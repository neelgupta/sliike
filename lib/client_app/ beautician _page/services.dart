// ignore_for_file: camel_case_types, must_be_immutable, must_be_immutable, duplicate_ignore, non_constant_identifier_names

import 'dart:convert';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/book_appoinment.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import '../../commonClass.dart';
import '../../utils/preferences.dart';

class services extends StatefulWidget {
  String beauticianId;
  String? businessName;
  services({Key? key, required this.beauticianId,this.businessName}) : super(key: key);

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  bool isSelected = false;
  String? colorbox = '';
  SingalBeautician? sb;
  BeauticianDetail? bd;
  int itemCount = 0;
  List<BeauticianServiceId> serviceNameList = [];
  List<SingalBeauticianData> Beauticiandata = [];
  List<Beautician> BeauticianDetails = [];
  TextEditingController search = TextEditingController();
  List<String> colors = [
    "black",
    "gold",
    "silver",
    "pink",
    "red",
    "blue",
    "green"
  ];
  List<String> cp = [
    "\$45.00",
    "\$35.00",
    "\$35.00",
    "\$40.00",
    "\$35.00",
    "\$45.00",
    "\$25.00",
  ];
  final List color = [
    Colors.black,
    const Color(0xFFCC9A48),
    const Color(0xFFC1CDCF),
    const Color(0xFFFF2681),
    const Color(0xFFC5000C),
    const Color(0xFF1366C8),
    const Color(0xFF08AE7C),
  ];
  double height = 0;
  double width = 0;
  bool viewMore = false;
  bool isLoading = false;
  MyFavorites? mf;
  String serviceTypeList = "";

  @override
  void initState() {
    super.initState();
    getBeauticianDetails();
  }

