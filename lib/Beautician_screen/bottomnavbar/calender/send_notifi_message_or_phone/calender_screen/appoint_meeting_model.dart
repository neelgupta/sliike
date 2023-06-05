// To parse this JSON data, do
//
//     final AppointmeetingModel = AppointmeetingModelFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

List<AppointMeetingModel> appointmeetingModelFromJson(String str) =>
    List<AppointMeetingModel>.from(
        json.decode(str).map((x) => AppointMeetingModel.fromJson(x)));

String appointmeetingModelToJson(List<AppointMeetingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointMeetingModel {
  AppointMeetingModel({
    this.id,
    required this.eventName,
    this.from,
    this.to,
    this.background = const Color(0xFF89CFF0),
    this.isAllDay = false,
  });

  String? id;
  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;

  factory AppointMeetingModel.fromJson(Map<String, dynamic> json) =>
      AppointMeetingModel(
        id: json["id"],
        eventName: json["eventName"],
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        background: json["background"],
        isAllDay: json["isAllDay"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "eventName": eventName,
        "from": from?.toIso8601String(),
        "to": to?.toIso8601String(),
        "background": background,
        "isAllDay": isAllDay,
      };
}
