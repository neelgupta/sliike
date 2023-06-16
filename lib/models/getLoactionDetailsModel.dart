// To parse this JSON data, do
//
//     final getLocationDetailsData = getLocationDetailsDataFromJson(jsonString);

import 'dart:convert';

GetLocationDetailsData getLocationDetailsDataFromJson(String str) => GetLocationDetailsData.fromJson(json.decode(str));

String getLocationDetailsDataToJson(GetLocationDetailsData data) => json.encode(data.toJson());

class GetLocationDetailsData {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  GetLocationDetailsData({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory GetLocationDetailsData.fromJson(Map<String, dynamic> json) => GetLocationDetailsData(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? country;
  int? hasShop;
  int? isServeAtClient;
  int? isServeAtOwnPlace;
  Location? location;
  List<Address>? address;

  Datum({
    this.id,
    this.country,
    this.hasShop,
    this.isServeAtClient,
    this.isServeAtOwnPlace,
    this.location,
    this.address,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    country: json["country"],
    hasShop: json["hasShop"],
    isServeAtClient: json["IsServeAtClient"],
    isServeAtOwnPlace: json["IsServeAtOwnPlace"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    address: json["address"] == null ? [] : List<Address>.from(json["address"]!.map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "country": country,
    "hasShop": hasShop,
    "IsServeAtClient": isServeAtClient,
    "IsServeAtOwnPlace": isServeAtOwnPlace,
    "location": location?.toJson(),
    "address": address == null ? [] : List<dynamic>.from(address!.map((x) => x.toJson())),
  };
}

class Address {
  String? address;
  Province? province;
  String? apartment;
  String? city;
  String? zipCode;

  Address({
    this.address,
    this.province,
    this.apartment,
    this.city,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    province: json["province"] == null ? null : Province.fromJson(json["province"]),
    apartment: json["apartment"],
    city: json["city"],
    zipCode: json["zipCode"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "province": province?.toJson(),
    "apartment": apartment,
    "city": city,
    "zipCode": zipCode,
  };
}

class Province {
  String? id;
  String? name;

  Province({
    this.id,
    this.name,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}
