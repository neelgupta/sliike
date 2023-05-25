import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/getbeuticianprofilemodel.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/Profile/profile_page.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/email_marketing/email_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/gist/gist_beauticin.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/help_center/help_center_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/notification/main_notification_screen.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/promotions/promotion.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/report/all_activities/all_acitivities.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_explore.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_screen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

import '../business_setup/busines_setup/business_setup.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

class more_Main_Sccreen extends StatefulWidget {
  const more_Main_Sccreen({Key? key}) : super(key: key);

  @override
  State<more_Main_Sccreen> createState() => _more_Main_SccreenState();
}

class _more_Main_SccreenState extends State<more_Main_Sccreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getBeauticianProfile();
    });
  }
  getBeauticianProfilemodel? getmodelProfile;
bool isLoading=false;
String businessname="";
String Userid="";

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
        toolbarHeight: height * 0.18, //

        flexibleSpace: Container(
          color: Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 10),
                child: Column(
                  children: [
                     InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return profilePage();
                         },));
                       },
                       child: Container(
                         height: 65,
                         width: 65,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle,
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(20),
                           child: Image.asset("assets/images/people.png",height: 10),
                         ),
                       ),
                     ),
                    textComoon(businessname, 14, Colors.white, FontWeight.w700),
                    SizedBox(height: 5),
                    textComoon(Userid, 10, Colors.white, FontWeight.w500),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoading?Center(
        child: CircularProgressIndicator(),
      ):SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Container(
            //   height: height*0.22,
            //   color: Color(0xffF3F3F3),
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20,right: 20),
            //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //           height: height*0.17,
            //           decoration: BoxDecoration(color: Color(0xffEBA668),
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(color: Color(0xffCFCFCF),width: 1),
            //           ),
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Container(
            //                 height: 110,
            //                 width: 110,
            //                 margin: EdgeInsets.all(12),
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(10),
            //                     image: DecorationImage(
            //                         fit: BoxFit.fill,
            //                         image: AssetImage("assets/images/Rectangle 967.png")
            //                     )
            //                 ),
            //               ),
            //               Container(
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     textComoon("Sliike Gist!",18, Color(0xff000000), FontWeight.w800),
            //                     SizedBox(height: 5,),
            //                     textComoonfade("Meet , learn and\nchat with other\nsliike users", 10, Color(0xff111111), FontWeight.w600),
            //                   ],
            //                 ),
            //               ),
            //               Spacer(),
            //               InkWell(
            //                 onTap: (){
            //                   Navigator.push(context,MaterialPageRoute(builder: (context) {
            //                     return sliiikeGist();
            //                   },));
            //                 },
            //                 child: Container(
            //                   height: 45,
            //                   width: 45,
            //                   decoration: BoxDecoration(
            //                     color: Color(0xffE48835),
            //                     shape: BoxShape.circle,
            //                   ),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(15),
            //                     child: Image.asset("assets/images/righticon.png",),
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(width: 10,),
            //             ],
            //           ),
            //
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return business_SetUp(email: getmodelProfile!.data!.userId!.email!);
                    },));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                      child: Image.asset("assets/images/setting-2.png"),
                      ),
                      SizedBox(width: 15,),
                      textComoon("Business Setup",14,Color(0xff414141), FontWeight.w500),
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
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,right: 20),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 17,),
            //     decoration: BoxDecoration(
            //         border: Border(bottom: BorderSide(color: Colors.black12))
            //     ),
            //     child: InkWell(
            //       onTap: (){
            //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         //   return all_Activities();
            //         // },));
            //       },
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 30,
            //           child: Image.asset("assets/images/diagram.png"),
            //           ),
            //           SizedBox(width: 15,),
            //           textComoon("Reports",14,Color(0xff414141), FontWeight.w500),
            //           Spacer(),
            //           Container(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,right: 20),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 17,),
            //     decoration: BoxDecoration(
            //         border: Border(bottom: BorderSide(color: Colors.black12))
            //     ),
            //     child: InkWell(
            //       onTap: (){
            //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         //   return email_Marketing_Main();
            //         // },));
            //
            //       },
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 30,
            //             width: 30,
            //           child: Image.asset("assets/images/sms_tracking.png"),
            //           ),
            //           SizedBox(width: 15,),
            //           textComoon("Email Marketing",14,Color(0xff414141), FontWeight.w500),
            //           Spacer(),
            //           Container(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,right: 20),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 17,),
            //     decoration: BoxDecoration(
            //         border: Border(bottom: BorderSide(color: Colors.black12))
            //     ),
            //     child: InkWell(
            //       onTap: (){
            //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         //   return main_Notification();
            //         // },));
            //       },
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 30,
            //
            //           child: Image.asset("assets/images/notification.png"),
            //           ),
            //           SizedBox(width: 15,),
            //           textComoon("Notification",14,Color(0xff414141), FontWeight.w500),
            //           Spacer(),
            //           Container(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,right: 20),
            //   child: Container(
            //     padding: EdgeInsets.only(top: 10,bottom: 60),
            //     decoration: BoxDecoration(
            //         border: Border(bottom: BorderSide(color: Colors.black12))
            //     ),
            //     child: InkWell(
            //       onTap: (){
            //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         //   return promotion();
            //         // },));
            //       },
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 30,
            //           child: Image.asset("assets/images/receiptdisscount.png"),
            //           ),
            //           SizedBox(width: 15,),
            //           textComoon("Promotions",14,Color(0xff414141), FontWeight.w500),
            //           Spacer(),
            //           Container(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              height: height*0.05,
              width: width,

              color: Color(0xffF3F3F3),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,right: 20),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(vertical: 17,),
            //     decoration: BoxDecoration(
            //         border: Border(bottom: BorderSide(color: Colors.black12))
            //     ),
            //     child: InkWell(
            //       onTap: (){
            //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         //   return help_center_beauti();
            //         // },));
            //       },
            //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           textComoon("Help Center",14,Color(0xff414141), FontWeight.w500),
            //           Container(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     //   return homescreen();
            //     // },));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20,right: 20),
            //     child: Container(
            //       padding: EdgeInsets.symmetric(vertical: 17,),
            //       decoration: BoxDecoration(
            //           border: Border(bottom: BorderSide(color: Colors.black12))
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           textComoon("Become User",14,Color(0xff414141), FontWeight.w500),
            //           Container(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: InkWell(
                onTap: (){
    logoutdata();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return signInScreen();
    },),(route) => false,);


                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      textComoon("Log Out",14,Color(0xff414141), FontWeight.w500),

                      Container(
                        height: 15,
                        width: 30,
                        child: Image.asset("assets/images/righticon.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  getBeauticianProfile() async {
    var geturi = Uri.parse(ApiUrlList.getBeauticianProfile);
    try {
      setState(() {
        isLoading = true;
      });
      // Loader.show(
      //   context,
      //   isSafeAreaOverlay: false,
      //   // isBottomBarOverlay: false,
      //   // overlayFromBottom: 80,
      //   overlayColor: Colors.black26,
      //   progressIndicator:
      //   const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
      //   themeData: Theme.of(context).copyWith(
      //     colorScheme: ColorScheme.fromSwatch().copyWith(
      //       secondary: const Color(0xff01635D),
      //     ),
      //   ),
      // );

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
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);

        getmodelProfile =
        getBeauticianProfilemodel.fromjson(jsonDecode(response.body));

        if (getmodelProfile!.status == 200) {
          setState(() {
            businessname = getmodelProfile!.data?.businessName ?? '';
            Userid = getmodelProfile!.data?.uid ?? '';
          });




          //imagepath = getmodelProfile?.data?.profileImage ?? '';

          // print("dataphone===${getmodelProfile?.data?.userId?.phoneNumber}");
          // print("data_countryname===${_countryname}");
        }
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
