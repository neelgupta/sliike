import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;
import '../ beautician _page/booking_summary_paymentconfirm.dart';
import '../../client_model/getpost_Appointment.dart';

class home_appointments extends StatefulWidget {
  const home_appointments({Key? key}) : super(key: key);

  @override
  State<home_appointments> createState() => _home_appointmentsState();
}

class _home_appointmentsState extends State<home_appointments> {
  List<Datum> datalist = [];
  bool upcoming = true;
  bool past = false;
  bool isLoading = false;
  ApintMentUpcomingModel? ApiUpcomingmodel;
  PastModal? posmodal;

  // ApintMentUpcomingModel? a;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        getAppointmentUpcomingList();
        getAppointmentPastList();
      });
    });

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
          decoration: BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(
                  image: AssetImage("assets/images/bgappbar.png"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: height * 0.06,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Image(
                              image: AssetImage("assets/images/Group 55.png"),
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("appointments",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold))
                            .tr(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                              color:
                              upcoming ? Color(0xFFDD5103) : Colors.black),
                          color: upcoming ? Color(0xFFDD5103) : Colors.white),
                      child: Text("upcoming",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color:
                              upcoming ? Colors.white : Colors.black))
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
                              color: past ? Color(0xFFDD5103) : Colors.black),
                          color: past ? Color(0xFFDD5103) : Colors.white),
                      child: Text("past",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: past ? Colors.white : Colors.black))
                          .tr(),
                    ),
                  ),
                ],
              ),
            ),
            upcoming == true
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text("upcoming_appointments",
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
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: datalist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return booking_summary_paymentconfirm(datalist[index].id);
                            },
                          ));
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black54),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: height * 0.08,
                                      width: width * 0.18,
                                      child: Image.network(
                                        "${datalist[index].beauticianId!.profileImage}",
                                        fit: BoxFit.fill,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Center(child:Text( "No image"),);
                                        },
                                      ),
                                    ),
                                    SizedBox(width: width*0.02,),
                                    //  Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${DateFormat.d().format(DateTime.parse(datalist[index].updatedAt.toString()))} ${DateFormat.MMM().format(DateTime.parse(datalist[index].updatedAt.toString()))}. ${DateFormat.y().format(DateTime.parse(datalist[index].updatedAt.toString()))}-${DateFormat.jm().format(DateTime.parse(datalist[index].updatedAt.toString()))}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "spartan",
                                                color: Colors.black54)),
                                        Row(mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                                "${datalist[index].beauticianId!.businessName}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        Text(
                                            "${datalist[index].serviceId?.serviceType?.serviceTypeName}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "spartan",
                                                color: Colors.black54)),
                                      ],
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: height * 0.03,
                                        width: width * 0.20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(20),
                                            color: datalist[index].status == 0
                                                ?Colors.yellow:datalist[index].status == 1
                                                ?Colors.green:datalist[index].status == 2?Colors.blue:datalist[index].status == 3?Colors.red:datalist[index].status == 4?Colors.red:
                                            Colors.green),
                                        child:  Text(datalist[index].status == 0
                                            ?"pending":datalist[index].status == 1
                                            ?"Accepted":datalist[index].status == 2?
                                        "Delivered":datalist[index].status == 3?
                                        "cancel":datalist[index].status == 4?"No Show":"pending",
                                            style: TextStyle(
                                                fontSize:
                                                12,
                                                fontFamily:
                                                "spartan",
                                                color: datalist[index].status == 0?Colors.black:Colors
                                                    .white))
                                            .tr()

                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            )
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text("past_appointment",
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
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: posmodal!.data!.length,
                    itemBuilder: (context, index) {
                      return  Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return booking_summary_paymentconfirm(datalist[index].id);
                                },
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black54),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: height * 0.08,
                                      width: width * 0.18,
                                      child: Image(image: NetworkImage(posmodal!.data![index].beauticianId!.logoPath.toString() != null?posmodal!.data![index].beauticianId!.logoPath.toString():"")),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("${DateFormat.d().format(DateTime.parse(posmodal!.data![index].dateTime.toString()))} ${DateFormat.MMM().format(DateTime.parse(posmodal!.data![index].dateTime.toString()))}. ${DateFormat.y().format(DateTime.parse(posmodal!.data![index].dateTime.toString()))}-${DateFormat.jm().format(DateTime.parse(posmodal!.data![index].dateTime.toString()))}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "spartan",
                                                color: Colors.black54)),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("${posmodal!.data![index].beauticianId!.firstName} ${posmodal!.data![index].beauticianId!.lastName}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),

                                          ],
                                        ),
                                        Text("${posmodal!.data![index].serviceId!.serviceCategory!.serviceCategoryName}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "spartan",
                                                color: Colors.black54)),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: height * 0.03,
                                      width: width * 0.20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: posmodal!.data![index].status == 0
                                              ?Colors.yellow:posmodal!.data![index].status == 1
                                              ?Colors.green:posmodal!.data![index].status == 2?Colors.blue:posmodal!.data![index].status == 3?Colors.red:posmodal!.data![index].status == 4?Colors.red:
                                          posmodal!.data![index].status == 5?Colors.red:Colors.green),
                                      child: Text(posmodal!.data![index].status == 0
                                          ?"pending":posmodal!.data![index].status == 1
                                          ?"confirm":posmodal!.data![index].status == 2?"delivered":posmodal!.data![index].status == 3?"cancel":posmodal!.data![index].status == 4?"cancel":
                                      posmodal!.data![index].status == 5?"no show":"",
                                          style: TextStyle(
                                            color: posmodal!.data![index].status == 0?Colors.black:Colors
                                                .white,
                                            fontSize: 12,
                                            fontFamily: "spartan",
                                          ))
                                          .tr(),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      );
                    },
                  )
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return booking_cancel();
                  //       },
                  //     ));
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: Colors.black54),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //               height: height * 0.09,
                  //               width: width * 0.20,
                  //               child: Image(
                  //                 image: AssetImage(
                  //                     "assets/images/Rectangle 944.png"),
                  //                 fit: BoxFit.fill,
                  //               )),
                  //           Spacer(),
                  //           Column(
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Text("20 Sep, 2022 - 9:00",
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontFamily: "spartan",
                  //                       color: Colors.black54)),
                  //               Row(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text("Freshman Cutz",
                  //                       style: TextStyle(
                  //                           fontSize: 12,
                  //                           fontFamily: "spartan",
                  //                           color: Colors.black)),
                  //                   SizedBox(
                  //                     width: width * 0.16,
                  //                   ),
                  //                   Container(
                  //                     alignment: Alignment.center,
                  //                     height: height * 0.03,
                  //                     width: width * 0.22,
                  //                     decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(20),
                  //                         color: Colors.red),
                  //                     child: Text("cancelled",
                  //                             style: TextStyle(
                  //                                 fontSize: 14,
                  //                                 fontFamily: "spartan",
                  //                                 color: Colors.white))
                  //                         .tr(),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text("Hair Dye",
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontFamily: "spartan",
                  //                       color: Colors.black54)),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return booking_delivered();
                  //       },
                  //     ));
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: Colors.black54),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //               height: height * 0.09,
                  //               width: width * 0.20,
                  //               child: Image(
                  //                 image: AssetImage(
                  //                     "assets/images/Rectangle 944.png"),
                  //                 fit: BoxFit.fill,
                  //               )),
                  //           Spacer(),
                  //           Column(
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Text("20 Sep, 2022 - 9:00",
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontFamily: "spartan",
                  //                       color: Colors.black54)),
                  //               Row(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text("Freshman Cutz",
                  //                       style: TextStyle(
                  //                           fontSize: 12,
                  //                           fontFamily: "spartan",
                  //                           color: Colors.black)),
                  //                   SizedBox(
                  //                     width: width * 0.16,
                  //                   ),
                  //                   Container(
                  //                     alignment: Alignment.center,
                  //                     height: height * 0.03,
                  //                     width: width * 0.22,
                  //                     decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(20),
                  //                         color: Colors.blue),
                  //                     child: Text("delivered",
                  //                             style: TextStyle(
                  //                                 fontSize: 14,
                  //                                 fontFamily: "spartan",
                  //                                 color: Colors.white))
                  //                         .tr(),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text("Hair Dye",
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontFamily: "spartan",
                  //                       color: Colors.black54)),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return booking_noshow();
                  //       },
                  //     ));
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: Colors.black54),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //               height: height * 0.09,
                  //               width: width * 0.20,
                  //               child: Image(
                  //                 image: AssetImage(
                  //                     "assets/images/Rectangle 944.png"),
                  //                 fit: BoxFit.fill,
                  //               )),
                  //           Spacer(),
                  //           Column(
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Text("20 Sep, 2022 - 9:00",
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontFamily: "spartan",
                  //                       color: Colors.black54)),
                  //               Row(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text("Freshman Cutz",
                  //                       style: TextStyle(
                  //                           fontSize: 12,
                  //                           fontFamily: "spartan",
                  //                           color: Colors.black)),
                  //                   SizedBox(
                  //                     width: width * 0.16,
                  //                   ),
                  //                   Container(
                  //                     alignment: Alignment.center,
                  //                     height: height * 0.03,
                  //                     width: width * 0.22,
                  //                     decoration: BoxDecoration(
                  //                         borderRadius:
                  //                             BorderRadius.circular(20),
                  //                         color: Colors.red),
                  //                     child: Text("no_show",
                  //                             style: TextStyle(
                  //                                 fontSize: 08,
                  //                                 fontFamily: "spartan",
                  //                                 color: Colors.white))
                  //                         .tr(),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text("Hair Dye",
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontFamily: "spartan",
                  //                       color: Colors.black54)),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getAppointmentUpcomingList() async {
    try {
      // setState(() {
      //   isLoading = true;
      // });
      Loader.show(
        context,
        isSafeAreaOverlay: false,
        // isBottomBarOverlay: false,
        // overlayFromBottom: 80,
        overlayColor: Colors.black26,
        progressIndicator:
        const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff01635D),
          ),
        ),
      );
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
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        ApiUpcomingmodel =
            ApintMentUpcomingModel.fromJson(jsonDecode(response.body));

        datalist = ApiUpcomingmodel!.data!;

        print("datalist===$datalist");
        //  print("datalist==${a!.data[0].serviceId.duration}");
        setState(() {

        });
      }
    } catch (e) {
      rethrow;
    } finally {
      Loader.hide();
      //   setState(() {
      //     isLoading = false;
      //   });
    }
  }

  getAppointmentPastList() async {
    try {
      // setState(() {
      //   isLoading = true;
      // });
      Loader.show(
        context,
        isSafeAreaOverlay: false,
        // isBottomBarOverlay: false,
        // overlayFromBottom: 80,
        overlayColor: Colors.black26,
        progressIndicator:
        const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff01635D),
          ),
        ),
      );
      var geturi = Uri.parse(ApiUrlList.getpastAppointmentList);

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
      log("getAppointmentPastList response.body ==> ${response.body}");
      log("getAppointmentPastList status code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        posmodal = PastModal.fromJson(jsonDecode(response.body));

        // print("datalist===$datalist");
        //  print("datalist==${a!.data[0].serviceId.duration}");
        setState(() {

        });
      }else{

      }
    } catch (e) {
      rethrow;
    } finally {
      Loader.hide();
      //   setState(() {
      //     isLoading = false;
      //   });
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

  BeauticianIdClass({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.profileImage,
    this.businessName
  });

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
    "firstName":firstName,
    "lastName":lastName,
    "gender": gender,
    "profileImage": profileImage,
    "businessName":businessName,
  };
}

