// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/client_app/home_screen/Search_services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/booking_cancel.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/booking_confirmed.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/booking_delivered.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/booking_noshow.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/booking_panding.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class home_appointments extends StatefulWidget {
  const home_appointments({Key? key}) : super(key: key);

  @override
  State<home_appointments> createState() => _home_appointmentsState();
}

class _home_appointmentsState extends State<home_appointments> {
  List<Datum> datalist = [];
  List<Data> data = [];
  bool upcoming = true;
  bool past = false;
  bool isLoading = false;
  PastAppointment? p;
  // ignore: non_constant_identifier_names
  ApintMentUpcomingModel? ApiUpcomingmodel;

  @override
  void initState() {
    super.initState();
    getAppointmentUpcomingList();
    // getAppointmentList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(
                  image: AssetImage("assets/images/bgappbar.png"),
                  fit: BoxFit.fill)),
          child: const Text("appointments",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontFamily: "spartan",
                  fontWeight: FontWeight.bold)).tr(),
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xFFDD6A03),
        onRefresh: () async {
          setState(() {
            getAppointmentUpcomingList();
            getAppointmentList();
          });
        },
        child: isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xffDD6A03),
          ),
        )
            :  SingleChildScrollView(
            child:  Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            upcoming = true;
                            past = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: upcoming
                                      ? const Color(0xFFDD5103)
                                      : Colors.black),
                              color: upcoming
                                  ? const Color(0xFFDD5103)
                                  : Colors.white),
                          child: Text("upcoming",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: upcoming
                                      ? Colors.white
                                      : Colors.black))
                              .tr(),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            upcoming = false;
                            past = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: past
                                      ? const Color(0xFFDD5103)
                                      : Colors.black),
                              color: past
                                  ? const Color(0xFFDD5103)
                                  : Colors.white),
                          child: Text("past",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color:
                                  past ? Colors.white : Colors.black))
                              .tr(),
                        ),
                      ),
                    ],
                  ),
                ),
                upcoming == true
                    ? datalist.isNotEmpty ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text("upcoming_appointments",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "spartan",
                              color: Colors.black)).tr(),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: datalist.length,
                        itemBuilder: (context, index) {
                          var startData =
                          DateFormat('dd MMM,yyyy | h:mm').format(
                              DateTime.parse(
                                  '${datalist[index].dateTime}'));
                          return InkWell(
                            onTap: () {
                              if(datalist[index].status == 0){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return booking_panding(id: datalist[index].id);
                                  },
                                ));
                              }else if(datalist[index].status == 1){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return BookingConfirmed(id: datalist[index].id);
                                  },
                                ));
                              }else if(datalist[index].status == 2){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return  booking_delivered(id: datalist[index].id);
                                  },
                                ));
                              }else if(datalist[index].status == 3){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return booking_cancel(id: datalist[index].id);
                                  },
                                ));
                              }else {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return  booking_noshow(id: datalist[index].id);
                                  },
                                ));
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black54),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: height * 0.09,
                                          width: width * 0.20,
                                          child: Image.network(
                                            "${datalist[index].beauticianId!.profileImage}",
                                            fit: BoxFit.fill,
                                            errorBuilder: (context,
                                                error, stackTrace) {
                                              return const Center(
                                                child: Text("No image"),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        //  Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(startData,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                    "spartan",
                                                    color: Colors
                                                        .black54)),
                                            SizedBox(
                                              width: width - 140,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      "${datalist[index].beauticianId!.businessName}",
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                          "spartan",
                                                          color: Colors
                                                              .black)),
                                                  const Spacer(),
                                                  Container(
                                                      alignment: Alignment
                                                          .center,
                                                      height: height * 0.03,
                                                      width: width * 0.22,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                          color: datalist[index].status == 0
                                                              ? Colors.yellow
                                                              : datalist[index].status == 1
                                                              ? Colors.green
                                                              : datalist[index].status == 2
                                                              ? Colors.blue
                                                              : datalist[index].status == 3
                                                              ? Colors.red
                                                              : datalist[index].status == 4
                                                              ? Colors.red
                                                              : Colors.green),
                                                      child: Text(
                                                          datalist[index].status == 0
                                                              ? "pending"
                                                              : datalist[index].status == 1
                                                              ? "Accepted"
                                                              : datalist[index].status == 2
                                                              ? "Delivered"
                                                              : datalist[index].status == 3
                                                              ? "Cancelled"
                                                              : datalist[index].status == 4
                                                              ? "No Show"
                                                              : "pending",
                                                          style:  TextStyle(fontSize: 14, fontFamily: "spartan", color: datalist[index].status == 0
                                                              ? Colors.black
                                                              : datalist[index].status == 1
                                                              ? Colors.white
                                                              : datalist[index].status == 2
                                                              ? Colors.white
                                                              : datalist[index].status == 3
                                                              ? Colors.white
                                                              : datalist[index].status == 4
                                                              ? Colors.white
                                                              : Colors.white))
                                                          .tr()),
                                                ],
                                              ),
                                            ),
                                            Text(
                                                "${datalist[index].serviceId?.serviceType?.serviceTypeName}",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                    "spartan",
                                                    color: Colors
                                                        .black54)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ): SizedBox(
                  height: height,
                  child: Column(
                    children: [
                      const Spacer(),
                      Image.asset("assets/images/NoAppointment.png"),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const searchservices();
                            },));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.07,
                            width: width,
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFFDD5103)),
                                color: const Color(0xFFDD5103),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5)
                                )
                            ),
                            child: const Text(
                              "Find beauticians near you",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
                    : data.isNotEmpty ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text("past_appointment",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "spartan",
                              color: Colors.black))
                          .tr(),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          var startData = DateFormat('dd MMM,yyyy | h:mm').format(DateTime.parse('${data[index].dateTime}'));
                          return InkWell(
                            onTap: () {
                              if(datalist[index].status == 0){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return booking_panding(id: datalist[index].id);
                                  },
                                ));
                              }else if(datalist[index].status == 1){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return BookingConfirmed(id: datalist[index].id);
                                  },
                                ));
                              }else if(datalist[index].status == 2){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return  booking_delivered(id: datalist[index].id);
                                  },
                                ));
                              }else if(datalist[index].status == 3){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return booking_cancel(id: datalist[index].id);
                                  },
                                ));
                              }else {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return booking_noshow(id: datalist[index].id);
                                  },
                                ));
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black54),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: height * 0.09,
                                          width: width * 0.20,
                                          child: Image.network(
                                            "${data[index].beauticianId!.profileImage}",
                                            fit: BoxFit.fill,
                                            errorBuilder: (context,
                                                error, stackTrace) {
                                              return const Center(
                                                child: Text("No image"),
                                              );
                                            },
                                          ),
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(startData,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                    "spartan",
                                                    color: Colors
                                                        .black54)),
                                            SizedBox(
                                              width: width - 140,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${data[index].beauticianId!.firstName}",
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                          "spartan",
                                                          color: Colors
                                                              .black)),
                                                  const Spacer(),
                                                  Container(
                                                    alignment:
                                                    Alignment.center,
                                                    height: height * 0.03,
                                                    width: width * 0.22,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: data[index].status == 0
                                                            ? Colors.yellow
                                                            : data[index].status == 1
                                                            ? Colors.green
                                                            : data[index].status == 2
                                                            ? Colors.blue
                                                            : data[index].status == 3
                                                            ? Colors.red
                                                            : data[index].status == 4
                                                            ? Colors.red
                                                            : Colors.green),
                                                    child: Text(
                                                        data[index].status == 0
                                                            ? "pending"
                                                            : data[index].status == 1
                                                            ? "Accepted"
                                                            : data[index].status == 2
                                                            ? "Delivered"
                                                            : data[index].status == 3
                                                            ? "Cancelled"
                                                            : data[index].status == 4
                                                            ? "No Show"
                                                            : "pending",
                                                        style: TextStyle(fontSize: 14, fontFamily: "spartan", color: datalist[index].status == 0
                                                            ? Colors.black
                                                            : datalist[index].status == 1
                                                            ? Colors.white
                                                            : datalist[index].status == 2
                                                            ? Colors.white
                                                            : datalist[index].status == 3
                                                            ? Colors.white
                                                            : datalist[index].status == 4
                                                            ? Colors.white
                                                            : Colors.white))
                                                        .tr(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                                "${data[index].serviceId!.serviceType!.serviceTypeName}",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                    "spartan",
                                                    color: Colors
                                                        .black54)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ) : SizedBox(
                  height: height,
                  child: Column(
                    children: const [
                      Spacer(),
                      Center(
                        child: Text(
                          "No Data Found!!!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "spartan",
                          ),
                        ),),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  getAppointmentUpcomingList() async {
    try {
      setState(() {
        isLoading = true;
      });
      var geturi = Uri.parse(ApiUrlList.getUpcomingAppointmentList);

      print("getupcoming uri=$geturi");
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("apoinmentupcoming response.body ==> ${response.body}");
      log("apoinmentupcoming status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        ApiUpcomingmodel =
            ApintMentUpcomingModel.fromJson(jsonDecode(response.body));
        datalist = ApiUpcomingmodel!.data!;
      }
    } catch (e) {
      rethrow;
    } finally {
      getAppointmentList();
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

  getAppointmentList() async {
    var getUri = Uri.parse(ApiUrlList.getAppointmentList);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      print("getAppointmentList url is ====> $getUri");

      var response = await http.get(
        getUri,
        headers: headers,
      );

      print("getClientFavoriteList status code ====> ${response.statusCode}");
      print(" getClientFavoriteList res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          p = PastAppointment.fromjson(map);
          data = p!.data!;
        }
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

class ApintMentUpcomingModel {
  int? status;
  bool? success;
  List<Datum>? data;

  ApintMentUpcomingModel({
    this.status,
    this.success,
    this.data,
  });

  factory ApintMentUpcomingModel.fromJson(Map<String, dynamic> json) =>
      ApintMentUpcomingModel(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? clientId;

  BeauticianIdClass? beauticianId;
  ServiceId? serviceId;
  BeauticianIdClass? stylistId;
  DateTime? dateTime;
  DateTime? endDateTime;
  int? price;
  int? place;
  String? note;
  int? status;
  String? createdBy;
  dynamic recurringOpt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.clientId,
    this.beauticianId,
    this.serviceId,
    this.stylistId,
    this.dateTime,
    this.endDateTime,
    this.price,
    this.place,
    this.note,
    this.status,
    this.createdBy,
    this.recurringOpt,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    clientId: json["clientId"],
    beauticianId: json["beauticianId"] == null
        ? null
        : BeauticianIdClass.fromJson(json["beauticianId"]),
    serviceId: json["serviceId"] == null
        ? null
        : ServiceId.fromJson(json["serviceId"]),
    stylistId: json["stylistID"] == null
        ? null
        : BeauticianIdClass.fromJson(json["stylistID"]),
    dateTime:
    json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    endDateTime: json["endDateTime"] == null
        ? null
        : DateTime.parse(json["endDateTime"]),
    price: json["price"],
    place: json["place"],
    note: json["note"],
    status: json["status"],
    createdBy: json["createdBy"]!,
    recurringOpt: json["recurringOpt"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientId": clientId,
    "beauticianId": beauticianId?.toJson(),
    "serviceId": serviceId?.toJson(),
    "stylistID": stylistId?.toJson(),
    "dateTime": dateTime?.toIso8601String(),
    "endDateTime": endDateTime?.toIso8601String(),
    "price": price,
    "place": place,
    "note": note,
    "status": status,
    "createdBy": createdBy,
    "recurringOpt": recurringOpt,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class BeauticianIdClass {
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? profileImage;
  String? businessName;

  BeauticianIdClass(
      {this.id,
        this.firstName,
        this.lastName,
        this.gender,
        this.profileImage,
        this.businessName});

  factory BeauticianIdClass.fromJson(Map<String, dynamic> json) =>
      BeauticianIdClass(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        profileImage: json["profileImage"],
        businessName: json["businessName"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "profileImage": profileImage,
    "businessName": businessName,
  };
}

class ServiceId {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  int? price;
  String? description;

  ServiceId({
    this.id,
    this.beauticianId,
    this.serviceCategory,
    this.serviceType,
    this.duration,
    this.price,
    this.description,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"]!,
    beauticianId: json["beauticianId"]!,
    serviceCategory: json["serviceCategory"] == null
        ? null
        : ServiceCategory.fromJson(json["serviceCategory"]),
    serviceType: json["serviceType"] == null
        ? null
        : ServiceType.fromJson(json["serviceType"]),
    duration: json["duration"],
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "beauticianId": beauticianId,
    "serviceCategory": serviceCategory?.toJson(),
    "serviceType": serviceType?.toJson(),
    "duration": duration,
    "price": price,
    "description": description,
  };
}

class ServiceCategory {
  String? id;
  String? serviceCategoryName;

  ServiceCategory({
    this.id,
    this.serviceCategoryName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        id: json["_id"]!,
        serviceCategoryName: json["serviceCategoryName"]!,
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceCategoryName": serviceCategoryName,
  };
}

class ServiceType {
  String? id;
  String? serviceTypeName;

  ServiceType({
    this.id,
    this.serviceTypeName,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    id: json["_id"]!,
    serviceTypeName: json["serviceTypeName"]!,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceTypeName": "serviceTypeName",
  };
}

class PastAppointment{
  int? status;
  bool? success;
  List<Data>? data;

  PastAppointment({this.status,this.success,this.data});
  factory PastAppointment.fromjson(Map<dynamic, dynamic>map){
    List list = map['data'] ?? [];
    List<Data> data = list.map((e) => Data.fromjson(e)).toList();
    return PastAppointment(
      status: map['status'],
      success: map['success'],
      data: data,
    );
  }
}

class Data{
  String? id;
  String? clientId;
  BeauticianIdPast? beauticianId;
  ServiceIdPast? serviceId;
  StylistIdPast? stylistId;
  String? dateTime;
  String? endDateTime;
  int? price;
  int? place;
  String? note;
  int? status;
  String? createdBy;
  String? recurringOpt;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({
    this.id,
    this.clientId,
    this.beauticianId,
    this.serviceId,
    this.stylistId,
    this.dateTime,
    this.endDateTime,
    this.price,
    this.place,
    this.note,
    this.status,
    this.createdBy,
    this.recurringOpt,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromjson(Map<dynamic, dynamic>map1){
    return Data(
      id: map1["_id"],
      clientId: map1["clientId"],
      beauticianId: BeauticianIdPast.fromjson(map1["beauticianId"] ?? {}),
      serviceId: ServiceIdPast.fromjson(map1["serviceId"] ?? {}),
      stylistId: StylistIdPast.fromjson(map1["stylistID"] ?? {}),
      dateTime: map1["dateTime"],
      endDateTime: map1["endDateTime"],
      price: map1["price"],
      place: map1["place"],
      note: map1["note"],
      status: map1["status"],
      createdBy: map1["createdBy"],
      recurringOpt: map1["recurringOpt"] ?? "",
      createdAt: map1["createdAt"],
      updatedAt: map1["updatedAt"],
      v: map1["__v"],
    );
  }
}

class BeauticianIdPast{
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  Address? address;
  String? businessName;
  String? profileImage;

  BeauticianIdPast({this.id,this.firstName,this.lastName,this.gender,this.address,this.businessName,this.profileImage});
  factory BeauticianIdPast.fromjson(Map<dynamic, dynamic>map3){
    return BeauticianIdPast(
      id: map3['_id'],
      firstName: map3['firstName'],
      lastName: map3['lastName'],
      gender: map3['gender'],
      address: Address.fromjson(map3['address']),
      businessName: map3['businessName'],
      profileImage: map3['profileImage'],
    );
  }
}

class Address{
  String? id;
  String? address;
  Province? province;
  String? apartment;
  String? zipCode;
  String? createdAt;
  String? updatedAt;
  int? v;

  Address({this.id,this.address,this.province,this.apartment,this.zipCode,this.createdAt,this.updatedAt,this.v});
  factory Address.fromjson(Map<dynamic, dynamic>map4){
    return Address(
      id: map4['_id'],
      address: map4['address'],
      province: Province.fromjson(map4['province']),
      apartment: map4['apartment'],
      zipCode: map4['zipCode'],
      createdAt: map4['createdAt'],
      updatedAt: map4['updatedAt'],
      v: map4['__v'],
    );
  }
}

class Province{
  String? id;
  String? province;

  Province({
    this.id,
    this.province
  });

  factory Province.fromjson(Map<dynamic, dynamic>map){
    return Province(
      id: map['_id'] ?? "",
      province: map['province'] ?? "",
    );
  }
}

class ServiceIdPast{
  String? id;
  String? beauticianId;
  ServiceCategoryPast? serviceCategory;
  ServiceTypePast? serviceType;
  String? duration;
  int? price;
  String? description;

  ServiceIdPast({
    this.id,
    this.beauticianId,
    this.serviceCategory,
    this.serviceType,
    this.duration,
    this.price,
    this.description,
  });

  factory ServiceIdPast.fromjson(Map<dynamic, dynamic>map5){
    return ServiceIdPast(
      id: map5["_id"]!,
      beauticianId: map5["beauticianId"]!,
      serviceCategory: ServiceCategoryPast.fromjson(map5["serviceCategory"] ?? {}),
      serviceType: ServiceTypePast.fromjson(map5["serviceType"] ?? {}),
      duration: map5["duration"],
      price: map5["price"],
      description: map5["description"],
    );
  }
}

class ServiceCategoryPast{
  String? id;
  String? serviceCategoryName;

  ServiceCategoryPast({
    this.id,
    this.serviceCategoryName,
  });

  factory ServiceCategoryPast.fromjson(Map<dynamic,dynamic>map6){
    return ServiceCategoryPast(
      id: map6['_id'],
      serviceCategoryName: map6['serviceCategoryName'],
    );
  }
}

class ServiceTypePast{
  String? id;
  String? serviceTypeName;

  ServiceTypePast({
    this.id,
    this.serviceTypeName,
  });

  factory ServiceTypePast.fromjson(Map<dynamic,dynamic>map6){
    return ServiceTypePast(
      id: map6['_id'],
      serviceTypeName: map6['serviceTypeName'],
    );
  }
}

class StylistIdPast {
  String? id;
  String? firstName;
  String? lastName;
  String? profileImage;

  StylistIdPast({this.id,this.firstName,this.lastName,this.profileImage});
  factory StylistIdPast.fromjson(Map<dynamic,dynamic>map3){
    return StylistIdPast(
      id: map3['_id'] ?? "",
      firstName: map3['firstName'] ?? "",
      lastName: map3['lastName'] ?? "",
      profileImage: map3['profileImage'] ?? "",
    );
  }
}
