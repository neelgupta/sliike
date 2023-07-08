// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/book_appoinment.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_screen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

import '../../utils/preferences.dart';

class cancel_appoinment extends StatefulWidget {
  String? time;
  String? businessName;
  String? category;
  String? bookingId;
  cancel_appoinment(
      {Key? key, this.businessName, this.time, this.category, this.bookingId})
      : super(key: key);

  @override
  State<cancel_appoinment> createState() => _cancel_appoinmentState();
}

class _cancel_appoinmentState extends State<cancel_appoinment> {
  bool isLoading = false;

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
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Image(
                        image: AssetImage("assets/images/Vector.png"),
                        height: 20,
                        width: 25,
                      )),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Are you sure you want to cancel\nappointment?",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width,
                  height: height * 0.15,
                  color: const Color(0xFFF3F3F3),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            height: height * 0.12,
                            width: width * 0.25,
                            child: const Image(
                              image:
                                  AssetImage("assets/images/Rectangle 944.png"),
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${widget.time}",
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: "spartan",
                                    color: Colors.black54)),
                            Text("${widget.businessName}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "spartan",
                                    color: Colors.black)),
                            Text("${widget.category}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "spartan",
                                    color: Colors.black54)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("If you want to reschedule this appointment,",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Row(
                        children: [
                          const Text("you can",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Helper.serviceId.clear();
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return book_appoinment(
                                    bookingId: widget.bookingId,
                                  );
                                },
                              ));
                            },
                            child: const Text("change",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                    color: Colors.blue)),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          const Text("your appointment",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.07,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: const Text("CLOSE",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cancelAppointment(widget.bookingId);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.07,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFD90000)),
                              color: const Color(0xFFD90000),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: const Text(
                            "YES, CANCEL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "spartan",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                )
              ],
            ),
    );
  }

  cancelAppointment(id) async {
    var deleteuri = Uri.parse(
        "https://sliike-server.onrender.com/api/v1/client/cancelAppointment/$id");
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      print("addPersonalInfo url is ====> $deleteuri ");
      print("BookingId is ====> $id ");
      print(headers);

      var response = await http.delete(
        deleteuri,
        headers: headers,
      );

      print("cancelAppointment status code ==> ${response.statusCode}");
      print(" cancelAppointment res body is :  ${response.body}");
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return homescreen(selectedIndex: 1);
          },
        ));
        showToast(
            message: "${map['message']}",);
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      } else {
       showToast(
            message: "${map['message']}",);
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

class DeleteBooking {
  bool success;
  int status;
  String message;

  DeleteBooking({
    required this.success,
    required this.status,
    required this.message,
  });

  factory DeleteBooking.fromJson(Map<String, dynamic> json) => DeleteBooking(
        success: json["success"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
      };
}
