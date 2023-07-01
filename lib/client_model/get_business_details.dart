// To parse this JSON data, do
//
//     final getBusinessDetails = getBusinessDetailsFromMap(jsonString);

import 'dart:convert';

GetBusinessDetails getBusinessDetailsFromMap(String str) =>
    GetBusinessDetails.fromMap(json.decode(str));

String getBusinessDetailsToMap(GetBusinessDetails data) =>
    json.encode(data.toMap());

class GetBusinessDetails {
  final int status;
  final bool success;
  final List<BusinessDat> beautician;

  GetBusinessDetails({
    required this.status,
    required this.success,
    required this.beautician,
  });

  factory GetBusinessDetails.fromMap(Map<String, dynamic> json) =>
      GetBusinessDetails(
        status: json["status"] ?? 0,
        success: json["success"] ?? false,
        beautician: List<BusinessDat>.from(
            (json["beautician"] ?? []).map((x) => BusinessDat.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "beautician": List<dynamic>.from(beautician.map((x) => x.toMap())),
      };
}

class BusinessDat {
  final String id;
  final String countryCode;
  final Address address;
  final String businessName;
  final int businessNumber;
  final Location location;
  final String description;
  final String facebookUrl;
  final String instagramUrl;
  final String website;
  final List<Amenity> amenities;
  final List<WorkHour> workHours;
  final List<Employee> employees;

  BusinessDat({
    required this.id,
    required this.countryCode,
    required this.address,
    required this.businessName,
    required this.businessNumber,
    required this.location,
    required this.description,
    required this.facebookUrl,
    required this.instagramUrl,
    required this.website,
    required this.amenities,
    required this.workHours,
    required this.employees,
  });

  factory BusinessDat.fromMap(Map<String, dynamic> json) => BusinessDat(
        id: json["_id"] ?? "",
        countryCode: json["country_code"] ?? "",
        address: Address.fromMap(json["address"] ?? {}),
        businessName: json["businessName"] ?? "",
        businessNumber: json["businessNumber"] ?? 0,
        location: Location.fromMap(json["location"] ?? {}),
        description: json["description"] ?? "",
        facebookUrl: json["facebookUrl"] ?? "",
        instagramUrl: json["instagramUrl"] ?? "",
        website: json["website"] ?? "",
        amenities: List<Amenity>.from(
            (json["amenities"] ?? []).map((x) => Amenity.fromMap(x))),
        workHours: List<WorkHour>.from(
            (json["workHours"] ?? []).map((x) => WorkHour.fromMap(x))),
        employees: List<Employee>.from(
            (json["Employees"] ?? []).map((x) => Employee.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "country_code": countryCode,
        "address": address.toMap(),
        "businessName": businessName,
        "businessNumber": businessNumber,
        "location": location.toMap(),
        "description": description,
        "facebookUrl": facebookUrl,
        "instagramUrl": instagramUrl,
        "website": website,
        "amenities": List<dynamic>.from(amenities.map((x) => x.toMap())),
        "workHours": List<dynamic>.from(workHours.map((x) => x.toMap())),
        "Employees": List<dynamic>.from(employees.map((x) => x.toMap())),
      };
}

class Address {
  final String address;
  final String province;
  final String apartment;
  final String city;
  final String zipCode;

  Address({
    required this.address,
    required this.province,
    required this.apartment,
    required this.city,
    required this.zipCode,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        address: json["address"] ?? "",
        province: json["province"] ?? "",
        apartment: json["apartment"] ?? "",
        city: json["city"] ?? "",
        zipCode: json["zipCode"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "province": province,
        "apartment": apartment,
        "city": city,
        "zipCode": zipCode,
      };
}

class Amenity {
  final String id;
  final String name;

  Amenity({
    required this.id,
    required this.name,
  });

  factory Amenity.fromMap(Map<String, dynamic> json) => Amenity(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
      };
}

class Employee {
  final String id;
  final String firstName;
  final String lastName;
  final String title;
  final String profileImage;

  Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.title,
    required this.profileImage,
  });

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        id: json["_id"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        title: json["title"] ?? "",
        profileImage: json["profileImage"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "title": title,
        "profileImage": profileImage,
      };
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        type: json["type"] ?? "",
        coordinates: List<double>.from(
            (json["coordinates"] ?? []).map((x) => x.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class WorkHour {
  final List<DayDetail> dayDetails;

  WorkHour({
    required this.dayDetails,
  });

  factory WorkHour.fromMap(Map<String, dynamic> json) => WorkHour(
        dayDetails: List<DayDetail>.from(
            (json["dayDetails"] ?? []).map((x) => DayDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "dayDetails": List<dynamic>.from(dayDetails.map((x) => x.toMap())),
      };
}

class DayDetail {
  final String day;
  final String startTime;
  final String endTime;
  final String breakStartTime;
  final String breakEndTime;
  final bool isOpen;
  final String id;

  DayDetail({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.breakStartTime,
    required this.breakEndTime,
    required this.isOpen,
    required this.id,
  });

  factory DayDetail.fromMap(Map<String, dynamic> json) => DayDetail(
        day: json["day"] ?? "",
        startTime: json["startTime"] ?? "",
        endTime: json["endTime"] ?? "",
        breakStartTime: json["breakStartTime"] ?? "",
        breakEndTime: json["breakEndTime"] ?? "",
        isOpen: json["isOpen"],
        id: json["_id"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "breakStartTime": breakStartTime,
        "breakEndTime": breakEndTime,
        "isOpen": isOpen,
        "_id": id,
      };
}
