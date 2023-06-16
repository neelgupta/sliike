import 'dart:convert';
import 'dart:developer';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/getbeuticianprofilemodel.dart';
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
  bool isLoading = false;
  GetData? getmodelProfile;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getBeauticianProfile();
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
      body: isLoading ?
      Center(child: CircularProgressIndicator(color: Color(0xff01635D)),):
      getmodelProfile!=null?
      SingleChildScrollView(
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
      ):
      Center(child: Text("SomeThing Went Wrong !!",style: TextStyle(fontWeight: FontWeight.bold),))
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

  getBeauticianProfile() async {
    var geturi = Uri.parse(ApiUrlList.getBeauticianProfile);
    try {
      setState(() {
        isLoading = true;
      });

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
      Map map = jsonDecode(response.body);
      if(map["status"] == 200){
        getmodelProfile = GetData.fromJson(jsonDecode(response.body));
        businessname.text = getmodelProfile!.data!.businessName!;
        phonernumber.text = getmodelProfile!.data!.userId!.phoneNumber.toString();
        email.text = getmodelProfile!.data!.userId!.email!;
        Description.text = getmodelProfile!.data!.description!;
        mounthvalue = getmodelProfile!.data!.calenderSetting!.startDay;
        languagevalue = getmodelProfile!.data!.language!;
        Instagram.text = getmodelProfile!.data!.instagramUrl!;
        Facebook.text = getmodelProfile!.data!.facebookUrl!;
        Website.text = getmodelProfile!.data!.website!;
        getmodelProfile!.data!.calenderSetting!.formate=="12"?
        timeformatvalue = timeformatitems[0]:
        timeformatvalue = timeformatitems[1];
        isLoading = false;
        setState(() {});
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
      // Loader.hide();
    }
  }

}

GetData getDataFromJson(String str) => GetData.fromJson(json.decode(str));

String getDataToJson(GetData data) => json.encode(data.toJson());

class GetData {
  int? status;
  bool? success;
  Data? data;

  GetData({
    this.status,
    this.success,
    this.data,
  });

