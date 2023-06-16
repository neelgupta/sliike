// To parse this JSON data, do
//
//     final getServices = getServicesFromMap(jsonString);

import 'dart:convert';

GetServices getServicesFromMap(String str) => GetServices.fromMap(json.decode(str));

String getServicesToMap(GetServices data) => json.encode(data.toMap());

class GetServices {
  int? status;
  bool? success;
  List<Datum>? data;

  GetServices({
    this.status,
    this.success,
    this.data,
  });

  factory GetServices.fromMap(Map<String, dynamic> json) => GetServices(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  String? id;
  String? promotionFor;
  String? promotionTitle;
  String? subIdType;
  String? serviceName;
  String? description;
  int? isDiscPercentage;
  int? discount;
  DateTime? startDate;
  DateTime? endDate;
  String? referenceCode;

  Datum({
    this.id,
    this.promotionFor,
    this.promotionTitle,
    this.subIdType,
    this.serviceName,
    this.description,
    this.isDiscPercentage,
    this.discount,
    this.startDate,
    this.endDate,
    this.referenceCode,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    promotionFor: json["promotionFor"],
    promotionTitle: json["promotionTitle"],
    subIdType: json["subId_type"],
    serviceName: json["serviceName"],
    description: json["description"],
    isDiscPercentage: json["isDiscPercentage"],
    discount: json["discount"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    referenceCode: json["referenceCode"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "promotionFor": promotionFor,
    "promotionTitle": promotionTitle,
    "subId_type": subIdType,
    "serviceName": serviceName,
    "description": description,
    "isDiscPercentage": isDiscPercentage,
    "discount": discount,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "referenceCode": referenceCode,
  };
}
