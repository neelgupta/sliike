// To parse this JSON data, do
//
//     final appointmentDetails = appointmentDetailsFromJson(jsonString);

import 'dart:convert';

AppointmentDetailsModel appointmentDetailsFromJson(String str) =>
    AppointmentDetailsModel.fromJson(json.decode(str));

String appointmentDetailsToJson(AppointmentDetailsModel data) =>
    json.encode(data.toJson());

class AppointmentDetailsModel {
  int status;
  bool success;
  AData data;

  AppointmentDetailsModel({
    required this.status,
    required this.success,
    required this.data,
  });

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      AppointmentDetailsModel(
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
        data: AData.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data.toJson(),
      };
}

class AData {
  String id;
  DateTime dateTime;
  int status;
  ClientData clientData;
  ServiceData serviceDetails;
  PaymentDetails paymentDetails;

  AData({
    required this.id,
    required this.dateTime,
    required this.status,
    required this.clientData,
    required this.serviceDetails,
    required this.paymentDetails,
  });

  factory AData.fromJson(Map<String, dynamic> json) => AData(
        id: json["_id"] ?? "",
        dateTime: DateTime.parse(json["dateTime"]),
        status: json["status"] ?? 0,
        clientData: ClientData.fromJson(json["clientData"] ?? {}),
        serviceDetails: ServiceData.fromJson(json["serviceDetails"] ?? {}),
        paymentDetails: PaymentDetails.fromJson(json["paymentDetails"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dateTime": dateTime.toIso8601String(),
        "status": status,
        "clientData": clientData.toJson(),
        "serviceDetails": serviceDetails.toJson(),
        "paymentDetails": paymentDetails.toJson(),
      };
}

class ClientData {
  String firstName;
  String lastName;
  String countryCode;
  int phoneNumber;

  ClientData({
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.phoneNumber,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) => ClientData(
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        countryCode: json["country_code"] ?? "",
        phoneNumber: json["phoneNumber"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "country_code": countryCode,
        "phoneNumber": phoneNumber,
      };
}

class PaymentDetails {
  String id;
  double totalPrice;
  int paymentStatus;

  PaymentDetails({
    required this.id,
    required this.totalPrice,
    required this.paymentStatus,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
        id: json["_id"] ?? "",
        totalPrice: (json["TotalPrice"] ?? 0).toDouble(),
        paymentStatus: json["paymentStatus"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "TotalPrice": totalPrice,
        "paymentStatus": paymentStatus,
      };
}

class ServiceData {
  String serviceName;
  int price;
  String duration;

  ServiceData({
    required this.serviceName,
    required this.price,
    required this.duration,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        serviceName: json["serviceName"] ?? "",
        price: json["price"] ?? 0,
        duration: json["duration"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "serviceName": serviceName,
        "price": price,
        "duration": duration,
      };
}
