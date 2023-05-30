// To parse this JSON data, do
//
//     final onlyoneModal = onlyoneModalFromJson(jsonString);

import 'dart:convert';

OnlyoneModal onlyoneModalFromJson(String str) => OnlyoneModal.fromJson(json.decode(str));

String onlyoneModalToJson(OnlyoneModal data) => json.encode(data.toJson());

class OnlyoneModal {
  int? status;
  bool? success;
  Data? data;
  String? message;

  OnlyoneModal({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  factory OnlyoneModal.fromJson(Map<String, dynamic> json) => OnlyoneModal(
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

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  Address? address;
  String? businessName;
  dynamic logoPath;
  List<dynamic>? workSpaceImgPaths;
  String? beauticianIdId;

  BeauticianId({
    this.id,
    this.address,
    this.businessName,
    this.logoPath,
    this.workSpaceImgPaths,
    this.beauticianIdId,
  });

  factory BeauticianId.fromJson(Map<String, dynamic> json) => BeauticianId(
    id: json["_id"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    businessName: json["businessName"],
    logoPath: json["logoPath"],
    workSpaceImgPaths: json["workSpaceImgPaths"] == null ? [] : List<dynamic>.from(json["workSpaceImgPaths"]!.map((x) => x)),
    beauticianIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address?.toJson(),
    "businessName": businessName,
    "logoPath": logoPath,
    "workSpaceImgPaths": workSpaceImgPaths == null ? [] : List<dynamic>.from(workSpaceImgPaths!.map((x) => x)),
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

  Address({
    this.id,
    this.address,
    this.province,
    this.apartment,
    this.city,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["_id"],
    address: json["address"],
    province: json["province"],
    apartment: json["apartment"],
    city: json["city"],
    zipCode: json["zipCode"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "province": province,
    "apartment": apartment,
    "city": city,
    "zipCode": zipCode,
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
