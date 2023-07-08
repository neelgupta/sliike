// To parse this JSON data, do
//
//     final getCardDetailsData = getCardDetailsDataFromJson(jsonString);

import 'dart:convert';

GetCardDetailsData getCardDetailsDataFromJson(String str) =>
    GetCardDetailsData.fromJson(json.decode(str));

String getCardDetailsDataToJson(GetCardDetailsData data) =>
    json.encode(data.toJson());

class GetCardDetailsData {
  int? status;
  List<Datum>? data;

  GetCardDetailsData({
    this.status,
    this.data,
  });

  factory GetCardDetailsData.fromJson(Map<String, dynamic> json) =>
      GetCardDetailsData(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? cardName;
  int? cardLastFour;
  String? cardBrand;
  String? cardCVV;
  int? expiryMonth;
  int? expiryYear;
  int? isPrimary;
  String? cardToken;

  Datum({
    this.id,
    this.cardName,
    this.cardLastFour,
    this.cardBrand,
    this.cardCVV,
    this.expiryMonth,
    this.expiryYear,
    this.isPrimary,
    this.cardToken,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        cardName: json["cardName"],
        cardLastFour: json["cardLastFour"],
        cardBrand: json["cardBrand"],
        cardCVV: (json["cardCVC"] ?? "0").toString(),
        expiryMonth: json["expiryMonth"],
        expiryYear: json["expiryYear"],
        isPrimary: json["isPrimary"] ?? 0,
        cardToken: json["cardToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cardName": cardName,
        "cardLastFour": cardLastFour,
        "cardBrand": cardBrand,
        "expiryMonth": expiryMonth,
        "expiryYear": expiryYear,
        "isPrimary": isPrimary,
        "cardToken": cardToken,
      };
}
