// To parse this JSON data, do
//
//     final getAppointMentDetailsModel = getAppointMentDetailsModelFromJson(jsonString);

import 'dart:convert';

GetAppointMentDetailsModel getAppointMentDetailsModelFromJson(String str) =>
    GetAppointMentDetailsModel.fromJson(json.decode(str));

String getAppointMentDetailsModelToJson(GetAppointMentDetailsModel data) =>
    json.encode(data.toJson());

class GetAppointMentDetailsModel {
  int status;
  bool success;
  List<AppointData> data;

  GetAppointMentDetailsModel({
    required this.status,
    required this.success,
    required this.data,
  });

  factory GetAppointMentDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetAppointMentDetailsModel(
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
        data: List<AppointData>.from(
            (json["data"] ?? {}).map((x) => AppointData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AppointData {
  String id;
  String clientId;
  String beauticianId;
  String serviceId;
  String stylistId;
  DateTime dateTime;
  DateTime endDateTime;
  String paymentDetails;
  ServiceDetails serviceDetails;
  AppointClientData clientData;

  AppointData({
    required this.id,
    required this.clientId,
    required this.beauticianId,
    required this.serviceId,
    required this.stylistId,
    required this.dateTime,
    required this.endDateTime,
    required this.paymentDetails,
    required this.serviceDetails,
    required this.clientData,
  });

  factory AppointData.fromJson(Map<String, dynamic> json) => AppointData(
        id: json["_id"] ?? "",
        clientId: json["clientId"] ?? "",
        beauticianId: json["beauticianId"] ?? "",
        serviceId: json["serviceId"] ?? "",
        stylistId: json["stylistID"] ?? "",
        dateTime: DateTime.parse(json["dateTime"]),
        endDateTime: DateTime.parse(json["endDateTime"]),
        paymentDetails: json["paymentDetails"] ?? "",
        serviceDetails: ServiceDetails.fromJson(json["serviceDetails"] ?? {}),
        clientData: AppointClientData.fromJson(json["clientData"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "clientId": clientId,
        "beauticianId": beauticianId,
        "serviceId": serviceId,
        "stylistID": stylistId,
        "dateTime": dateTime.toIso8601String(),
        "endDateTime": endDateTime.toIso8601String(),
        "paymentDetails": paymentDetails,
        "serviceDetails": serviceDetails.toJson(),
        "clientData": clientData.toJson(),
      };
}

class AppointClientData {
  String id;
  String firstName;
  String lastName;

  AppointClientData({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory AppointClientData.fromJson(Map<String, dynamic> json) =>
      AppointClientData(
        id: json["_id"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
      };
}

class ServiceDetails {
  String id;
  String serviceType;
  String serviceTypeName;

  ServiceDetails({
    required this.id,
    required this.serviceType,
    required this.serviceTypeName,
  });

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
        id: json["_id"] ?? "",
        serviceType: json["serviceType"] ?? "",
        serviceTypeName: json["serviceTypeName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceType": serviceType,
        "serviceTypeName": serviceTypeName,
      };
}
