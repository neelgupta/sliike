// To parse this JSON data, do
//
//     final getAppointmentDetailModel = getAppointmentDetailModelFromJson(jsonString);

import 'dart:convert';

GetAppointmentDetailModel getAppointmentDetailModelFromJson(String str) => GetAppointmentDetailModel.fromJson(json.decode(str));

String getAppointmentDetailModelToJson(GetAppointmentDetailModel data) => json.encode(data.toJson());

class GetAppointmentDetailModel {
  int? status;
  bool? success;
  Data? data;

  GetAppointmentDetailModel({
    this.status,
    this.success,
    this.data,
  });

  factory GetAppointmentDetailModel.fromJson(Map<String, dynamic> json) => GetAppointmentDetailModel(
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
  TimingOfDay? timingOfDay;
  CalenderSetting? calenderSetting;

  Data({
    this.appointmentData,
    this.timingOfDay,
    this.calenderSetting,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    appointmentData: json["appointmentData"] == null ? [] : List<AppointmentDatum>.from(json["appointmentData"]!.map((x) => AppointmentDatum.fromJson(x))),
    timingOfDay: json["timingOfDay"] == null ? null : TimingOfDay.fromJson(json["timingOfDay"]),
    calenderSetting: json["calenderSetting"] == null ? null : CalenderSetting.fromJson(json["calenderSetting"]),
  );

  Map<String, dynamic> toJson() => {
    "appointmentData": appointmentData == null ? [] : List<dynamic>.from(appointmentData!.map((x) => x.toJson())),
    "timingOfDay": timingOfDay?.toJson(),
    "calenderSetting": calenderSetting?.toJson(),
  };
}

class AppointmentDatum {
  String? id;
  String? clientId;
  String? beauticianId;
  String? serviceId;
  String? stylistId;
  DateTime? dateTime;
  DateTime? endDateTime;
  String? paymentDetails;
  ServiceDetails? serviceDetails;
  ClientData? clientData;

  AppointmentDatum({
    this.id,
    this.clientId,
    this.beauticianId,
    this.serviceId,
    this.stylistId,
    this.dateTime,
    this.endDateTime,
    this.paymentDetails,
    this.serviceDetails,
    this.clientData,
  });

  factory AppointmentDatum.fromJson(Map<String, dynamic> json) => AppointmentDatum(
    id: json["_id"],
    clientId: json["clientId"],
    beauticianId: json["beauticianId"],
    serviceId: json["serviceId"],
    stylistId: json["stylistID"],
    dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    endDateTime: json["endDateTime"] == null ? null : DateTime.parse(json["endDateTime"]),
    paymentDetails: json["paymentDetails"],
    serviceDetails: json["serviceDetails"] == null ? null : ServiceDetails.fromJson(json["serviceDetails"]),
    clientData: json["clientData"] == null ? null : ClientData.fromJson(json["clientData"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientId": clientId,
    "beauticianId": beauticianId,
    "serviceId": serviceId,
    "stylistID": stylistId,
    "dateTime": dateTime?.toIso8601String(),
    "endDateTime": endDateTime?.toIso8601String(),
    "paymentDetails": paymentDetails,
    "serviceDetails": serviceDetails?.toJson(),
    "clientData": clientData?.toJson(),
  };
}

class ClientData {
  String? id;
  String? firstName;
  String? lastName;

  ClientData({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) => ClientData(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
  };
}

class ServiceDetails {
  String? id;
  String? serviceType;
  String? serviceTypeName;

  ServiceDetails({
    this.id,
    this.serviceType,
    this.serviceTypeName,
  });

  factory ServiceDetails.fromJson(Map<String, dynamic> json) => ServiceDetails(
    id: json["_id"],
    serviceType: json["serviceType"],
    serviceTypeName: json["serviceTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceType": serviceType,
    "serviceTypeName": serviceTypeName,
  };
}

class CalenderSetting {
  int? formate;
  String? startDay;

  CalenderSetting({
    this.formate,
    this.startDay,
  });

  factory CalenderSetting.fromJson(Map<String, dynamic> json) => CalenderSetting(
    formate: json["formate"],
    startDay: json["startDay"],
  );

  Map<String, dynamic> toJson() => {
    "formate": formate,
    "startDay": startDay,
  };
}

class TimingOfDay {
  String? day;
  String? startTime;
  String? endTime;
  String? breakStartTime;
  String? breakEndTime;
  bool? isOpen;
  String? id;

  TimingOfDay({
    this.day,
    this.startTime,
    this.endTime,
    this.breakStartTime,
    this.breakEndTime,
    this.isOpen,
    this.id,
  });

  factory TimingOfDay.fromJson(Map<String, dynamic> json) => TimingOfDay(
    day: json["day"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    breakStartTime: json["breakStartTime"],
    breakEndTime: json["breakEndTime"],
    isOpen: json["isOpen"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "startTime": startTime,
    "endTime": endTime,
    "breakStartTime": breakStartTime,
    "breakEndTime": breakEndTime,
    "isOpen": isOpen,
    "_id": id,
  };
}
