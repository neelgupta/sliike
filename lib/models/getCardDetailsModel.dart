// To parse this JSON data, do
//
//     final getCardDetailsData = getCardDetailsDataFromJson(jsonString);

import 'dart:convert';

GetCardDetailsData getCardDetailsDataFromJson(String str) => GetCardDetailsData.fromJson(json.decode(str));

String getCardDetailsDataToJson(GetCardDetailsData data) => json.encode(data.toJson());

class GetCardDetailsData {
  int? status;
  List<Datum>? data;

  GetCardDetailsData({
    this.status,
    this.data,
  });

  factory GetCardDetailsData.fromJson(Map<String, dynamic> json) => GetCardDetailsData(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? cardName;
  int? cardLastFour;
  String? cardBrand;
  int? expiryMonth;
  int? expiryYear;
  String? cardToken;

  Datum({
    this.id,
    this.cardName,
    this.cardLastFour,
    this.cardBrand,
    this.expiryMonth,
    this.expiryYear,
    this.cardToken,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    cardName: json["cardName"],
    cardLastFour: json["cardLastFour"],
    cardBrand: json["cardBrand"],
    expiryMonth: json["expiryMonth"],
    expiryYear: json["expiryYear"],
    cardToken: json["cardToken"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "cardName": cardName,
    "cardLastFour": cardLastFour,
    "cardBrand": cardBrand,
    "expiryMonth": expiryMonth,
    "expiryYear": expiryYear,
    "cardToken": cardToken,
  };
}
