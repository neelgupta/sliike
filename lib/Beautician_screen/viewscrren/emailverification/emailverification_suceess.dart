// ignore: duplicate_ignore
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/business_setup_all_scrren/setup_profile.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_screen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class emailVeriSuceesful extends StatefulWidget {

  const emailVeriSuceesful({Key? key}) : super(key: key);

  @override
  State<emailVeriSuceesful> createState() => _emailVeriSuceesfulState();
}

class _emailVeriSuceesfulState extends State<emailVeriSuceesful> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/verifi_sucess.png"),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text("Verification Successfully",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * 0.03,
              ),
              const Text("Continue to explore Sliike best of beauty services, products and brand.",textAlign: TextAlign.center,style: TextStyle(color: Colors.black45, fontSize: 14, fontFamily: "spartan",),),
              SizedBox(height: height*0.05,),
              InkWell(
                onTap: () async {
                  String userType = Helper.prefs!.getString(UserPrefs.keyusertype) ?? "";
                  if (userType == "user") {
                    Helper.prefs!.setBool(UserPrefs.keyuserlogin, true);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return homescreen(selectedIndex: 0,);
                        },
                      ),(route) => false,
                    );
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const setup_profile();
                        },
                      ),(route) => false,
                    );

                  }


                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return signInScreen();
                  //   },
                  // ),(route) => false,);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffDD6A03)),
                  child: const Text("CONTINUE",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
