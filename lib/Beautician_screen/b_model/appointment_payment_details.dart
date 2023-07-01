// To parse this JSON data, do
//
//     final appointmentPaymentDetails = appointmentPaymentDetailsFromJson(jsonString);

import 'dart:convert';

AppointmentPaymentDetails appointmentPaymentDetailsFromJson(String str) =>
    AppointmentPaymentDetails.fromJson(json.decode(str));

String appointmentPaymentDetailsToJson(AppointmentPaymentDetails data) =>
    json.encode(data.toJson());

class AppointmentPaymentDetails {
  int status;
  bool success;
  List<PaymentData> data;

  AppointmentPaymentDetails({
    required this.status,
    required this.success,
    required this.data,
  });

  factory AppointmentPaymentDetails.fromJson(Map<String, dynamic> json) =>
      AppointmentPaymentDetails(
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
        data: List<PaymentData>.from(
            (json["data"] ?? {}).map((x) => PaymentData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PaymentData {
  String id;
  DateTime dateTime;
  int status;
  ClientEmail clientEmail;
  ServiceDetails serviceDetails;
  PaymentInfo paymentInfo;

  PaymentData({
    required this.id,
    required this.dateTime,
    required this.status,
    required this.clientEmail,
    required this.serviceDetails,
    required this.paymentInfo,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        id: json["_id"] ?? "",
        dateTime: DateTime.parse(json["dateTime"]),
        status: json["status"] ?? 0,
        clientEmail: ClientEmail.fromJson(json["clientEmail"] ?? {}),
        serviceDetails: ServiceDetails.fromJson(json["serviceDetails"] ?? {}),
        paymentInfo: PaymentInfo.fromJson(json["paymentInfo"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dateTime": dateTime.toIso8601String(),
        "status": status,
        "clientEmail": clientEmail.toJson(),
        "serviceDetails": serviceDetails.toJson(),
        "paymentInfo": paymentInfo.toJson(),
      };
}

class ClientEmail {
  String email;

  ClientEmail({
    required this.email,
  });

  factory ClientEmail.fromJson(Map<String, dynamic> json) => ClientEmail(
        email: json["email"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}

class PaymentInfo {
  String bookingId;
  DateTime paymentDate;
  double subTotal;
  double discount;
  double GST;
  double HST;
  double PST;
  double QST;
  double total;

  PaymentInfo({
    required this.bookingId,
    required this.paymentDate,
    required this.subTotal,
    required this.discount,
    required this.GST,
    required this.HST,
    required this.PST,
    required this.QST,
    required this.total,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
        bookingId: json["BookingId"] ?? "",
        paymentDate: DateTime.parse(json["paymentDate"]),
        subTotal: double.parse((json["subTotal"] ?? 0).toString()),
        discount: double.parse((json["discount"] ?? 0).toString()),
        GST: double.parse((json["GST"] ?? 0).toString()),
        HST: double.parse((json["HST"] ?? 0).toString()),
        PST: double.parse((json["PST"] ?? 0).toString()),
        QST: double.parse((json["QST"] ?? 0).toString()),
        total: double.parse((json["total"] ?? 0).toString()),
      );

  Map<String, dynamic> toJson() => {
        "BookingId": bookingId,
        "paymentDate": paymentDate.toIso8601String(),
        "subTotal": subTotal,
        "discount": discount,
        "GST": GST,
        "HST": HST,
        "PST": PST,
        "QST": QST,
        "total": total,
      };
}

class ServiceDetails {
  String duration;
  int price;
  String serviceName;

  ServiceDetails({
    required this.duration,
    required this.price,
    required this.serviceName,
  });

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
        duration: json["duration"] ?? "",
        price: json["price"] ?? 0,
        serviceName: json["serviceName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "price": price,
        "serviceName": serviceName,
      };
}
