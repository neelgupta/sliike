// ignore_for_file: camel_case_types, must_be_immutable, must_be_immutable, duplicate_ignore, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/book_appoinment.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../client_model/get_business_details.dart';
import '../../commonClass.dart';
import '../../utils/preferences.dart';

class services extends StatefulWidget {
  String beauticianId;
  String? businessName;
  bool fromStart = true;
  services(
      {Key? key,
      required this.beauticianId,
      this.businessName,
      this.fromStart = true})
      : super(key: key);

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  bool isSelected = false;
  String? colorbox = '';
  SingalBeautician? sb;
  BeauticianDetail? bd;
  int itemCount = 0;
  bool? like;
  List<BeauticianServiceId> serviceNameList = [];
  List<SingalBeauticianData> Beauticiandata = [];
  BusinessDat? businessDetails;
  List<BeauticianServiceId> temp = [];
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
  late CameraPosition _initialLocation;
  List<Marker> markers = <Marker>[];
  Position? p;
  String lat = "";
  String long = "";
  double? lati, longi;
  GoogleMapController? mapController;

  void launchFaceBookUrl(String fbUrl) async {
    var url = Uri.parse("fb://facewebmodal/f?href=${fbUrl}");
    // if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      // mode: LaunchMode.externalApplication,
    );
    // } else {
    //   throw 'There was a problem to open the url: $url';
    // }
  }

  void launchInstagramUrl(String instaUrl) async {
    var url = Uri.parse("https://www.instagram.com/icy");
    // if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      // mode: LaunchMode.externalApplication,
    );
    // } else {
    //   throw 'There was a problem to open the url: $url';
    // }
  }

  @override
  void initState() {
    super.initState();
    if (widget.fromStart) Helper.serviceId.clear();
    getBeauticianDetails();
    // getBusinessDeatils();
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

  locationLatLng() {
    markers.add(
      Marker(
          markerId: MarkerId(businessDetails!.id),
          position: LatLng(
            businessDetails!.location.coordinates[1],
            businessDetails!.location.coordinates[0],
          ),
          infoWindow: InfoWindow(title: businessDetails!.location.type)),
    );
  }

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchDailer(String mobileNumber) async {
    Uri phoneno = Uri.parse('tel:${mobileNumber}');
    if (await launchUrl(phoneno)) {
      print("dailer open");
      //dialer opened
    } else {
      print("dailer is not open");
      //dailer is not opened
    }
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
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, true);
            return true;
          },
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffDD6A03),
                  ),
                )
              : Beauticiandata.isNotEmpty
                  ? SingleChildScrollView(
                      // physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: height * 0.38,
                              child: Swiper(
                                autoplay: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Beauticiandata[0]
                                          .workSpaceImgs!
                                          .isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl: Beauticiandata[0]
                                              .workSpaceImgs![index],
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return Container(
                                              height: height * 0.13,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: imageProvider)),
                                            );
                                          },
                                          progressIndicatorBuilder: (context,
                                                  url, process) =>
                                              Container(
                                                  height: height * 0.13,
                                                  width: width,
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  child: const Center(
                                                      child:
                                                          CircularProgressIndicator())),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                                  height: height * 0.13,
                                                  width: width,
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  child: Center(
                                                      child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(Icons.error),
                                                      SizedBox(
                                                        height: height * 0.02,
                                                      ),
                                                      const Text("No Image")
                                                    ],
                                                  ))),
                                        )
                                      : Container(
                                          height: height * 0.13,
                                          width: width,
                                          margin: const EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          child: Center(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.error),
                                              SizedBox(
                                                height: height * 0.02,
                                              ),
                                              const Text("No Image")
                                            ],
                                          )));
                                },
                                itemCount: Beauticiandata[0]
                                        .workSpaceImgs!
                                        .isNotEmpty
                                    ? Beauticiandata[0].workSpaceImgs!.length
                                    : 1,
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
                              top: 5,
                              left: 5,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_sharp,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              right: 15,
                              child: Row(
                                children: [
                                  // Image.asset(
                                  //   "assets/images/share.png",
                                  //   height: 20,
                                  //   width: 20,
                                  // ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      if (Beauticiandata[0].isFav!) {
                                        setState(() {
                                          removeFromMyFavorites(
                                              widget.beauticianId);
                                        });
                                      } else {
                                        setState(() {
                                          addToMyFavorites(widget.beauticianId);
                                        });
                                      }
                                      Beauticiandata[0].isFav =
                                          !Beauticiandata[0].isFav!;
                                    },
                                    child: Icon(
                                      Beauticiandata[0].isFav!
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: const Color(0xFFDD5103),
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 160,
                          width: width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/bgappbar.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20),
                                width: width * 0.70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${Beauticiandata[0].businessName}",
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                      "${Beauticiandata[0].address!.apartment} ${Beauticiandata[0].address!.city} ${Beauticiandata[0].address!.zipCode}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (Beauticiandata[0].rating != "0")
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20, right: 10),
                                    width: width * 0.30,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Image(
                                                image: AssetImage(
                                                    "assets/images/Star 1.png"),
                                                height: 20),
                                            SizedBox(
                                              width: width * 0.03,
                                            ),
                                            Text(
                                              Beauticiandata[0].rating ?? "0",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: "spartan",
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text(
                                            "${Beauticiandata[0].noOfReviews ?? "0"} Reviews",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: "spartan",
                                              color: Colors.black,
                                            )),
                                      ],
                                    )),
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
                                    isScrollable: true,
                                    tabs: [
                                      Tab(
                                          child: const Text(
                                        "services",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: "spartan",
                                          fontSize: 15,
                                        ),
                                      ).tr()),
                                      Tab(
                                          child: const Text(
                                        "reviews",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 15),
                                      ).tr()),
                                      Tab(
                                          child: const Text(
                                        "portfolio",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 15),
                                      ).tr()),
                                      Tab(
                                          child: const Text(
                                        "details",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 15),
                                      ).tr()),
                                    ]),
                                Container(
                                  // color: Colors.red,
                                  height:
                                      viewMore ? height * 0.9 : height * 0.7,

                                  child: TabBarView(
                                    // physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      SingleChildScrollView(
                                        // physics: NeverScrollableScrollPhysics(),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15, top: 20),
                                              child: TextField(
                                                autofocus: false,
                                                controller: search,
                                                onChanged: (value) {
                                                  setState(() {
                                                    searchService(value);
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  hintText:
                                                      "search_service".tr(),
                                                  hintStyle: const TextStyle(
                                                      color: Color(0xff707070)),
                                                  suffixIcon: Container(
                                                    width: width * 0.2,
                                                    color:
                                                        const Color(0xFFDD6A03),
                                                    height: 5,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Image.asset(
                                                          "assets/images/search-whitenormal.png"),
                                                    ),
                                                  ),
                                                  labelStyle: const TextStyle(
                                                      fontFamily: 'spartan',
                                                      color: Colors.black54),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.black38),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.black38),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: height * 0.02),
                                            const Divider(
                                                color: Colors.black54),
                                            SizedBox(height: height * 0.02),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: const Text(
                                                            "services",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    "spartan",
                                                                color: Colors
                                                                    .black))
                                                        .tr(),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        "(${search.text.isEmpty ? sb!.data!.total : temp.length})",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors
                                                                .black54)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: ((Beauticiandata[0]
                                                                  .beauticianServiceId!
                                                                  .length <=
                                                              5
                                                          ? Beauticiandata[0]
                                                              .beauticianServiceId!
                                                              .length
                                                          : viewMore
                                                              ? Beauticiandata[
                                                                      0]
                                                                  .beauticianServiceId!
                                                                  .length
                                                              : 5) *
                                                      60) +
                                                  20,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  // physics: const NeverScrollableScrollPhysics(),
                                                  itemCount: search
                                                          .text.isNotEmpty
                                                      ? temp.length
                                                      : Beauticiandata[0]
                                                                  .beauticianServiceId!
                                                                  .length <=
                                                              5
                                                          ? Beauticiandata[0]
                                                              .beauticianServiceId!
                                                              .length
                                                          : viewMore
                                                              ? Beauticiandata[
                                                                      0]
                                                                  .beauticianServiceId!
                                                                  .length
                                                              : 5,
                                                  itemBuilder:
                                                      (context, index) {
                                                    // if (index < 5) {
                                                    //   return serviceSingalItem(index);
                                                    // } else if (viewMore) {
                                                    return search
                                                            .text.isNotEmpty
                                                        ? showSearchItem(index)
                                                        : serviceSingalItem(
                                                            index);
                                                    // } else {
                                                    //   return const SizedBox();
                                                    // }
                                                  }),
                                            ),
                                            SizedBox(height: height * 0.02),
                                            if (search.text.isEmpty)
                                              Beauticiandata[0]
                                                          .beauticianServiceId!
                                                          .length >
                                                      5
                                                  ? viewMore
                                                      ? InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              viewMore = false;
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: const Text(
                                                                          "view_less",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: "spartan",
                                                                              color: Color(0xFFDD6A03)))
                                                                      .tr(),
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            2),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_up,
                                                                    color: Color(
                                                                        0xFFDD6A03),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              viewMore = true;
                                                            });
                                                          },
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: const Text(
                                                                          "more_services",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontFamily: "spartan",
                                                                              color: Color(0xFFDD6A03)))
                                                                      .tr(),
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            2),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: Color(
                                                                        0xFFDD6A03),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                  : const SizedBox(),
                                            SizedBox(
                                              height: height * 0.04,
                                            )
                                          ],
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
                                      businessDetails != null
                                          ? SingleChildScrollView(
                                              // physics:
                                              //     NeverScrollableScrollPhysics(),
                                              child: Column(
                                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      SizedBox(
                                                        height: height * 0.35,
                                                        width: width,
                                                        child: GoogleMap(
                                                          onTap: (latLng) {
                                                            lat = latLng
                                                                .latitude
                                                                .toString();
                                                            long = latLng
                                                                .longitude
                                                                .toString();
                                                          },
                                                          mapToolbarEnabled:
                                                              false,
                                                          initialCameraPosition:
                                                              _initialLocation,
                                                          myLocationButtonEnabled:
                                                              false,
                                                          myLocationEnabled:
                                                              true,
                                                          mapType:
                                                              MapType.normal,
                                                          zoomControlsEnabled:
                                                              false,
                                                          zoomGesturesEnabled:
                                                              true,
                                                          markers:
                                                              Set<Marker>.of(
                                                                  markers),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: 10,
                                                          bottom: 15,
                                                          child: Container(
                                                            height:
                                                                height * 0.12,
                                                            width: width - 20,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: Colors
                                                                    .white),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      15,
                                                                  vertical: 10),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          businessDetails!
                                                                              .businessName,
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.black,
                                                                            fontFamily:
                                                                                "spartan",
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                height * 0.01),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${businessDetails!.address.address}\n${businessDetails!.address.city} ${businessDetails!.address.zipCode}",
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontFamily: "spartan",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          10),
                                                                  const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10),
                                                                    child: VerticalDivider(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          10),
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          _launchMapsUrl(
                                                                              businessDetails!.location.coordinates[1],
                                                                              businessDetails!.location.coordinates[0]);
                                                                        },
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              height * 0.05,
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/Group 12665.png",
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
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
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // SizedBox(
                                                        //   height: height * 0.04,
                                                        // ),
                                                        // const Text("Staff Members",
                                                        //     style: TextStyle(
                                                        //         fontSize: 20,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black)),
                                                        // SizedBox(
                                                        //   height: height * 0.04,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     Column(
                                                        //       children: [
                                                        //         SizedBox(
                                                        //           height: height * 0.15,
                                                        //           child: Image.asset(
                                                        //             "assets/images/Ellipse 154.png",
                                                        //             fit: BoxFit.fill,
                                                        //           ),
                                                        //         ),
                                                        //         SizedBox(
                                                        //             height: height * 0.02),
                                                        //         const Text("Tibo Quan",
                                                        //             style: TextStyle(
                                                        //                 fontSize: 20,
                                                        //                 fontFamily:
                                                        //                     "spartan",
                                                        //                 color:
                                                        //                     Colors.black)),
                                                        //         SizedBox(
                                                        //             height: height * 0.01),
                                                        //         const Text("Owner",
                                                        //             style: TextStyle(
                                                        //                 fontSize: 16,
                                                        //                 fontFamily:
                                                        //                     "spartan",
                                                        //                 color: Colors
                                                        //                     .black54)),
                                                        //       ],
                                                        //     ),
                                                        //     SizedBox(
                                                        //       width: width * 0.04,
                                                        //     ),
                                                        //     Column(
                                                        //       children: [
                                                        //         SizedBox(
                                                        //           height: height * 0.15,
                                                        //           child: Image.asset(
                                                        //             "assets/images/Ellipse 154.png",
                                                        //             fit: BoxFit.fill,
                                                        //           ),
                                                        //         ),
                                                        //         SizedBox(
                                                        //             height: height * 0.02),
                                                        //         const Text("Tibo Quan",
                                                        //             style: TextStyle(
                                                        //                 fontSize: 20,
                                                        //                 fontFamily:
                                                        //                     "spartan",
                                                        //                 color:
                                                        //                     Colors.black)),
                                                        //         SizedBox(
                                                        //             height: height * 0.01),
                                                        //         const Text("",
                                                        //             style: TextStyle(
                                                        //                 fontSize: 16,
                                                        //                 fontFamily:
                                                        //                     "spartan",
                                                        //                 color: Colors
                                                        //                     .black54)),
                                                        //       ],
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        // SizedBox(
                                                        //   height: height * 0.04,
                                                        // ),
                                                        // const Divider(
                                                        //   color: Colors.black54,
                                                        // ),
                                                        SizedBox(
                                                            height:
                                                                height * 0.02),
                                                        const Text(
                                                          "About Us",
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                height * 0.02),
                                                        Text(
                                                          businessDetails!
                                                              .description,
                                                          // "Barbing, freshness and confidence in one place. With a soft touch of modern styles, Freshman Cutz gives you that lost confidence.",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "spartan",
                                                            color:
                                                                Colors.black54,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                height * 0.02),
                                                        const Divider(
                                                            color:
                                                                Colors.black54),
                                                        SizedBox(
                                                            height:
                                                                height * 0.02),
                                                        const Text(
                                                          "Contact",
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                height * 0.02),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: const Color(
                                                                    0xffF3F3F3),
                                                              ),
                                                              child: Center(
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/contact_call.png",
                                                                  color: const Color(
                                                                      0xff707070),
                                                                  height: 24,
                                                                  width: 24,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            textComoon(
                                                                "${businessDetails!.businessNumber}",
                                                                15,
                                                                const Color(
                                                                    0xff292929),
                                                                FontWeight
                                                                    .w600),
                                                            const Spacer(),
                                                            InkWell(
                                                              onTap: () {
                                                                _launchDailer(
                                                                    businessDetails!
                                                                        .businessNumber
                                                                        .toString());
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 80,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: const Color(
                                                                            0xffFCF0E6),
                                                                        border: Border
                                                                            .all(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              const Color(0xffE48835),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                child: Center(
                                                                    child: textComoon(
                                                                        "Call",
                                                                        15,
                                                                        const Color(
                                                                            0xffDD6A03),
                                                                        FontWeight
                                                                            .w600)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10),
                                                        const Divider(
                                                            color:
                                                                Colors.black54),
                                                        const Text(
                                                          "Opening Hours",
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(height: 20),
                                                        // Row(
                                                        //   children:  [
                                                        //     const Text("Monday - Friday",
                                                        //         style: TextStyle(
                                                        //             fontSize: 16,
                                                        //             fontFamily: "spartan",
                                                        //             color: Colors.black54)),
                                                        //     const Spacer(),
                                                        //     Text("${businessDetails!.workHours[0].dayDetails[0].startTime} - ${businessDetails!.workHours[0].dayDetails[0].endTime}",
                                                        //         style: const TextStyle(
                                                        //             fontSize: 20,
                                                        //             fontFamily: "spartan",
                                                        //             color: Colors.black)),
                                                        //   ],
                                                        // ),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        businessDetails!
                                                                .workHours
                                                                .isEmpty
                                                            ? const Center(
                                                                child: Text(
                                                                  "No Data Found!!!",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        "spartan",
                                                                  ),
                                                                ),
                                                              )
                                                            : ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    businessDetails!
                                                                        .workHours[
                                                                            0]
                                                                        .dayDetails
                                                                        .length,
                                                                physics:
                                                                    NeverScrollableScrollPhysics(),
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "${businessDetails!.workHours[0].dayDetails[index].day}",
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 15,
                                                                              fontFamily: "spartan",
                                                                              color: Colors.black54,
                                                                            ),
                                                                          ),
                                                                          const Spacer(),
                                                                          Text(
                                                                            "${businessDetails!.workHours[0].dayDetails[index].startTime} - ${businessDetails!.workHours[0].dayDetails[index].endTime}",
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 17,
                                                                              fontFamily: "spartan",
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              10)
                                                                    ],
                                                                  );
                                                                },
                                                              ),

                                                        SizedBox(height: 10),
                                                        const Divider(
                                                            color:
                                                                Colors.black54),
                                                        SizedBox(height: 10),
                                                        // const Text("Products",
                                                        //     style: TextStyle(
                                                        //         fontSize: 20,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // SizedBox(
                                                        //   height: height * 0.15,
                                                        //   width: width,
                                                        //   child: Image.asset(
                                                        //     "assets/images/Group 12681.png",
                                                        //     fit: BoxFit.fill,
                                                        //   ),
                                                        // ),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Divider(
                                                        //   color: Colors.black54,
                                                        // ),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        const Text(
                                                          "Social Media Link",
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(height: 20),
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                launchInstagramUrl(
                                                                    businessDetails!
                                                                        .instagramUrl);
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        height *
                                                                            0.08,
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/Group 12685.png",
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  const Text(
                                                                    "Instagram",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            "spartan",
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: width *
                                                                    0.06),
                                                            GestureDetector(
                                                              onTap: () {
                                                                launchFaceBookUrl(
                                                                    businessDetails!
                                                                        .facebookUrl);
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        height *
                                                                            0.08,
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/facebooklogo.png",
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  const Text(
                                                                    "Facebook",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontFamily:
                                                                            "spartan",
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        businessDetails!
                                                                .amenities
                                                                .isEmpty
                                                            ? SizedBox()
                                                            : Column(
                                                                children: [
                                                                  SizedBox(
                                                                      height:
                                                                          15),
                                                                  const Divider(
                                                                    color: Colors
                                                                        .black54,
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          15),
                                                                  const Text(
                                                                    "Amenities",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontFamily:
                                                                            "spartan",
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          20),
                                                                  ListView
                                                                      .separated(
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemCount: businessDetails!
                                                                        .amenities
                                                                        .length,
                                                                    physics:
                                                                        NeverScrollableScrollPhysics(),
                                                                    separatorBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return SizedBox(
                                                                          height:
                                                                              15);
                                                                    },
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Text(
                                                                        businessDetails!
                                                                            .amenities[index]
                                                                            .name,
                                                                        // "Parking space",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontFamily:
                                                                              "spartan",
                                                                          color:
                                                                              Colors.black54,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                        // const Text(
                                                        //   "Parking space",
                                                        //   style: TextStyle(
                                                        //     fontSize: 15,
                                                        //     fontWeight:
                                                        //         FontWeight.w500,
                                                        //     fontFamily:
                                                        //         "spartan",
                                                        //     color:
                                                        //         Colors.black54,
                                                        //   ),
                                                        // ),
                                                        // SizedBox(height: 20),
                                                        // const Text(
                                                        //   "Accessible to people with disabilities",
                                                        //   style: TextStyle(
                                                        //       fontSize: 15,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .w500,
                                                        //       fontFamily:
                                                        //           "spartan",
                                                        //       color: Colors
                                                        //           .black54),
                                                        // ),
                                                        // SizedBox(height: 20),
                                                        // const Text(
                                                        //   "Child-friendly",
                                                        //   style: TextStyle(
                                                        //       fontSize: 15,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .w500,
                                                        //       fontFamily:
                                                        //           "spartan",
                                                        //       color: Colors
                                                        //           .black54),
                                                        // ),
                                                        // SizedBox(height: 20),
                                                        // const Text(
                                                        //   "Wi-Fi",
                                                        //   style: TextStyle(
                                                        //       fontSize: 15,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .w500,
                                                        //       fontFamily:
                                                        //           "spartan",
                                                        //       color: Colors
                                                        //           .black54),
                                                        // ),
                                                        SizedBox(height: 70),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : const Center(
                                              child: Text(
                                                "No Data Found!!!",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: "spartan",
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ],
                    ))
                  : const Center(child: Text('No data Found!!')),
        ),
      ),
    );
  }

  serviceSingalItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          infoDilog(index);
        });
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Text(
                      "${Beauticiandata[0].beauticianServiceId![index].serviceType!.serviceTypeName}",
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ).tr(),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${Beauticiandata[0].beauticianServiceId![index].price}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black),
                    ),
                    Text(
                      getTimeFormatedValue(Beauticiandata[0]
                          .beauticianServiceId![index]
                          .duration
                          .toString()),
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(width: 35),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return book_appoinment(
                            serviceTypeName:
                                "${Beauticiandata[0].beauticianServiceId![index].serviceType!.serviceTypeName}",
                            price:
                                "${Beauticiandata[0].beauticianServiceId![index].price}",
                            duration: getTimeFormatedValue(Beauticiandata[0]
                                .beauticianServiceId![index]
                                .duration
                                .toString()),
                            beauticianId: widget.beauticianId,
                            serviceId: Beauticiandata[0]
                                .beauticianServiceId![index]
                                .id!,
                            serviceDuration:
                                "${Beauticiandata[0].beauticianServiceId![index].duration}",
                          );
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDD6A03),
                    ),
                    child: const Text("book",
                            style: TextStyle(fontFamily: "spartan"))
                        .tr()),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  showSearchItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          infoDilog(index);
        });
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    child: Text(
                      "${temp[index].serviceType!.serviceTypeName}",
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ).tr(),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${temp[index].price}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black),
                    ),
                    Text(
                      getTimeFormatedValue(temp[index].duration.toString()),
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(width: 35),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return book_appoinment(
                            serviceTypeName:
                                "${temp[index].serviceType!.serviceTypeName}",
                            price: "${temp[index].price}",
                            duration: getTimeFormatedValue(
                                temp[index].duration.toString()),
                            beauticianId: widget.beauticianId,
                            serviceId: temp[index].id!,
                            serviceDuration: "${temp[index].duration}",
                          );
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDD6A03),
                    ),
                    child: const Text("book",
                            style: TextStyle(fontFamily: "spartan"))
                        .tr()),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  infoDilog(int index) {
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
                  height: height - 40,
                  width: width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  size: 30,
                                ))
                          ],
                        ),
                        Container(
                            height: height * 0.30,
                            width: width - 20,
                            margin: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Text("No Image")
                              ],
                            ))),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 100,
                              child: Text(
                                      search.text.isEmpty
                                          ? "${Beauticiandata[0].beauticianServiceId![index].serviceType!.serviceTypeName}"
                                          : "${temp[index].serviceType!.serviceTypeName}",
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
                                Text(
                                    search.text.isEmpty
                                        ? "\$${Beauticiandata[0].beauticianServiceId![index].price}"
                                        : "${temp[index].price}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black)),
                                Text(
                                    getTimeFormatedValue(search.text.isEmpty
                                        ? Beauticiandata[0]
                                            .beauticianServiceId![index]
                                            .duration
                                            .toString()
                                        : temp[index].duration.toString()),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                        search.text.isEmpty
                            ? Beauticiandata[0]
                                        .beauticianServiceId![index]
                                        .description !=
                                    ""
                                ? Expanded(
                                    child: Text(
                                        "${Beauticiandata[0].beauticianServiceId![index].description}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  )
                                : const Center(
                                    child: Text("No Description",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  )
                            : temp[index].description != ""
                                ? Expanded(
                                    child: Text("${temp[index].description}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  )
                                : const Center(
                                    child: Text("No Description",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
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
                                        Future.delayed(
                                                const Duration(seconds: 1))
                                            .then((value) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return book_appoinment(
                                                serviceTypeName:
                                                    "${serviceNameList[index].serviceType?.serviceTypeName}",
                                                price:
                                                    "${serviceNameList[index].price}",
                                                duration: getTimeFormatedValue(
                                                    serviceNameList[index]
                                                        .duration
                                                        .toString()),
                                                beauticianId:
                                                    widget.beauticianId,
                                                serviceId:
                                                    serviceNameList[index].id!,
                                                serviceDuration:
                                                    serviceNameList[index]
                                                        .duration
                                                        .toString(),
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

  addToMyFavorites(beauticianId) async {
    var posturi = Uri.parse(ApiUrlList.addToMyFavorites);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };

    var bodydata = {
      "beauticianId": beauticianId,
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
        // getBeauticianDetails();
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
  }

  removeFromMyFavorites(beauticianId) async {
    var posturi = Uri.parse(ApiUrlList.removeFromMyFavorites);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };

    var bodydata = {
      "beauticianId": beauticianId,
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
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {"id": widget.beauticianId, "limit": 10, "offset": 0};
      print("headers is ====> $headers ");
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
          Beauticiandata[0].isFav!;
          Beauticiandata[0].isFav!;
        }
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      }
      // setState(() {
      //   isLoading = false;
      // });
    } catch (e) {
      rethrow;
    } finally {
      getBusinessDeatils();
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

  getBusinessDeatils() async {
    var geturi = Uri.parse(ApiUrlList.getBusinessDeatilsNew);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        // 'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {
        "id": widget.beauticianId,
      };

      print("getBusinessDeatils url is ====> $geturi");
      log("bodydata is ====> $bodydata ");
      var response = await http.post(
        geturi,
        body: bodydata,
        headers: headers,
      );
      print("getBusinessDeatils status code ====> ${response.statusCode}");
      log(" getBusinessDeatils res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          GetBusinessDetails getBusinessDetails =
              GetBusinessDetails.fromMap(jsonDecode(response.body));
          businessDetails = getBusinessDetails.beautician.first;

          _initialLocation = CameraPosition(
            target: LatLng(businessDetails!.location.coordinates[1],
                businessDetails!.location.coordinates[0]),
            zoom: 15,
          );
          locationLatLng();
        }
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      }
      // setState(() {
      //   isLoading = false;
      // });
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  searchService(String value) {
    if (search.text.isNotEmpty) {
      temp.clear();
      for (int i = 0; i < Beauticiandata[0].beauticianServiceId!.length; i++) {
        print(Beauticiandata[0]
            .beauticianServiceId![i]
            .serviceType!
            .serviceTypeName!);
        if (Beauticiandata[0]
            .beauticianServiceId![i]
            .serviceType!
            .serviceTypeName!
            .toLowerCase()
            .contains(search.text.toLowerCase())) {
          print(
              "data : ${Beauticiandata[0].beauticianServiceId![i].serviceType!.serviceTypeName!}");
          temp.add(Beauticiandata[0].beauticianServiceId![i]);
          // setState(() {});
        }
      }
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
    List<SingalBeauticianData> data =
        list.map((e) => SingalBeauticianData.fromjson(e)).toList();
    return Data(
      total: map4['total'],
      data: data,
    );
  }
}

class SingalBeauticianData {
  String? id;
  String? businessName;

  String? rating;

  String? noOfReviews;

  Location? location;
  String? gender;
  List<BeauticianServiceId>? beauticianServiceId;
  List? workSpaceImgs;
  Address? address;
  bool? isFav;

  SingalBeauticianData(
      {this.id,
      this.businessName,
      this.rating,
      this.noOfReviews,
      this.location,
      this.gender,
      this.beauticianServiceId,
      this.workSpaceImgs,
      this.address,
      this.isFav});

  factory SingalBeauticianData.fromjson(Map<dynamic, dynamic> map1) {
    List list = map1['beauticianServiceId'] ?? [];
    List<BeauticianServiceId> beauticianServiceId =
        list.map((e) => BeauticianServiceId.fromjson(e)).toList();
    Address address = Address.fromjson(map1['address'] ?? {});
    return SingalBeauticianData(
      id: map1['_id'] ?? "",
      businessName: map1['businessName'] ?? "",
      rating: (map1['rating'] ?? "0").toString(),
      noOfReviews: (map1['noOfReviews'] ?? "0").toString(),
      location: Location.fromjson(map1['location'] ?? {}),
      gender: map1['gender'] ?? "",
      beauticianServiceId: beauticianServiceId,
      workSpaceImgs: map1['workSpaceImgs'] ?? [],
      address: address,
      isFav: map1['isFav'] ?? false,
    );
  }
}

class Location {
  String? type;
  List<dynamic>? coordinates;

  Location({this.type, this.coordinates});

  factory Location.fromjson(Map<dynamic, dynamic> map) {
    return Location(
      type: map['type'] ?? "",
      coordinates: map['coordinates'] ?? [],
    );
  }
}

class Address {
  String? id;
  String? address;
  String? province;
  String? apartment;
  String? city;
  String? zipCode;

  Address(
      {this.id,
      this.address,
      this.province,
      this.apartment,
      this.city,
      this.zipCode});

  factory Address.fromjson(Map<dynamic, dynamic> map) {
    return Address(
      id: map['_id'] ?? "",
      address: map['address'] ?? "",
      province: map['province'] ?? "",
      apartment: map['apartment'] ?? "",
      city: map['city'] ?? "",
      zipCode: map['zipCode'].toString(),
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

  factory BeauticianDetail.fromMap(Map<String, dynamic> json) =>
      BeauticianDetail(
        status: json["status"],
        success: json["success"],
        beautician: List<Beautician>.from(
            json["beautician"].map((x) => Beautician.fromMap(x))),
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
        beauticianServiceId:
            List<String>.from(json["beauticianServiceId"].map((x) => x)),
        isProvideService: json["isProvideService"] ?? 0,
        isProvideProduct: json["isProvideProduct"] ?? 0,
        totalEmployee: json["totalEmployee"] ?? 0,
        demographicIds:
            List<dynamic>.from(json["demographicIds"].map((x) => x)),
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
        serviceDetails: List<ServiceDetail>.from(
            json["serviceDetails"].map((x) => ServiceDetail.fromMap(x))),
        demographys: List<dynamic>.from(json["demographys"].map((x) => x)),
        beauticianAddress: List<BeauticianAddress>.from(
            json["beauticianAddress"].map((x) => BeauticianAddress.fromMap(x))),
        workHours: List<WorkHour>.from(
            json["workHours"].map((x) => WorkHour.fromMap(x))),
        employees: List<Employee>.from(
            json["Employees"].map((x) => Employee.fromMap(x))),
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
        "beauticianServiceId":
            List<dynamic>.from(beauticianServiceId.map((x) => x)),
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
        "serviceDetails":
            List<dynamic>.from(serviceDetails.map((x) => x.toMap())),
        "demographys": List<dynamic>.from(demographys.map((x) => x)),
        "beauticianAddress":
            List<dynamic>.from(beauticianAddress.map((x) => x.toMap())),
        "workHours": List<dynamic>.from(workHours.map((x) => x.toMap())),
        "Employees": List<dynamic>.from(employees.map((x) => x.toMap())),
      };
}

class BeauticianAddress {
  String address;
  String province;
  String city;
  String zipCode;

  BeauticianAddress({
    required this.address,
    required this.province,
    required this.city,
    required this.zipCode,
  });

  factory BeauticianAddress.fromMap(Map<String, dynamic> json) =>
      BeauticianAddress(
        address: json["address"] ?? "",
        province: json["province"] ?? "",
        city: json["city"] ?? "",
        zipCode: json["zipCode"].toString(),
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
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
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
        dayDetails: List<DayDetail>.from(
            json["dayDetails"].map((x) => DayDetail.fromMap(x))),
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
