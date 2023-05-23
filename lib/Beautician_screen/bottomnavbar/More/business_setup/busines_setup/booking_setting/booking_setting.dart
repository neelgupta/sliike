import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class booking_Setting extends StatefulWidget {
  const booking_Setting({Key? key}) : super(key: key);

  @override
  State<booking_Setting> createState() => _booking_SettingState();
}

class _booking_SettingState extends State<booking_Setting> {
  bool product = false;
  TextEditingController Booking=TextEditingController();
  TextEditingController futureBooking=TextEditingController();
  TextEditingController Rescheduling=TextEditingController();
  List BookingWindowList = [
    'No less than 15 mins in advance',
    'No less than 30 mins in advance',
    'No less than 1 hour in advance',
    'No less than 2 hours in advance',
    'No less than 3 hours in advance',
    'No less than 6 hours in advance',
    'No less than 12 hours in advance',
    'No less than 1 day in advance',
    'No less than 2 days in advance',
    'No less than 3 days in advance',
    'No less than 5 days in advance',
    'No less than 7 days in advance',
  ];
  String? selectdradioValue ="";
  List futureWindowList = [
    'Up to 7 days in the future',
    'Up to 14 days in the future',
    'Up to 1 month in the future',
    'Up to 2 months in the future',
    'Up to 3 months in the future',
    'Up to 6 months in the future',
    'Up to 12 months in the future',
    'Up to 24 months in the future',

  ];
  String? futureselectdradioValue = "";
  List ReschedulingWindowList = [
    'No less than 1 hour in advance',
    'No less than 2 hours in advance',
    'No less than 3 hours in advance',
    'No less than 6 hours in advance',
    'No less than 12 hours in advance',
    'No less than 1 day in advance',
    'No less than 2 days in advance',
    'No less than 3 days in advance',
    'No less than 5 days in advance',
    'No less than 7 days in advance',

  ];
  String? ReschedulingselectdradioValue = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  Scaffold(
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
                        GestureDetector(
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
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Allow calendar bookings", 14, Color(0xff292929),
                      FontWeight.w700),
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    valueFontSize: 12.0,
                    toggleSize: 18.0,
                    activeColor: Color(0xff01635D),
                    value: product,
                    onToggle: (value) {
                      setState(() {
                        product = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child:   Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text:
                      'Automatic booking confirmation when turned\non, can save time and make it easier for clients\nto book. ',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'spartan',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff707070),
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {},
                          text: 'Read more',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'spartan',
                            color: Color(0xff2F80ED),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Container(
              height: 50,
              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: textComoon("Booking Regulations", 14, Color(0xff292929), FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.025,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: textComoon("Booking Window", 14, Color(0xff292929), FontWeight.w700),
            ),
            SizedBox(height: height*0.015,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: textComoonfade("How much of a booking interval do you need between the time of a booking and the appointment time? This helps you to plan ahead and prevents surprise appointments.", 12, Color(0xff414141), FontWeight.w500),
            ),
            SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                child: TextFormField(
                  controller: Booking,
                  readOnly: true,
                  onChanged: (value) {

                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    //hintText: "Last Name",
                    labelText: "Booking Window",
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
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Container(

                                  height: height * 0.7,
                                  width: width - 40,

                                  child: Card(

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: BookingWindowList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectdradioValue =
                                                  BookingWindowList[index]
                                                      .toString();
                                              print(selectdradioValue);
                                              Navigator.pop(context);
                                              Booking.text=selectdradioValue!;

                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1)),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    //here change to your color
                                                    unselectedWidgetColor:
                                                    Color(0xff01635D),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 8,
                                                        bottom: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          "${BookingWindowList[index]}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xff292929),
                                                              fontFamily:
                                                              "spartan",
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal),
                                                        ),
                                                        Radio<String>(
                                                          value:
                                                          BookingWindowList[index],
                                                          activeColor: Color(
                                                              0xff01635D),
                                                          groupValue:
                                                          selectdradioValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectdradioValue =
                                                                  value
                                                                      .toString();
                                                              print(
                                                                  selectdradioValue);
                                                              Navigator.pop(
                                                                  context);
                                                            });
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
                        });

                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Color(0xff414141),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20,top: height*0.01),
              child: dividerCommon(),
            ),



            SizedBox(height: height*0.025,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: textComoon("Future Booking Window", 14, Color(0xff292929), FontWeight.w700),
            ),
            SizedBox(height: height*0.015,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: textComoonfade("Choose how far in the future clients can schedule appointments.", 12, Color(0xff414141), FontWeight.w500),
            ),
            SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                child: TextFormField(
                  controller: futureBooking,style: TextStyle(color: Colors.black),
                  readOnly: true,
                  onChanged: (value) {
                    // setState(() {
                    //   futureBooking.text=selectdradioValue;
                    // });
                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    //hintText: "Last Name",
                    labelText: "Future Booking Window",
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
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Container(

                                  height: height * 0.7,
                                  width: width - 40,

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


                                              futureselectdradioValue = futureWindowList[index].toString();
                                              print(futureselectdradioValue);
                                              Navigator.pop(context);
                                              setState(() { futureBooking.text=futureselectdradioValue!;
                                              print("...${futureselectdradioValue}");
                                              print("...futureBooking.text ${futureBooking.text}");


                                          });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1)),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    //here change to your color
                                                    unselectedWidgetColor:
                                                    Color(0xff01635D),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 8,
                                                        bottom: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          "${futureWindowList[index]}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xff292929),
                                                              fontFamily:
                                                              "spartan",
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal),
                                                        ),
                                                        Radio<String>(
                                                          value: futureWindowList[index],
                                                          activeColor: Color(0xff01635D),
                                                          groupValue: futureselectdradioValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              futureselectdradioValue =
                                                                  value
                                                                      .toString();
                                                              print(
                                                                  futureselectdradioValue);
                                                              Navigator.pop(
                                                                  context);
                                                            });
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
                        });

                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Color(0xff414141),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20,right: 20,top: height*0.01),
              child: dividerCommon(),
            ),
            SizedBox(height: height*0.025,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: textComoon("Rescheduling", 14, Color(0xff292929), FontWeight.w700),
            ),
            SizedBox(height: height*0.015,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: textComoonfade("Choose how long before a client can reschedule or cancel an appointment.", 12, Color(0xff414141), FontWeight.w500),
            ),
            SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                child: TextField(
                  controller: Rescheduling,
                  readOnly: true,
                  onChanged: (value) {

                  },

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    //hintText: "Last Name",
                    labelText: "Rescheduling",
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
                    suffixIcon: InkWell(
                      onTap: (){
                        setState(() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Container(

                                  height: height * 0.7,
                                  width: width - 40,

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
                                                    .toString();
                                            print(ReschedulingselectdradioValue);
                                            Navigator.pop(context);
                                            setState(() {
                                              Rescheduling.text=ReschedulingselectdradioValue!;

                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1)),
                                            child: Column(
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    //here change to your color
                                                    unselectedWidgetColor:
                                                    Color(0xff01635D),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 8,
                                                        bottom: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          "${ReschedulingWindowList[index]}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color(
                                                                  0xff292929),
                                                              fontFamily:
                                                              "spartan",
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal),
                                                        ),
                                                        Radio<String>(
                                                          value:
                                                          ReschedulingWindowList[
                                                          index],
                                                          activeColor: Color(
                                                              0xff01635D),
                                                          groupValue:
                                                          ReschedulingselectdradioValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              ReschedulingselectdradioValue =
                                                                  value
                                                                      .toString();
                                                              print(
                                                                  ReschedulingselectdradioValue);
                                                              Navigator.pop(
                                                                  context);
                                                            });
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
                        });

                      },
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Color(0xff414141),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: RichText(
                text: TextSpan(
                  text:
                  'For cancellation, set on ',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'spartan',
                    fontWeight: FontWeight.w500,
                    color: Color(0xff707070),
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {},
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
              padding:  EdgeInsets.only(left: 20,right: 20,top: height*0.01),
              child: dividerCommon(),
            ),
            SizedBox(height: height*0.03,),
          ],
        ),
      ),
    );
  }
}
