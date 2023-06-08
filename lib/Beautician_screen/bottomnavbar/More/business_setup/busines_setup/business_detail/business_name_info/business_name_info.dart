import 'dart:convert';
import 'dart:developer';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import '../../../../../../../commonClass.dart';
import '../../../../../../../utils/apiurllist.dart';
import '../../../../../../../utils/preferences.dart';
import '../../../../../../custom_widget/ButtonCommon/Button.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class business_Name_Info extends StatefulWidget {
  const business_Name_Info({Key? key}) : super(key: key);

  @override
  State<business_Name_Info> createState() => _business_Name_InfoState();
}

class _business_Name_InfoState extends State<business_Name_Info> {
  TextEditingController businessname = TextEditingController();
  TextEditingController phonernumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Description = TextEditingController();
  TextEditingController Instagram = TextEditingController();
  TextEditingController Facebook = TextEditingController();
  TextEditingController Website = TextEditingController();
  bool bnamestatus = false;
  bool phonestatus = false;
  bool emailstatus = false;
  bool Instagramstatus = false;
  bool Facebookstatus = false;
  bool Websitestatus = false;
  String? timeformatvalue;
  String languagevalue = "English (UK)";

  var languageitemslist = [
    "English (UK)",
    "FRENCH",
    "ARABIC",
    "HINDI",
  ];

  String status = "";
  String? mounthvalue;
  var timeformatitems = [
    "24 hours",
    "12 hours",
  ];

