import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/booking_receipt.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/manage_appoinment.dart';
import 'package:new_sliikeapps_apps/client_model/onlyonemodal.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

class booking_summary_paymentconfirm extends StatefulWidget {
  String? id;
  booking_summary_paymentconfirm(this.id, {Key? key}) : super(key: key);

  @override
  State<booking_summary_paymentconfirm> createState() => _booking_summary_paymentconfirmState();
}

class _booking_summary_paymentconfirmState extends State<booking_summary_paymentconfirm> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        getAppointmentPastList(widget.id);
      });
    });

  }

  @override
  OnlyoneModal? onlyonemodal;
  bool ison = false;
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: ison?Container(color: Colors.white,):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.08,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(onTap: () {
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back_sharp,size: 30,)),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: width*0.35,
                    height: height*0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green
                    ),
                    child: Text(onlyonemodal!.data!.status == 0
                        ?"pending":onlyonemodal!.data!.status == 1
                        ?"confirm":onlyonemodal!.data!.status == 2?"delivered":onlyonemodal!.data!.status == 3?"cancel":onlyonemodal!.data!.status == 4?"cancel":
                    onlyonemodal!.data!.status == 5?"no show":"",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: onlyonemodal!.data!.status == 0?Colors.black:Colors.white)).tr(),
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("appointment_details",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black)).tr(),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                      height: height*0.12,
                      width: width*0.25,
                      child: Image(image: NetworkImage(onlyonemodal!.data!.beauticianId!.logoPath != null?onlyonemodal!.data!.beauticianId!.logoPath:""),fit: BoxFit.fill,)),
                  SizedBox(width: width*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("${onlyonemodal!.data!.beauticianId!.businessName}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                          SizedBox(width: width*0.12,),
                        ],
                      ),
                      Text("${onlyonemodal!.data!.beauticianId!.address!.address}",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "spartan",
                              color: Colors.blue)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(color: Colors.black54,),
                      ),
                      SizedBox(height: height*0.02,),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: height*0.03,),
                  Row(
                    children: [
                      Text("${DateFormat.d().format(DateTime.parse(onlyonemodal!.data!.dateTime.toString()))} ${DateFormat.MMM().format(DateTime.parse(onlyonemodal!.data!.dateTime.toString()))}. ${DateFormat.y().format(DateTime.parse(onlyonemodal!.data!.dateTime.toString()))} | ${DateFormat.jm().format(DateTime.parse(onlyonemodal!.data!.dateTime.toString()))} ${DateFormat.jm().format(DateTime.parse(onlyonemodal!.data!.endDateTime.toString()))}",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: height*0.03,),
                  Row(
                    children: [
                      Text("${onlyonemodal!.data!.serviceId!.serviceType!.serviceTypeName}",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Spacer(),
                      Text("${onlyonemodal!.data!.price}",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      Container(
                        height: height*0.03,
                        width: width*0.06,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: width*0.02,),
                      // Text("Black",
                      //     style: TextStyle(
                      //         fontSize: 16,
                      //         fontFamily: "spartan",
                      //         color: Colors.black54)),
                      // Spacer(),
                      // Text("for 30 min",
                      //     style: TextStyle(
                      //         fontSize: 18,
                      //         fontFamily: "spartan",
                      //         color: Colors.black54)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(height: height*0.01,),
                  Text("stylist",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(width: width*0.02,),
                  Image(image: AssetImage("assets/images/Ellipse 150.png"),height: height*0.04,width: width*0.06,),
                  SizedBox(width: width*0.02,),
                  Text("No Preference",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return manage_appoinment();
                  },));
                },
                child: Row(
                  children: [
                    Text("mange_appointment",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "spartan",
                            color: Color(0xffDD6A03))).tr(),
                    SizedBox(width: width*0.02,),
                    Icon(Icons.arrow_forward_ios_sharp,size: 25,color: Color(0xffDD6A03),)
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: height*0.03,),
                  Row(
                    children: [
                      Text("Tuesday, 20 Sep 2022 | 11:00 - 11:30",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: height*0.03,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Men’s Cut",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Spacer(),
                      Text("\$20.00",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("for 30 min",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(height: height*0.01,),
                  Text("stylist",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(width: width*0.02,),
                  Image(image: AssetImage("assets/images/Ellipse 150.png"),height: height*0.04,width: width*0.06,),
                  SizedBox(width: width*0.02,),
                  Text("No Preference",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("mange_appointment",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Color(0xffDD6A03))).tr(),
                  SizedBox(width: width*0.02,),
                  Icon(Icons.arrow_forward_ios_sharp,size: 25,color: Color(0xffDD6A03),)
                ],
              ),
            ),
            SizedBox(height: height*0.04,),
            Container(
              height: height*0.06,
              color: Color(0xFFF3F3F3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("total",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)).tr(),
                      Spacer(),
                      Text("\$70.00",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("booking_id",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(width: width*0.02,),
                  Text("#12DA481",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "spartan",
                          color: Colors.black54)),
                ],
              ),
            ),
            SizedBox(height: height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return booking_receipt();
                  },));
                },
                child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffDD6A03)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("assets/images/message-text.png"),height: height*0.05,width: width*0.05,),
                        SizedBox(width: width*0.02,),
                        Text("view_receipt",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.white)).tr(),
                      ],
                    )
                ),
              ),
            ),
            SizedBox(height: height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFDF8F2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("important_info",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("info",
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "spartan",
                              color: Colors.black)).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("late_cancel",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.05,)
          ],
        ),
      ),
    );
  }

  getAppointmentPastList(id) async {
    try {
      ison = true;
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
      var geturi = Uri.parse("${ApiUrlList.getSingleAppointmentData}$id");
      print("getSingleAppointmentData uri=$geturi");
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
      log("getSingleAppointmentData response.body ==> ${response.body}");
      log("getSingleAppointmentData status code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        onlyonemodal = OnlyoneModal.fromJson(jsonDecode(response.body));
        setState(() {
        });
      }else{
      }
    } catch (e) {
      rethrow;
    } finally {
      ison = false;
      Loader.hide();
    }
  }

}
