// To parse this JSON data, do
//
//     final getClientListData = getClientListDataFromJson(jsonString);

import 'dart:convert';

GetClientListData getClientListDataFromJson(String str) => GetClientListData.fromJson(json.decode(str));

String getClientListDataToJson(GetClientListData data) => json.encode(data.toJson());

class GetClientListData {
  int? status;
  bool? success;
  List<Datum>? data;

  GetClientListData({
    this.status,
    this.success,
    this.data,
  });

  factory GetClientListData.fromJson(Map<String, dynamic> json) => GetClientListData(
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
  String? phoneNubWithFormat;
  int? phoneNumber;
  int? status;

  Datum({
    this.id,
    this.clientId,
    this.phoneNubWithFormat,
    this.phoneNumber,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    clientId: json["clientId"],
    phoneNubWithFormat: json["phoneNubWithFormat"],
    phoneNumber: json["phoneNumber"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientId": clientId,
    "phoneNubWithFormat": phoneNubWithFormat,
    "phoneNumber": phoneNumber,
    "status": status,
  };
}
