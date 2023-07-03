// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../../utils/apiurllist.dart';

class edit_profile extends StatefulWidget {
  String firstName;
  String lastName;
  String email;
  String PhoneNumber;
  String day;
  String month;
  String year;
  String gender;
  edit_profile({
    Key? key,
    required this.email,
    required this.PhoneNumber,
    required this.firstName,
    required this.lastName,
    required this.day,
    required this.month,
    required this.gender,
    required this.year,
  }) : super(key: key);

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  var genderitems = [
    'Select option',
    'Female',
    'Male',
    'Transgender',
    'prefer not to say',
  ];
  var mounthitemslist = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  TextEditingController firstNameTc = TextEditingController();
  TextEditingController lastNameTc = TextEditingController();
  TextEditingController phoneNumberTc = TextEditingController();
  TextEditingController emailTc = TextEditingController();
  TextEditingController dayTc = TextEditingController();
  TextEditingController yearTc = TextEditingController();

  bool daystatus = false;
  bool yearstatus = false;
  bool isLoading = false;
  String? gendervalue;
  String status = "";
  String? mounthvalue;
  PersonalInfo? p;

  @override
  void initState() {
    if (widget.firstName != "") {
      firstNameTc.text = widget.firstName;
    }
    if (widget.lastName != "") {
      lastNameTc.text = widget.lastName;
    }
    if (widget.PhoneNumber != "") {
      phoneNumberTc.text = widget.PhoneNumber;
    }
    if (widget.email != "") {
      emailTc.text = widget.email;
    }
    if (widget.day != "") {
      dayTc.text = widget.day;
    }
    if (widget.year != "") {
      yearTc.text = widget.year;
    }

    if (widget.month.toLowerCase().contains("january")) {
      mounthvalue = "January";
    } else if (widget.month.toLowerCase().contains("february")) {
      mounthvalue = "February";
    } else if (widget.month.toLowerCase().contains("march")) {
      mounthvalue = "March";
    } else if (widget.month.toLowerCase().contains("april")) {
      mounthvalue = "April";
    } else if (widget.month.toLowerCase().contains("may")) {
      mounthvalue = "May";
    } else if (widget.month.toLowerCase().contains("june")) {
      mounthvalue = "June";
    } else if (widget.month.toLowerCase().contains("july")) {
      mounthvalue = "July";
    } else if (widget.month.toLowerCase().contains("august")) {
      mounthvalue = "August";
    } else if (widget.month.toLowerCase().contains("september")) {
      mounthvalue = "September";
    } else if (widget.month.toLowerCase().contains("october")) {
      mounthvalue = "October";
    } else if (widget.month.toLowerCase().contains("november")) {
      mounthvalue = "November";
    } else if (widget.month.toLowerCase().contains("december")) {
      mounthvalue = "December";
    }

    if (widget.gender.toLowerCase().contains("select option")) {
      gendervalue = "Select option";
    } else if (widget.gender.toLowerCase().contains("female")) {
      gendervalue = "Female";
    } else if (widget.gender.toLowerCase().contains("male")) {
      gendervalue = "Male";
    } else if (widget.gender.toLowerCase().contains("transgender")) {
      gendervalue = "Transgender";
    } else if (widget.gender.toLowerCase().contains("prefer not to say")) {
      gendervalue = "prefer not to say";
    }
    log("widget.firstName : ${widget.firstName}");
    log("mounthvalue : $mounthvalue");

    log("widget.gender : ${widget.gender}");
    log("gendervalue : $gendervalue");
    super.initState();
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
                                  image: AssetImage("assets/images/Vector.png"),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Edit Personal Info",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.06),
                    TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
                      ],
                      controller: firstNameTc,
                      cursorColor: Colors.black,
                      style: const TextStyle(
                        fontFamily: "spartan",
                        height: 1,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'spartan',
                            color: Colors.black54),
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
                    SizedBox(
                      height: height * 0.04,
                    ),
                    TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
                      ],
                      controller: lastNameTc,
                      cursorColor: Colors.black,
                      style: const TextStyle(
                        fontFamily: "spartan",
                        height: 1,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'spartan',
                            color: Colors.black54),
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
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text("Phone number",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(widget.PhoneNumber,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54,
                        )),
                    // TextField(
                    //   controller: PhoneNumber,
                    //   keyboardType: TextInputType.number,
                    //   style: TextStyle(fontFamily: "spartan",fontSize: 12),
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: "Phone Number",
                    //   ),
                    // ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text("Email address",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      widget.email,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black54,
                      ),
                    ),
                    // TextField(
                    //   controller: Email,
                    //   style: TextStyle(fontFamily: "spartan",fontSize: 12),
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: "Email Address",
                    //   ),
                    // ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text("Date of birth",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: dayTc,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: "Day",
                              labelText: "Day",
                              labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'spartan',
                                  color: Colors.black54),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                              ),
                            ),
                          ),
                        ),
                        daystatus
                            ? SizedBox(
                                height: 30,
                                child: Text(
                                  status,
                                  style: const TextStyle(
                                      fontFamily: 'spartan',
                                      fontSize: 12,
                                      color: Colors.red),
                                ),
                              )
                            : Container(
                                height: 25,
                              ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            //padding: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black38)),
                            child: DropdownButton(
                              hint: const Text("Month"),
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.w500),
                              underline: const SizedBox(),
                              dropdownColor: Colors.white,
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.yellow,
                              //isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff414141)),
                              value: mounthvalue,
                              items: mounthitemslist.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  mounthvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: yearTc,
                            onChanged: (value) {
                              setState(() {
                                yearstatus = false;
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: "Year",
                              labelText: "Year",
                              labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'spartan',
                                  color: Colors.black54),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                              ),
                            ),
                          ),
                        ),
                        yearstatus
                            ? SizedBox(
                                height: 30,
                                child: Text(
                                  status,
                                  style: const TextStyle(
                                      fontFamily: 'spartan',
                                      fontSize: 12,
                                      color: Colors.red),
                                ),
                              )
                            : Container(
                                height: 25,
                              )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const Text("Gender",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black38)),
                      child: DropdownButton(
                        hint: textComoon("Select option", 12,
                            const Color(0xff707070), FontWeight.w500),
                        underline: const SizedBox(),
                        dropdownColor: Colors.white,
                        iconDisabledColor: Colors.black,
                        iconEnabledColor: Colors.yellow,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xff414141)),
                        value: gendervalue,
                        items: genderitems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            gendervalue = newValue!;
                          });
                        },
                      ),
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
                          onTap: () async {
                            await addPersonalInfo(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.07,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFDD6A03)),
                                color: const Color(0xFFDD6A03),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: const Text(
                              "SAVE",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    )
                  ],
                ),
              ),
            ),
    );
  }

  addPersonalInfo(context) async {
    var Posturi = Uri.parse(ApiUrlList.addPersonalInfo);
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
        "firstName": firstNameTc.text.trim(),
        "lastName": lastNameTc.text.trim(),
        "email": widget.email.trim(),
        "phoneNumber": widget.PhoneNumber.trim(),
        "day": dayTc.text.trim(),
        "month": mounthvalue,
        "year": yearTc.text.trim(),
        "gender": gendervalue,
      };

      log("addPersonalInfo url is :: $Posturi");
      log("req bodydata :: $bodydata");

      var response = await http.post(
        Posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );

      log("addPersonalInfo status code ==> ${response.statusCode}");
      log(" addPersonalInfo res body is :  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          p = PersonalInfo.fromjson(map);
          Navigator.pop(context, true);
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

class PersonalInfo {
  int? status;
  bool? success;
  String? message;

  PersonalInfo({this.status, this.success, this.message});

  factory PersonalInfo.fromjson(Map<dynamic, dynamic> map) {
    return PersonalInfo(
        status: map['status'] ?? 0,
        success: map['success'] ?? false,
        message: map['message'] ?? "");
  }
}
