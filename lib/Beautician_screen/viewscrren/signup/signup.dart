import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/emailverification/emailverification.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signup/privcy_policy.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signup/teams_and_condition.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types, must_be_immutable
class signUp extends StatefulWidget {
  bool? isverify;
  String? userType;

  signUp({Key? key, this.isverify, this.userType}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

// ignore: camel_case_types
class _signUpState extends State<signUp> {
  String firebaseToken = "";
  String deviceToken = "";
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  getFirebaseToken() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission().then((value) async {
        firebaseToken = (await _firebaseMessaging.getToken())!;
      });
    } else {
      firebaseToken = (await _firebaseMessaging.getToken())!;
    }
    print(firebaseToken);
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceToken = androidInfo.id;
      print('Device id is ${androidInfo.id}'); // e.g. "Moto G (4)"
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceToken = iosInfo.identifierForVendor!;
      print('Device id is ${iosInfo.identifierForVendor!}');
    }
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    butten == true ? butten1 = false : true;
    verifyemailcontroller = temailAdress;
    getNotification();
    getFirebaseToken();
    getDeviceInfo();
    verifyemail();
  }

  verifyemail() async {
    if (widget.isverify == true) {
      var prefs = await SharedPreferences.getInstance();
      var getemail = prefs.getString(UserPrefs.keyemail) ?? "";
      print("widget.isverify${widget.isverify}");
      setState(() {
        verifyemailcontroller.text = getemail;
        temailAdress.text = getemail;
        isEmailVerify = true;
      });
    } else {}
  }

  SignUpModel? s1;
  SendOtpModel? sendotpmodel;
  TextEditingController tname = TextEditingController();
  TextEditingController tlastname = TextEditingController();
  TextEditingController temailAdress = TextEditingController();
  TextEditingController tphone = TextEditingController();
  TextEditingController tpassword = TextEditingController();
  TextEditingController verifyemailcontroller = TextEditingController();

  bool namestatus = false;
  bool verifyphonestatus = false;
  bool lastnamestatus = false;
  bool emailAdressstatus = false;
  bool veriyemailAdressstatus = false;
  bool phonestatus = false;
  bool phonestatusup = false;
  bool passwordstatus = false;
  bool butten = false;
  bool butten1 = false;
  bool passStr = false;
  // String status = "";
  String statusv = "";
  String fnameMsg = "";
  String lnameMsg = "";
  String emailMsg = "";
  String phoneMsg = "";
  String passwordMsg = "";
  bool showstatus = true;
  bool isEmailVerify = false;
  String _radioSelected = "user";
  String _countryname = "Ca";
  String _countrycode = "Ca";
  double strength = 0;
  String displayText = '';
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  Color? strengthColor;
  String vemail = "";
  String strengthMsg = "";

  void _passwordStrength(String value) {
    if (value.isEmpty) {
      setState(() {
        strengthMsg = "Password cannot be empty";
        strengthColor = Colors.red;
        passStr = true;
      });
    } else if (value.length <= 6) {
      setState(() {
        strengthMsg = "Weak";
        strengthColor = Colors.red;
        passStr = true;
      });
    } else if (value.length <= 8) {
      setState(() {
        strengthMsg = "Good";
        strengthColor = Colors.orange;
        passStr = true;
      });
    } else if (RegExp(r'^((?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20})$')
        .hasMatch(value)) {
      setState(() {
        strengthMsg = "Strong";
        strengthColor = Colors.green;
        passStr = true;
      });
    }
    print(strengthMsg);
    print(strengthColor);
  }

  // void _checkPassword(String value) {
  //   if (tpassword.text.isEmpty) {
  //     setState(() {
  //       strength = 1 / 4;
  //       displayText = '';
  //       password_strength_color = Colors.red;
  //     });
  //   } else if (tpassword.text.length <= 6) {
  //     setState(() {
  //       strength = 1 / 4;
  //       displayText = 'Weak';
  //       password_strength_color = Colors.red;
  //     });
  //   } else if (tpassword.text.length <= 8) {
  //     setState(() {
  //       strength = 2 / 4;
  //       displayText = 'Good';
  //       password_strength_color = Colors.orange;
  //     });
  //   } else if (letterReg.hasMatch(tpassword.text) &&
  //       numReg.hasMatch(tpassword.text)) {
  //     setState(() {
  //       strength = 3 / 4;
  //       displayText = 'Strong';
  //       password_strength_color = Colors.green;
  //     });
  //   }
  //   print(displayText);
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;

    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isEmailVerify)
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isEmailVerify = false;
                          print("Registerback$widget.isverify");
                        });
                        if (widget.isverify == true) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.keyboard_backspace)),
                Center(
                  child: Text(
                    isEmailVerify ? "Verify your Email" : "Create an account",
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    isEmailVerify
                        ? "We have sent an Email with a code to:\n${temailAdress.text}"
                        : "Create an account to access all goodies from Sliike.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "spartan",
                        color: Colors.black45),
                  ),
                ),
                isEmailVerify
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: "user",
                            groupValue: _radioSelected,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFFDD5103)),
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value.toString();
                                print(_radioSelected);
                              });
                            },
                          ),
                          const Text('CLIENT APP'),
                          Radio(
                            value: "beautician",
                            groupValue: _radioSelected,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFFDD5103)),
                            activeColor: Colors.pink,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value.toString();
                                print(_radioSelected);
                              });
                            },
                          ),
                          const Text('BEAUTICIAN APP'),
                        ],
                      ),
                const SizedBox(
                  height: 20,
                ),
                if (isEmailVerify)
                  Column(
                    children: [
                      TextField(
                        readOnly: true,
                        controller: verifyemailcontroller,
                        onChanged: (value) {
                          veriyemailAdressstatus = false;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: "Email Address",
                          labelText: "Email Address",
                          labelStyle: const TextStyle(
                              fontFamily: 'spartan', color: Colors.black54),
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
                      veriyemailAdressstatus
                          ? Container(
                              alignment: Alignment.topLeft,
                              height: 30,
                              child: Text(
                                statusv,
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(),
                    ],
                  )
                else
                  Column(
                    children: [
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
                        ],
                        controller: tname,
                        onChanged: (value) {
                          setState(() {
                            namestatus = false;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: "First Name",
                          labelText: "First Name",
                          labelStyle: const TextStyle(
                              fontFamily: 'spartan', color: Colors.black54),
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
                      namestatus
                          ? Container(
                              alignment: Alignment.topLeft,
                              height: 30,
                              child: Text(
                                fnameMsg,
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 20,
                            ),
                      TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
                        ],
                        controller: tlastname,
                        onChanged: (value) {
                          setState(() {
                            lastnamestatus = false;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: "Last Name",
                          labelText: "Last Name",
                          labelStyle: const TextStyle(
                              fontFamily: 'spartan', color: Colors.black54),
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
                      lastnamestatus
                          ? Container(
                              alignment: Alignment.topLeft,
                              height: 30,
                              child: Text(
                                lnameMsg,
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 20,
                            ),
                      TextField(
                        controller: temailAdress,
                        onChanged: (value) {
                          setState(() {
                            emailAdressstatus = false;  
                          });
                          
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: "Email Address",
                          labelText: "Email Address",
                          labelStyle: const TextStyle(
                              fontFamily: 'spartan', color: Colors.black54),
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
                      emailAdressstatus
                          ? Container(
                              alignment: Alignment.topLeft,
                              height: 30,
                              child: Text(
                                emailMsg,
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 20,
                            ),
                      TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.phone,
                        controller: tphone,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff292929),
                            fontWeight: FontWeight.w500,
                            fontFamily: "spartan"),
                        onChanged: (value) {
                          setState(() {
                            phonestatusup = false;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: "Phone Number",
                          labelText: "Phone Number",
                          labelStyle: const TextStyle(
                              fontFamily: 'spartan', color: Colors.black54),
                          prefixIcon: SizedBox(
                            width: width * 0.35,
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CountryCodePicker(
                                    searchDecoration: InputDecoration(
                                      isDense: true,
                                      border: border,
                                      enabledBorder: border,
                                      focusedBorder: border,
                                      contentPadding: EdgeInsets.only(),
                                    ),
                                    flagWidth: 25,
                                    hideSearch: false,
                                    showCountryOnly: false,

                                    onChanged: (obj) {
                                      setState(() {
                                        _countryname = obj.name.toString();
                                        _countrycode = obj.dialCode.toString();
                                        print("obj country ;; ${obj.name}");
                                        print("obj country2 ;; $_countryname");
                                      });
                                    },
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: 'Ca',
                                    enabled: true,
                                    favorite: const ['+1', 'Ca'],
                                    // countryFilter: ['IT', 'FR'],
                                    textStyle: const TextStyle(
                                        fontSize: 10, color: Colors.black87),
                                    // optional. Shows only country name and flag
                                    //showCountryOnly: false,
                                    // optional. Shows only country name and flag when popup is closed.
                                    showOnlyCountryWhenClosed: false,
                                    // optional. aligns the flag and the Text left
                                    alignLeft: false,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: Color(0xffCECECE),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                      phonestatusup
                          ? Container(
                              alignment: Alignment.topLeft,
                              height: 30,
                              child: Text(
                                phoneMsg,
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 20,
                            ),
                      TextField(
                        controller: tpassword,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setState(() {
                              passStr = false;
                            });
                          } else {
                            setState(() {
                              _passwordStrength(value);
                              passwordstatus = false;
                            });
                          }
                        },
                        obscureText: showstatus,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: "Password",
                          labelText: "Password",
                          suffixIcon: showstatus
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showstatus = !showstatus;
                                    });
                                  },
                                  icon:
                                      const Icon(Icons.visibility_off_outlined),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showstatus = !showstatus;
                                    });
                                  },
                                  icon: const Icon(Icons.visibility_outlined)),
                          labelStyle: const TextStyle(
                              fontFamily: 'spartan', color: Colors.black54),
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
                      // Padding(
                      //   padding: EdgeInsets.only(left: 5),
                      //   child: Align(
                      //     alignment: Alignment.topLeft,
                      //     child: Text(
                      //       displayText,
                      //       style:  TextStyle(fontSize: 10,
                      //       color: password_strength_color,
                      //         fontFamily: 'spartan',
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      passStr
                          ? Container(
                              // color: Colors.red,
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                strengthMsg,
                                style: TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: strengthColor),
                              ),
                            )
                          : passwordstatus
                              ? Container(
                                  alignment: Alignment.topLeft,
                                  height: 30,
                                  child: Text(
                                    passwordMsg,
                                    style: const TextStyle(
                                        fontFamily: 'spartan',
                                        fontSize: 12,
                                        color: Colors.red),
                                  ),
                                )
                              : Container(
                                  height: 20,
                                ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                isEmailVerify
                    ? InkWell(
                        onTap: () {
                          vemail = verifyemailcontroller.text;
                          // bool emailValidv = RegExp(
                          //         r"^[a-zA-Z.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+")
                          //     .hasMatch(vemail);
                          setState(() {
                            if (vemail.isEmpty) {
                              setState(() {
                                veriyemailAdressstatus = true;
                                statusv = "Please Enter Email";
                              });
                            } else {
                              setState(() {
                                SendOtp(vemail.trim());
                              });
                              // print("if  isEmailVerify");
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffDD6A03)),
                          child: const Text("CONTINUE",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.white)),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          String firstName = tname.text;
                          String lastName = tlastname.text;
                          String email = temailAdress.text;
                          String phoneNumber = tphone.text;
                          String password = tpassword.text;
                          String country = _countryname;
                          String radiovalue = _radioSelected;
                          bool contactValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                  .hasMatch(phoneNumber);
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);
                          setState(() {
                            if (firstName.isEmpty &&
                                lastName.isEmpty &&
                                phoneNumber.isEmpty &&
                                email.isEmpty &&
                                password.isEmpty) {
                              namestatus = true;
                              fnameMsg = "Please Enter  First Name";
                              lastnamestatus = true;
                              lnameMsg = "Please Enter Last Name";
                              emailAdressstatus = true;
                              emailMsg = "Please Enter Email ID";
                              phonestatusup = true;
                              phoneMsg = "Please Enter Phone Number";
                              passwordstatus = true;
                              passwordMsg = "Please Enter Password";
                            }
                            if (firstName.isEmpty) {
                              namestatus = true;
                              fnameMsg = "Please Enter  First Name";
                            } else if (lastName.isEmpty) {
                              lastnamestatus = true;
                              lnameMsg = "Please Enter LastName";
                            } else if (email.isEmpty) {
                              emailAdressstatus = true;
                              emailMsg = "Please Enter Email ID";
                            } else if (!emailValid) {
                              emailAdressstatus = true;
                              emailMsg = "Please Enter Correct Email ID";
                            } else if (phoneNumber.isEmpty) {
                              phonestatusup = true;
                              phoneMsg = "Please Enter Phone Number";
                            } else if (!contactValid) {
                              phonestatusup = true;
                              phoneMsg = "Please Enter Correct Phone Number";
                            } else if (password.isEmpty) {
                              passwordstatus = true;
                              passwordMsg = "Please Enter Password";
                            } else if (password.length < 6) {
                              passwordstatus = true;
                              passwordMsg = "Please Enter 6 Character";
                            } else {
                              setState(() {
                                SignUp(
                                    firstName,
                                    lastName,
                                    radiovalue,
                                    email,
                                    password,
                                    country,
                                    phoneNumber,
                                    _countrycode);
                              });
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffDD6A03)),
                          child: const Text("CONTINUE",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.white)),
                        ),
                      ),
                SizedBox(
                  height: height * 0.020,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Text('By signing up I agree to the ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1,
                              height: 1.3)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const TermsAndCondition();
                            },
                          ));
                        },
                        child: const Text('Terms & Conditions ',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffDD6A03),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.1,
                                height: 1.3)),
                      ),
                      const Text('and to the ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1,
                              height: 1.3)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const PrivacyPolicy();
                            },
                          ));
                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffDD6A03),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.1,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(children: const [
                  Expanded(
                    child: Divider(
                      color: Color(0xff707070),
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black45),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xff707070),
                      height: 50,
                    ),
                  )
                ]),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image(
                          image: AssetImage("assets/images/facebookicon.png")),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image(
                          image: AssetImage("assets/images/googleicon.png")),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image(
                          image: AssetImage("assets/images/iponeicon.png")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontSize: 12)),
                    InkWell(
                        onTap: () {
                          widget.userType == "user"
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const signInScreen(),
                                  ))
                              : Navigator.pop(context);
                        },
                        child: const Text(" Sign In",
                            style: TextStyle(
                                color: Color(0xffDD6A03),
                                fontFamily: "spartan",
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.1))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///client SignUp
  // ignore: non_constant_identifier_names
  SignUp(
      String firstName,
      String lastName,
      String radiovalue,
      String email,
      String password,
      String country,
      String phoneNumber,
      String countrycode) async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          // isBottomBarOverlay: false,
          // overlayFromBottom: 80,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodydata = {
        'firstName': firstName,
        'lastName': lastName,
        "signUpType": radiovalue,
        'email': email,
        'password': password,
        'country': country,
        'phoneNumber': phoneNumber,
        'country_code': countrycode.replaceAll("+", ""),
        'deviceToken': deviceToken,
        'firebaseToken': firebaseToken
      };
      log("Body :: ${bodydata}");
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };

      var response = await http.post(Uri.parse(ApiUrlList.signUpApiUrl),
          body: jsonEncode(bodydata), headers: headers);

      print('signup status: ${response.statusCode}');
      print('signup body : ${response.body}');
      var map = jsonDecode(response.body);
      if (response.statusCode == 201) {
        s1 = SignUpModel.fromJson(map);
        Helper.prefs!.setString(UserPrefs.keyDeviceToken, deviceToken);
        Helper.prefs!.setString(UserPrefs.keyusertype, radiovalue);
        Helper.prefs!.setString(UserPrefs.firstName, firstName);
        Helper.prefs!.setString(UserPrefs.lastName, lastName);
        Helper.prefs!.setString(UserPrefs.email, email);
        Helper.prefs!
            .setString("country_code", countrycode.replaceAll("+", ""));
        Helper.prefs!.setString(UserPrefs.keybusinessNumber, phoneNumber);
        Helper.prefs!.setString(UserPrefs.password, password);
       showToast(
            message: "${map['message']}",);
        setState(() {
          isEmailVerify = true;
        });
      } else {
       showToast(
            message: "${map['message']}",);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> getNotification() async {
    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    var channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title// description
      importance: Importance.high,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var androiInit =
        const AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo
    var iosInit = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    flutterLocalNotificationsPlugin.initialize(initSetting);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('Flutter Notificaction message from main');
        print('Get Initial Message');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      print('Get Message');
      print(notification!.title);
      print(notification.body);
      if (notification.title != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            iOS: const DarwinNotificationDetails(),
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: '@mipmap/ic_launcher',
            ),
          ),
          payload: "${notification.title}",
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message.notification!.title);
    });
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  ///client SendOtp
  // ignore: non_constant_identifier_names
  SendOtp(String vemail) async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          // isBottomBarOverlay: false,
          // overlayFromBottom: 80,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodydatamy = {
        'email': vemail,
      };
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };

      var responce = await http.post(Uri.parse(ApiUrlList.sendOtp),
          body: jsonEncode(bodydatamy), headers: headers);
      print('sendOtp status : ${responce.statusCode}');
      print('sendOtp body :${responce.body}');
      var map = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        sendotpmodel = SendOtpModel.fromJson(map);
        String userid = (sendotpmodel!.id ?? "");

        showToast(
            message: "${map['message']}",);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return emailVeriFication(vemail, userid);
            },
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        showToast(
            message: "${map['message']}",);
      }
    } catch (e) {
    } finally {
      Loader.hide();
    }
  }
}

class SendOtpModel {
  bool? success;
  int? status;
  String? message;
  String? id;

  SendOtpModel({this.success, this.status, this.message, this.id});

  SendOtpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    status = json['status'] ?? 0;
    message = json['message'] ?? "";
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    data['_id'] = id;
    return data;
  }
}

class SignUpModel {
  bool? success;
  int? status;
  String? message;

  SignUpModel({this.success, this.status, this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
