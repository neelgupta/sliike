// To parse this JSON data, do
//
//     final getServiceDetailsModel = getServiceDetailsModelFromJson(jsonString);

import 'dart:convert';

GetServiceDetailsModel getServiceDetailsModelFromJson(String str) => GetServiceDetailsModel.fromJson(json.decode(str));

String getServiceDetailsModelToJson(GetServiceDetailsModel data) => json.encode(data.toJson());

class GetServiceDetailsModel {
  int? status;
  bool? success;
  List<Datum>? data;
  String? message;

  GetServiceDetailsModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  factory GetServiceDetailsModel.fromJson(Map<String, dynamic> json) => GetServiceDetailsModel(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  int? price;
  String? description;
  int? isDelete;
  bool? isBookOnline;
  bool? isHomeService;
  int? nubOfCartClicked;
  int? nubOfShareClicked;
  int? nubOfView;
  dynamic imageUrl;
  String? datumId;

  Datum({
    this.id,
    this.beauticianId,
    this.serviceCategory,
    this.serviceType,
    this.duration,
    this.price,
    this.description,
    this.isDelete,
    this.isBookOnline,
    this.isHomeService,
    this.nubOfCartClicked,
    this.nubOfShareClicked,
    this.nubOfView,
    this.imageUrl,
    this.datumId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    beauticianId: json["beauticianId"],
    serviceCategory: json["serviceCategory"] == null ? null : ServiceCategory.fromJson(json["serviceCategory"]),
    serviceType: json["serviceType"] == null ? null : ServiceType.fromJson(json["serviceType"]),
    duration: json["duration"],
    price: json["price"],
    description: json["description"],
    isDelete: json["isDelete"],
    isBookOnline: json["isBookOnline"],
    isHomeService: json["isHomeService"],
    nubOfCartClicked: json["nubOfCartClicked"],
    nubOfShareClicked: json["nubOfShareClicked"],
    nubOfView: json["nubOfView"],
    imageUrl: json["imageUrl"],
    datumId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "beauticianId": beauticianId,
    "serviceCategory": serviceCategory?.toJson(),
    "serviceType": serviceType?.toJson(),
    "duration": duration,
    "price": price,
    "description": description,
    "isDelete": isDelete,
    "isBookOnline": isBookOnline,
    "isHomeService": isHomeService,
    "nubOfCartClicked": nubOfCartClicked,
    "nubOfShareClicked": nubOfShareClicked,
    "nubOfView": nubOfView,
    "imageUrl": imageUrl,
    "id": datumId,
  };
}

class ServiceCategory {
  String? id;
  String? serviceCategoryName;

  ServiceCategory({
    this.id,
    this.serviceCategoryName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
    id: json["_id"],
    serviceCategoryName: json["serviceCategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceCategoryName": serviceCategoryName,
  };
}

class ServiceType {
  String? id;
  String? serviceTypeName;

  ServiceType({
    this.id,
    this.serviceTypeName,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    id: json["_id"],
    serviceTypeName: json["serviceTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceTypeName": serviceTypeName,
  };
}
