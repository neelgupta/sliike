// To parse this JSON data, do
//
//     final getServicesListData = getServicesListDataFromJson(jsonString);

import 'dart:convert';

GetServicesListData getServicesListDataFromJson(String str) => GetServicesListData.fromJson(json.decode(str));

String getServicesListDataToJson(GetServicesListData data) => json.encode(data.toJson());

class GetServicesListData {
  int? status;
  bool? success;
  Data? data;

  GetServicesListData({
    this.status,
    this.success,
    this.data,
  });

  factory GetServicesListData.fromJson(Map<String, dynamic> json) => GetServicesListData(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {
  List<Category>? category;

  Data({
    this.category,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class Category {
  List<ServiceType>? serviceType;
  String? id;
  String? serviceCategoryName;

  Category({
    this.serviceType,
    this.id,
    this.serviceCategoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    serviceType: json["serviceType"] == null ? [] : List<ServiceType>.from(json["serviceType"]!.map((x) => ServiceType.fromJson(x))),
    id: json["_id"],
    serviceCategoryName: json["serviceCategoryName"],
  );

  Map<String, dynamic> toJson() => {
    "serviceType": serviceType == null ? [] : List<dynamic>.from(serviceType!.map((x) => x.toJson())),
    "_id": id,
    "serviceCategoryName": serviceCategoryName,
  };
}

class ServiceType {
  String? serviceTypeName;
  String? bServiceId;

  ServiceType({
    this.serviceTypeName,
    this.bServiceId,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    serviceTypeName: json["serviceTypeName"],
    bServiceId: json["bServiceId"],
  );

  Map<String, dynamic> toJson() => {
    "serviceTypeName": serviceTypeName,
    "bServiceId": bServiceId,
  };
}
