// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/contact_us.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/faq_page.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/feedback.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/privacy_policy.dart';
import '../../Beautician_screen/custom_widget/textcommon/textcommon.dart';


class help_center extends StatefulWidget {
  const help_center({Key? key}) : super(key: key);

  @override
  State<help_center> createState() => _help_centerState();
}

class _help_centerState extends State<help_center> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/Rectangle 28.png"),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
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
              const Text("Welcome to Sliike help center, how can we be of help?",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                      color: Colors.black)),
              SizedBox(height:height*0.02,),
              Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffDD6A03)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: const AssetImage("assets/images/message-text.png"),height: height*0.05,width: width*0.05,),
                      SizedBox(width: width*0.02,),
                      const Text("Start live chat",
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
                    return const faq_page();
                  },));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 17,),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("FAQ",16,const Color(0xff414141), FontWeight.w500),
                      const Spacer(),
                      SizedBox(
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
                    return const feedback();
                  },));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 17,),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("Feedback",16,const Color(0xff414141), FontWeight.w500),
                      const Spacer(),
                      SizedBox(
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
                    return const contact_us();
                  },));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 17,),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("Contact Us",16,const Color(0xff414141), FontWeight.w500),
                      const Spacer(),
                      SizedBox(
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
                    return const privacy_policy();
                  },));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 17,),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("Privacy Policy",16,const Color(0xff414141), FontWeight.w500),
                      const Spacer(),
                      SizedBox(
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
                    return const privacy_policy();
                  },));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 17,),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(
                    children: [
                      textComoon("Terms of Service",16,const Color(0xff414141), FontWeight.w500),
                      const Spacer(),
                      SizedBox(
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
