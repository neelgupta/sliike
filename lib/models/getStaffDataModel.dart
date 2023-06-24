// To parse this JSON data, do
//
//     final getStaffDataModel = getStaffDataModelFromJson(jsonString);

import 'dart:convert';

GetStaffDataModel getStaffDataModelFromJson(String str) => GetStaffDataModel.fromJson(json.decode(str));

String getStaffDataModelToJson(GetStaffDataModel data) => json.encode(data.toJson());

class GetStaffDataModel {
  int? status;
  bool? success;
  String? message;
  List<Datums>? data;

  GetStaffDataModel({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory GetStaffDataModel.fromJson(Map<String, dynamic> json) => GetStaffDataModel(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datums>.from(json["data"]!.map((x) => Datums.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datums {
  WorkHours? workHours;
  String? id;
  String? firstName;
  String? lastName;
  String? title;
  String? calenderColor;
  String? profileImage;
  String? profileImgPath;
  String? datumId;

  Datums({
    this.workHours,
    this.id,
    this.firstName,
    this.lastName,
    this.title,
    this.calenderColor,
    this.profileImage,
    this.profileImgPath,
    this.datumId,
  });

  factory Datums.fromJson(Map<String, dynamic> json) => Datums(
    workHours: json["workHours"] == null ? null : WorkHours.fromJson(json["workHours"]),
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    title: json["title"],
    calenderColor: json["calenderColor"],
    profileImage: json["profileImage"],
    profileImgPath: json["profileImgPath"],
    datumId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "workHours": workHours?.toJson(),
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "title": title,
    "calenderColor": calenderColor,
    "profileImage": profileImage,
    "profileImgPath": profileImgPath,
    "id": datumId,
  };
}

class WorkHours {
  String? startTime;
  String? endTime;

  WorkHours({
    this.startTime,
    this.endTime,
  });

  factory WorkHours.fromJson(Map<String, dynamic> json) => WorkHours(
    startTime: json["startTime"],
    endTime: json["endTime"],
  );

  Map<String, dynamic> toJson() => {
    "startTime": startTime,
    "endTime": endTime,
  };
}
