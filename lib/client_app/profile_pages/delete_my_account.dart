// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../../utils/apiurllist.dart';
import '../../utils/preferences.dart';

class delete_my_account extends StatefulWidget {
  const delete_my_account({Key? key}) : super(key: key);

  @override
  State<delete_my_account> createState() => _delete_my_accountState();
}

class _delete_my_accountState extends State<delete_my_account> {
  String? radio = "mistake";
  bool isLoading = false;
  deleteAccount? d;

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'connect@sliike.com',
    queryParameters: {'subject': "connect", 'body': ""},
  );

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
                                    image:
                                        AssetImage("assets/images/Vector.png"),
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Delete My Account",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text("We will be sorry to see you go",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: height * 0.02),
                    const Text(
                        "How can we change your mind? Let us know how we can serve you better. Leave a note at",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontFamily: "spartan",
                        )),
                    GestureDetector(
                      onTap: () {
                        launchUrl(emailLaunchUri);
                      },
                      child: const Text("connect@sliike.com",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1571ED),
                            fontFamily: "spartan",
                          )),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text(
                        "If you wish to continue please let us know why you are deleting your account below:",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontFamily: "spartan",
                        )),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: const Color(0xFFDD6A03),
                          value: "mistake",
                          groupValue: radio,
                          onChanged: (value) {
                            setState(() {
                              radio = value.toString();
                            });
                          },
                        ),
                        const Expanded(
                          child: Text("I created this account by mistake",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "spartan",
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: const Color(0xFFDD6A03),
                          value: "down",
                          groupValue: radio,
                          onChanged: (value) {
                            setState(() {
                              radio = value.toString();
                            });
                          },
                        ),
                        const Expanded(
                          child: Text("I am shutting down my business",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "spartan",
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: const Color(0xFFDD6A03),
                          value: "market",
                          groupValue: radio,
                          onChanged: (value) {
                            setState(() {
                              radio = value.toString();
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "I don’t want to use sliike marketplace anymore",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "spartan",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Radio(
                          activeColor: const Color(0xFFDD6A03),
                          value: "other",
                          groupValue: radio,
                          onChanged: (value) {
                            setState(() {
                              radio = value.toString();
                            });
                          },
                        ),
                        const Text("Other",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "spartan",
                            )),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.20,
                    ),
                    Row(
                      children: [
                        GestureDetector(
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
                            child: const Text("CANCEL",
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
                              deleteClientAccount();
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage("assets/images/trash.png"),
                                  height: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                const Text("DELETE",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  deleteClientAccount() async {
    var deleteuri = Uri.parse(ApiUrlList.deleteClientAccount);
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
        "deleteReason": radio,
      };

      print("addPersonalInfo url is :: $deleteuri ");
      print("req bodydata :: $bodydata ");

      var response = await http.delete(
        deleteuri,
        body: jsonEncode(bodydata),
        headers: headers,
      );

      print("addPersonalInfo status code ==> ${response.statusCode}");
      print(" addPersonalInfo res body is :  ${response.body}");
      print("response ===> $response");
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
      } else if (map['status'] == 202) {
        logoutdata();
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const signInScreen();
          },
        ));
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
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
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

class deleteAccount {
  int? status;
  bool? success;
  String? message;

  deleteAccount({this.status, this.success, this.message});

  factory deleteAccount.fromjson(Map<dynamic, dynamic> map) {
    return deleteAccount(
        status: map['status'] ?? 0,
        success: map['success'] ?? false,
        message: map['message'] ?? "");
  }
}
