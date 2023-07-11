// To parse this JSON data, do
//
//     final beauticianReportModel = beauticianReportModelFromMap(jsonString);

import 'dart:convert';

BeauticianReportModel beauticianReportModelFromMap(String str) => BeauticianReportModel.fromMap(json.decode(str));

String beauticianReportModelToMap(BeauticianReportModel data) => json.encode(data.toMap());

class BeauticianReportModel {
    int? status;
    Data? data;
    bool? success;

    BeauticianReportModel({
        this.status,
        this.data,
        this.success,
    });

    factory BeauticianReportModel.fromMap(Map<String, dynamic> json) => BeauticianReportModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        success: json["success"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": data?.toMap(),
        "success": success,
    };
}

class Data {
    AppointActivity? appointActivity;
    UpcomingAppointment? upcomingAppointment;
    List<TopService>? topServices;

    Data({
        this.appointActivity,
        this.upcomingAppointment,
        this.topServices,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        appointActivity: json["appointActivity"] == null ? null : AppointActivity.fromMap(json["appointActivity"]),
        upcomingAppointment: json["upcomingAppointment"] == null ? null : UpcomingAppointment.fromMap(json["upcomingAppointment"]),
        topServices: json["TopServices"] == null ? [] : List<TopService>.from(json["TopServices"]!.map((x) => TopService.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "appointActivity": appointActivity?.toMap(),
        "upcomingAppointment": upcomingAppointment?.toMap(),
        "TopServices": topServices == null ? [] : List<dynamic>.from(topServices!.map((x) => x.toMap())),
    };
}

class AppointActivity {
    int? totalAppointment;
    int? completed;
    int? notCompleted;
    int? cancelled;
    int? noShowStatus;

    AppointActivity({
        this.totalAppointment,
        this.completed,
        this.notCompleted,
        this.cancelled,
        this.noShowStatus,
    });

    factory AppointActivity.fromMap(Map<String, dynamic> json) => AppointActivity(
        totalAppointment: json["totalAppointment"],
        completed: json["completed"],
        notCompleted: json["notCompleted"],
        cancelled: json["cancelled"],
        noShowStatus: json["noShowStatus"],
    );

    Map<String, dynamic> toMap() => {
        "totalAppointment": totalAppointment,
        "completed": completed,
        "notCompleted": notCompleted,
        "cancelled": cancelled,
        "noShowStatus": noShowStatus,
    };
}

class TopService {
    String? id;
    String? serviceTypeName;
    int? currentMonth;
    int? lastMonth;

    TopService({
        this.id,
        this.serviceTypeName,
        this.currentMonth,
        this.lastMonth,
    });

    factory TopService.fromMap(Map<String, dynamic> json) => TopService(
        id: json["id"],
        serviceTypeName: json["serviceTypeName"],
        currentMonth: json["currentMonth"],
        lastMonth: json["lastMonth"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "serviceTypeName": serviceTypeName,
        "currentMonth": currentMonth,
        "lastMonth": lastMonth,
    };
}

class UpcomingAppointment {
    int? total;
    List<AppointmentList>? appointmentList;

    UpcomingAppointment({
        this.total,
        this.appointmentList,
    });

    factory UpcomingAppointment.fromMap(Map<String, dynamic> json) => UpcomingAppointment(
        total: json["total"],
        appointmentList: json["appointmentList"] == null ? [] : List<AppointmentList>.from(json["appointmentList"]!.map((x) => AppointmentList.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "appointmentList": appointmentList == null ? [] : List<dynamic>.from(appointmentList!.map((x) => x.toMap())),
    };
}

class AppointmentList {
    String? id;
    int? place;
    DateTime? dateTime;
    int? dummDis;
    String? clientFirstName;
    String? clientLastName;
    String? serviceName;
    int? subTotal;
    String? discount;
    String? gstORhst;
    double? pstORqst;
    int? sliikFee;
    double ? sliikFeeGst;
    double  ? sliikFeePst;
    double? totalSum;

    AppointmentList({
        this.id,
        this.place,
        this.dateTime,
        this.dummDis,
        this.clientFirstName,
        this.clientLastName,
        this.serviceName,
        this.subTotal,
        this.discount,
        this.gstORhst,
        this.pstORqst,
        this.sliikFee,
        required this.sliikFeeGst,
        required this.sliikFeePst,
        this.totalSum,
    });

    factory AppointmentList.fromMap(Map<String, dynamic> json) => AppointmentList(
        id: json["_id"],
        place: json["place"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        dummDis: json["dummDis"],
        clientFirstName: json["clientFirstName"],
        clientLastName: json["clientLastName"],
        serviceName: json["serviceName"],
        subTotal: json["subTotal"],
        discount: json["discount"].toString(),
        gstORhst: json["gstORhst"].toString(),
        pstORqst: json["pstORqst"]?.toDouble(),
        sliikFee: json["sliikFee"],
        sliikFeeGst: json["sliikFeeGST"].toDouble(),
        sliikFeePst: json["sliikFeePST"].toDouble(),
        totalSum: json["totalSum"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "place": place,
        "dateTime": dateTime?.toIso8601String(),
        "dummDis": dummDis,
        "clientFirstName": clientFirstName,
        "clientLastName": clientLastName,
        "serviceName": serviceName,
        "subTotal": subTotal,
        "discount": discount,
        "gstORhst": gstORhst,
        "pstORqst": pstORqst,
        "sliikFee": sliikFee,
        "sliikFeeGST": sliikFeeGst,
        "sliikFeePST": sliikFeePst,
        "totalSum": totalSum,
    };
}
