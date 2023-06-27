// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/bottomnavbar.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/business_setup_all_scrren/setup_profile.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/add_your_work_hours.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/second_beautyservice_or_product/service_add/categorytype_service.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/type_first_second_bussines/bussinessinfo_type.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/add_new_address.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/delete_my_account.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/edit_profile.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/help_center.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/my_favorites.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/payments.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../../Beautician_screen/custom_widget/textcommon/textcommon.dart';
import '../../client_model/get_profile_model.dart';
import '../../utils/apiurllist.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool editProfile = false;
  bool isLoading = false;

  // PersonalInfo? p;
  ProfileData? profileData;
  AddressData? addressData;
  SwitchAccountModel? switchAccountModel;

  File? userImageFile;

  String firebaseToken = "";
  String deviceToken = "";

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    // TODO: implement initState
    getClientPersonalInfo();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  /// Get from gallery
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        userImageFile = File(pickedFile.path);
        print(userImageFile);
      });
      updateUserProfileImage();
    }
  }

  /// Get from Camera
  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        userImageFile = File(pickedFile.path);
      });
      updateUserProfileImage();
    }
  }

  pickImageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.camera_alt_rounded,
              ),
              title: const Text("Pick From Camera"),
              onTap: () {
                Navigator.pop(context);
                getFromCamera();
              },
            ),
            const Divider(thickness: 0.8),
            ListTile(
              leading: const Icon(
                Icons.perm_media_rounded,
              ),
              title: const Text("Pick From Gallery"),
              onTap: () {
                Navigator.pop(context);
                getFromGallery();
              },
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color(0xffDD6A03),
            ),
          )
        : editProfile
            ? editProfileBody(height, width)
            : viewProfileBody(height, width);
  }

  Widget viewProfileBody(double height, double width) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.12,
                  width: width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                    child:
                        profileData != null && profileData?.profileImage != ""
                            ? Image.network(
                                profileData!.profileImage!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/Ellipse 202.png",
                                fit: BoxFit.fill,
                              ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "${profileData?.firstName} ${profileData?.lastName}",
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: "spartan",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      editProfile = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 38,
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFDD6A03)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "view_profile".tr(),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFFDD6A03),
                          fontFamily: "spartan",
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            // Container(
            //   height: height * 0.25,
            //   color: const Color(0xffF3F3F3),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 15),
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.push(context, MaterialPageRoute(
            //               builder: (context) {
            //                 return const gist();
            //               },
            //             ));
            //           },
            //           child: Container(
            //             height: height * 0.20,
            //             decoration: BoxDecoration(
            //               color: const Color(0xffEBA668),
            //               borderRadius: BorderRadius.circular(10),
            //               border: Border.all(
            //                   color: const Color(0xffCFCFCF), width: 1),
            //             ),
            //             child: Row(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Container(
            //                   height: 110,
            //                   width: 110,
            //                   margin: const EdgeInsets.all(12),
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       image: const DecorationImage(
            //                           fit: BoxFit.fill,
            //                           image: AssetImage(
            //                               "assets/images/Rectangle 967.png"))),
            //                 ),
            //                 Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     textComoon("sliike_gist", 20,
            //                         const Color(0xff000000), FontWeight.w800),
            //                     const SizedBox(
            //                       height: 5,
            //                     ),
            //                     textComoonfade("gist_info", 12,
            //                         const Color(0xff111111), FontWeight.w600),
            //                   ],
            //                 ),
            //                 const Spacer(),
            //                 Container(
            //                   height: 45,
            //                   width: 45,
            //                   decoration: const BoxDecoration(
            //                     color: Color(0xffE48835),
            //                     shape: BoxShape.circle,
            //                   ),
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(15),
            //                     child: Image.asset(
            //                       "assets/images/righticon.png",
            //                     ),
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                   width: 10,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: height * 0.01),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return homescreen(selectedIndex: 1);
            //       },
            //     ));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 17,
            //       ),
            //       decoration: const BoxDecoration(
            //           border:
            //               Border(bottom: BorderSide(color: Colors.black12))),
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             height: 30,
            //             child: Image.asset("assets/images/calendar-2.png"),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           textComoon("my_appointments", 14, const Color(0xff414141),
            //               FontWeight.w500),
            //           const Spacer(),
            //           SizedBox(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const my_favorites();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset("assets/images/heart-1.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      textComoon("my_favorites", 14, const Color(0xff414141),
                          FontWeight.w500),
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
            ),
            SizedBox(height: height * 0.01),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return const cart();
            //       },
            //     ));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 17,
            //       ),
            //       decoration: const BoxDecoration(
            //           border:
            //               Border(bottom: BorderSide(color: Colors.black12))),
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             height: 30,
            //             child: Image.asset("assets/images/shopping-cart.png"),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           textComoon("carts", 14, const Color(0xff414141),
            //               FontWeight.w500),
            //           const Spacer(),
            //           SizedBox(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: height * 0.01),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return const my_order();
            //       },
            //     ));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 17,
            //       ),
            //       decoration: const BoxDecoration(
            //           border:
            //               Border(bottom: BorderSide(color: Colors.black12))),
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             height: 30,
            //             child: Image.asset("assets/images/bag-2.png"),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           textComoon("my_orders", 14, const Color(0xff414141),
            //               FontWeight.w500),
            //           const Spacer(),
            //           SizedBox(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: height * 0.01),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return const notification();
            //       },
            //     ));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 17,
            //       ),
            //       decoration: const BoxDecoration(
            //           border:
            //               Border(bottom: BorderSide(color: Colors.black12))),
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             height: 30,
            //             child: Image.asset("assets/images/notification.png"),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           textComoon("notification_settings", 14,
            //               const Color(0xff414141), FontWeight.w500),
            //           const Spacer(),
            //           SizedBox(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const payments();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset("assets/images/cards.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      textComoon("payment", 14, const Color(0xff414141),
                          FontWeight.w500),
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
            ),
            SizedBox(height: height * 0.01),

            /// Help Center ///
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const help_center();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset("assets/images/question.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      textComoon("help_center", 14, const Color(0xff414141),
                          FontWeight.w500),
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
            ),
            // SizedBox(height: height * 0.01),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return const change_language();
            //       },
            //     ));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 17,
            //       ),
            //       decoration: const BoxDecoration(
            //           border:
            //               Border(bottom: BorderSide(color: Colors.black12))),
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             height: 30,
            //             child: Image.asset("assets/images/global.png"),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           textComoon("english", 14, const Color(0xff414141),
            //               FontWeight.w500),
            //           const Spacer(),
            //           SizedBox(
            //             height: 15,
            //             width: 30,
            //             child: Image.asset("assets/images/righticon.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: height * 0.01),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //       vertical: 17,
            //     ),
            //     decoration: const BoxDecoration(
            //         border: Border(bottom: BorderSide(color: Colors.black12))),
            //     child: Row(
            //       children: [
            //         SizedBox(
            //           height: 30,
            //           child: Image.asset("assets/images/logout.png"),
            //         ),
            //         const SizedBox(
            //           width: 15,
            //         ),
            //         textComoon("Become Beautician", 14, const Color(0xff414141),
            //             FontWeight.w500),
            //         const Spacer(),
            //         SizedBox(
            //           height: 15,
            //           width: 30,
            //           child: Image.asset("assets/images/righticon.png"),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                switchAccount();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 30,
                        child: Icon(Icons.switch_account),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      textComoon(
                          profileData!.isRegisterBeautician
                              ? "Switch to Beautician"
                              : "Become Beautician",
                          14,
                          const Color(0xff414141),
                          FontWeight.w500),
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
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  handleLogoutFunction();
                  // setState(() {
                  //   logoutdata();
                  //   Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) {
                  //         return const signInScreen();
                  //       },
                  //     ),
                  //     (route) => false,
                  //   );
                  // });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset("assets/images/logout.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      textComoon("log_out", 14, const Color(0xff414141),
                          FontWeight.w500),
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
            ),
            SizedBox(height: height * 0.01),
            // GestureDetector(
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(
            //     //   builder: (context) {
            //     //     return const rating_scareen();
            //     //   },
            //     // ));
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Container(
            //       padding: const EdgeInsets.symmetric(
            //         vertical: 17,
            //       ),
            //       decoration: const BoxDecoration(
            //           border:
            //               Border(bottom: BorderSide(color: Colors.black12))),
            //       // child: Row(
            //       //   children: [
            //       //     const SizedBox(
            //       //       height: 30,
            //       //       child: Icon(Icons.star_border),
            //       //     ),
            //       //     const SizedBox(
            //       //       width: 15,
            //       //     ),
            //       //     textComoon("Rating", 14, const Color(0xff414141),
            //       //         FontWeight.w500),
            //       //     const Spacer(),
            //       //     SizedBox(
            //       //       height: 15,
            //       //       width: 30,
            //       //       child: Image.asset("assets/images/righticon.png"),
            //       //     ),
            //       //   ],
            //       // ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget editProfileBody(double height, double width) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          editProfile = false;
        });
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          editProfile = false;
                        });
                        // Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                      )),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: SizedBox(
                        height: height * 0.12,
                        width: width * 0.25,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(200)),
                          child: profileData?.profileImage != ""
                              ? CachedNetworkImage(
                                  imageUrl: profileData!.profileImage!,
                                  fit: BoxFit.cover,
                                )
                              : userImageFile != null
                                  ? Image.file(
                                      userImageFile!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/images/Ellipse 202.png",
                                      fit: BoxFit.cover,
                                    ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 2,
                      child: GestureDetector(
                        onTap: () {
                          pickImageBottomSheet();
                        },
                        child: Image.asset(
                          "assets/images/Group 13175.png",
                          fit: BoxFit.fill,
                          height: 28,
                          width: 28,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Personal Info",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "spartan",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        var dateob = profileData?.dob;
                        var day = "";
                        var month = "";
                        var year = "";
                        if (profileData?.dob != null) {
                          day = dateob!.day.toString();
                          month = DateFormat.MMMM().format(dateob).toString();
                          year = dateob.year.toString();
                        }
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return edit_profile(
                              email: profileData?.userId.email ?? "",
                              PhoneNumber:
                                  profileData?.userId.phoneNumber.toString() ??
                                      "",
                              firstName: profileData?.firstName ?? "",
                              lastName: profileData?.lastName ?? "",
                              day: day,
                              month: month,
                              year: year,
                              gender: profileData?.gender ?? "male",
                            );
                          },
                        )).then((value) async {
                          if (value == true) {
                            setState(() {
                              editProfile = false;
                            });
                            await getClientPersonalInfo();
                          } else {}
                        });
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Color(0xFFDD6A03),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                const Text("First name",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54,
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("${profileData?.firstName}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("Last name",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54,
                    )),
                SizedBox(height: height * 0.01),
                Text("${profileData?.lastName}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("Email address",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54,
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("${profileData?.userId.email}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("Phone number",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54,
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                Text("${profileData?.userId.phoneNumber}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("Date of birth",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54,
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                profileData?.dob == null
                    ? const SizedBox()
                    : Text(
                        DateFormat("dd - MMM - yyyy").format(profileData!.dob!),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black,
                        )),
                SizedBox(
                  height: height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    var dateob = profileData?.dob;
                    var day = "";
                    var month = "";
                    var year = "";
                    if (profileData?.dob != null) {
                      day = dateob!.day.toString();
                      month = DateFormat.MMMM().format(dateob).toString();
                      year = dateob.year.toString();
                    }
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return edit_profile(
                          email: "${profileData?.userId.email}",
                          PhoneNumber: "${profileData?.userId.phoneNumber}",
                          firstName: profileData?.firstName ?? "",
                          lastName: profileData?.lastName ?? "",
                          day: day,
                          month: month,
                          year: year,
                          gender: profileData?.gender ?? "male",
                        );
                      },
                    )).then((value) {
                      if (value) {
                        getClientPersonalInfo();
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Image(
                        image:
                            const AssetImage("assets/images/Group 12095.png"),
                        height: height * 0.03,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        profileData?.dob == null ? "Add" : "Edit",
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Color(0xffDD6A03),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                profileData?.gender == ""
                    ? const SizedBox()
                    : Text(
                        "${profileData?.gender}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black,
                        ),
                      ),
                SizedBox(height: height * 0.01),
                GestureDetector(
                  onTap: () {
                    var dateob = profileData?.dob;
                    var day = "";
                    var month = "";
                    var year = "";
                    if (profileData?.dob != null) {
                      day = dateob!.day.toString();
                      month = DateFormat.MMMM().format(dateob).toString();
                      year = dateob.year.toString();
                    }
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return edit_profile(
                          email: "${profileData?.userId.email}",
                          PhoneNumber: "${profileData?.userId.phoneNumber}",
                          firstName: profileData?.firstName ?? "",
                          lastName: profileData?.lastName ?? "",
                          day: day,
                          month: month,
                          year: year,
                          gender: profileData?.gender ?? "male",
                        );
                      },
                    )).then((value) {
                      if (value) {
                        getClientPersonalInfo();
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Image(
                        image:
                            const AssetImage("assets/images/Group 12095.png"),
                        height: height * 0.03,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        profileData?.gender == "" ? "Add" : "Edit",
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Color(0xffDD6A03),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                const Divider(color: Colors.black54),
                SizedBox(height: height * 0.02),
                const Text("My Address",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.01,
                ),
                addressData == null
                    ? const SizedBox()
                    : Text(
                        addressData!.addressType,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54,
                        ),
                      ),
                addressData == null
                    ? const SizedBox()
                    : SizedBox(
                        height: height * 0.01,
                      ),
                addressData == null
                    ? const SizedBox()
                    : Text(addressData!.addressId.address,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54,
                        )),
                addressData == null
                    ? const SizedBox()
                    : SizedBox(
                        height: height * 0.01,
                      ),
                // addressData == null
                //     ? const SizedBox()
                //     : Text(addressData!.addressId.province,
                //     style: const TextStyle(
                //       fontSize: 16,
                //       fontFamily: "spartan",
                //       color: Colors.black54,
                //     )),
                addressData == null
                    ? const SizedBox()
                    : SizedBox(
                        height: height * 0.01,
                      ),
                addressData == null
                    ? const SizedBox()
                    : Text(addressData!.addressId.apartment,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54,
                        )),
                addressData == null
                    ? const SizedBox()
                    : SizedBox(
                        height: height * 0.02,
                      ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return add_new_address(
                          Address_Name: addressData?.addressId.address ?? "",
                          Apartment_suite:
                              addressData?.addressId.apartment ?? "",
                          Province_name: addressData?.addressId.province ?? "",
                          Location: "surat",
                          Zip_Code: "395004",
                          addressValue: false,
                        );
                      },
                    )).then((value) {
                      if (value) {
                        getClientPersonalInfo();
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Image(
                        image:
                            const AssetImage("assets/images/Group 12095.png"),
                        height: height * 0.03,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        addressData?.addressType == ""
                            ? "Add New Address"
                            : "Edit Address",
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Color(0xffDD6A03),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const Divider(
                  color: Colors.black54,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("Delete Account",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                    "Are you sure you want to leave Sliike? By leaving you miss out on the goodies and beauty information. ",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const delete_my_account();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage("assets/images/trash.png"),
                        height: 30,
                      ),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      const Text("Delete My Account",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Color(0xFFD90000),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleLogoutFunction() async {
    var geturi = Uri.parse(ApiUrlList.handleLogout);
    try {
      setState(() {
        isLoading = true;
      });
      var userRole = Helper.prefs!.getString(UserPrefs.keyusertype);

      var deviceToken = Helper.prefs!.getString(UserPrefs.keyDeviceToken);
      // var userToken = Helper.prefs!.getString(UserPrefs.keyutoken);
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var resBody = {
        "deviceToken": "${deviceToken}",
        "role": "${userRole}",
      };
      log("handleLogoutFunction url is  : $geturi");
      log("handleLogoutFunction headers  : $headers");
      log("handleLogoutFunction resBody  : $resBody");
      var response = await http.post(
        geturi,
        body: jsonEncode(resBody),
        headers: headers,
      );
      log("handleLogoutFunction response.body ==> ${response.body}");
      log("handleLogoutFunction status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);
        // getmodelProfile =
        //     getBeauticianProfilemodel.fromjson(jsonDecode(response.body));
        // if (getmodelProfile!.status == 200) {
        logoutdata();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return signInScreen();
            },
          ),
          (route) => false,
        );
        Fluttertoast.showToast(
          msg: "Logged Out Successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // setState(() {
        //   businessname = getmodelProfile!.data?.businessName ?? '';
        //   Userid = getmodelProfile!.data?.uid ?? '';
        // });
        // }
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

  getClientPersonalInfo() async {
    var geturi = Uri.parse(ApiUrlList.getClientPersonalInfo);
    try {
      setState(() {
        isLoading = true;
      });

      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getClientPersonalInfo response.body ==> ${response.body}");
      log("getClientPersonalInfo status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);
        print(profileData);
        GetProfileModel getProfileModel =
            GetProfileModel.fromJson(jsonDecode(response.body));
        if (getProfileModel.status == 200) {
          getFirebaseToken();
          getDeviceInfo();
          profileData = getProfileModel.data;
          if (getProfileModel.data.address.isNotEmpty) {
            addressData = getProfileModel.data.address.first;
          }
        } else if (response.statusCode == 401) {
          logoutdata();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return signInScreen();
            },
          ), (route) => false);
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  updateUserProfileImage() async {
    try {
      setState(() {
        isLoading = true;
      });
      var postUri = Uri.parse(ApiUrlList.updateProfileImage);
      var request = http.MultipartRequest("POST", postUri);
      log("logg :: ${request.files}");
      log("logg :: ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
      request.headers['Authorization'] =
          "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          'profileImage', userImageFile!.path);
      request.files.add(multipartFile);

      http.StreamedResponse response = await request.send();
      print('code: ${response.statusCode}');
      final res = await http.Response.fromStream(response);
      print('body: ${res.body}');

      Map map = jsonDecode(res.body);
      if (res.statusCode == 200) {
        getClientPersonalInfo();
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  switchAccount() async {
    Loader.show(context,
        isSafeAreaOverlay: false,
        overlayColor: Colors.black26,
        progressIndicator:
            const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xffDD6A03))));
    var Body = {
      'deviceToken': deviceToken,
      'firebaseToken': firebaseToken,
    };
    log("Body : ${Body}");
    log("Token : ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
        Uri.parse("${ApiUrlList.switchAccount}${"beautician"}"),
        body: jsonEncode(Body),
        headers: Headers);
    log('switchAccount Code : ${response.statusCode}');
    log('switchAccount Body :${response.body}');
    log('switchAccount Payload Body :${Body}');
    var map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        SwitchAccountModel switchAccountModel =
            SwitchAccountModel.fromJson(jsonDecode(response.body));
        Loader.hide();
        if ((switchAccountModel.screenStatus ?? 0) == 3) {
          Loader.hide();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return setup_profile();
              },
            ),
          );
        } else if ((switchAccountModel.screenStatus ?? 0) == 4) {
          Loader.hide();
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const bussinessInfoCATEGORY();
            },
          ));
        } else if ((switchAccountModel.screenStatus ?? 0) == 5) {
          Loader.hide();
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return addServicetype(secondflow: true);
            },
          ));
        } else if ((switchAccountModel.screenStatus ?? 0) == 6) {
          Loader.hide();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return add_Your_Work_Hours(secondflow: true);
              },
            ),
            (route) => false,
          );
        } else if ((switchAccountModel.screenStatus ?? 0) == 7) {
          Loader.hide();
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          Helper.prefs!.setBool(UserPrefs.keyisserviceprovide, true);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const BottomNavigation();
              },
            ),
            (route) => false,
          );
          Helper.prefs!.setBool(UserPrefs.keyuserlogin, true);
        } else {
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
      });
      Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
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

  getFirebaseToken() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission().then((value) async {
        firebaseToken = (await _firebaseMessaging.getToken())!;
      });
    } else {
      firebaseToken = (await _firebaseMessaging.getToken())!;
    }
    print(firebaseToken);
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceToken = androidInfo.id;
      print('Device id is ${androidInfo.id}'); // e.g. "Moto G (4)"
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceToken = iosInfo.identifierForVendor!;
      print('Device id is ${iosInfo.identifierForVendor!}');
    }
  }
}

SwitchAccountModel switchAccountModelFromJson(String str) =>
    SwitchAccountModel.fromJson(json.decode(str));

String switchAccountModelToJson(SwitchAccountModel data) =>
    json.encode(data.toJson());

class SwitchAccountModel {
  int? status;
  bool? success;
  String? type;
  String? message;
  int? screenStatus;

  SwitchAccountModel({
    this.status,
    this.success,
    this.type,
    this.message,
    this.screenStatus,
  });

  factory SwitchAccountModel.fromJson(Map<String, dynamic> json) =>
      SwitchAccountModel(
        status: json["status"],
        success: json["success"],
        type: json["type"],
        message: json["message"],
        screenStatus: json["screenStatus"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "type": type,
        "message": message,
        "screenStatus": screenStatus,
      };
}
