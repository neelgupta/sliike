import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/bottomnavbar.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/business_setup_all_scrren/setup_profile.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/add_your_work_hours.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/second_beautyservice_or_product/service_add/categorytype_service.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signup/signup.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/type_first_second_bussines/bussinessinfo_type.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/unbording/unboarding%20screen.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_screen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/userdetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../viewscrren/signin/signin.dart';

// ignore: camel_case_types
class splash_Scrren extends StatefulWidget {
  const splash_Scrren({Key? key}) : super(key: key);

  @override
  State<splash_Scrren> createState() => _splash_ScrrenState();
}

// ignore: camel_case_types
class _splash_ScrrenState extends State<splash_Scrren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
    next();
    });
  }

  Future<void> next() async {
    Helper.prefs = await SharedPreferences.getInstance();
    bool login = Helper.prefs!.getBool(UserPrefs.keyuserlogin) ?? false;
    if (login) {
      String userType = Helper.prefs!.getString(UserPrefs.keyusertype) ?? "";
      String usertoken = Helper.prefs!.getString(UserPrefs.keyutoken) ?? "";
      Userdetail.userToken = usertoken;
      if (userType == "user") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const homescreen();
            },
          ),
        );
      }
      else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const BottomNavigation();
            },
          ),
          (route) => false,
        );
      }
    }
    else {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const signInScreen();
          },
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
      width: tw,
      height: th,
      child: Image.asset("assets/images/splash.png", fit: BoxFit.fill),
    )
        // Center(
        //     child: Container(
        //       height: th,
        //       width: tw,
        //       color: Color(0xFFDD6A03),
        //       // decoration: BoxDecoration(
        //       //     image: DecorationImage(image: AssetImage("assets/images/collage 1.png",),fit: BoxFit.fill)
        //       // ),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Container(
        //                 height: th*0.12,
        //                 // width: tw*0.2,
        //                 child: Image(image: AssetImage("assets/images/Sliike logo4 1.png")),
        //               ),
        //             ],
        //           ),
        //           Text("Beauty Made Easy",style: TextStyle(fontSize: 15,fontFamily: "spartan",color: Colors.white),)
        //         ],
        //       ),
        //     )
        // ),
        );
  }
}
