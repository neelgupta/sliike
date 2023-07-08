// To parse this JSON data, do
//
//     final getTaxProvinceDetailsModel = getTaxProvinceDetailsModelFromMap(jsonString);

import 'dart:convert';

GetTaxProvinceDetailsModel getTaxProvinceDetailsModelFromMap(String str) => GetTaxProvinceDetailsModel.fromMap(json.decode(str));

String getTaxProvinceDetailsModelToMap(GetTaxProvinceDetailsModel data) => json.encode(data.toMap());

class GetTaxProvinceDetailsModel {
    int? status;
    bool? success;
    Data? data;

    GetTaxProvinceDetailsModel({
        this.status,
        this.success,
        this.data,
    });

    factory GetTaxProvinceDetailsModel.fromMap(Map<String, dynamic> json) => GetTaxProvinceDetailsModel(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "data": data?.toMap(),
    };
}

class Data {
    String? provinceId;
    bool? isProvinceTaxInfo;
    String? gstNumber;
    String? pstNumber;
    String? hstNumber;
    String? qstNumber;

    Data({
        this.provinceId,
        this.isProvinceTaxInfo,
        this.gstNumber,
        this.pstNumber,
        this.hstNumber,
        this.qstNumber,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        provinceId: json["provinceID"],
        isProvinceTaxInfo: json["isProvinceTaxInfo"],
        gstNumber: json["GSTNumber"],
        pstNumber: json["PSTNumber"],
        hstNumber: json["HSTNumber"],
        qstNumber: json["QSTNumber"],
    );

    Map<String, dynamic> toMap() => {
        "provinceID": provinceId,
        "isProvinceTaxInfo": isProvinceTaxInfo,
        "GSTNumber": gstNumber,
        "PSTNumber": pstNumber,
        "HSTNumber": hstNumber,
        "QSTNumber": qstNumber,
    };
}
