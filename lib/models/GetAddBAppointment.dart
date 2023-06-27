// To parse this JSON data, do
//
//     final getAddBAppointment = getAddBAppointmentFromJson(jsonString);

import 'dart:convert';

GetAddBAppointment getAddBAppointmentFromJson(String str) => GetAddBAppointment.fromJson(json.decode(str));

String getAddBAppointmentToJson(GetAddBAppointment data) => json.encode(data.toJson());

class GetAddBAppointment {
  int? status;
  bool? success;
  Data? data;
  String? message;

  GetAddBAppointment({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  factory GetAddBAppointment.fromJson(Map<String, dynamic> json) => GetAddBAppointment(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  String? appointmentId;

  Data({
    this.appointmentId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    appointmentId: json["appointmentId"],
  );

  Map<String, dynamic> toJson() => {
    "appointmentId": appointmentId,
  };
}
