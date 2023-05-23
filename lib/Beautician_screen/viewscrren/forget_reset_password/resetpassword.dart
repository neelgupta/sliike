// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:http/http.dart' as http;

class resetPassWord extends StatefulWidget {
  final String email;

  const resetPassWord(this.email, {Key? key}) : super(key: key);

  @override
  State<resetPassWord> createState() => _resetPassWordState();
}

class _resetPassWordState extends State<resetPassWord> {
  String userid = "";
  ForgotPasswordModel? forgotpasswordModel;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController passwordContoller = TextEditingController();
  TextEditingController conformpasswordContoller = TextEditingController();
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();
  bool passwordstatus = false;
  bool conformpasswordstatus = false;
  bool passwordshowstatushide = false;
  bool conformshowstatushide = false;
  bool isOtpShow = false;
  TextEditingController emailContoller = TextEditingController();
  bool emailstatus = false;
  bool isEmailEnter = true;
  bool isCodeEnter = false;
  bool isPasswordEnter = false;
  bool isProcessDone = false;
  bool isProcessEnter = false;
  String status = "";
  double height = 0;
  double width = 0;
  String ot = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paswordresetcall();
  }

  void paswordresetcall() {
    emailContoller.text = widget.email;
    print("email...${widget.email}");
    print("email...$emailContoller");
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    MediaQuery.of(context).padding.bottom;
    width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   toolbarHeight: height * 0.1, // Set this height
      //   flexibleSpace: Container(
      //     color: Colors.white,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10),
      //           child: Row(
      //                     children: [
      //                       GestureDetector(
      //                         onTap: (){
      //                           Navigator.pop(context);
      //                         },
      //                         child: Container(
      //                           padding: EdgeInsets.all(8),
      //                           height: height*0.06,
      //                           decoration: BoxDecoration(
      //                               shape: BoxShape.circle,
      //                               border: Border.all(color: Colors.black)),
      //                           child:Container(
      //                               padding: EdgeInsets.all(5),
      //                               child: Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
      //                         ),
      //                       ),
      //                       SizedBox(width: 60,),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Text("Reset Password",
      //                               style: TextStyle(
      //                                   fontSize: 18,
      //                                   color: Colors.black,
      //                                   fontFamily: "spartan",
      //                                   fontWeight: FontWeight.bold)),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isProcessDone || isEmailEnter) {
                            Navigator.pop(context);
                          } else if (isCodeEnter) {
                            isCodeEnter = false;
                            setState(() {});
                          } else if (isPasswordEnter) {
                            isPasswordEnter = false;
                            setState(() {});
                          } else if (isProcessDone) {
                            setState(() {
                              isProcessEnter = false;
                            });
                          }
                        },
                        child: const Icon(
                          Icons.keyboard_backspace,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Text("paasword_reset",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold))
                          .tr(),
                      const Spacer()
                    ],
                  ),
                  SizedBox(height: height * 0.06),
                  isProcessDone
                      ? processDone()
                      : isPasswordEnter
                          ? newPassword(userid)
                          : isCodeEnter
                              ? enterCode()
                              : enterEmail()
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context) {
                  //         return const resetPassWordDone();
                  //       },
                  //     ));
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     width: width,
                  //     height: height * 0.06,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5),
                  //         color: Color(0xffDD6A03)),
                  //     child: Text("SEND",
                  //         style: TextStyle(
                  //             fontSize: 14,
                  //             fontFamily: "spartan",
                  //             color: Colors.white)),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///sucessfull screen
  Widget processDone() {
    return Column(
      children: [
        SizedBox(height: height * 0.08),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            height: 70,
            width: 70,
            child: Image.asset("assets/images/verifi_sucess.png"),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        const Text("password_reset_sucessfull",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "spartan",
                    fontWeight: FontWeight.bold))
            .tr(),
        const SizedBox(
          height: 10,
        ),
        const Text("your_account",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    fontFamily: "spartan"))
            .tr(),
        SizedBox(height: height * 0.07),
        InkWell(
          onTap: () {
            setState(() {
              isProcessDone = true;
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const signInScreen();
                },
              ));
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffDD6A03)),
            child: const Text("sign_in",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white))
                .tr(),
          ),
        ),
      ],
    );
  }

  /// password reset Screen
  Widget newPassword(String userid) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "create_new_password",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: "spartan"),
            ).tr(),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordContoller,
            obscureText: passwordshowstatushide,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20),
              hintText: "New Password",
              labelText: "New Password",
              suffixIcon: passwordshowstatushide
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          passwordshowstatushide = !passwordshowstatushide;
                        });
                      },
                      icon: const Icon(Icons.visibility_off_outlined),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          passwordshowstatushide = !passwordshowstatushide;
                        });
                      },
                      icon: const Icon(Icons.visibility_outlined)),
              labelStyle:
                  const TextStyle(fontFamily: 'spartan', color: Colors.black54),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.black38),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.black38),
              ),
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please a Enter Password';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: conformpasswordContoller,
            obscureText: conformshowstatushide,
            //obscureText: conformshowstatushide,
            // obscuringCharacter: "*",
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 20),
                hintText: "Confirm Password ",
                labelText: "Confirm Password ",
                suffixIcon: conformshowstatushide
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            conformshowstatushide = !conformshowstatushide;
                          });
                        },
                        icon: const Icon(Icons.visibility_off_outlined),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            conformshowstatushide = !conformshowstatushide;
                          });
                        },
                        icon: const Icon(Icons.visibility_outlined)),
                labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Colors.black54),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black38),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black38),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black38),
                )),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please re-enter password';
              }
              print(passwordContoller.text);
              print(conformpasswordContoller.text);
              if (passwordContoller.text != conformpasswordContoller.text) {
                return "Password does not match";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              String password = passwordContoller.text;
              //  String Conformpassword=ConformpasswordContoller.text;
              if (_formkey.currentState!.validate()) {
                print("successful");
                resetPassword(userid, password);
                setState(() {});
              } else {
                print("UnSuccessfull");
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffDD6A03)),
              child: const Text("continue",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white))
                  .tr(),
            ),
          ),
        ],
      ),
    );
  }

  ///otp Screen
  Widget enterCode() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: const Text(
            "enter_code_here",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: "spartan"),
          ).tr(),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: height * 0.06,
          child: OtpTextField(
            numberOfFields: 6,
            borderColor: Colors.black45,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,

            onSubmit: (String verificationCode) {
              //ot = int.parse(verificationCode);
              print("otp is $verificationCode ");
              setState(() {
                ot = verificationCode;
              });
              if (ot.length < 6) {
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
          height: 40,
        ),
        InkWell(
          onTap: () {
            String otp = ot;
            print("verifyotp$otp");
            verifyResetCode(otp);
            // isPasswordEnter = true;
          },
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:
                    isOtpShow == true ? const Color(0xffDD6A03) : Colors.transparent),
            child: const Text("continue",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white))
                .tr(),
          ),
        ),
      ],
    );
  }

  Widget enterEmail() {
    return Column(
      children: [
        const Text(
          "reset_info",
          style: TextStyle(
              fontSize: 12,
              color: Color(0xff414141),
              fontFamily: "spartan",
              fontWeight: FontWeight.w500),
        ).tr(),
        const SizedBox(
          height: 24,
        ),
        TextField(
          controller: emailContoller,
          onChanged: (value) {
            emailstatus = false;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20),
            hintText: "Enter your email",
            labelText: "Enter your email",
            labelStyle:
                const TextStyle(fontFamily: 'spartan', color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.black38),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.black38),
            ),
          ),
        ),
        emailstatus
            ? Container(
                alignment: Alignment.topLeft,
                height: 30,
                child: Text(
                  status,
                  style: const TextStyle(
                      fontFamily: 'spartan', fontSize: 12, color: Colors.red),
                ),
              )
            : Container(),
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {

            String email = emailContoller.text;
            bool emailValid = RegExp(
                    r"^[a-zA-Z.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+")
                .hasMatch(email);
            if (email.isEmpty) {
              emailstatus = true;
              status = "Please Enter Email ID";
            } else if (!emailValid) {
              emailstatus = true;
              status = "Please Enter Correct Email ID";
            } else {
              forgotPassword(email);
            }
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffDD6A03)),
            child: const Text("send",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white))
                .tr(),
          ),
        ),
      ],
    );
  }

  void _showdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          content: SizedBox(
            height: height * 0.45,
            width: width * 0.80,
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/Group 12322 (1).png"),
                  height: 70,
                  width: 70,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                const Text("reset_popup",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "spartan",
                    )).tr(),
                SizedBox(
                  height: height * 0.01,
                ),
                const Text("reset_popup_info",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "spartan",
                    )).tr(),
                SizedBox(
                  height: height * 0.04,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isCodeEnter = true;
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffDD6A03)),
                    child: const Text("OK, GOT IT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.white))
                        .tr(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///Client  API Calling
  Future<void> forgotPassword(String email) async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator:
              const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodyDat = {
        'email': email,
      };
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };
      print("loginApi url : ${ApiUrlList.forgotPassword}");
      print("passing bodyDat : $bodyDat");
      var response = await http.post(
        Uri.parse(ApiUrlList.forgotPassword),
        body: jsonEncode(bodyDat),
        headers: headers,
      );
      print("statuscode : ${response.statusCode}");
      print("res  body :: ${response.body}");
      var map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        forgotpasswordModel = ForgotPasswordModel.fromJson(map);
        print(forgotpasswordModel);

        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          _showdialog(context);
        });
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }

  ///otp
  Future<void> verifyResetCode(String otp) async {
    VerifyResetCodemodel verifyresetCodemodel;
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,

          overlayColor: Colors.black26,
          progressIndicator:
              const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodyDat = {
        'OTP': otp,
      };
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };
      print("loginApi url : ${ApiUrlList.verifyResetCode}");
      print("passing bodyDat : $bodyDat");
      var response = await http.post(
        Uri.parse(ApiUrlList.verifyResetCode),
        body: jsonEncode(bodyDat),
        headers: headers,
      );
      var map = jsonDecode(response.body);
      print("statuscode : ${response.statusCode}");
      print("res  body :: ${response.body}");
      if (response.statusCode == 200) {
        verifyresetCodemodel = VerifyResetCodemodel.fromJson(map);
        print("....1${verifyresetCodemodel._userId}");
        userid = verifyresetCodemodel._userId!;
        print('account sucessfully');
        print("userid====$userid");
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          isPasswordEnter = true;
        });
        print("preset===$isPasswordEnter");
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        print("failed");
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      Loader.hide();
    }
  }

  Future<void> resetPassword(
    String userid,
    String password,
  ) async {
    ResetPasswordModel resetpasswordmodel;
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator:
              const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodyDat = {
        'userId': userid,
        'password': password,
      };
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };
      print("loginApi url : ${ApiUrlList.resetPassword}");
      print("passing bodyDat : $bodyDat");
      var response = await http.post(
        Uri.parse(ApiUrlList.resetPassword),
        body: jsonEncode(bodyDat),
        headers: headers,
      );

      print("statuscode : ${response.statusCode}");
      print("res  body :: ${response.body}");

      var map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        resetpasswordmodel = ResetPasswordModel.fromJson(map);
        print(resetpasswordmodel);

        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        setState(() {
          isProcessDone = true;
        });
        print("........$isProcessDone");
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }
}

class ForgotPasswordModel {
  int? status;
  bool? success;
  String? message;
  String? oTP;

  ForgotPasswordModel({this.status, this.success, this.message, this.oTP});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    oTP = json['OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    data['OTP'] = this.oTP;
    return data;
  }
}

class VerifyResetCodemodel {
  int? _status;
  bool? _success;
  String? _userId;
  String? _message;

  VerifyResetCodemodel(
      {int? status, bool? success, String? userId, String? message}) {
    if (status != null) {
      this._status = status;
    }
    if (success != null) {
      this._success = success;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (message != null) {
      this._message = message;
    }
  }

  int? get status => _status;

  set status(int? status) => _status = status;

  bool? get success => _success;

  set success(bool? success) => _success = success;

  String? get userId => _userId;

  set userId(String? userId) => _userId = userId;

  String? get message => _message;

  set message(String? message) => _message = message;

  VerifyResetCodemodel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    _userId = json['userId'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this._status;
    data['success'] = this._success;
    data['userId'] = this._userId;
    data['message'] = this._message;
    return data;
  }
}

class ResetPasswordModel {
  bool? success;
  int? status;
  String? message;

  ResetPasswordModel({this.success, this.status, this.message});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
