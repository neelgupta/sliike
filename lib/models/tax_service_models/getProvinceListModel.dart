// To parse this JSON data, do
//
//     final getProvinceListModel = getProvinceListModelFromMap(jsonString);

import 'dart:convert';

GetProvinceListModel getProvinceListModelFromMap(String str) => GetProvinceListModel.fromMap(json.decode(str));

String getProvinceListModelToMap(GetProvinceListModel data) => json.encode(data.toMap());

class GetProvinceListModel {
    int? status;
    bool? success;
    List<Datum>? data;
    String? message;

    GetProvinceListModel({
        this.status,
        this.success,
        this.data,
        this.message,
    });

    factory GetProvinceListModel.fromMap(Map<String, dynamic> json) => GetProvinceListModel(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
    };
}

class Datum {
    String? id;
    String? name;
    List<SubType>? subType;
    String? colorCode;

    Datum({
        this.id,
        this.name,
        this.subType,
        this.colorCode,
    });

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        subType: json["subType"] == null ? [] : List<SubType>.from(json["subType"]!.map((x) => SubType.fromMap(x))),
        colorCode: json["colorCode"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "subType": subType == null ? [] : List<dynamic>.from(subType!.map((x) => x.toMap())),
        "colorCode": colorCode,
    };
}

class SubType {
    String? taxName;
    double? tax;
    String? id;

    SubType({
        this.taxName,
        this.tax,
        this.id,
    });

    factory SubType.fromMap(Map<String, dynamic> json) => SubType(
        taxName: json["taxName"],
        tax: json["tax"]?.toDouble(),
        id: json["_id"],
    );

    Map<String, dynamic> toMap() => {
        "taxName": taxNameValues.reverse[taxName],
        "tax": tax,
        "_id": id,
    };
}

enum TaxName { GST, HST, PST, QST }

final taxNameValues = EnumValues({
    "GST": "GST",
    "HST": "HST",
    "PST": "PST",
    "QST": "QST"
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
