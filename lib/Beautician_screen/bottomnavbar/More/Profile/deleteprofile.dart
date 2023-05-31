import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class delete_my_accountb extends StatefulWidget {

   delete_my_accountb(  {Key? key})
      : super(key: key);

  @override
  State<delete_my_accountb> createState() => _delete_my_accountbState();
}

class _delete_my_accountbState extends State<delete_my_accountb> {
  DeleteProfileModel? deletprofile;
  String? radio = "mistake";

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: "connect@gmail.com",

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
      body: SingleChildScrollView(
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
                              image: AssetImage("assets/images/Vector.png"),
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
                height: height * 0.10,
              ),
              Row(
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
                      child: const Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      deleteBeauticianprofile(radio!);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.07,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFD90000)),
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
                          Text("DELETE",
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

  /// Delete
  Future<void> deleteBeauticianprofile(String radio) async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodyDat = {
        'deleteReason': radio,
      };
      print("delete url=${ApiUrlList.deleteBeauticianProfile}");
      //print(bodyDat);
      var responce = await http.delete(
        Uri.parse(ApiUrlList.deleteBeauticianProfile),
        body: jsonEncode(bodyDat),
        headers: ApiHeader.headers,
      );
      var map = jsonDecode(responce.body.toString());
      print("statuscode ${responce.statusCode}");
      print("body${responce.body}");

      if(responce.statusCode==200)
        {}

      else if (responce.statusCode == 202) {
        deletprofile = DeleteProfileModel.fromJson(map);
        print("delete$DeleteProfileModel");
        logoutdata();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return signInScreen();
          }),
          (route) => false,
        );
        setState(() {

        });
      }else if(responce.statusCode == 401){
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return signInScreen();
        },), (route) => false);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }
}

class DeleteProfileModel {
  int? status;
  bool? success;
  String? message;

  DeleteProfileModel({this.status, this.success, this.message});

  DeleteProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
