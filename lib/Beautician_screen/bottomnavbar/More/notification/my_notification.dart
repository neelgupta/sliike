import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class my_Notification extends StatefulWidget {
  const my_Notification({Key? key}) : super(key: key);

  @override
  State<my_Notification> createState() => _my_NotificationState();
}

class _my_NotificationState extends State<my_Notification> {
  bool apoinmenttextS=false;
  bool apoinmentemailS=false;
  bool productemailS=false;
  bool producttextS=false;
  bool statsmailS=false;
  bool reviewS=false;
  bool gistmypostS=false;
  bool gistcommnetS=false;
  bool brandS=false;
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
                      SizedBox(width: width*0.15,),
                      Container(
                        child: Text("My Notifications",
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
        child: Column(
          children: [
            Container(

              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20),
                child: textComoon("Appointments", 14,Color(0xff292929), FontWeight.w600),
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textComoon("Bookings & Cancellations",14,Color(0xff292929), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Get notified when clients book and cancel appointments.",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Text", 14, Color(0xff292929),FontWeight.w500),
                    SizedBox(width: 20,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: apoinmenttextS,
                      onToggle: (value) {
                        setState(() {
                          apoinmenttextS = value;
                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Email", 14, Color(0xff292929),FontWeight.w500),
                    SizedBox(width: 20,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: apoinmentemailS,
                      onToggle: (value) {
                        setState(() {
                          apoinmentemailS = value;
                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.01,),
            Container(

              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20),
                child: textComoon("Products", 14,Color(0xff292929), FontWeight.w600),
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textComoon("Product Sales",14,Color(0xff292929), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Get notified when clients buy products.",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Text", 14, Color(0xff292929),FontWeight.w500),
                    SizedBox(width: 20,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: producttextS,
                      onToggle: (value) {
                        setState(() {
                          producttextS = value;
                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Email", 14, Color(0xff292929),FontWeight.w500),
                    SizedBox(width: 20,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: productemailS,
                      onToggle: (value) {
                        setState(() {
                          productemailS = value;
                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
            ///stats update
            SizedBox(height: height*0.01,),
            Container(

              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20),
                child: textComoon("Stats Updates", 14,Color(0xff292929), FontWeight.w600),
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textComoon("Daily Stats",14,Color(0xff292929), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Receive daily stats updates.",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Email", 14, Color(0xff292929),FontWeight.w500),
                    SizedBox(width: 20,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: statsmailS,
                      onToggle: (value) {
                        setState(() {
                          statsmailS = value;
                        });
                      },
                    ),

                  ],
                ),
              ),
            ),
            ///Rwview
            SizedBox(height: height*0.03,),
            Container(

              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20),
                child: textComoon("Review", 14,Color(0xff292929), FontWeight.w600),
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),

                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          textComoonfade("Client Thank You & Review Comments",14,Color(0xff292929), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Send clients a thank you email with a link to leave a review after an\nappointment.",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),
                  SizedBox(width: 5,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: reviewS,
                      onToggle: (value) {
                        setState(() {
                          reviewS = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            ///gist
            Container(

              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20),
                child: textComoon("Gist", 14,Color(0xff292929), FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),

                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          textComoonfade("Get Notification On My Post",14,Color(0xff292929), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Send push notification when someone comments on my post",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(width: 5,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: gistmypostS,
                      onToggle: (value) {
                        setState(() {
                          gistmypostS = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),

                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          textComoonfade("Get Notification On Comments",14,Color(0xff292929), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Send push notification when someone comments on my comments",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(width: 5,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: gistcommnetS,
                      onToggle: (value) {
                        setState(() {
                          gistcommnetS = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            ///brand
            SizedBox(height: height*0.02,),
            Container(

              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20),
                child: textComoon("Brands", 14,Color(0xff292929), FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),

                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          textComoonfade("Get Notification On Brand Updates",14,Color(0xff292929), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Notify me when my favorite brand makes an update",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(width: 5,),
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: brandS,
                      onToggle: (value) {
                        setState(() {
                          brandS = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.03,),
          ],
        ),
      ),
    );
  }
}