  var mounthitemslist = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

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
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/Group 55.png"),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.1,
                      ),
                      Container(
                        child: Text("Beautician Name & Info",
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                child: TextField(
                  controller: businessname,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff292929),
                      fontWeight: FontWeight.w500,
                      fontFamily: "spartan"),
                  onChanged: (value) {
                    setState(() {
                      bnamestatus = false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Business Name",
                    labelText: "Business Name",
                    labelStyle:
                        TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
              ),
              bnamestatus
                  ? Container(
                      height: 30,
                      child: Text(
                        "$status",
                        style: TextStyle(
                            fontFamily: 'spartan',
                            fontSize: 12,
                            color: Colors.red),
                      ),
                    )
                  : Container(
                      height: 25,
                    ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: phonernumber,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff292929),
                      fontWeight: FontWeight.w500,
                      fontFamily: "spartan"),
                  onChanged: (value) {
                    phonestatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                    labelStyle:
                        TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    prefixIcon: Container(
                      width: width * 0.33,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CountryCodePicker(
                              flagWidth: 25,
                              onChanged: print,
                              initialSelection: 'Ca',
                              enabled: true,
                              favorite: const ['+1', 'Ca'],
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              textStyle: TextStyle(
                                  fontSize: 10, color: Colors.black87),
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Color(0xffCECECE),
                            )
                          ],
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: TextField(
                  controller: email,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff292929),
                      fontWeight: FontWeight.w500,
                      fontFamily: "spartan"),
                  onChanged: (value) {
                    emailstatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Email Address",
                    labelText: "Email Address",
                    labelStyle:
                        TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
              ),
              emailstatus
                  ? Container(
                      height: 30,
                      child: Text(
                        "$status",
                        style: TextStyle(
                            fontFamily: 'spartan',
                            fontSize: 12,
                            color: Colors.red),
                      ),
                    )
                  : Container(
                      height: 25,
                    ),
              Container(
                child: TextField(
                  controller: Description,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff292929),
                      fontWeight: FontWeight.w500,
                      fontFamily: "spartan"),
                  onChanged: (value) {
                    emailstatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 15),
                    hintText: "Description",
                    labelText: "Description",
                    labelStyle:
                        TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: textComoon(
                    "Set Time & Calendar", 16, Colors.black, FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: textComoonfade(
                    "Update a time format that suit’s you business. These settings will update automatically based on your selected time format.",
                    12,
                    Color(0xff414141),
                    FontWeight.w500),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, bottom: height * 0.01),
                child: textComoon(
                    "Time Format", 12, Color(0xff292929), FontWeight.w700),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38)),
                child: DropdownButton(
                  hint: Text("Select Time Format"),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'spartan',
                      fontWeight: FontWeight.w500),
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  iconDisabledColor: Colors.black,
                  iconEnabledColor: Colors.yellow,
                  isExpanded: true,
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: Color(0xff414141)),
                  value: timeformatvalue,
                  items: timeformatitems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      timeformatvalue = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, bottom: height * 0.01),
                child: textComoon(
                    "Start Week", 12, Color(0xff292929), FontWeight.w700),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38)),
                child: DropdownButton(
                  hint: Text("Week"),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'spartan',
                      fontWeight: FontWeight.w500),
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  iconDisabledColor: Colors.black,
                  iconEnabledColor: Colors.yellow,
                  isExpanded: true,
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: Color(0xff414141)),
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
              SizedBox(
                height: height * 0.025,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: textComoon(
                    "Language setting", 16, Colors.black, FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: textComoonfade(
                    "Choose the default language for appointment notification messages sent to your clients. You can also set language for each client depending on their language.",
                    12,
                    Color(0xff414141),
                    FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38)),
                child: DropdownButton(
                  hint: Text("English (UK)"),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'spartan',
                      fontWeight: FontWeight.w500),
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  iconDisabledColor: Colors.black,
                  iconEnabledColor: Colors.yellow,
                  isExpanded: true,
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: Color(0xff414141)),
                  value: languagevalue,
                  items: languageitemslist.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      languagevalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: textComoon(
                    "Social Media", 16, Colors.black, FontWeight.w700),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.01, bottom: height * 0.03),
                child: textComoonfade(
                    "Add your company website and social media links so you can share with clients.",
                    12,
                    Color(0xff414141),
                    FontWeight.w500),
              ),
              Container(
                child: TextField(
                  controller: Instagram,
                  onChanged: (value) {
                    Instagramstatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Instagram",
                    hintStyle: TextStyle(color: Color(0xff707070)),
                    prefixIcon: Container(
                      width: 80,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Container(
                                width: 25,
                                height: 25,
                                alignment: Alignment.center,
                                child:
                                    Image.asset("assets/images/instgram.png"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: VerticalDivider(
                                color: Color(0xff707070),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    labelStyle: TextStyle(
                        fontFamily: 'spartan', color: Color(0xff707070)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xff707070)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                child: TextField(
                  controller: Facebook,
                  onChanged: (value) {
                    Facebookstatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Facebook",
                    hintStyle: TextStyle(color: Color(0xff707070)),
                    prefixIcon: Container(
                      width: 80,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Container(
                                width: 25,
                                height: 25,
                                //padding: EdgeInsets.only(left: 20,right: 10),
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/facebook.png",
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: VerticalDivider(
                                color: Color(0xff707070),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    labelStyle: TextStyle(
                        fontFamily: 'spartan', color: Color(0xff707070)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xff707070)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                child: TextField(
                  controller: Website,
                  onChanged: (value) {
                    Websitestatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Website",
                    hintStyle: TextStyle(color: Color(0xff707070)),
                    prefixIcon: Container(
                      width: 80,
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Container(
                                width: 25,
                                height: 25,
                                //padding: EdgeInsets.only(left: 20,right: 10),
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/website.png",
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: VerticalDivider(
                                color: Color(0xff707070),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    labelStyle: TextStyle(
                        fontFamily: 'spartan', color: Color(0xff707070)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xff707070)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              CommonButton(context, "SAVE", 12, FontWeight.w700, Colors.white,
                  (){updateBusinessDetails();}),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateBusinessDetails() async {
    Loader.show(context,
        isSafeAreaOverlay: false,
        overlayColor: Colors.black26,
        progressIndicator: const CircularProgressIndicator(
            backgroundColor: Color(0xff01635D)),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff01635D))));
    var Body = {
      'businessName': businessname.text,
      'businessNumber': phonernumber.text,
      'email': email.text,
      'description': Description.text,
      'hourFormate': int.parse(timeformatvalue!.split(" ").first.toString()),
      'startDay': mounthvalue,
      'language': languagevalue,
      'facebookUrl': Facebook.text,
      'instagramUrl': Instagram.text,
      'website': Website.text,
    };
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization":
      "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var responce = await http.put(Uri.parse(ApiUrlList.updateBusinessDetails),
        body: jsonEncode(Body), headers: headers);
    log('updateBusinessDetails Code : ${responce.statusCode}');
    log('updateBusinessDetails Response Body :${responce.body}');
    log('updateBusinessDetails Payload Body :${Body}');
    var map = jsonDecode(responce.body);
    if (responce.statusCode == 200) {
      Navigator.pop(context);
      Loader.hide();
      Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.pop(context);
      Loader.hide();
      Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
