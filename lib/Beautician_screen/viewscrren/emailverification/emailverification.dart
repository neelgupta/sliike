import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/emailverification/emailverification_suceess.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types, must_be_immutable
class emailVeriFication extends StatefulWidget {

  String vemail;
  String userid;
  emailVeriFication(this.vemail, this.userid, {Key? key}) : super(key: key);

  @override
  State<emailVeriFication> createState() => _emailVeriFicationState();
}

// ignore: camel_case_types
class _emailVeriFicationState extends State<emailVeriFication> {
  String userid = "";
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  VerifyOtpModel? verifyotpmodel;
  ReSendOtpModel? reSendotpmodel;
  final TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  final formKey = GlobalKey<FormState>();
  String currentText = "";

  int time = 30;
  String ot = "";
  bool isOtpShow = false;
  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
      ReSendOtp();
    });
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.keyboard_backspace)),
                      const Center(
                        child: Text("Email Verification",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Enter your OTP code here",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "spartan",
                                color: Colors.black),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: height * 0.06,
                        child: OtpTextField(
                          numberOfFields: 6,
                          borderColor: Colors.black45,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          onSubmit: (String verificationCode) {
                            setState(() {
                              ot = verificationCode;
                            });
                            if (ot.length > 6) {
                              setState(() {
                                isOtpShow = false;
                              });
                            } else {
                              setState(() {
                                isOtpShow = true;
                              });
                            }
                          }, // end onSubmit
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "00:$secondsRemaining",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "Didn't receive code?",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w200),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                enableResend ? _resendCode() : null;
                              });
                            },
                            child: Text(
                              "Resend Code",
                              style: TextStyle(
                                  color: enableResend
                                      ? const Color(0xffDD6A03)
                                      : Colors.black54,
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      String otp = ot;
                      VerifyOtp(otp);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isOtpShow == true
                            ? const Color(0xffDD6A03)
                            : Colors.transparent,
                      ),
                      child: const Text(
                        "VERIFY",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "spartan",
                          color: Colors.white,
                        ),
                      ),
                    )
                    //:SizedBox(),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  VerifyOtp(String otp) async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodydata = {
        'otp': otp,
        'UserId': widget.userid,
      };
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };

      var respnce = await http.post(Uri.parse(ApiUrlList.verifyOtp),
          body: jsonEncode(bodydata), headers: headers);
      print('verifyOtp status : ${respnce.statusCode}');
      print('verifyOtp body :${respnce.body}');
      var map = jsonDecode(respnce.body);
      if (respnce.statusCode == 200) {
        verifyotpmodel = VerifyOtpModel.fromJson(map);
        // log("verifyotpmodel ; ${verifyotpmodel.success}");

        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        Helper.prefs!.setString(UserPrefs.keyutoken, verifyotpmodel!.token!);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return emailVeriSuceesful();
          },
        ),(route) => false,);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }


  /// Resend otp gen
 // ignore: non_constant_identifier_names
  ReSendOtp() async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodydatamy = {
        'email': widget.vemail,
      };
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };
      print('sendOtp url${ApiUrlList.sendOtp}');
      print('sendOtp url$bodydatamy');

      var responce = await http.post(Uri.parse(ApiUrlList.sendOtp),
          body: jsonEncode(bodydatamy), headers: headers);
      print('sendOtp status : ${responce.statusCode}');
      print('sendOtp body :${responce.body}');
      var map = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        reSendotpmodel = ReSendOtpModel.fromJson(map);
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        print("failed sendOtp");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }
}

class VerifyOtpModel {
  int? status;
  bool? success;
  String? token;
  String? message;

  VerifyOtpModel({this.status, this.success, this.token, this.message});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['success'] = success;
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}

class ReSendOtpModel {
  bool? success;
  int? status;
  String? message;

  ReSendOtpModel({this.success, this.status, this.message});

  ReSendOtpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