// enum FirstName { TESTING2, ASHIN1 }
//
// final firstNameValues =
//     EnumValues({"Ashin1": FirstName.ASHIN1, "testing2": FirstName.TESTING2});
//
// enum Gender { MALE }
//
// final genderValues = EnumValues({"male ": Gender.MALE});
//
// enum Id {
//   THE_645_B85_BF2_C1_C19_F02_C8_F1_C9_B,
//   THE_645_CBB374_B1_F272_FD815_D0_F2
// }
//
// final idValues = EnumValues({
//   "645b85bf2c1c19f02c8f1c9b": Id.THE_645_B85_BF2_C1_C19_F02_C8_F1_C9_B,
//   "645cbb374b1f272fd815d0f2": Id.THE_645_CBB374_B1_F272_FD815_D0_F2
// });
//
// enum LastName { TESTING21, MALIK }

// final lastNameValues =
//     EnumValues({"Malik": LastName.MALIK, "testing21": LastName.TESTING21});
//
// enum ClientId { THE_645_A239457_AF889495_E10245 }

// final clientIdValues = EnumValues(
//     {"645a239457af889495e10245": ClientId.THE_645_A239457_AF889495_E10245});
//
// enum CreatedBy { CLIENT }

// final createdByValues = EnumValues({"client": CreatedBy.CLIENT});

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

