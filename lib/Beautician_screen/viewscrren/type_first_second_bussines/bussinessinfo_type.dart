import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/second_beautyservice_or_product/service_add/categorytype_service.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/constants.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class bussinessInfoCATEGORY extends StatefulWidget {
  const bussinessInfoCATEGORY({Key? key}) : super(key: key);

  @override
  State<bussinessInfoCATEGORY> createState() => _bussinessInfoCATEGORYState();
}

// ignore: camel_case_types
class _bussinessInfoCATEGORYState extends State<bussinessInfoCATEGORY> {
  int _radioValue1 = 0;
  addBusinessTypeModel? businesstype;
  // _handleChange(String? value) {
  //   setState(() {
  //     _selected = value.toString();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return WillPopScope(
      onWillPop: () async {
        return await false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.18, //
          flexibleSpace: Container(
            color: const Color(0xff01635D),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: const Image(
                                  image:
                                      AssetImage("assets/images/backwhite.png"),
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            "Select your business category",
                            style: TextStyle(
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "2/",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff292929),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "4",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffA0A0A0),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       // _radioValue1=0;
              //     });
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //       border: _radioValue1 == 0
              //           ? Border.all(
              //               width: 1,
              //               color: const Color(0xff707070),
              //             )
              //           : Border.all(
              //               width: 1,
              //               color: const Color(0xffCFCFCF),
              //             ),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 10, bottom: 10),
              //       child: Row(
              //         children: [
              //           Radio(
              //               value: 0,
              //               activeColor: const Color(0xff01635D),
              //               groupValue: _radioValue1,
              //               onChanged: (value) {
              //                 setState(() {
              //                   _radioValue1 = value as int;
              //                 });
              //               }),
              //           const Text(
              //             "I sell beauty products only",
              //             style: TextStyle(
              //                 fontSize: 15,
              //                 fontFamily: 'spartan',
              //                 color: Color(0xff414141)),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _radioValue1 = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: _radioValue1 == 1
                        ? Border.all(
                            width: 1,
                            color: const Color(0xff707070),
                          )
                        : Border.all(
                            width: 1,
                            color: const Color(0xffCFCFCF),
                          ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Radio(
                              value: 1,
                              activeColor: const Color(0xff01635D),
                              groupValue: _radioValue1,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue1 = value as int;
                                });
                              }),
                        ),
                        const Text(
                          "I provide beauty services and\nalso sell beauty products.",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'spartan',
                              color: Color(0xff111111)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  if (_radioValue1 != 0) {
                    addBusinessType(_radioValue1);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text("SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  addBusinessType(int radioValue1) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      // ignore: use_build_context_synchronously
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          // ignore: use_build_context_synchronously
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodydata = {
        "isProvideService": _radioValue1,
      };
      print("loginApi url : ${ApiUrlList.addBusinessType}");
      print("passing bodyDat : $bodydata");
      var response = await http.post(
        Uri.parse(ApiUrlList.addBusinessType),
        body: jsonEncode(bodydata),
        headers: ApiHeader.headers,
      );
      var map = jsonDecode(response.body.toString());
      print("statuscode : ${response.statusCode}");
      print("res  body :: ${response.body}");
      if (response.statusCode == 200) {
        businesstype = addBusinessTypeModel.fromJson(map);
        //print(signinmodel);
        print('account sucessfully');

        if (_radioValue1 == 0) {
          // prefs.setBool(UserPrefs.keyisserviceprovide,false);

          // Navigator.push(context, MaterialPageRoute(
          //   builder: (context) {
          //     return add_Your_Work_Hours(secondflow:false);
          //   },
          // ));
        } else
        // if(_radioValue1==1)
        {
          Helper.prefs!.setBool(UserPrefs.keyisserviceprovide, true);
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return addServicetype(secondflow: true);
            },
          ));
        }
        showToast(
          message: "${map['message']}",
        );
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      } else {
        showToast(
          message: "${map['message']}",
        );
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }
}

// ignore: camel_case_types
class addBusinessTypeModel {
  int? status;
  bool? success;
  String? message;

  addBusinessTypeModel({this.status, this.success, this.message});

  addBusinessTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
