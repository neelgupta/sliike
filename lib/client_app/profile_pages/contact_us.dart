// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class contact_us extends StatefulWidget {
  const contact_us({Key? key}) : super(key: key);

  @override
  State<contact_us> createState() => _contact_usState();
}

class _contact_usState extends State<contact_us> {
  void _launchDailer(String mobileNumber) async {
    Uri phoneno = Uri.parse('tel:${mobileNumber}');
    if (await launchUrl(phoneno)) {
      print("dailer open");
      //dialer opened
    } else {
      print("dailer is not open");
      //dailer is not opened
    }
  }

  bool getCall = false;

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
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle 28.png"),
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
                        padding: const EdgeInsets.all(5),
                        height: height * 0.06,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              image: AssetImage("assets/images/Group 55.png"),
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Contact Us",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.20,
                width: width,
                child: Image.asset(
                  "assets/images/Frame 427321081.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const Text("(514) 709-8276",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Color(0xFFDD6A03),
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * 0.04,
              ),
              const Text("We are available Monday to Friday",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * 0.02,
              ),
              const Text("From 8am to 5pm",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "spartan",
                    color: Colors.black,
                  )),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _launchDailer("+15147098276");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.07,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFDD6A03)),
                          color: const Color(0xFFDD6A03),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage("assets/images/call.png"),
                            height: height * 0.03,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          const Text("Call Us",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "spartan",
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.06,
              ),
              GestureDetector(
                onTap: () {
                  callToCustomerCare(context, "client");
                },
                child: Container(
                  height: height * 0.08,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage("assets/images/call.png"),
                        height: height * 0.03,
                        color: const Color(0xFFDD6A03),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                          getCall
                              ? "Hold on, sending request..."
                              : "Get a call from Sliike customer care",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "spartan",
                              color: Color(0xFFDD6A03))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Get a Call from us service ///
  callToCustomerCare(BuildContext context, String type) async {
    setState(() {
      getCall = true;
    });
    var getUri = Uri.parse(ApiUrlList.callToCustomerCare + "$type");
    log("${getUri}");

    var headers = {
      // 'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      getUri,
      headers: headers,
    );
    log("callToCustomerCare Body ==> ${response.body}");
    log("callToCustomerCare Code ==> ${response.statusCode}");
    if (response.statusCode == 200) {
      Loader.hide();
      setState(() {
        getCall = false;
      });
      showToast(
        message: jsonDecode(response.body)["message"],
      );
      contactdialog();
      Future.delayed(
        Duration(seconds: 5),
        () {
          Navigator.pop(context);
        },
      );
      // return GetCardDetailsData.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      setState(() {
        getCall = false;
      });
      Loader.hide();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return signInScreen();
        },
      ), (route) => false);
    } else {
      setState(() {
        getCall = false;
      });
      Loader.hide();
      showToast(message: "Something went wrong !! ");
    }
  }

  contactdialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: height * 0.35,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: height * 0.15,
                      child: Image.asset(
                        "assets/images/469342_1 1.png",
                        fit: BoxFit.fill,
                      )),
                  const Text("Thank you for reaching out!",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text("A customer care personnel will reach",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.black,
                      )),
                  const Text("out to you soon.",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