// enum Duration { THE_0030, THE_0100 }
//
// final durationValues =
//     EnumValues({"00:30": Duration.THE_0030, "01:00": Duration.THE_0100});
//
// enum PurpleId {
//   THE_645_CEB8_E1_C9_CA21_F8081522_D,
//   THE_645_CEB8_E1_C9_CA21_F8081522_E
// }
//
// final purpleIdValues = EnumValues({
//   "645ceb8e1c9ca21f8081522d": PurpleId.THE_645_CEB8_E1_C9_CA21_F8081522_D,
//   "645ceb8e1c9ca21f8081522e": PurpleId.THE_645_CEB8_E1_C9_CA21_F8081522_E
// });

class ServiceCategory {
  String? id;
  String? serviceCategoryName;

  ServiceCategory({
    this.id,
    this.serviceCategoryName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        id:json["_id"]!,
        serviceCategoryName:
        json["serviceCategoryName"]!,
      );

  Map<String, dynamic> toJson() => {
    "_id":id,
    "serviceCategoryName":
    serviceCategoryName,
  };
}

// enum ServiceCategoryId { THE_6448_C3_FC983_BC7_EF8_CF02_FF7 }

// final serviceCategoryIdValues = EnumValues({
//   "6448c3fc983bc7ef8cf02ff7":
//       ServiceCategoryId.THE_6448_C3_FC983_BC7_EF8_CF02_FF7
// });
//
// enum ServiceCategoryName { BARBER }

// final serviceCategoryNameValues =
//     EnumValues({"Barber": ServiceCategoryName.BARBER});

class ServiceType {
  String? id;
  String? serviceTypeName;

  ServiceType({
    this.id,
    this.serviceTypeName,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    id: json["_id"]!,
    serviceTypeName:json["serviceTypeName"]!,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceTypeName": "serviceTypeName",
  };
}

// enum ServiceTypeId {
//   THE_6448_CA7_BE2425_C80585646_F1,
//   THE_6448_D8761_AFAB039_A42_C1_F36
// }
//
// final serviceTypeIdValues = EnumValues({
//   "6448ca7be2425c80585646f1": ServiceTypeId.THE_6448_CA7_BE2425_C80585646_F1,
//   "6448d8761afab039a42c1f36": ServiceTypeId.THE_6448_D8761_AFAB039_A42_C1_F36
// });

// enum ServiceTypeName { MEN_S_CUT, WOMEN_S_CUT }

// final serviceTypeNameValues = EnumValues({
//   "Men's Cut": ServiceTypeName.MEN_S_CUT,
//   "Women's Cut": ServiceTypeName.WOMEN_S_CUT
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }




