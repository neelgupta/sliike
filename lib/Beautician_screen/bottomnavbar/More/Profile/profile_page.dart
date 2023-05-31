import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/getbeuticianprofilemodel.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/Profile/deleteprofile.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/utils/constants.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/userdetail.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getBeauticianProfile();
    });
    super.initState();
  }

  bool isLoading = false;
  getBeauticianProfilemodel? getmodelProfile;
  UpdateBeauticianProfileModel? updateBeauticianProfilemodel;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonernumber = TextEditingController();
  TextEditingController currentpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController conpassword = TextEditingController();
  TextEditingController day = TextEditingController();
  TextEditingController year = TextEditingController();
  bool namestatus = false;
  bool lastnamestatus = false;
  bool emailAdressstatus = false;
  bool phonestatus = false;
  bool curenntpasswordstatus = false;
  bool newpasswordstatus = false;
  bool passwordshowstatushide = false;
  bool conformshowstatushide = false;

  bool conpasswordstatus = false;
  bool daystatus = false;
  bool yearstatus = false;
  String status = "";
  bool showstatus = false;
  bool cshowstatus = false;
  String gendervalue = "Select option";
  String mounthvalue = "January";
  String _countryname = "IN";
  String _countrycode = "IN";
  String profileImage = "";

  String d1 = "";
  String m1 = "";
  String y1 = "";
  var genderitems = [
    'Select option',
    'Female',
    'Male',
    'Transgender',
    'prefer not to say',
  ];
  String formattedDate = "";
  var mounthitemslist = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final ImagePicker _picker = ImagePicker();
  bool imagestatus = false;
  String imagepath = "";

  // String? img;
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
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: height * 0.13, //

            flexibleSpace: Container(
              color: const Color(0xffFFFFFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                    child: Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/images/Group 55.png"),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.2,
                          ),
                          Container(
                            child: const Text("My Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            alignment: Alignment.bottomCenter,
                            insetPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            title: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CommonButton(context, "TAKE A PHOTO", 12,
                                    FontWeight.w600, Colors.white, () async {
                                  Navigator.pop(context);

                                  final XFile? photo = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  if (photo != null) {
                                    imagepath = photo.path;
                                    imagestatus = true;
                                    setState(() {});
                                  }
                                }),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CommonButton(context, "CHOOSE FROM GALLERY", 12,
                                    FontWeight.w600, Colors.white, () async {
                                  Navigator.pop(context);
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    imagepath = image.path;
                                    imagestatus = true;
                                    setState(() {});
                                  }
                                }),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                commonButtonborder(
                                    context,
                                    "CANCEL",
                                    12,
                                    FontWeight.w600,
                                    const Color(0xff01635D), () {
                                  setState(() {
                                    Navigator.pop(context);
                                    imagepath == "";
                                    imagestatus = false;
                                  });
                                }),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: imagestatus
                        ? Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(File(imagepath)),
                                    fit: BoxFit.fill)),
                          )
                        : profileImage != ""
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(profileImage),
                                        fit: BoxFit.fill)),
                              )
                            : Container(
                                width: 120,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.center,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD7E0DD),
                                  ),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset(
                                              "assets/images/editprofile.png",
                                              height: 40),
                                        ),
                                        textComoon(
                                            "Photo",
                                            10,
                                            const Color(0xff01635D),
                                            FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                textComoon("Personal Info", 16, const Color(0xff292929),
                    FontWeight.w700),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: textComoon("Edit your personal details here. ", 14,
                      const Color(0xff414141), FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  child: TextField(
                    controller: firstname,
                    onChanged: (value) {
                      setState(() {
                        namestatus = false;
                      });
                    },
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
                ),
                namestatus
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
                TextField(
                  controller: lastname,
                  onChanged: (value) {
                    lastnamestatus = false;
                  },
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
                TextField(
                  controller: email,
                  enabled: false,
                  onChanged: (value) {
                    emailAdressstatus = false;
                  },
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
                TextField(
                  controller: phonernumber,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    phonestatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Phone number",
                    labelText: "Phone number",
                    enabled: false,
                    labelStyle: const TextStyle(
                        fontFamily: 'spartan', color: Colors.black54),
                    prefixIcon: SizedBox(
                      width: width * 0.35,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CountryCodePicker(
                              flagWidth: 25,
                              showCountryOnly: false,
                              onChanged: (obj) {
                                setState(() {
                                  _countryname = obj.name.toString();
                                  _countrycode = obj.code.toString();
                                  print("obj country ;; ${obj.name}");
                                  print("obj country2 ;; ${_countryname}");
                                });
                              },
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'IN',
                              enabled: true,
                              favorite: ['+91', 'IN'],
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
                phonestatus
                    ? Container(
                        alignment: Alignment.topLeft,
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
                        height: 20,
                      ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: textComoon(
                      "Date of birth", 12, Colors.black, FontWeight.w500),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: day,
                        onChanged: (value) {
                          setState(() {
                            daystatus = false;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: "Day",
                          labelText: "Day",
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
                        padding: const EdgeInsets.only(
                          left: 3,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black38)),
                        child: DropdownButton(
                          hint: const Text("Month"),
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'spartan',
                              fontWeight: FontWeight.w500),
                          underline: const SizedBox(),
                          dropdownColor: Colors.white,
                          iconDisabledColor: Colors.black,
                          iconEnabledColor: Colors.yellow,
                          isExpanded: true,
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
                        controller: year,
                        keyboardType: TextInputType.datetime,
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
                            borderSide: const BorderSide(color: Colors.black38),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black38),
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
                          ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child:
                      textComoon("Gender", 12, Colors.black, FontWeight.w500),
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
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: height * 0.01),
                  child: const Divider(
                    thickness: 1,
                    color: Color(0xffCFCFCF),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: textComoon("Change Password", 16,
                      const Color(0xff292929), FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.03),
                  child: textComoonfade(
                      "To update password, enter your existing password followed by a new one. Logout and use the Reset Password link on the Log In Page.",
                      12,
                      const Color(0xff414141),
                      FontWeight.w500),
                ),
                TextField(
                  controller: currentpassword,
                  onChanged: (value) {
                    setState(() {
                      curenntpasswordstatus = false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Current Password",
                    labelText: "Current Password",
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
                curenntpasswordstatus
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
                TextFormField(
                  controller: newpassword,
                  obscureText: passwordshowstatushide,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "New Password",
                    labelText: "New Password",
                    suffixIcon: passwordshowstatushide
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                passwordshowstatushide =
                                    !passwordshowstatushide;
                              });
                            },
                            icon: const Icon(Icons.visibility_off_outlined),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                passwordshowstatushide =
                                    !passwordshowstatushide;
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
                  onChanged: (value) {
                    newpasswordstatus = false;
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please a Enter Password';
                    }
                    return null;
                  },
                ),
                newpasswordstatus
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
                        height: 20,
                      ),
                TextFormField(
                  controller: conpassword,
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
                                  conformshowstatushide =
                                      !conformshowstatushide;
                                });
                              },
                              icon: const Icon(Icons.visibility_off_outlined),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  conformshowstatushide =
                                      !conformshowstatushide;
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      )),
                  onChanged: (value) {
                    conpasswordstatus = true;
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please re-enter password';
                    }
                    print(conpassword.text);
                    print(conpassword.text);
                    if (conpassword.text != conpassword.text) {
                      return "Password does not match";
                    }
                    return null;
                  },
                ),
                conpasswordstatus
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
                        height: 20,
                      ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: const Divider(
                    thickness: 1,
                    color: Color(0xffCFCFCF),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: textComoon("Delete Account", 16,
                      const Color(0xff292929), FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.03),
                  child: textComoonfade(
                      "By deleting account, you will delete all your personal and busines info from Sliike and won’t be able to retrieve them.",
                      12,
                      const Color(0xff414141),
                      FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return delete_my_accountb();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/delete.png"),
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      textComoon("Delete my Sliike account", 12, Colors.black,
                          FontWeight.w500),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CommonButton(
                  context,
                  "SAVE",
                  12,
                  FontWeight.w600,
                  Colors.white,
                  () async {
                    print("imagepath =====> $imagepath");
                    print("gendervalue====$gendervalue");
                    print("imagepath==$imagepath");
                    d1 = day.text;
                    m1 = mounthvalue;
                    y1 = year.text;
                    if (firstname.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Entar Frist Name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (lastname.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Entar Last Name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (email.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Entar Email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (phonernumber.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Entar PhoneNumbar",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (d1 == "" || m1 == "" || y1 == "") {
                      Fluttertoast.showToast(
                          msg: "Enter Your Dob",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (gendervalue == "") {
                      Fluttertoast.showToast(
                          msg: "Select Your Gender",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      String dateString = '$d1$m1$y1';
                      print("dateString :: ${dateString}");
                      // DateTime dateTime =
                      //     DateFormat("dd-MMMM-yyyy").parse(dateString);
                      // print(
                      //     "dateTime  se :: $dateTime"); // 2022-05-22 00:00:00.000
                      // formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
                      // print("formattedDate :: $formattedDate");
                      print("userDetail.userToken ${Userdetail.userToken}");
                      updateBeauticianProfile();
                    }
// setState(() {});
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ))),
    );
  }

  List<dynamic> MyprofilePlacelist = [];

  getBeauticianProfile() async {
    var geturi = Uri.parse(ApiUrlList.getBeauticianProfile);
    try {
      Loader.show(
        context,
        isSafeAreaOverlay: false,
        // isBottomBarOverlay: false,
        // overlayFromBottom: 80,
        overlayColor: Colors.black26,
        progressIndicator:
            const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff01635D),
          ),
        ),
      );

      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getApi response.body ==> ${response.body}");
      log("getAPi status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        getmodelProfile = getBeauticianProfilemodel.fromjson(jsonDecode(response.body));
        if (getmodelProfile!.status == 200) {
          print(" gender >>> ${getmodelProfile!.data?.gender}");
          setState(() {
            firstname.text = getmodelProfile?.data?.firstName ?? '';
            lastname.text = getmodelProfile?.data?.lastName ?? '';
            email.text = getmodelProfile?.data?.userId?.email ?? '';
            phonernumber.text =
                getmodelProfile!.data!.userId!.phoneNumber.toString();
            _countryname = getmodelProfile?.data?.countryCode ?? '';
            currentpassword.text =
                getmodelProfile?.data?.userId?.password ?? '';
            var Dobformat = getmodelProfile?.data?.DOB ?? '';

            if (getmodelProfile!.data!.gender!.toLowerCase().contains("male")) {
              gendervalue = "Male";
            } else if (getmodelProfile!.data!.gender!
                .toLowerCase()
                .contains("female")) {
              gendervalue = "Female";
            } else if (getmodelProfile!.data!.gender!
                .toLowerCase()
                .contains("transgender")) {
              gendervalue = "Transgender";
            } else {
              gendervalue = "Select option";
            }

            if (Dobformat != "") {
              var datetime = DateTime.parse(Dobformat);
              day.text = datetime.day.toString();
              var month = DateFormat.MMMM().format(datetime).toString();
              year.text = datetime.year.toString();
              mounthvalue = month;
            }
            Loader.hide();
          });
        }
      }else if(response.statusCode == 401){
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return signInScreen();
        },), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      // setState(() {
      //   isLoading = false;
      // });
      Loader.hide();
    }
  }

  ///Update APi
  Future<void> updateBeauticianProfile() async {
    try {
      Loader.show(
        context,
        isSafeAreaOverlay: false,
        // isBottomBarOverlay: false,
        // overlayFromBottom: 80,
        overlayColor: Colors.black26,
        progressIndicator:
            const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff01635D),
          ),
        ),
      );
      var postUri = Uri.parse(ApiUrlList.updateBeauticianProfile);
      var request = http.MultipartRequest("PUT", postUri);

      request.fields['firstName'] = firstname.text;
      request.fields['lastName'] = lastname.text;
      request.fields['gender'] = gendervalue;
      request.fields['country_code'] = _countrycode;
      request.fields['phoneNumber'] = phonernumber.text;
      request.fields['email'] = email.text;
      request.fields['day'] = d1;
      request.fields['month'] = m1;
      request.fields['year'] = y1;
      request.fields['oldPassword'] = currentpassword.text;
      request.fields['newPassword'] = newpassword.text;
      request.headers['Authorization'] = "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
      request.headers['Content-Type'] = "multipart/form-data";
      if (imagepath != "") {
        http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          'profileImage',
          imagepath,
        );
        request.files.add(multipartFile);
        print("multipartFile ====> $multipartFile");
      }

      print("request url ${request.url}");
      print("request fields ${request.fields}");
      print("request header ${request.headers}");
      print("request files ${request.files}");

      http.StreamedResponse response = await request.send();
      final res = await http.Response.fromStream(response);

      //  var res = await http.put(postUri,headers: ApiHeader.headers,body: jsonEncode(data),);
      print('code: ${res.statusCode}');
      print('body: ${res.body}');

      Map map = jsonDecode(res.body);
      if (res.statusCode == 200) {
        // print("updateBeauticianProfilemodel=$updateBeauticianProfilemodel");
        Navigator.pop(context);
        getBeauticianProfile();
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
      }
      setState(() {});
    } catch (e) {
      print(e.toString());
      print("emaild failed catch");

      rethrow;
    } finally {
      Loader.hide();
    }
  }
}

class UpdateBeauticianProfileModel {
  int? status;
  bool? success;
  String? message;

  UpdateBeauticianProfileModel({this.status, this.success, this.message});

  factory UpdateBeauticianProfileModel.fromjson(Map<dynamic, dynamic> map) {
    return UpdateBeauticianProfileModel(
        status: map['status'],
        success: map['success'],
        message: map['message']);
  }
}

// class UpdateBeauticianProfileModel {
//   int? status;
//   bool? success;
//   String? message;
//
//   UpdateBeauticianProfileModel({this.status, this.success, this.message});
//
//   UpdateBeauticianProfileModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     success = json['success'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['success'] = this.success;
//     data['message'] = this.message;
//     return data;
//   }
// }
