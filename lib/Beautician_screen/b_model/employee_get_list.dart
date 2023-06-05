// To parse this JSON data, do
//
//     final employeesGetList = employeesGetListFromJson(jsonString);

import 'dart:convert';

EmployeesGetList employeesGetListFromJson(String str) =>
    EmployeesGetList.fromJson(json.decode(str));

String employeesGetListToJson(EmployeesGetList data) =>
    json.encode(data.toJson());

class EmployeesGetList {
  int status;
  bool success;
  String message;
  List<EmployeeData> data;

  EmployeesGetList({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  factory EmployeesGetList.fromJson(Map<String, dynamic> json) =>
      EmployeesGetList(
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: List<EmployeeData>.from(
            json["data"].map((x) => EmployeeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<EmployeeData>.from(data.map((x) => x.toJson())),
      };
}

class EmployeeData {
  WorkHours workHours;
  String id;
  String firstName;
  String lastName;
  String title;
  String calenderColor;
  String profileImage;
  String profileImgPath;
  String dataId;
  bool isSelected;

  EmployeeData({
    required this.workHours,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.calenderColor,
    required this.profileImage,
    required this.profileImgPath,
    required this.dataId,
    this.isSelected = false,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
        workHours: WorkHours.fromJson(json["workHours"]),
        id: json["_id"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        title: json["title"] ?? "",
        calenderColor: json["calenderColor"] ?? "",
        profileImage: json["profileImage"] ?? "",
        profileImgPath: json["profileImgPath"] ?? "",
        dataId: json["id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "workHours": workHours.toJson(),
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "title": title,
        "calenderColor": calenderColor,
        "profileImage": profileImage,
        "profileImgPath": profileImgPath,
        "id": dataId,
      };
}

class WorkHours {
  String startTime;
  String endTime;

  WorkHours({
    required this.startTime,
    required this.endTime,
  });

  factory WorkHours.fromJson(Map<String, dynamic> json) => WorkHours(
        startTime: json["startTime"] ?? "",
        endTime: json["endTime"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
      };
}
