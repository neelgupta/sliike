import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:http/http.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/cancellation_policy/cancellation_policy.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/models/booking_setting_model.dart';
import 'package:new_sliikeapps_apps/services/business_setup_services.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class booking_Setting extends StatefulWidget {
  const booking_Setting({Key? key}) : super(key: key);

  @override
  State<booking_Setting> createState() => _booking_SettingState();
}

class _booking_SettingState extends State<booking_Setting> {
  BusinessSetupService businessSetupService = BusinessSetupService();
  bool allowBooking = false;
  bool isLoad = true;
  List BookingWindowList = [
    {
      "id": "00:15",
      "value": 'No less than 15 mins in advance',
    },
    {
      "id": "00:30",
      "value": 'No less than 30 mins in advance',
    },
    {
      "id": "01:00",
      "value": 'No less than 1 hour in advance',
    },
    {
      "id": "02:00",
      "value": 'No less than 2 hours in advance',
    },
    {
      "id": "03:00",
      "value": 'No less than 3 hours in advance',
    },
    {
      "id": "06:00",
      "value": 'No less than 6 hours in advance',
    },
    {
      "id": "12:00",
      "value": 'No less than 12 hours in advance',
    },
    {
      "id": "24:00",
      "value": 'No less than 1 day in advance',
    },
    {
      "id": "48:00",
      "value": 'No less than 2 days in advance',
    },
    {
      "id": "72:00",
      "value": 'No less than 3 days in advance',
    },
    {
      "id": "120:00",
      "value": 'No less than 5 days in advance',
    },
    {
      "id": "144:00",
      "value": 'No less than 7 days in advance',
    },
  ];
  String selectdradioValue = "";
  List futureWindowList = [
    {"id": "7 days", "value": 'Up to 7 days in the future'},
    {"id": "14 days", "value": 'Up to 14 days in the future'},
    {"id": "1 months", "value": 'Up to 1 month in the future'},
    {"id": "2 months", "value": 'Up to 2 months in the future'},
    {"id": "3 months", "value": 'Up to 3 months in the future'},
    {"id": "6 months", "value": 'Up to 6 months in the future'},
    {"id": "12 months", "value": 'Up to 12 months in the future'},
    {"id": "24 months", "value": 'Up to 24 months in the future'},
  ];
  String futureselectdradioValue = "";
  List ReschedulingWindowList = [
    {
      "id": "01:00",
      "value": 'No less than 1 hour in advance',
    },
    {
      "id": "02:00",
      "value": 'No less than 2 hours in advance',
    },
    {
      "id": "03:00",
      "value": 'No less than 3 hours in advance',
    },
    {
      "id": "06:00",
      "value": 'No less than 6 hours in advance',
    },
    {
      "id": "12:00",
      "value": 'No less than 12 hours in advance',
    },
    {
      "id": "24:00",
      "value": 'No less than 1 day in advance',
    },
    {
      "id": "48:00",
      "value": 'No less than 2 days in advance',
    },
    {
      "id": "72:00",
      "value": 'No less than 3 days in advance',
    },
    {
      "id": "120:00",
      "value": 'No less than 5 days in advance',
    },
    {
      "id": "144:00",
      "value": 'No less than 7 days in advance',
    },
  ];
  String ReschedulingselectdradioValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
        toolbarHeight: height * 0.14, //
        flexibleSpace: Container(
          color: Color(0xffF5F7F7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Booking Settings",
                                  style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
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
      body: isLoad
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.03),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textComoon("Automatic booking confirmation", 16,
                            Color(0xff292929), FontWeight.w700),
                        FlutterSwitch(
                          width: 55.0,
                          height: 25.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          activeColor: Color(0xff01635D),
                          value: allowBooking,
                          onToggle: (value) {
                            setState(() {
                              allowBooking = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                        'Automatic booking confirmation when turned\non, can save time and make it easier for clients\nto book. ',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'spartan',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff707070),
                        )),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    height: 50,
                    width: width,
                    color: Color(0xffF3F3F3),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                              child: textComoon("Booking Regulations", 14,
                                  Color(0xff292929), FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: textComoon("Booking Window", 14, Color(0xff292929),
                        FontWeight.w700),
                  ),
                  SizedBox(height: height * 0.015),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: textComoonfade(
                        "How much of a booking interval do you need between the time of a booking and the appointment time? This helps you to plan ahead and prevents surprise appointments.",
                        12,
                        Color(0xff414141),
                        FontWeight.w500),
                  ),
                  SizedBox(height: height * 0.03),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              constraints:
                                  BoxConstraints(maxHeight: height * 0.85),
                              width: width * 0.9,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ListView.builder(
                                  // physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: BookingWindowList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          selectdradioValue =
                                              BookingWindowList[index]['value']
                                                  .toString();
                                          print(selectdradioValue);
                                          // Booking.text=selectdradioValue;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 1)),
                                        child: Column(
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                //here change to your color
                                                unselectedWidgetColor:
                                                    Color(0xff01635D),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${BookingWindowList[index]['value']}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff292929),
                                                          fontFamily: "spartan",
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    Radio<String>(
                                                      value: BookingWindowList[
                                                          index]['value'],
                                                      activeColor:
                                                          Color(0xff01635D),
                                                      groupValue:
                                                          selectdradioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectdradioValue =
                                                              value.toString();
                                                          print(
                                                              selectdradioValue);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              width: width,
                                              color: Color(0xffE7E7E7),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black38)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(selectdradioValue.isNotEmpty
                                  ? selectdradioValue
                                  : "Booking Window")),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: height * 0.01),
                    child: dividerCommon(),
                  ),
                  SizedBox(height: height * 0.025),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: textComoon("Future Booking Window", 14,
                        Color(0xff292929), FontWeight.w700),
                  ),
                  SizedBox(height: height * 0.015),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: textComoonfade(
                        "Choose how far in the future clients can schedule appointments.",
                        12,
                        Color(0xff414141),
                        FontWeight.w500),
                  ),
                  SizedBox(height: height * 0.03),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              constraints:
                                  BoxConstraints(maxHeight: height * 0.85),
                              width: width * 0.9,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: futureWindowList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        futureselectdradioValue =
                                            futureWindowList[index]['value']
                                                .toString();
                                        setState(() {});
                                        print(futureselectdradioValue);
                                        Navigator.pop(context);
                                        print("...${futureselectdradioValue}");
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 1)),
                                        child: Column(
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                //here change to your color
                                                unselectedWidgetColor:
                                                    Color(0xff01635D),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${futureWindowList[index]['value']}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff292929),
                                                          fontFamily: "spartan",
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    Radio<String>(
                                                      value: futureWindowList[
                                                          index]['value'],
                                                      activeColor:
                                                          Color(0xff01635D),
                                                      groupValue:
                                                          futureselectdradioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          futureselectdradioValue =
                                                              value.toString();
                                                          print(
                                                              futureselectdradioValue);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              width: width,
                                              color: Color(0xffE7E7E7),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black38)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(futureselectdradioValue.isNotEmpty
                                  ? futureselectdradioValue
                                  : "Future Booking Window")),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: height * 0.01),
                    child: dividerCommon(),
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: textComoon(
                        "Rescheduling", 14, Color(0xff292929), FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: textComoonfade(
                        "Choose how long before a client can reschedule or cancel an appointment.",
                        12,
                        Color(0xff414141),
                        FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              constraints:
                                  BoxConstraints(maxHeight: height * 0.85),
                              width: width * 0.9,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: ReschedulingWindowList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        ReschedulingselectdradioValue =
                                            ReschedulingWindowList[index]
                                                    ['value']
                                                .toString();
                                        setState(() {});
                                        print(ReschedulingselectdradioValue);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 1)),
                                        child: Column(
                                          children: [
                                            Theme(
                                              data: ThemeData(
                                                //here change to your color
                                                unselectedWidgetColor:
                                                    Color(0xff01635D),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${ReschedulingWindowList[index]['value']}",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff292929),
                                                          fontFamily: "spartan",
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    Radio<String>(
                                                      value:
                                                          ReschedulingWindowList[
                                                              index]['value'],
                                                      activeColor:
                                                          Color(0xff01635D),
                                                      groupValue:
                                                          ReschedulingselectdradioValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          ReschedulingselectdradioValue =
                                                              value.toString();
                                                          print(
                                                              ReschedulingselectdradioValue);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 1,
                                              width: width,
                                              color: Color(0xffE7E7E7),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black38)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  ReschedulingselectdradioValue.isNotEmpty
                                      ? ReschedulingselectdradioValue
                                      : "Rescheduling")),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'For cancellation, set on ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'spartan',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff707070),
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return cancellation_Policy();
                                  },
                                ));
                              },
                            text: 'Cancellation policy ',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'spartan',
                              color: Color(0xff2F80ED),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'page',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'spartan',
                              color: Color(0xff707070),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: height * 0.01),
                    child: dividerCommon(),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommonButton(
                        context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                      updateData();
                    }),
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
    );
  }

  getData() async {
    Response response = await businessSetupService.getBookingSetting();

    if (response.statusCode == 200) {
      BookingSetting bookingSetting =
          BookingSetting.fromJson(jsonDecode(response.body));
      if (bookingSetting.data != null) {
        for (int i = 0; i < BookingWindowList.length; i++) {
          if (bookingSetting.data!.bookingWindow ==
              BookingWindowList[i]['id']) {
            selectdradioValue = BookingWindowList[i]['value'];
          }
        }
        for (int i = 0; i < futureWindowList.length; i++) {
          if (bookingSetting.data!.futureBooking == futureWindowList[i]['id']) {
            futureselectdradioValue = futureWindowList[i]['value'];
          }
        }
        for (int i = 0; i < ReschedulingWindowList.length; i++) {
          if (bookingSetting.data!.rescheduling ==
              ReschedulingWindowList[i]['id']) {
            ReschedulingselectdradioValue = ReschedulingWindowList[i]['value'];
          }
        }
        allowBooking = bookingSetting.data!.confirmAuto;
      }
    }
    isLoad = false;
    setState(() {});
  }

  updateData() async {
    Loader.show(context,
        isSafeAreaOverlay: false,
        overlayColor: Colors.black26,
        progressIndicator:
            const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff01635D))));
    String bookingWindow = "";
    String futureBooking = "";
    String rescheduling = "";

    for (int i = 0; i < BookingWindowList.length; i++) {
      if (selectdradioValue == BookingWindowList[i]['value']) {
        bookingWindow = BookingWindowList[i]['id'];
      }
    }
    for (int i = 0; i < futureWindowList.length; i++) {
      if (futureselectdradioValue == futureWindowList[i]['value']) {
        futureBooking = futureWindowList[i]['id'];
      }
    }
    for (int i = 0; i < ReschedulingWindowList.length; i++) {
      if (ReschedulingselectdradioValue == ReschedulingWindowList[i]['value']) {
        rescheduling = ReschedulingWindowList[i]['id'];
      }
    }
    var body = {
      "confirmAuto": allowBooking,
      "bookingWindow": bookingWindow,
      "futureBooking": futureBooking,
      "rescheduling": rescheduling
    };
    print(body);
    Response response =
        await businessSetupService.updateBookingSetting(jsonEncode(body));
    showToast(message: "${jsonDecode(response.body)['message']}");
    Loader.hide();
  }
}
