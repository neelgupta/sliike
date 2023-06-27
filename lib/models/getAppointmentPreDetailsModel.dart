// To parse this JSON data, do
//
//     final getAppointmentPreDetailsData = getAppointmentPreDetailsDataFromJson(jsonString);

import 'dart:convert';

GetAppointmentPreDetailsData getAppointmentPreDetailsDataFromJson(String str) => GetAppointmentPreDetailsData.fromJson(json.decode(str));

String getAppointmentPreDetailsDataToJson(GetAppointmentPreDetailsData data) => json.encode(data.toJson());

class GetAppointmentPreDetailsData {
  int? status;
  bool? success;
  Data? data;

  GetAppointmentPreDetailsData({
    this.status,
    this.success,
    this.data,
  });

  factory GetAppointmentPreDetailsData.fromJson(Map<String, dynamic> json) => GetAppointmentPreDetailsData(
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
  List<AppointmentDatum>? appointmentData;

  Data({
    this.appointmentData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    appointmentData: json["appointmentData"] == null ? [] : List<AppointmentDatum>.from(json["appointmentData"]!.map((x) => AppointmentDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "appointmentData": appointmentData == null ? [] : List<dynamic>.from(appointmentData!.map((x) => x.toJson())),
  };
}

class AppointmentDatum {
  String? id;
  TId? clientId;
  String? beauticianId;
  ServiceId? serviceId;
  TId? stylistId;
  DateTime? dateTime;
  DateTime? endDateTime;
  int? price;
  int? place;
  int? status;
  String? createdBy;
  String? recurringOpt;
  int? step;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AppointmentDatum({
    this.id,
    this.clientId,
    this.beauticianId,
    this.serviceId,
    this.stylistId,
    this.dateTime,
    this.endDateTime,
    this.price,
    this.place,
    this.status,
    this.createdBy,
    this.recurringOpt,
    this.step,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AppointmentDatum.fromJson(Map<String, dynamic> json) => AppointmentDatum(
    id: json["_id"],
    clientId: json["clientId"] == null ? null : TId.fromJson(json["clientId"]),
    beauticianId: json["beauticianId"],
    serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
    stylistId: json["stylistID"] == null ? null : TId.fromJson(json["stylistID"]),
    dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    endDateTime: json["endDateTime"] == null ? null : DateTime.parse(json["endDateTime"]),
    price: json["price"],
    place: json["place"],
    status: json["status"],
    createdBy: json["createdBy"],
    recurringOpt: json["recurringOpt"],
    step: json["step"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientId": clientId?.toJson(),
    "beauticianId": beauticianId,
    "serviceId": serviceId?.toJson(),
    "stylistID": stylistId?.toJson(),
    "dateTime": dateTime?.toIso8601String(),
    "endDateTime": endDateTime?.toIso8601String(),
    "price": price,
    "place": place,
    "status": status,
    "createdBy": createdBy,
    "recurringOpt": recurringOpt,
    "step": step,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class TId {
  String? id;
  String? firstName;
  String? lastName;
  dynamic profileImgPath;
  String? tIdId;

  TId({
    this.id,
    this.firstName,
    this.lastName,
    this.profileImgPath,
    this.tIdId,
  });

  factory TId.fromJson(Map<String, dynamic> json) => TId(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    profileImgPath: json["profileImgPath"],
    tIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "profileImgPath": profileImgPath,
    "id": tIdId,
  };
}

class ServiceId {
  ServiceType? serviceType;
  dynamic imageUrl;
  dynamic id;

  ServiceId({
    this.serviceType,
    this.imageUrl,
    this.id,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    serviceType: json["serviceType"] == null ? null : ServiceType.fromJson(json["serviceType"]),
    imageUrl: json["imageUrl"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "serviceType": serviceType?.toJson(),
    "imageUrl": imageUrl,
    "id": id,
  };
}

class ServiceType {
  String? serviceTypeName;

  ServiceType({
    this.serviceTypeName,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    serviceTypeName: json["serviceTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "serviceTypeName": serviceTypeName,
  };
}
