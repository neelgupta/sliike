// To parse this JSON data, do
//
//     final pastModal = pastModalFromJson(jsonString);

import 'dart:convert';

PastModal pastModalFromJson(String str) => PastModal.fromJson(json.decode(str));

String pastModalToJson(PastModal data) => json.encode(data.toJson());

class PastModal {
  int? status;
  bool? success;
  List<Datum>? data;

  PastModal({
    this.status,
    this.success,
    this.data,
  });

  factory PastModal.fromJson(Map<String, dynamic> json) => PastModal(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? clientId;
  BeauticianId? beauticianId;
  ServiceId? serviceId;
  dynamic stylistId;
  DateTime? dateTime;
  DateTime? endDateTime;
  int? price;
  int? place;
  String? note;
  int? status;
  String? createdBy;
  dynamic recurringOpt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.clientId,
    this.beauticianId,
    this.serviceId,
    this.stylistId,
    this.dateTime,
    this.endDateTime,
    this.price,
    this.place,
    this.note,
    this.status,
    this.createdBy,
    this.recurringOpt,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    clientId: json["clientId"],
    beauticianId: json["beauticianId"] == null ? null : BeauticianId.fromJson(json["beauticianId"]),
    serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
    stylistId: json["stylistID"],
    dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    endDateTime: json["endDateTime"] == null ? null : DateTime.parse(json["endDateTime"]),
    price: json["price"],
    place: json["place"],
    note: json["note"],
    status: json["status"],
    createdBy: json["createdBy"],
    recurringOpt: json["recurringOpt"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientId": clientId,
    "beauticianId": beauticianId?.toJson(),
    "serviceId": serviceId?.toJson(),
    "stylistID": stylistId,
    "dateTime": dateTime?.toIso8601String(),
    "endDateTime": endDateTime?.toIso8601String(),
    "price": price,
    "place": place,
    "note": note,
    "status": status,
    "createdBy": createdBy,
    "recurringOpt": recurringOpt,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class BeauticianId {
  String? id;
  String? firstName;
  String? lastName;
  Address? address;
  String? businessName;
  String? profileImage;
  String? logoPath;
  List<String>? workSpaceImgPaths;
  String? beauticianIdId;

  BeauticianId({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.businessName,
    this.profileImage,
    this.logoPath,
    this.workSpaceImgPaths,
    this.beauticianIdId,
  });

  factory BeauticianId.fromJson(Map<String, dynamic> json) => BeauticianId(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    businessName: json["businessName"],
    profileImage: json["profileImage"],
    logoPath: json["logoPath"],
    workSpaceImgPaths: json["workSpaceImgPaths"] == null ? [] : List<String>.from(json["workSpaceImgPaths"]!.map((x) => x)),
    beauticianIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "address": address?.toJson(),
    "businessName": businessName,
    "profileImage": profileImage,
    "logoPath": logoPath,
    "workSpaceImgPaths": workSpaceImgPaths == null ? [] : List<String>.from(workSpaceImgPaths!.map((x) => x)),
    "id": beauticianIdId,
  };
}

class Address {
  String? id;
  String? address;
  String? province;
  String? apartment;
  String? city;
  String? zipCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Address({
    this.id,
    this.address,
    this.province,
    this.apartment,
    this.city,
    this.zipCode,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["_id"],
    address: json["address"],
    province: json["province"],
    apartment: json["apartment"],
    city: json["city"],
    zipCode: json["zipCode"].toString(),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "province": province,
    "apartment": apartment,
    "city": city,
    "zipCode": zipCode,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ServiceId {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  int? price;
  String? description;

  ServiceId({
    this.id,
    this.beauticianId,
    this.serviceCategory,
    this.serviceType,
    this.duration,
    this.price,
    this.description,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    beauticianId: json["beauticianId"],
    serviceCategory: json["serviceCategory"] == null ? null : ServiceCategory.fromJson(json["serviceCategory"]),
    serviceType: json["serviceType"] == null ? null : ServiceType.fromJson(json["serviceType"]),
    duration: json["duration"],
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "beauticianId": beauticianId,
    "serviceCategory": serviceCategory?.toJson(),
    "serviceType": serviceType?.toJson(),
    "duration": duration,
    "price": price,
    "description": description,
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
