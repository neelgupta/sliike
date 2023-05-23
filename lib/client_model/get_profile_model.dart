// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  int status;
  bool success;
  String message;
  ProfileData data;

  GetProfileModel({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: ProfileData.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class ProfileData {
  String id;
  UserIdModel userId;
  String firstName;
  String lastName;
  String country;
  String countryCode;
  int isDeleted;
  DateTime? dob;
  String? gender;
  String? profileImage;
  List<Address> address;
  // DateTime createdAt;
  // DateTime updatedAt;
  int v;

  ProfileData({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.countryCode,
    required this.isDeleted,
    required this.address,
    this.dob,
    this.gender,
    this.profileImage,
    // required this.createdAt,
    // required this.updatedAt,
    required this.v,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["_id"] ?? "",
        userId: UserIdModel.fromJson(json["userId"] ?? {}),
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        country: json["country"] ?? "",
        gender: json["gender"] ?? "",
        profileImage: json["profileImage"] ?? "",
    address: List<Address>.from((json["address"] ?? []).map((x) => Address.fromJson(x))),

    countryCode: json["country_code"] ?? 0,
        isDeleted: json["isDeleted"] ?? 0,
        dob: json["DOB"]!=null?DateTime.parse(json["DOB"]):null,

        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId.toJson(),
        "firstName": firstName,
        "lastName": lastName,
        "country": country,
        "country_code": countryCode,
        "isDeleted": isDeleted,
        "profileImage": profileImage,
        "gender": gender,
        "DOB": dob!.toIso8601String(),
        "address": List<Address>.from(address.map((x) => x)),
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}


class Address {
  AddressId addressId;
  String addressType;
  String id;

  Address({
    required this.addressId,
    required this.addressType,
    required this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressId: AddressId.fromJson(json["addressId"] ?? {}),
    addressType: json["addressType"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "addressId": addressId.toJson(),
    "addressType": addressType,
    "_id": id,
  };
}

class AddressId {
  Location location;
  String id;
  String address;
  String province;
  String apartment;

  AddressId({
    required this.location,
    required this.id,
    required this.address,
    required this.province,
    required this.apartment,
  });

  factory AddressId.fromJson(Map<String, dynamic> json) => AddressId(
    location: Location.fromJson(json["location"] ?? {}),
    id: json["_id"] ?? "",
    address: json["address"] ?? "",
    province: json["province"] ?? "",
    apartment: json["apartment"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "_id": id,
    "address": address,
    "province": province,
    "apartment": apartment,
  };
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"] ?? "",
    coordinates: List<double>.from((json["coordinates"])??[].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}


class UserIdModel {
  String id;
  String email;
  int phoneNumber;

  UserIdModel({
    required this.id,
    required this.email,
    required this.phoneNumber,
  });

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        id: json["_id"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phoneNumber"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