  getTimeFormatedValue(String minute) {
    String formatedTime = "";
    switch (minute) {
      case "00:30":
        formatedTime = "30 min";
        break;
      case "01:00":
        formatedTime = "60 min";
        break;
      case "01:30":
        formatedTime = "90 min";
        break;
      case "02:00":
        formatedTime = "120 min";
        break;
      case "02:30":
        formatedTime = "150 min";
        break;
      case "03:00":
        formatedTime = "180 min";
        break;
      case "03:30":
        formatedTime = "210 min";
        break;
      case "04:00":
        formatedTime = "240 min";
        break;
      case "04:30":
        formatedTime = "270 min";
        break;
      case "05:00":
        formatedTime = "300 min";
        break;
      case "05:30":
        formatedTime = "330 min";
        break;
      case "06:00":
        formatedTime = "360 min";
        break;
      case "06:30":
        formatedTime = "390 min";
        break;
    }
    return formatedTime;
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xffDD6A03),
              ),
            )
          : SingleChildScrollView(
              // physics: const NeverScrollableScrollPhysics(),
              child: Beauticiandata.isNotEmpty ?Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    SizedBox(
                      height: height * 0.38,
                      child: Swiper(
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          // return Image.asset('assets/images/Rectangle 145.png',
                          //     fit: BoxFit.fill);
                          return Container(
                              height: height * 0.13,
                              width: width * 0.27,
                              margin: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              child: Center(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.error),
                                  SizedBox(height: height*0.02,),
                                  const Text("No Image")
                                ],
                              ))
                          );
                        },
                        itemCount: 4,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(bottom: 10),
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white,
                                activeColor: Colors.white,
                                activeSize: 8,
                                size: 5)),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        left: 15,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                            ))),
                    Positioned(
                        top: 40,
                        right: 55,
                        child: Image.asset(
                          "assets/images/share.png",
                          height: 20,
                          width: 20,
                        )),
                    Positioned(
                        top: 38,
                        right: 15,
                        child: GestureDetector(
                            onTap: () {
                              if (isSelected) {
                                setState(() {
                                  removeFromMyFavorites();
                                  isSelected = false;
                                });
                              } else {
                                setState(() {
                                  addToMyFavorites();
                                  isSelected = true;
                                });
                              }
                            },
                            child: Image.asset(
                              "assets/images/heart.png",
                              height: 25,
                              width: 25,
                              color: isSelected
                                  ? const Color(0xFFDD6A03)
                                  : Colors.white,
                            ))),
                  ]),
                  Container(
                    height: height * 0.18,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/bgappbar.png"),
                            fit: BoxFit.fill)),
                    child: Row(
                      children: [
                        Container(
                            padding:
                                const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                            width: width * 0.70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${Beauticiandata[0].businessName}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text("${Beauticiandata[0].address!.apartment} ${Beauticiandata[0].address!.province} ${Beauticiandata[0].address!.city} ${Beauticiandata[0].address!.zipCode}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                      color: Colors.black,
                                    )),
                              ],
                            )),
                        // Container(
                        //     padding:
                        //         const EdgeInsets.only(top: 20, bottom: 20, right: 10),
                        //     width: width * 0.30,
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Row(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             const Image(
                        //                 image: AssetImage(
                        //                     "assets/images/Star 1.png"),
                        //                 height: 20),
                        //             SizedBox(
                        //               width: width * 0.01,
                        //             ),
                        //             const Text(
                        //               "4.0",
                        //               style: TextStyle(
                        //                 fontSize: 16,
                        //                 fontFamily: "spartan",
                        //                 color: Colors.black,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         SizedBox(
                        //           height: height * 0.01,
                        //         ),
                        //         const Text("320 Reviews",
                        //             style: TextStyle(
                        //               fontSize: 12,
                        //               fontFamily: "spartan",
                        //               color: Colors.black,
                        //             )),
                        //       ],
                        //     )),
                      ],
                    ),
                  ),
                  DefaultTabController(
                      length: 4,
                      initialIndex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TabBar(
                              labelColor: const Color(0xFFDD6A03),
                              indicatorColor: const Color(0xFFDD6A03),
                              tabs: [
                                Tab(
                                    child: const Text(
                                  "services",
                                  style: TextStyle(
                                      fontFamily: "spartan", fontSize: 15),
                                ).tr()),
                                Tab(
                                    child: const Text(
                                  "reviews",
                                  style: TextStyle(
                                      fontFamily: "spartan", fontSize: 15),
                                ).tr()),
                                Tab(
                                    child: const Text(
                                  "portfolio",
                                  style: TextStyle(
                                      fontFamily: "spartan", fontSize: 15),
                                ).tr()),
                                Tab(
                                    child: const Text(
                                  "details",
                                  style: TextStyle(
                                      fontFamily: "spartan", fontSize: 15),
                                ).tr()),
                              ]),
                          SizedBox(
                            height: viewMore ? height * 1.25 : height * 0.75,
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 20),
                                      child: TextField(
                                        autofocus: false,
                                        controller: search,
                                        onChanged: (value) {},
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(left: 20),
                                          hintText: "search_service".tr(),
                                          hintStyle: const TextStyle(
                                              color: Color(0xff707070)),
                                          suffixIcon: Container(
                                            width: width * 0.2,
                                            color: const Color(0xFFDD6A03),
                                            height: 5,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.asset(
                                                  "assets/images/search-whitenormal.png"),
                                            ),
                                          ),
                                          labelStyle: const TextStyle(
                                              fontFamily: 'spartan',
                                              color: Colors.black54),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.black38),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    const Divider(
                                      color: Colors.black54,
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: const Text("services",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "spartan",
                                                        color: Colors.black))
                                                .tr(),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("(${sb!.data!.total})",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "spartan",
                                                    color: Colors.black54)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.45,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.only(top: 20),
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: Beauticiandata[0].beauticianServiceId!.length,
                                          itemBuilder: (context, index) {
                                            if (index < 5) {
                                              return serviceSingalItem(index);
                                            } else if (viewMore) {
                                              return serviceSingalItem(index);
                                            } else {
                                              return const SizedBox();
                                            }
                                          }),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Beauticiandata[0].beauticianServiceId!.length > 5 ? viewMore ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          viewMore = false;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 20),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: const Text("view_less",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily:
                                                      "spartan",
                                                      color: Color(
                                                          0xFFDD6A03)))
                                                  .tr(),
                                            ),
                                          ),
                                          const Padding(
                                            padding:
                                            EdgeInsets.only(
                                                left: 2),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: Icon(
                                                Icons.keyboard_arrow_up,
                                                color: Color(0xFFDD6A03),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ) : 
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          viewMore = true;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 20),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: const Text("more_services",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily:
                                                      "spartan",
                                                      color: Color(
                                                          0xFFDD6A03)))
                                                  .tr(),
                                            ),
                                          ),
                                          const Padding(
                                            padding:
                                            EdgeInsets.only(
                                                left: 2),
                                            child: Align(
                                              alignment:
                                              Alignment.centerLeft,
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Color(0xFFDD6A03),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ) : const SizedBox(),
                                  ],
                                ),
                                const Center(
                                  child: Text(
                                    "No Data Found!!!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                    ),
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    "No Data Found!!!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                    ),
                                  ),
                                ),
                                // SingleChildScrollView(
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         horizontal: 15),
                                //     child: Column(
                                //       children: [
                                //         SizedBox(
                                //           height: height * 0.04,
                                //         ),
                                //         Container(
                                //           height: height * 0.25,
                                //           decoration: BoxDecoration(
                                //               borderRadius:
                                //                   BorderRadius.circular(10),
                                //               border: Border.all(
                                //                   color: const Color(0xFFF8E1CD)),
                                //               color: const Color(0xFFFDF8F2)),
                                //           child: Padding(
                                //             padding: const EdgeInsets.symmetric(
                                //                 horizontal: 15),
                                //             child: Row(
                                //               children: [
                                //                 Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.center,
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.center,
                                //                   children: [
                                //                     Row(
                                //                       children: const [
                                //                         Text("4.9",
                                //                             style: TextStyle(
                                //                                 fontSize: 22,
                                //                                 color: Colors
                                //                                     .black,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .bold)),
                                //                         Text("/5",
                                //                             style: TextStyle(
                                //                               fontSize: 18,
                                //                               color: Colors
                                //                                   .black54,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                       ],
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                     const Text("Based on 201 reviews",
                                //                         style: TextStyle(
                                //                           fontSize: 14,
                                //                           color: Colors.black54,
                                //                           fontFamily: "spartan",
                                //                         )),
                                //                   ],
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.01,
                                //                 ),
                                //                 const Padding(
                                //                   padding:
                                //                       EdgeInsets.only(
                                //                           top: 15, bottom: 15),
                                //                   child: VerticalDivider(
                                //                     color: Colors.black54,
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.01,
                                //                 ),
                                //                 Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.center,
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.center,
                                //                   children: [
                                //                     SizedBox(
                                //                       height: height * 0.04,
                                //                       child: Row(
                                //                         children: [
                                //                           const Text("5",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           SizedBox(
                                //                             height:
                                //                                 height * 0.08,
                                //                             width: width * 0.20,
                                //                             child: Image.asset(
                                //                                 "assets/images/Line 104.png"),
                                //                           ),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           const Text("199",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       height: height * 0.04,
                                //                       child: Row(
                                //                         children: [
                                //                           const Text("4",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           SizedBox(
                                //                             height:
                                //                                 height * 0.08,
                                //                             width: width * 0.20,
                                //                             child: Image.asset(
                                //                                 "assets/images/Line 105.png"),
                                //                           ),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           const Text("2",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       height: height * 0.04,
                                //                       child: Row(
                                //                         children: [
                                //                           const Text("3",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           SizedBox(
                                //                             height:
                                //                                 height * 0.08,
                                //                             width: width * 0.20,
                                //                             child: Image.asset(
                                //                                 "assets/images/Line 105.png"),
                                //                           ),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           const Text("0",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       height: height * 0.04,
                                //                       child: Row(
                                //                         children: [
                                //                           const Text("2",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           SizedBox(
                                //                             height:
                                //                                 height * 0.08,
                                //                             width: width * 0.20,
                                //                             child: Image.asset(
                                //                                 "assets/images/Line 105.png"),
                                //                           ),
                                //                           SizedBox(
                                //                             width: width * 0.03,
                                //                           ),
                                //                           const Text("0",
                                //                               style: TextStyle(
                                //                                 fontSize: 18,
                                //                                 color: Colors
                                //                                     .black54,
                                //                                 fontFamily:
                                //                                     "spartan",
                                //                               )),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 )
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.04,
                                //         ),
                                //         Column(
                                //           children: [
                                //             Row(
                                //               children: [
                                //                 SizedBox(
                                //                   height: height * 0.10,
                                //                   width: width * 0.20,
                                //                   child: const Image(
                                //                     image: AssetImage(
                                //                         "assets/images/Group 12555.png"),
                                //                     fit: BoxFit.fill,
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.04,
                                //                 ),
                                //                 Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     Row(
                                //                       children: [
                                //                         const Text("Mike Lock",
                                //                             style: TextStyle(
                                //                               fontSize: 18,
                                //                               color:
                                //                                   Colors.black,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                         SizedBox(
                                //                           width: width * 0.10,
                                //                         ),
                                //                         const Text("Mar 26, 2022",
                                //                             style: TextStyle(
                                //                               fontSize: 16,
                                //                               color: Colors
                                //                                   .black54,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                       ],
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             const Text(
                                //                 "Great attendant with great skill. Had the best time, definitely coming back.",
                                //                 style: TextStyle(
                                //                   fontSize: 16,
                                //                   color: Colors.black54,
                                //                   fontFamily: "spartan",
                                //                 )),
                                //             SizedBox(
                                //               height: height * 0.02,
                                //             ),
                                //             const Divider(
                                //               color: Colors.black54,
                                //             )
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.02,
                                //         ),
                                //         Column(
                                //           children: [
                                //             Row(
                                //               children: [
                                //                 SizedBox(
                                //                   height: height * 0.10,
                                //                   width: width * 0.20,
                                //                   child: const Image(
                                //                     image: AssetImage(
                                //                         "assets/images/Group 12555.png"),
                                //                     fit: BoxFit.fill,
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.04,
                                //                 ),
                                //                 Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     Row(
                                //                       children: [
                                //                         const Text("Mike Lock",
                                //                             style: TextStyle(
                                //                               fontSize: 18,
                                //                               color:
                                //                                   Colors.black,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                         SizedBox(
                                //                           width: width * 0.10,
                                //                         ),
                                //                         const Text("Mar 26, 2022",
                                //                             style: TextStyle(
                                //                               fontSize: 16,
                                //                               color: Colors
                                //                                   .black54,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                       ],
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             const Text(
                                //                 "Great attendant with great skill. Had the best time, definitely coming back.",
                                //                 style: TextStyle(
                                //                   fontSize: 16,
                                //                   color: Colors.black54,
                                //                   fontFamily: "spartan",
                                //                 )),
                                //             SizedBox(
                                //               height: height * 0.02,
                                //             ),
                                //             const Divider(
                                //               color: Colors.black54,
                                //             )
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.02,
                                //         ),
                                //         Column(
                                //           children: [
                                //             Row(
                                //               children: [
                                //                 SizedBox(
                                //                   height: height * 0.10,
                                //                   width: width * 0.20,
                                //                   child: const Image(
                                //                     image: AssetImage(
                                //                         "assets/images/Group 12555.png"),
                                //                     fit: BoxFit.fill,
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.04,
                                //                 ),
                                //                 Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     Row(
                                //                       children: [
                                //                         const Text("Mike Lock",
                                //                             style: TextStyle(
                                //                               fontSize: 18,
                                //                               color:
                                //                                   Colors.black,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                         SizedBox(
                                //                           width: width * 0.10,
                                //                         ),
                                //                         const Text("Mar 26, 2022",
                                //                             style: TextStyle(
                                //                               fontSize: 16,
                                //                               color: Colors
                                //                                   .black54,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                       ],
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             const Text(
                                //                 "Great attendant with great skill. Had the best time, definitely coming back.",
                                //                 style: TextStyle(
                                //                   fontSize: 16,
                                //                   color: Colors.black54,
                                //                   fontFamily: "spartan",
                                //                 )),
                                //             SizedBox(
                                //               height: height * 0.02,
                                //             ),
                                //             const Divider(
                                //               color: Colors.black54,
                                //             )
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.02,
                                //         ),
                                //         Column(
                                //           children: [
                                //             Row(
                                //               children: [
                                //                 SizedBox(
                                //                   height: height * 0.10,
                                //                   width: width * 0.20,
                                //                   child: const Image(
                                //                     image: AssetImage(
                                //                         "assets/images/Group 12555.png"),
                                //                     fit: BoxFit.fill,
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.04,
                                //                 ),
                                //                 Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     Row(
                                //                       children: [
                                //                         const Text("Mike Lock",
                                //                             style: TextStyle(
                                //                               fontSize: 18,
                                //                               color:
                                //                                   Colors.black,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                         SizedBox(
                                //                           width: width * 0.10,
                                //                         ),
                                //                         const Text("Mar 26, 2022",
                                //                             style: TextStyle(
                                //                               fontSize: 16,
                                //                               color: Colors
                                //                                   .black54,
                                //                               fontFamily:
                                //                                   "spartan",
                                //                             )),
                                //                       ],
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                         SizedBox(
                                //                           width: width * 0.01,
                                //                         ),
                                //                         SizedBox(
                                //                           height: height * 0.05,
                                //                           width: width * 0.05,
                                //                           child: Image.asset(
                                //                               "assets/images/Star 1.png"),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             const Text(
                                //                 "Great attendant with great skill. Had the best time, definitely coming back.",
                                //                 style: TextStyle(
                                //                   fontSize: 16,
                                //                   color: Colors.black54,
                                //                   fontFamily: "spartan",
                                //                 )),
                                //             SizedBox(
                                //               height: height * 0.02,
                                //             ),
                                //             const Divider(
                                //               color: Colors.black54,
                                //             )
                                //           ],
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // SingleChildScrollView(
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         horizontal: 15),
                                //     child: Column(
                                //       children: [
                                //         SizedBox(
                                //           height: height * 0.04,
                                //         ),
                                //         Row(
                                //           children: [
                                //             SizedBox(
                                //               height: height * 0.23,
                                //               width: width * 0.44,
                                //               child: const Image(
                                //                 image: AssetImage(
                                //                     "assets/images/Group 12646.png"),
                                //                 fit: BoxFit.fill,
                                //               ),
                                //             ),
                                //             const Spacer(),
                                //             SizedBox(
                                //               height: height * 0.23,
                                //               width: width * 0.44,
                                //               child: const Image(
                                //                 image: AssetImage(
                                //                     "assets/images/Group 12646.png"),
                                //                 fit: BoxFit.fill,
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.02,
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.30,
                                //           width: width,
                                //           child: const Image(
                                //             image: AssetImage(
                                //                 "assets/images/Rectangle 892.png"),
                                //             fit: BoxFit.fill,
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.02,
                                //         ),
                                //         Row(
                                //           children: [
                                //             SizedBox(
                                //               height: height * 0.23,
                                //               width: width * 0.44,
                                //               child: const Image(
                                //                 image: AssetImage(
                                //                     "assets/images/Group 12646.png"),
                                //                 fit: BoxFit.fill,
                                //               ),
                                //             ),
                                //             const Spacer(),
                                //             SizedBox(
                                //               height: height * 0.23,
                                //               width: width * 0.44,
                                //               child: const Image(
                                //                 image: AssetImage(
                                //                     "assets/images/Group 12646.png"),
                                //                 fit: BoxFit.fill,
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: height * 0.04,
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                BeauticianDetails.isNotEmpty?SingleChildScrollView(
                                  child: Column(
                                    //  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: height * 0.35,
                                            width: width,
                                            child: Image.asset(
                                              "assets/images/Rectangle.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              left: 10,
                                              bottom: 15,
                                              child: Container(
                                                height: height * 0.12,
                                                width: width - 20,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(BeauticianDetails[0].businessName,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    "spartan",
                                                              )),
                                                          SizedBox(
                                                            height:
                                                                height * 0.01,
                                                          ),
                                                          const Text("hello",
                                                              // "${BeauticianDetails[0].beauticianAddress[0].address} ${BeauticianDetails[0].beauticianAddress[0].province} ${BeauticianDetails[0].beauticianAddress[0].city} ${BeauticianDetails[0].beauticianAddress[0].zipCode}",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black54,
                                                                fontFamily:
                                                                    "spartan",
                                                              )),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                height * 0.08,
                                                            child: Image.asset(
                                                              "assets/images/Group 12665.png",
                                                              fit: BoxFit.fill,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                            const Text("Staff Members",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: height * 0.15,
                                                      child: Image.asset(
                                                        "assets/images/Ellipse 154.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: height * 0.02),
                                                    const Text("Tibo Quan",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                "spartan",
                                                            color:
                                                                Colors.black)),
                                                    SizedBox(
                                                        height: height * 0.01),
                                                    const Text("Owner",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors
                                                                .black54)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: width * 0.04,
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: height * 0.15,
                                                      child: Image.asset(
                                                        "assets/images/Ellipse 154.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: height * 0.02),
                                                    const Text("Tibo Quan",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                "spartan",
                                                            color:
                                                                Colors.black)),
                                                    SizedBox(
                                                        height: height * 0.01),
                                                    const Text("",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors
                                                                .black54)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("About Us",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text(
                                                "Barbing, freshness and confidence in one place. With a soft touch of modern styles, Freshman Cutz gives you that lost confidence.",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "spartan",
                                                    color: Colors.black54)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("Contact",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor:
                                                        const Color(0xffF3F3F3),
                                                    child: Image.asset(
                                                      "assets/images/contact_call.png",
                                                      color: const Color(0xff707070),
                                                      height: 20,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  textComoon(
                                                      "514 888 7722",
                                                      15,
                                                      const Color(0xff292929),
                                                      FontWeight.w600),
                                                  const Spacer(),
                                                  Container(
                                                      height: 40,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              const Color(0xffFCF0E6),
                                                          border: Border.all(
                                                            width: 1,
                                                            color: const Color(
                                                                0xffE48835),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Center(
                                                          child: textComoon(
                                                              "Call",
                                                              15,
                                                              const Color(0xffDD6A03),
                                                              FontWeight
                                                                  .w600))),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            const Text("Opening Hours",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Row(
                                              children: const [
                                                Text("Monday - Friday",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "spartan",
                                                        color: Colors.black54)),
                                                Spacer(),
                                                Text("9:00 - 19:00",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "spartan",
                                                        color: Colors.black)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Row(
                                              children: const [
                                                Text("Sarturday",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "spartan",
                                                        color: Colors.black54)),
                                                Spacer(),
                                                Text("10:00 - 17:00",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "spartan",
                                                        color: Colors.black)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Row(
                                              children: [
                                                const Text("Sarturday",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "spartan",
                                                        color: Colors.black54)),
                                                const Spacer(),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("Products",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            SizedBox(
                                              height: height * 0.15,
                                              width: width,
                                              child: Image.asset(
                                                "assets/images/Group 12681.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("Social Media Link",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: height * 0.08,
                                                      child: Image.asset(
                                                        "assets/images/Group 12685.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: height * 0.01),
                                                    const Text("Instagram",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors
                                                                .black54)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: width * 0.06,
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: height * 0.08,
                                                      child: Image.asset(
                                                        "assets/images/Group 12685.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: height * 0.01),
                                                    const Text("Facebook",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors
                                                                .black54)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Divider(
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("Amenities",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("Parking space",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "spartan",
                                                    color: Colors.black54)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text(
                                                "Accessible to people with disabilities",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "spartan",
                                                    color: Colors.black54)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("Child-friendly",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "spartan",
                                                    color: Colors.black54)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text("Wi-Fi",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "spartan",
                                                    color: Colors.black54)),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ):
                                Container(
                                  child: Center(child: Text("No Data Found!!!")),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ): const SizedBox(
                  child: Text('No data Found!!'),
              ),
            )
    );
  }

  serviceSingalItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 100,
                  child: Text(
                          "${Beauticiandata[0].beauticianServiceId![index].serviceType!.serviceTypeName}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black))
                      .tr(),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("\$${Beauticiandata[0].beauticianServiceId![index].price}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Colors.black)),
                    Text(getTimeFormatedValue(Beauticiandata[0].beauticianServiceId![index].duration.toString()),
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black54)),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return book_appoinment(
                            serviceTypeName: "${Beauticiandata[0].beauticianServiceId![index].serviceType!.serviceTypeName}",
                            price: "${Beauticiandata[0].beauticianServiceId![index].price}",
                            duration: getTimeFormatedValue(Beauticiandata[0].beauticianServiceId![index].duration.toString()),
                            beauticianId: widget.beauticianId,
                            serviceId: Beauticiandata[0].beauticianServiceId![index].id!,
                            serviceDuration: "${Beauticiandata[0].beauticianServiceId![index].duration}",
                          );
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFDD6A03),
                    ),
                    child:
                        const Text("book", style: TextStyle(fontFamily: "spartan")).tr()),

              ],
            ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  moreservicesDialog(int index) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(5),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: height - 60,
                width: width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text("Select color ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Image(
                                image: AssetImage("assets/images/Vector.png"),
                                height: 20,
                                width: 25,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Divider(
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: height * 0.80,
                      width: width,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: color.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      height: height * 0.03,
                                      width: width * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: color[index]),
                                    ),
                                    SizedBox(
                                      width: width * 0.04,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(colors[index],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "spartan",
                                                    color: Colors.black))
                                            .tr(),
                                        Text(cp[index],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: "spartan",
                                                color: Colors.black)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Radio(
                                      activeColor: const Color(0xFFDD6A03),
                                      value: colors[index],
                                      groupValue: colorbox,
                                      onChanged: (value) {
                                        setState(() {
                                          colorbox = value.toString();
                                          print(colors[index]);
                                        });
                                        Future.delayed(const Duration(seconds: 1))
                                            .then((value) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return book_appoinment(
                                                serviceTypeName: "${serviceNameList[index].serviceType?.serviceTypeName}",
                                                price: "${serviceNameList[index].price}",
                                                duration: getTimeFormatedValue(serviceNameList[index].duration.toString()),
                                                beauticianId: widget.beauticianId,
                                                serviceId: serviceNameList[index].id!,
                                                serviceDuration: serviceNameList[index].duration.toString(),
                                              );
                                            },
                                          ));
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.black54,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  addToMyFavorites() async {
    var posturi = Uri.parse(ApiUrlList.addToMyFavorites);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {
        "beauticianId": widget.beauticianId,
      };
      print("addToMyFavorites url is ====> $posturi ");
      print("addToMyFavorites bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("addToMyFavorites status code ====> ${response.statusCode}");
      print("addToMyFavorites body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          mf = MyFavorites.fromjson(map);
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
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
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  removeFromMyFavorites() async {
    var posturi = Uri.parse(ApiUrlList.removeFromMyFavorites);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {
        "beauticianId": widget.beauticianId,
      };
      print("removeFromMyFavorites url is ====> $posturi ");
      print("removeFromMyFavorites bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("removeFromMyFavorites status code ====> ${response.statusCode}");
      print("removeFromMyFavorites res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          mf = MyFavorites.fromjson(map);
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
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
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  getBeauticianDetails() async {
    var posturi = Uri.parse(ApiUrlList.getBeauticianDetails);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {"id": widget.beauticianId, "limit": 10, "offset": 0};
      print("getBeauticianDetails url is ====> $posturi ");
      print("getBeauticianDetails bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("getBeauticianDetails status code ====> ${response.statusCode}");
      print(" getBeauticianDetails res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          sb = SingalBeautician.fromjson(map);
          Beauticiandata = sb!.data!.data!;
          Helper.serviceId.clear();
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
        isLoading = false;
    }
  }

  getBusinessDeatils() async {
    var geturi = Uri.parse(ApiUrlList.getBusinessDeatils);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      print("getBeauticianDetails url is ====> $geturi ");
      var response = await http.get(
        geturi,
        headers: headers,
      );
      print("getBeauticianDetails status code ====> ${response.statusCode}");
      print(" getBeauticianDetails res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          bd = BeauticianDetail.fromMap(jsonDecode(response.body));
          BeauticianDetails = bd!.beautician;
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}

class SingalBeautician {
  int? status;
  Data? data;

  SingalBeautician({this.status, this.data});

  factory SingalBeautician.fromjson(Map<dynamic, dynamic> map) {
    return SingalBeautician(
      status: map['status'] ?? 0,
      data: Data.fromjson(map['data']),
    );
  }
}

class Data {
  int? total;
  List<SingalBeauticianData>? data;

  Data({this.total, this.data});

  factory Data.fromjson(Map<dynamic, dynamic> map4) {
    List list = map4['data'];
    List<SingalBeauticianData> data = list.map((e) => SingalBeauticianData.fromjson(e)).toList();
    return Data(
      total: map4['total'],
      data: data,
    );
  }
}

class SingalBeauticianData {
  String? id;
  String? businessName ;
  Location? location;
  String? gender;
  List<BeauticianServiceId>? beauticianServiceId;
  Address? address;

  SingalBeauticianData({
    this.id,
    this.businessName,
    this.location,
    this.gender,
    this.beauticianServiceId,
    this.address,
  });

  factory SingalBeauticianData.fromjson(Map<dynamic, dynamic> map1) {
    List list = map1['beauticianServiceId'] ?? [];
    List<BeauticianServiceId> beauticianServiceId = list.map((e) => BeauticianServiceId.fromjson(e)).toList();
    Address address = Address.fromjson(map1['address'] ?? {});
    return SingalBeauticianData(
      id: map1['_id'] ?? "",
      businessName: map1['businessName'] ?? "",
      location: Location.fromjson(map1['location'] ?? {}),
      gender: map1['gender'] ?? "",
      beauticianServiceId: beauticianServiceId,
      address: address,
    );
  }
}

class Location{
  String? type;
  List<dynamic>? coordinates;

  Location({this.type,this.coordinates});
  factory Location.fromjson(Map<dynamic,dynamic>map){
    return Location(
        type: map['type'] ?? "",
        coordinates: map['coordinates'] ?? [],
    );
  }
}

class Address{
  String? id;
  String? address;
  String? province;
  String? apartment;
  String? city;
  int? zipCode;

  Address({this.id,this.address,this.province,this.apartment,this.city,this.zipCode});
  factory Address.fromjson(Map<dynamic, dynamic>map){
    return Address(
        id: map['_id'] ?? "",
      address: map['address'] ?? "",
      province: map['province'] ?? "",
      apartment: map['apartment'] ?? "",
      city: map['city'] ?? "",
      zipCode: map['zipCode'] ?? 0,
    );
  }
}

class BeauticianServiceId {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  int? price;
  String? description;
  int? v;
  String? createdAt;
  String? updatedAt;

  BeauticianServiceId(
      {this.id,
      this.beauticianId,
      this.serviceCategory,
      this.serviceType,
      this.duration,
      this.price,
      this.description,
      this.v,
      this.createdAt,
      this.updatedAt});

  factory BeauticianServiceId.fromjson(Map<dynamic, dynamic> map2) {
    return BeauticianServiceId(
      id: map2['_id'],
      beauticianId: map2['beauticianId'],
      serviceCategory: ServiceCategory.fromjson(map2['serviceCategory']),
      serviceType: ServiceType.fromjson(map2['serviceType']),
      duration: map2['duration'],
      price: map2['price'],
      description: map2['description'],
      v: map2['__v'],
      createdAt: map2['createdAt'],
      updatedAt: map2['updatedAt'],
    );
  }
}

class ServiceType {
  String? id;
  String? serviceTypeName;

  ServiceType({this.id, this.serviceTypeName});

  factory ServiceType.fromjson(Map<dynamic, dynamic> map3) {
    return ServiceType(
      id: map3['_id'],
      serviceTypeName: map3['serviceTypeName'],
    );
  }
}

class ServiceCategory {
  String? id;
  String? serviceCategoryName;

  ServiceCategory({this.id, this.serviceCategoryName});

  factory ServiceCategory.fromjson(Map<dynamic, dynamic> map3) {
    return ServiceCategory(
      id: map3['_id'],
      serviceCategoryName: map3['serviceCategoryName'],
    );
  }
}

class MyFavorites {
  int? status;
  bool? success;
  String? message;

  MyFavorites({this.status, this.success, this.message});

  factory MyFavorites.fromjson(Map<dynamic, dynamic> map) {
    return MyFavorites(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? "",
    );
  }
}

class RemoveFavorites {
  int? status;
  bool? success;
  String? message;

  RemoveFavorites({this.status, this.success, this.message});

  factory RemoveFavorites.fromjson(Map<dynamic, dynamic> map) {
    return RemoveFavorites(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? "",
    );
  }
}


class BeauticianDetail {
  int status;
  bool success;
  List<Beautician> beautician;

  BeauticianDetail({
    required this.status,
    required this.success,
    required this.beautician,
  });

  factory BeauticianDetail.fromMap(Map<String, dynamic> json) => BeauticianDetail(
    status: json["status"],
    success: json["success"],
    beautician: List<Beautician>.from(json["beautician"].map((x) => Beautician.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "success": success,
    "beautician": List<dynamic>.from(beautician.map((x) => x.toMap())),
  };
}

class Beautician {
  String id;
  String userId;
  String uid;
  String firstName;
  String lastName;
  List<dynamic> workSpaceImgs;
  String country;
  String countryCode;
  List<String> beauticianServiceId;
  int isProvideService;
  int isProvideProduct;
  int totalEmployee;
  List<dynamic> demographicIds;
  int hasShop;
  int isServeAtClient;
  int isServeAtOwnPlace;
  int screenStatus;
  int isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String businessName;
  int businessNumber;
  LocationDetail location;
  String logo;
  String address;
  int noOfReviews;
  double rating;
  String gender;
  String profileImage;
  List<User> user;
  List<ServiceDetail> serviceDetails;
  List<dynamic> demographys;
  List<BeauticianAddress> beauticianAddress;
  List<WorkHour> workHours;
  List<Employee> employees;

  Beautician({
    required this.id,
    required this.userId,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.workSpaceImgs,
    required this.country,
    required this.countryCode,
    required this.beauticianServiceId,
    required this.isProvideService,
    required this.isProvideProduct,
    required this.totalEmployee,
    required this.demographicIds,
    required this.hasShop,
    required this.isServeAtClient,
    required this.isServeAtOwnPlace,
    required this.screenStatus,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.businessName,
    required this.businessNumber,
    required this.location,
    required this.logo,
    required this.address,
    required this.noOfReviews,
    required this.rating,
    required this.gender,
    required this.profileImage,
    required this.user,
    required this.serviceDetails,
    required this.demographys,
    required this.beauticianAddress,
    required this.workHours,
    required this.employees,
  });

  factory Beautician.fromMap(Map<String, dynamic> json) => Beautician(
    id: json["_id"] ?? "",
    userId: json["userId"] ?? "",
    uid: json["uid"] ?? "",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    workSpaceImgs: List<dynamic>.from(json["workSpaceImgs"].map((x) => x)),
    country: json["country"] ?? "",
    countryCode: json["country_code"] ?? "",
    beauticianServiceId: List<String>.from(json["beauticianServiceId"].map((x) => x)),
    isProvideService: json["isProvideService"] ?? 0,
    isProvideProduct: json["isProvideProduct"] ?? 0,
    totalEmployee: json["totalEmployee"] ?? 0,
    demographicIds: List<dynamic>.from(json["demographicIds"].map((x) => x)),
    hasShop: json["hasShop"] ?? 0,
    isServeAtClient: json["IsServeAtClient"],
    isServeAtOwnPlace: json["IsServeAtOwnPlace"],
    screenStatus: json["screenStatus"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    businessName: json["businessName"] ?? "",
    businessNumber: json["businessNumber"],
    location: LocationDetail.fromMap(json["location"]),
    logo: json["logo"],
    address: json["address"],
    noOfReviews: json["noOfReviews"],
    rating: json["rating"]?.toDouble(),
    gender: json["gender"],
    profileImage: json["profileImage"],
    user: List<User>.from(json["User"].map((x) => User.fromMap(x))),
    serviceDetails: List<ServiceDetail>.from(json["serviceDetails"].map((x) => ServiceDetail.fromMap(x))),
    demographys: List<dynamic>.from(json["demographys"].map((x) => x)),
    beauticianAddress: List<BeauticianAddress>.from(json["beauticianAddress"].map((x) => BeauticianAddress.fromMap(x))),
    workHours: List<WorkHour>.from(json["workHours"].map((x) => WorkHour.fromMap(x))),
    employees: List<Employee>.from(json["Employees"].map((x) => Employee.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "userId": userId,
    "uid": uid,
    "firstName": firstName,
    "lastName": lastName,
    "workSpaceImgs": List<dynamic>.from(workSpaceImgs.map((x) => x)),
    "country": country,
    "country_code": countryCode,
    "beauticianServiceId": List<dynamic>.from(beauticianServiceId.map((x) => x)),
    "isProvideService": isProvideService,
    "isProvideProduct": isProvideProduct,
    "totalEmployee": totalEmployee,
    "demographicIds": List<dynamic>.from(demographicIds.map((x) => x)),
    "hasShop": hasShop,
    "IsServeAtClient": isServeAtClient,
    "IsServeAtOwnPlace": isServeAtOwnPlace,
    "screenStatus": screenStatus,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "businessName": businessName,
    "businessNumber": businessNumber,
    "location": location.toMap(),
    "logo": logo,
    "address": address,
    "noOfReviews": noOfReviews,
    "rating": rating,
    "gender": gender,
    "profileImage": profileImage,
    "User": List<dynamic>.from(user.map((x) => x.toMap())),
    "serviceDetails": List<dynamic>.from(serviceDetails.map((x) => x.toMap())),
    "demographys": List<dynamic>.from(demographys.map((x) => x)),
    "beauticianAddress": List<dynamic>.from(beauticianAddress.map((x) => x.toMap())),
    "workHours": List<dynamic>.from(workHours.map((x) => x.toMap())),
    "Employees": List<dynamic>.from(employees.map((x) => x.toMap())),
  };
}

class BeauticianAddress {
  String address;
  String province;
  String city;
  int zipCode;

  BeauticianAddress({
    required this.address,
    required this.province,
    required this.city,
    required this.zipCode,
  });

  factory BeauticianAddress.fromMap(Map<String, dynamic> json) => BeauticianAddress(
    address: json["address"] ?? "",
    province: json["province"] ?? "",
    city: json["city"] ?? "",
    zipCode: json["zipCode"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "address": address,
    "province": province,
    "city": city,
    "zipCode": zipCode,
  };
}

class Employee {
  String firstName;
  String lastName;
  int phoneNumber;
  String countryCode;
  String email;
  String title;
  String notes;
  String calenderColor;
  String permissionLevel;
  WorkHours workHours;
  List<String> serviceIds;
  int status;
  String profileImage;

  Employee({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.countryCode,
    required this.email,
    required this.title,
    required this.notes,
    required this.calenderColor,
    required this.permissionLevel,
    required this.workHours,
    required this.serviceIds,
    required this.status,
    required this.profileImage,
  });

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
    countryCode: json["country_code"],
    email: json["email"],
    title: json["title"],
    notes: json["notes"],
    calenderColor: json["calenderColor"],
    permissionLevel: json["permissionLevel"],
    workHours: WorkHours.fromMap(json["workHours"]),
    serviceIds: List<String>.from(json["serviceIds"].map((x) => x)),
    status: json["status"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toMap() => {
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "country_code": countryCode,
    "email": email,
    "title": title,
    "notes": notes,
    "calenderColor": calenderColor,
    "permissionLevel": permissionLevel,
    "workHours": workHours.toMap(),
    "serviceIds": List<dynamic>.from(serviceIds.map((x) => x)),
    "status": status,
    "profileImage": profileImage,
  };
}

class WorkHours {
  String startTime;
  String endTime;

  WorkHours({
    required this.startTime,
    required this.endTime,
  });

  factory WorkHours.fromMap(Map<String, dynamic> json) => WorkHours(
    startTime: json["startTime"],
    endTime: json["endTime"],
  );

  Map<String, dynamic> toMap() => {
    "startTime": startTime,
    "endTime": endTime,
  };
}

class LocationDetail {
  String type;
  List<double> coordinates;

  LocationDetail({
    required this.type,
    required this.coordinates,
  });

  factory LocationDetail.fromMap(Map<String, dynamic> json) => LocationDetail(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class ServiceDetail {
  String id;
  String beauticianId;
  String serviceCategory;
  String serviceType;
  String duration;
  int price;
  String description;
  int v;
  DateTime createdAt;
  DateTime updatedAt;

  ServiceDetail({
    required this.id,
    required this.beauticianId,
    required this.serviceCategory,
    required this.serviceType,
    required this.duration,
    required this.price,
    required this.description,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceDetail.fromMap(Map<String, dynamic> json) => ServiceDetail(
    id: json["_id"],
    beauticianId: json["beauticianId"],
    serviceCategory: json["serviceCategory"],
    serviceType: json["serviceType"],
    duration: json["duration"],
    price: json["price"],
    description: json["description"],
    v: json["__v"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "beauticianId": beauticianId,
    "serviceCategory": serviceCategory,
    "serviceType": serviceType,
    "duration": duration,
    "price": price,
    "description": description,
    "__v": v,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class User {
  String email;
  int phoneNumber;
  int isVerified;
  int isActiveUser;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.email,
    required this.phoneNumber,
    required this.isVerified,
    required this.isActiveUser,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    isVerified: json["isVerified"],
    isActiveUser: json["isActiveUser"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "phoneNumber": phoneNumber,
    "isVerified": isVerified,
    "isActiveUser": isActiveUser,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class WorkHour {
  List<DayDetail> dayDetails;

  WorkHour({
    required this.dayDetails,
  });

  factory WorkHour.fromMap(Map<String, dynamic> json) => WorkHour(
    dayDetails: List<DayDetail>.from(json["dayDetails"].map((x) => DayDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "dayDetails": List<dynamic>.from(dayDetails.map((x) => x.toMap())),
  };
}

class DayDetail {
  String? day;
  String startTime;
  String endTime;
  String breakStartTime;
  String breakEndTime;
  bool isOpen;
  String id;

  DayDetail({
    this.day,
    required this.startTime,
    required this.endTime,
    required this.breakStartTime,
    required this.breakEndTime,
    required this.isOpen,
    required this.id,
  });

  factory DayDetail.fromMap(Map<String, dynamic> json) => DayDetail(
    day: json["day"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    breakStartTime: json["breakStartTime"],
    breakEndTime: json["breakEndTime"],
    isOpen: json["isOpen"],
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "day": day,
    "startTime": startTime,
    "endTime": endTime,
    "breakStartTime": breakStartTime,
    "breakEndTime": breakEndTime,
    "isOpen": isOpen,
    "_id": id,
  };
}
