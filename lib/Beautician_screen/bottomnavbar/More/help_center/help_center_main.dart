import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/help_center/contact_us_help.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/help_center/faq_help_center.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/help_center/feedback_help.dart';

import '../../../custom_widget/textcommon/textcommon.dart';


class help_center_beauti extends StatefulWidget {
  const help_center_beauti({Key? key}) : super(key: key);

  @override
  State<help_center_beauti> createState() => _help_center_beautiState();
}

class _help_center_beautiState extends State<help_center_beauti> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
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
                    SizedBox(width: width*0.20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Help Center",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height:height*0.04,),
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text:
                      'Welcome to ',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'spartan',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff414141)),
                      children: [
                        TextSpan(
                            text: 'Sliike help center',
                            style: TextStyle(
                                fontFamily: 'spartan',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xff292929))),
                        TextSpan(
                            text: ', how can we be of help?',
                            style: TextStyle(
                                fontFamily: 'spartan',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff414141))),


                      ])),

              SizedBox(height:height*0.02,),
              Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff01635D)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/images/message-text.png"),height: height*0.05,width: width*0.05,),
                      SizedBox(width: width*0.02,),
                      Text("Start live chat",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.white)),
                    ],
                  )
              ),
              SizedBox(height:height*0.04,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return faq_beauty();
                  },));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("FAQ",16,Color(0xff414141), FontWeight.w500),
                      Spacer(),
                      Container(
                        height: 15,
                        width: 30,
                        child: Image.asset("assets/images/righticon.png"),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return feedback_beauty();
                  },));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("Feedback",16,Color(0xff414141), FontWeight.w500),
                      Spacer(),
                      Container(
                        height: 15,
                        width: 30,
                        child: Image.asset("assets/images/righticon.png"),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return contact_us_beauty();
                  },));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("Contact Us",16,Color(0xff414141), FontWeight.w500),
                      Spacer(),
                      Container(
                        height: 15,
                        width: 30,
                        child: Image.asset("assets/images/righticon.png"),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
