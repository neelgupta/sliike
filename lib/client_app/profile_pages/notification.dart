// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import '../../utils/preferences.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool appointment = false;
  bool product = false;
  bool email = false;
  bool isLoading = false;
  Notification? n;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xffDD6A03),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: height * 0.06,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
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
                              const Text("notifications",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.bold))
                                  .tr(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text("sliike_only",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: "spartan"))
                        .tr(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text("app_setting",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold))
                        .tr(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text("app_info",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: "spartan"))
                        .tr(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        const Text("text_message",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold))
                            .tr(),
                        const Spacer(),
                        FlutterSwitch(
                          width: 50.0,
                          height: 25.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          activeColor: const Color(0xFFDD6A03),
                          value: product,
                          onToggle: (bool value) {
                            setState(() {
                              product = value;
                              appointment = false;
                              email = false;
                              if (product = value) {
                                setState(() {
                                  saveNotification();
                                });
                              }
                            });
                          },
                        )
                      ],
                    ),
                    const Text("text_info",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: "spartan"))
                        .tr(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        const Text("product",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold))
                            .tr(),
                        const Spacer(),
                        FlutterSwitch(
                          width: 50.0,
                          height: 25.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          activeColor: const Color(0xFFDD6A03),
                          value: appointment,
                          onToggle: (bool value) {
                            setState(() {
                              product = false;
                              appointment = value;
                              email = false;
                              if (appointment = value) {
                                setState(() {
                                  saveNotification();
                                });
                              }
                            });
                          },
                        )
                      ],
                    ),
                    const Text("product_info",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: "spartan"))
                        .tr(),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        const Text("email_market",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold))
                            .tr(),
                        const Spacer(),
                        FlutterSwitch(
                          width: 50.0,
                          height: 25.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          activeColor: const Color(0xFFDD6A03),
                          value: email,
                          onToggle: (bool value) {
                            setState(() {
                              product = false;
                              appointment = false;
                              email = value;
                              if (email = value) {
                                setState(() {
                                  saveNotification();
                                });
                              }
                            });
                          },
                        )
                      ],
                    ),
                    const Text("market_info",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontFamily: "spartan"))
                        .tr(),
                  ],
                ),
              ),
            ),
    );
  }

  saveNotification() async {
    var PostUri = Uri.parse(ApiUrlList.saveNotification);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {
        "appointmentText": product,
        "productText": appointment,
        "emailNotification": email
      };

      log("addPersonalInfo url is :: $PostUri");
      log("req bodydata :: $bodydata");

      var response = await http.post(
        PostUri,
        body: jsonEncode(bodydata),
        headers: headers,
      );

      log("addPersonalInfo status code ==> ${response.statusCode}");
      log(" addPersonalInfo res body is :  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          n = Notification.fromjson(map);
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
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

class Notification {
  int? status;
  bool? success;
  String? message;

  Notification({this.status, this.success, this.message});

  factory Notification.fromjson(Map<dynamic, dynamic> map) {
    return Notification(
        status: map['status'],
        success: map['success'],
        message: map['message']);
  }
}