  factory GetData.fromJson(Map<String, dynamic> json) => GetData(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  UserId? userId;
  String? uid;
  String? firstName;
  String? lastName;
  List<String>? workSpaceImgs;
  String? country;
  String? countryCode;
  List<String>? beauticianServiceId;
  int? isProvideService;
  int? isProvideProduct;
  int? isRecommended;
  int? totalEmployee;
  List<String>? demographicIds;
  List<String>? amenityIds;
  HealthSafety? healthSafety;
  int? hasShop;
  int? isLicensed;
  int? isServeAtClient;
  int? isServeAtOwnPlace;
  int? screenStatus;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Address? address;
  String? businessName;
  int? businessNumber;
  Location? location;
  CalenderSetting? calenderSetting;
  String? description;
  String? facebookUrl;
  String? instagramUrl;
  String? language;
  String? website;
  String? logo;
  String? licenseImage;
  int? cancelProtection;
  int? noShowProtection;
  dynamic profileImage;
  bool? isStripeSetUp;

  Data({
    this.id,
    this.userId,
    this.uid,
    this.firstName,
    this.lastName,
    this.workSpaceImgs,
    this.country,
    this.countryCode,
    this.beauticianServiceId,
    this.isProvideService,
    this.isProvideProduct,
    this.isRecommended,
    this.totalEmployee,
    this.demographicIds,
    this.amenityIds,
    this.healthSafety,
    this.hasShop,
    this.isLicensed,
    this.isServeAtClient,
    this.isServeAtOwnPlace,
    this.screenStatus,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.businessName,
    this.businessNumber,
    this.location,
    this.calenderSetting,
    this.description,
    this.facebookUrl,
    this.instagramUrl,
    this.language,
    this.website,
    this.logo,
    this.licenseImage,
    this.cancelProtection,
    this.noShowProtection,
    this.profileImage,
    this.isStripeSetUp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    uid: json["uid"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    workSpaceImgs: json["workSpaceImgs"] == null ? [] : List<String>.from(json["workSpaceImgs"]!.map((x) => x)),
    country: json["country"],
    countryCode: json["country_code"],
    beauticianServiceId: json["beauticianServiceId"] == null ? [] : List<String>.from(json["beauticianServiceId"]!.map((x) => x)),
    isProvideService: json["isProvideService"],
    isProvideProduct: json["isProvideProduct"],
    isRecommended: json["isRecommended"],
    totalEmployee: json["totalEmployee"],
    demographicIds: json["demographicIds"] == null ? [] : List<String>.from(json["demographicIds"]!.map((x) => x)),
    amenityIds: json["amenityIds"] == null ? [] : List<String>.from(json["amenityIds"]!.map((x) => x)),
    healthSafety: json["healthSafety"] == null ? null : HealthSafety.fromJson(json["healthSafety"]),
    hasShop: json["hasShop"],
    isLicensed: json["isLicensed"],
    isServeAtClient: json["IsServeAtClient"],
    isServeAtOwnPlace: json["IsServeAtOwnPlace"],
    screenStatus: json["screenStatus"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    businessName: json["businessName"],
    businessNumber: json["businessNumber"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    calenderSetting: json["calenderSetting"] == null ? null : CalenderSetting.fromJson(json["calenderSetting"]),
    description: json["description"],
    facebookUrl: json["facebookUrl"],
    instagramUrl: json["instagramUrl"],
    language: json["language"],
    website: json["website"],
    logo: json["logo"],
    licenseImage: json["licenseImage"],
    cancelProtection: json["cancelProtection"],
    noShowProtection: json["noShowProtection"],
    profileImage: json["profileImage"],
    isStripeSetUp: json["isStripeSetUp"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId?.toJson(),
    "uid": uid,
    "firstName": firstName,
    "lastName": lastName,
    "workSpaceImgs": workSpaceImgs == null ? [] : List<dynamic>.from(workSpaceImgs!.map((x) => x)),
    "country": country,
    "country_code": countryCode,
    "beauticianServiceId": beauticianServiceId == null ? [] : List<dynamic>.from(beauticianServiceId!.map((x) => x)),
    "isProvideService": isProvideService,
    "isProvideProduct": isProvideProduct,
    "isRecommended": isRecommended,
    "totalEmployee": totalEmployee,
    "demographicIds": demographicIds == null ? [] : List<dynamic>.from(demographicIds!.map((x) => x)),
    "amenityIds": amenityIds == null ? [] : List<dynamic>.from(amenityIds!.map((x) => x)),
    "healthSafety": healthSafety?.toJson(),
    "hasShop": hasShop,
    "isLicensed": isLicensed,
    "IsServeAtClient": isServeAtClient,
    "IsServeAtOwnPlace": isServeAtOwnPlace,
    "screenStatus": screenStatus,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "address": address?.toJson(),
    "businessName": businessName,
    "businessNumber": businessNumber,
    "location": location?.toJson(),
    "calenderSetting": calenderSetting?.toJson(),
    "description": description,
    "facebookUrl": facebookUrl,
    "instagramUrl": instagramUrl,
    "language": language,
    "website": website,
    "logo": logo,
    "licenseImage": licenseImage,
    "cancelProtection": cancelProtection,
    "noShowProtection": noShowProtection,
    "profileImage": profileImage,
    "isStripeSetUp": isStripeSetUp,
  };
}

class Address {
  String? id;
  String? address;
  String? province;
  String? apartment;
  String? city;
  String? zipCode;

  Address({
    this.id,
    this.address,
    this.province,
    this.apartment,
    this.city,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["_id"],
    address: json["address"],
    province: json["province"],
    apartment: json["apartment"],
    city: json["city"],
    zipCode: json["zipCode"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "province": province,
    "apartment": apartment,
    "city": city,
    "zipCode": zipCode,
  };
}

class CalenderSetting {
  int? formate;
  String? startDay;

  CalenderSetting({
    this.formate,
    this.startDay,
  });

  factory CalenderSetting.fromJson(Map<String, dynamic> json) => CalenderSetting(
    formate: json["formate"],
    startDay: json["startDay"],
  );

  Map<String, dynamic> toJson() => {
    "formate": formate,
    "startDay": startDay,
  };
}

class HealthSafety {
  String? detailForClient;
  List<dynamic>? healthId;

  HealthSafety({
    this.detailForClient,
    this.healthId,
  });

  factory HealthSafety.fromJson(Map<String, dynamic> json) => HealthSafety(
    detailForClient: json["detailForClient"],
    healthId: json["healthId"] == null ? [] : List<dynamic>.from(json["healthId"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "detailForClient": detailForClient,
    "healthId": healthId == null ? [] : List<dynamic>.from(healthId!.map((x) => x)),
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({
    this.type,
    this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class UserId {
  String? id;
  String? email;
  int? phoneNumber;
  int? isVerified;

  UserId({
    this.id,
    this.email,
    this.phoneNumber,
    this.isVerified,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    isVerified: json["isVerified"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "phoneNumber": phoneNumber,
    "isVerified": isVerified,
  };
}

