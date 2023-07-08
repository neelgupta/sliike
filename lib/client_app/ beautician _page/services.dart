// ignore_for_file: camel_case_types, must_be_immutable, must_be_immutable, duplicate_ignore, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/book_appoinment.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/service_description.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../commonClass.dart';
import '../../utils/preferences.dart';

class services extends StatefulWidget {
  String beauticianId;
  String? businessName;
  bool fromStart = true;
  String? isLicensed;
  String? isIndependent;
  services(
      {Key? key,
      required this.beauticianId,
      this.businessName,
      this.fromStart = true,
      this.isLicensed,
      this.isIndependent})
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
  List<Beautician> BeauticianDetails = [];
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
  // MyFavorites? mf;
  String serviceTypeList = "";
  late CameraPosition _initialLocation;
  List<Marker> markers = <Marker>[];
  Position? p;
  String lat = "";
  String long = "";
  double? lati, longi;
  GoogleMapController? mapController;

  GetPolicyModel? getPolicyModel;
  GetPortfolioModel? getPortfolioModel;

  bool isPolicyLoading = true;
  bool isPortfolioLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.fromStart) Helper.serviceId.clear();
    getBeauticianDetails();
    getPolicy(widget.beauticianId);
    getPortfolio(widget.beauticianId);
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
          markerId: MarkerId(BeauticianDetails[0].id),
          position: LatLng(
            BeauticianDetails[0].location.coordinates[1],
            BeauticianDetails[0].location.coordinates[0],
          ),
          infoWindow: InfoWindow(title: BeauticianDetails[0].location.type)),
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
                              height: height * 0.30,
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
                            // Positioned(
                            //   top: 5,
                            //   left: 5,
                            //   child: IconButton(
                            //     padding: EdgeInsets.all(0),
                            //     onPressed: () {
                            //       Navigator.pop(context);
                            //     },
                            //     icon: const Icon(
                            //       Icons.arrow_back_sharp,
                            //       color: Colors.orange,
                            //     ),
                            //   ),
                            // ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 10),
                                child: Image.asset("assets/images/back.png",
                                    color: Color(0xFFDD6A03),
                                    height: 30,
                                    width: 30),
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
                          height: 120,
                          width: width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/bgappbar.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.red,
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 20),
                                width: width * 0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            "${Beauticiandata[0].businessName}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: "spartan",
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width * 0.03),
                                        if (BeauticianDetails[0].isLicensed ==
                                            "1")
                                          Image.asset(
                                            "assets/images/Subtract (1).png",
                                            height: 20,
                                            width: 20,
                                          ),
                                        SizedBox(width: width * 0.03),
                                        if (BeauticianDetails[0].hasShop == "1")
                                          InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                              "assets/images/independentmen.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                          )
                                      ],
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                      "${Beauticiandata[0].address!.apartment} ${Beauticiandata[0].address!.city} ${Beauticiandata[0].address!.zipCode}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // if (Beauticiandata[0].rating != "0")
                              //   Container(
                              //       padding: const EdgeInsets.only(
                              //           top: 20, bottom: 20, right: 10),
                              //       width: width * 0.30,
                              //       child: Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         children: [
                              //           Row(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               const Image(
                              //                   image: AssetImage(
                              //                       "assets/images/Star 1.png"),
                              //                   height: 20),
                              //               SizedBox(
                              //                 width: width * 0.03,
                              //               ),
                              //               Text(
                              //                 Beauticiandata[0].rating ?? "0",
                              //                 style: const TextStyle(
                              //                   fontSize: 16,
                              //                   fontFamily: "spartan",
                              //                   color: Colors.black,
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //           SizedBox(
                              //             height: height * 0.01,
                              //           ),
                              //           Text(
                              //               "${Beauticiandata[0].noOfReviews ?? "0"} Reviews",
                              //               style: const TextStyle(
                              //                 fontSize: 12,
                              //                 fontFamily: "spartan",
                              //                 color: Colors.black,
                              //               )),
                              //         ],
                              //       )),
                            ],
                          ),
                        ),
                        DefaultTabController(
                            length: 5,
                            initialIndex: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TabBar(
                                  isScrollable: true,
                                    unselectedLabelColor: Colors.black,
                                    labelColor: const Color(0xFFDD6A03),
                                    indicatorColor: const Color(0xFFDD6A03),
                                    tabs: [
                                      Tab(
                                          child: const Text(
                                        "services",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 13),
                                      ).tr()),
                                      Tab(
                                          child: const Text(
                                        "reviews",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 13),
                                      ).tr()),
                                      Tab(
                                          child: const Text(
                                        "portfolio",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 13),
                                      ).tr()),
                                      Tab(
                                          child: const Text(
                                        "details",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 13),
                                      ).tr()),
                                      Tab(
                                          child: const Text(
                                        "Policy",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "spartan",
                                            fontSize: 13),
                                      ).tr()),
                                    ]),
                                Container(
                                  // color: Colors.red,
                                  height:
                                      viewMore ? height * 0.98 : height * 0.5,

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
                                                        "(${search.text.isEmpty ? Beauticiandata[0].beauticianServiceId!.length : temp.length})",
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
                                      isPortfolioLoading
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                  color: Color(0xff0FFDD6A03)),
                                            )
                                          : getPortfolioModel!.data!.isNotEmpty
                                              ? GridView.custom(
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.all(20),
                                                  gridDelegate:
                                                      SliverQuiltedGridDelegate(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 10,
                                                    crossAxisSpacing: 10,
                                                    repeatPattern:
                                                        QuiltedGridRepeatPattern
                                                            .same,
                                                    pattern: [
                                                      QuiltedGridTile(1, 1),
                                                      QuiltedGridTile(1, 1),
                                                      QuiltedGridTile(1, 2),
                                                    ],
                                                  ),
                                                  childrenDelegate:
                                                      SliverChildBuilderDelegate(
                                                    childCount:
                                                        getPortfolioModel
                                                            ?.data?.length,
                                                    (context, index) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                          // color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: CachedNetworkImage(
                                                        // imageUrl:
                                                        imageUrl:
                                                            "${getPortfolioModel?.data?[index]}",
                                                        //     "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Stack(
                                                          children: [
                                                            Container(
                                                              // width: 120,
                                                              // height: 120,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black12),
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(
                                                                          "${getPortfolioModel?.data?[index]}"),
                                                                      fit: BoxFit
                                                                          .fill)),
                                                            ),
                                                            Positioned(
                                                                bottom: -1,
                                                                right: -1,
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  width: 50,
                                                                  child: Center(
                                                                      child: Icon(
                                                                          Icons
                                                                              .favorite_border,
                                                                          color: Colors
                                                                              .white,
                                                                          size:
                                                                              25,
                                                                          weight:
                                                                              1.0)),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black54,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              05)),
                                                                ))
                                                          ],
                                                        ),
                                                        progressIndicatorBuilder: (context,
                                                                url, process) =>
                                                            Container(
                                                                height: height *
                                                                    0.15,
                                                                width: width,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(5),
                                                                child: const Center(
                                                                    child:
                                                                        CircularProgressIndicator())),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            05),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black26)),
                                                                height: height *
                                                                    0.15,
                                                                width: width,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(5),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Center(
                                                                    child:
                                                                        Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    const Icon(Icons
                                                                        .error),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.02,
                                                                    ),
                                                                    const Text(
                                                                        "No Image")
                                                                  ],
                                                                ))),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                child: Text(
                                                    "No Portfolio Found!",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight
                                                                .w600)),
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
                                      BeauticianDetails.isNotEmpty
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
                                                                            BeauticianDetails[0]
                                                                                .businessName,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "spartan",
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.01,
                                                                        ),
                                                                        Expanded(
                                                                          child: Text(
                                                                              "${BeauticianDetails[0].beauticianAddress[0].address}\n${BeauticianDetails[0].beauticianAddress[0].city} ${BeauticianDetails[0].beauticianAddress[0].zipCode}",
                                                                              style: const TextStyle(
                                                                                fontSize: 11,
                                                                                color: Colors.black54,
                                                                                fontFamily: "spartan",
                                                                              )),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
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
                                                                              BeauticianDetails[0].location.coordinates[1],
                                                                              BeauticianDetails[0].location.coordinates[0]);
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
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Text("About Us",
                                                        //     style: TextStyle(
                                                        //         fontSize: 22,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Text(
                                                        //     "Barbing, freshness and confidence in one place. With a soft touch of modern styles, Freshman Cutz gives you that lost confidence.",
                                                        //     style: TextStyle(
                                                        //         fontSize: 16,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black54)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Divider(
                                                        //   color: Colors.black54,
                                                        // ),
                                                        SizedBox(
                                                            height:
                                                                height * 0.02),
                                                        const Text(
                                                          "Contact",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                height * 0.01),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 30,
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xffF3F3F3),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/contact_call.png",
                                                                  color: const Color(
                                                                      0xff707070),
                                                                  height: 20,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              textComoon(
                                                                  "${BeauticianDetails[0].businessNumber}",
                                                                  14,
                                                                  const Color(
                                                                      0xff292929),
                                                                  FontWeight
                                                                      .w600),
                                                              const Spacer(),
                                                              InkWell(
                                                                onTap: () {
                                                                  _launchDailer(
                                                                      BeauticianDetails[
                                                                              0]
                                                                          .businessNumber
                                                                          .toString());
                                                                },
                                                                child: Container(
                                                                    height: 35,
                                                                    width: 65,
                                                                    decoration: BoxDecoration(
                                                                        color: const Color(0xffFCF0E6),
                                                                        border: Border.all(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              const Color(0xffE48835),
                                                                        ),
                                                                        borderRadius: BorderRadius.circular(5)),
                                                                    child: Center(child: textComoon("Call", 12, const Color(0xffDD6A03), FontWeight.w600))),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Divider(
                                                            color:
                                                                Colors.black54),
                                                        const Text(
                                                          "Opening Hours",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontFamily:
                                                                "spartan",
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                height * 0.02),
                                                        // Row(
                                                        //   children:  [
                                                        //     const Text("Monday - Friday",
                                                        //         style: TextStyle(
                                                        //             fontSize: 16,
                                                        //             fontFamily: "spartan",
                                                        //             color: Colors.black54)),
                                                        //     const Spacer(),
                                                        //     Text("${BeauticianDetails[0].workHours[0].dayDetails[0].startTime} - ${BeauticianDetails[0].workHours[0].dayDetails[0].endTime}",
                                                        //         style: const TextStyle(
                                                        //             fontSize: 20,
                                                        //             fontFamily: "spartan",
                                                        //             color: Colors.black)),
                                                        //   ],
                                                        // ),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        BeauticianDetails[0]
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
                                                            : Container(
                                                                // color: Colors.red,
                                                                height: height *
                                                                    0.3,
                                                                child: ListView
                                                                    .builder(
                                                                  itemCount: BeauticianDetails[
                                                                          0]
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
                                                                            Text("${BeauticianDetails[0].workHours[0].dayDetails[index].day}",
                                                                                style: const TextStyle(fontSize: 14, fontFamily: "spartan", color: Colors.black54)),
                                                                            const Spacer(),
                                                                            Text("${BeauticianDetails[0].workHours[0].dayDetails[index].startTime} - ${BeauticianDetails[0].workHours[0].dayDetails[index].endTime}",
                                                                                style: const TextStyle(fontSize: 14, fontFamily: "spartan", color: Colors.black)),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              25,
                                                                        )
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text("Sarturday",
                                                        //         style: TextStyle(
                                                        //             fontSize: 16,
                                                        //             fontFamily: "spartan",
                                                        //             color: Colors.black54)),
                                                        //     const Spacer(),
                                                        //     Text("${BeauticianDetails[0].workHours[0].dayDetails[5].startTime} - ${BeauticianDetails[0].workHours[0].dayDetails[5].endTime}",
                                                        //         style: const TextStyle(
                                                        //             fontSize: 20,
                                                        //             fontFamily: "spartan",
                                                        //             color: Colors.black)),
                                                        //   ],
                                                        // ),
                                                        // s
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
                                                        const Divider(
                                                          color: Colors.black54,
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
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
                                                        // const Text("Social Media Link",
                                                        //     style: TextStyle(
                                                        //         fontSize: 20,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // Row(
                                                        //   children: [
                                                        //     Column(
                                                        //       children: [
                                                        //         SizedBox(
                                                        //           height: height * 0.08,
                                                        //           child: Image.asset(
                                                        //             "assets/images/Group 12685.png",
                                                        //             fit: BoxFit.fill,
                                                        //           ),
                                                        //         ),
                                                        //         SizedBox(
                                                        //             height: height * 0.01),
                                                        //         const Text("Instagram",
                                                        //             style: TextStyle(
                                                        //                 fontSize: 16,
                                                        //                 fontFamily:
                                                        //                     "spartan",
                                                        //                 color: Colors
                                                        //                     .black54)),
                                                        //       ],
                                                        //     ),
                                                        //     SizedBox(
                                                        //       width: width * 0.06,
                                                        //     ),
                                                        //     Column(
                                                        //       children: [
                                                        //         SizedBox(
                                                        //           height: height * 0.08,
                                                        //           child: Image.asset(
                                                        //             "assets/images/Group 12685.png",
                                                        //             fit: BoxFit.fill,
                                                        //           ),
                                                        //         ),
                                                        //         SizedBox(
                                                        //             height: height * 0.01),
                                                        //         const Text("Facebook",
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
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Divider(
                                                        //   color: Colors.black54,
                                                        // ),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Text("Amenities",
                                                        //     style: TextStyle(
                                                        //         fontSize: 20,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Text("Parking space",
                                                        //     style: TextStyle(
                                                        //         fontSize: 18,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black54)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Text(
                                                        //     "Accessible to people with disabilities",
                                                        //     style: TextStyle(
                                                        //         fontSize: 18,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black54)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Text("Child-friendly",
                                                        //     style: TextStyle(
                                                        //         fontSize: 18,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black54)),
                                                        // SizedBox(
                                                        //   height: height * 0.02,
                                                        // ),
                                                        // const Text("Wi-Fi",
                                                        //     style: TextStyle(
                                                        //         fontSize: 18,
                                                        //         fontFamily: "spartan",
                                                        //         color: Colors.black54)),
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
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

                                      /// Policy Tab View ///
                                      isPolicyLoading
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                  color: Color(0xff0FFDD6A03)),
                                            )
                                          : getPolicyModel?.data != null
                                              ? SingleChildScrollView(
                                                  child: Container(
                                                    // color: Colors.red,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Cancellation Policy",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 17),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    10,
                                                                  ),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black12)),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "${getPolicyModel?.data?.cancelPolicy?.title ?? ""}",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Image.asset(
                                                                    "assets/images/bluetick.png",
                                                                    height: 20,
                                                                    width: 20,
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "${getPolicyModel?.data?.cancelPolicy?.policy ?? ""}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        15,
                                                                    color: Color(
                                                                        0xff414141)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "No-show Policy: ${getPolicyModel?.data?.noSHowPolicy?.title ?? ""}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 17),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  20),
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    10,
                                                                  ),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black12)),
                                                          child: Text(
                                                            "${getPolicyModel?.data?.noSHowPolicy?.policy ?? ""}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 15,
                                                                color: Color(
                                                                    0xff414141)),
                                                          ),
                                                        ),
                                                        // const SizedBox(
                                                        //   height: 25,
                                                        // ),
                                                        // Container(
                                                        //   padding: EdgeInsets.all(20),
                                                        //   decoration: BoxDecoration(
                                                        //       borderRadius:
                                                        //           BorderRadius.circular(
                                                        //         10,
                                                        //       ),
                                                        //       border: Border.all(
                                                        //           color: Colors.black12)),
                                                        //   child: Text(
                                                        //     "Arrive at your appointment 15 minutes before your scheduled time to avoid late arrival, total cancellation or forfeiture."
                                                        //     "All no-show appointments may only be rescheduled at no cost, only at the discretion of the beauty business. Please avoid No-Show.",
                                                        //     style: TextStyle(
                                                        //         fontWeight:
                                                        //             FontWeight.w500,
                                                        //         fontSize: 15,
                                                        //         color: Color(0xff414141)),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                              child: Text(
                                                  "No Policy Found!",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                                )
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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDescription(
                Beauticiandata[0].beauticianServiceId![index].description ?? "",
                Beauticiandata[0].beauticianServiceId![index].imgName ?? "",
              ),
            ));
      },
      child: Container(
        // height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.red,
                  alignment: Alignment.centerLeft,
                  width: 150,
                  child: Row(
                    children: [
                      Text("${Beauticiandata[0].beauticianServiceId![index].serviceType!.serviceTypeName}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black))
                          .tr(),
                      SizedBox(
                        width: 05,
                      ),
                      Text(
                          "(${getTimeFormatedValue(Beauticiandata[0].beauticianServiceId![index].duration.toString())})",
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "\$${Beauticiandata[0].beauticianServiceId![index].price}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black)),
                    // Text(
                    //     getTimeFormatedValue(Beauticiandata[0]
                    //         .beauticianServiceId![index]
                    //         .priceStatus
                    //         .toString()),
                    //     style: const TextStyle(
                    //         fontSize: 12,
                    //         fontFamily: "spartan",
                    //         color: Colors.black54)),

                    Text(
                        Beauticiandata[0]
                                    .beauticianServiceId![index]
                                    .priceStatus !=
                                ""
                            ? "${Beauticiandata[0].beauticianServiceId![index].priceStatus}"
                            : "Fixed",
                        style: const TextStyle(
                            fontSize: 12,
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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDescription(
                Beauticiandata[0].beauticianServiceId![index].description ?? "",
                Beauticiandata[0].beauticianServiceId![index].imgName ?? "",
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 150,
                  child: Row(
                    children: [
                      Text("${temp[index].serviceType!.serviceTypeName}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black))
                          .tr(),
                      const SizedBox(
                        width: 05,
                      ),
                      Text(
                          "(${getTimeFormatedValue(temp[index].duration.toString())})",
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("\$${temp[index].price}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black)),

                    Text(
                        Beauticiandata[0]
                                    .beauticianServiceId![index]
                                    .priceStatus !=
                                ""
                            ? "${Beauticiandata[0].beauticianServiceId![index].priceStatus}"
                            : "Fixed",
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: "spartan",
                            color: Colors.black54)),
                    // Text(getTimeFormatedValue(temp[index].priceStatus.toString()),
                    //     style: const TextStyle(
                    //         fontSize: 12,
                    //         fontFamily: "spartan",
                    //         color: Colors.black54)),
                  ],
                ),
                const Spacer(),
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
                                          fontSize: 14,
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
                                        fontSize: 14,
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
                                            fontSize: 14,
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
                                            fontSize: 14,
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
                      // color: Colors.red,
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
        showToast(
          message: "${map['message']}",
        );
        // getBeauticianDetails();
      } else {
        showToast(
          message: "${map['message']}",
        );
        ;
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
        showToast(
          message: "${map['message']}",
        );
      } else {
        showToast(
          message: "${map['message']}",
        );
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
      print("getBeauticianDetails url is ====> $posturi ");
      print("getBeauticianDetails bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("getBeauticianDetails status code ====> ${response.statusCode}");
      log(" getBeauticianDetails res body is ====>  ${response.body}");
      log(" getBeauticianDetails Headers ====>  ${headers}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          sb = SingalBeautician.fromjson(map);
          Beauticiandata = sb!.data!.data!;
        }
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      getBusinessDeatils();
    }
  }

  getBusinessDeatils() async {
    var geturi = Uri.parse(ApiUrlList.getBusinessDeatils);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        // 'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {
        "id": widget.beauticianId,
      };

      print("getBusinessDeatils url is ====> $geturi ");
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
          bd = BeauticianDetail.fromMap(jsonDecode(response.body));
          BeauticianDetails = bd!.beautician;

          _initialLocation = CameraPosition(
            target: LatLng(BeauticianDetails[0].location.coordinates[1],
                BeauticianDetails[0].location.coordinates[0]),
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

  /// Get Policy ///
  getPolicy(String id) async {
    var getUri = Uri.parse(ApiUrlList.getPolicy + "$id");
    var Headers = {
      // 'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    log("URL ====> $getUri");
    var response = await http.get(
      getUri,
      headers: Headers,
    );
    log("getPolicy Code ====> ${response.statusCode}");
    log("getPolicy Body ====>  ${response.body}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (map['status'] == 200) {
        setState(() {
          isPolicyLoading = false;
          getPolicyModel = GetPolicyModel.fromMap(jsonDecode(response.body));
        });
      }
    } else if (response.statusCode == 401) {
      logoutdata();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return signInScreen();
        },
      ), (route) => false);
    } else {
      setState(() {
        getPolicyModel = null;
        isPolicyLoading = false;
      });
    }
  }

  /// Get Portfolio ///
  getPortfolio(String id) async {
    var getUri = Uri.parse(ApiUrlList.getPortfolio + "$id");
    var Headers = {
      // 'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    log("URL ====> $getUri");

    try {
      var response = await http.get(
        getUri,
        headers: Headers,
      );
      log("getPortfolio Code ====> ${response.statusCode}");
      log("getPortfolio Body ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (map['status'] == 200) {
          setState(() {
            isPortfolioLoading = false;
            getPortfolioModel =
                GetPortfolioModel.fromMap(jsonDecode(response.body));
          });
        }
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      } else {
        setState(() {
          getPortfolioModel = null;
          isPortfolioLoading = false;
        });
      }
    } catch (e) {
      rethrow;
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
  Data? data;

  SingalBeautician({this.data});

  factory SingalBeautician.fromjson(Map<dynamic, dynamic> map) {
    return SingalBeautician(
      data: Data.fromjson(map['data']),
    );
  }
}

class Data {
  List<SingalBeauticianData>? data;

  Data({this.data});

  factory Data.fromjson(Map<dynamic, dynamic> map4) {
    List list = map4['data'];
    List<SingalBeauticianData> data =
        list.map((e) => SingalBeauticianData.fromjson(e)).toList();
    return Data(
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
      location:
          map1['location'] != null ? Location.fromjson(map1['location']) : null,
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
  List? coordinates;

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
  String? imgName;
  String? priceStatus;

  BeauticianServiceId({
    this.id,
    this.beauticianId,
    this.serviceCategory,
    this.serviceType,
    this.duration,
    this.price,
    this.description,
    this.imgName,
    this.priceStatus,
  });

  factory BeauticianServiceId.fromjson(Map<dynamic, dynamic> map2) {
    return BeauticianServiceId(
        id: map2['_id'],
        beauticianId: map2['beauticianId'],
        serviceCategory: ServiceCategory.fromjson(map2['serviceCategory']),
        serviceType: ServiceType.fromjson(map2['serviceType']),
        duration: map2['duration'],
        price: map2['price'],
        description: map2['description'],
        imgName: map2["imgName"] ?? "",
        priceStatus: map2["priceStatus"] ?? "");
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

class BeauticianDetail {
  int status;
  bool success;
  List<Beautician> beautician;

  BeauticianDetail({
    required this.status,
    required this.success,
    required this.beautician,
  });

  factory BeauticianDetail.fromMap(Map<String, dynamic> json) {
    List list = json["beautician"] ?? [];
    return BeauticianDetail(
      status: json["status"],
      success: json["success"],
      beautician: list.map((x) => Beautician.fromMap(x)).toList(),
    );
  }
}

class Beautician {
  String id;
  String userId;
  String uid;
  String firstName;
  String lastName;
  List workSpaceImgs;
  String country;
  String businessName;
  int businessNumber;
  LocationDetail location;
  String logo;
  String address;
  int noOfReviews;
  double rating;
  String gender;
  String profileImage;
  String hasShop;
  String isLicensed;
  List<BeauticianAddress> beauticianAddress;
  List<WorkHour> workHours;

  Beautician({
    required this.id,
    required this.userId,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.workSpaceImgs,
    required this.country,
    required this.hasShop,
    required this.businessName,
    required this.businessNumber,
    required this.location,
    required this.logo,
    required this.isLicensed,
    required this.address,
    required this.noOfReviews,
    required this.rating,
    required this.gender,
    required this.profileImage,
    required this.beauticianAddress,
    required this.workHours,
  });

  factory Beautician.fromMap(Map<String, dynamic> json) => Beautician(
        id: json["_id"] ?? "",
        userId: json["userId"] ?? "",
        uid: json["uid"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        workSpaceImgs: json["workSpaceImgs"] ?? [],
        country: json["country"] ?? "",
        hasShop: (json["hasShop"] ?? 0).toString(),
        isLicensed: (json["isLicensed"] ?? 0).toString(),
        businessName: json["businessName"] ?? "",
        businessNumber: json["businessNumber"],
        location: LocationDetail.fromMap(json["location"]),
        logo: json["logo"] ?? "",
        address: json["address"] ?? "",
        noOfReviews: (json["noOfReviews"] ?? 0),
        rating: double.parse((json["rating"] ?? 0).toString()),
        gender: json["gender"] ?? "",
        profileImage: json["profileImage"] ?? "",
        beauticianAddress: List<BeauticianAddress>.from(
            json["beauticianAddress"].map((x) => BeauticianAddress.fromMap(x))),
        workHours: List<WorkHour>.from(
            json["workHours"].map((x) => WorkHour.fromMap(x))),
      );
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

  ServiceDetail({
    required this.id,
    required this.beauticianId,
    required this.serviceCategory,
    required this.serviceType,
    required this.duration,
    required this.price,
    required this.description,
  });

  factory ServiceDetail.fromMap(Map<String, dynamic> json) => ServiceDetail(
        id: json["_id"],
        beauticianId: json["beauticianId"],
        serviceCategory: json["serviceCategory"],
        serviceType: json["serviceType"],
        duration: json["duration"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "beauticianId": beauticianId,
        "serviceCategory": serviceCategory,
        "serviceType": serviceType,
        "duration": duration,
        "price": price,
        "description": description,
      };
}

class WorkHour {
  List<DayDetail> dayDetails;

  WorkHour({
    required this.dayDetails,
  });

  factory WorkHour.fromMap(Map<String, dynamic> json) {
    List list = json['dayDetails'];
    return WorkHour(
      dayDetails: list.map((x) => DayDetail.fromMap(x)).toList(),
    );
  }
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
        day: json["day"] ?? "Monday",
        startTime: json["startTime"] ?? "",
        endTime: json["endTime"] ?? "",
        breakStartTime: json["breakStartTime"] ?? "",
        breakEndTime: json["breakEndTime"] ?? "",
        isOpen: json["isOpen"] ?? false,
        id: json["_id"] ?? "",
      );
}

/// get Policy Model Data Class ///

GetPolicyModel getPolicyModelFromMap(String str) =>
    GetPolicyModel.fromMap(json.decode(str));

String getPolicyModelToMap(GetPolicyModel data) => json.encode(data.toMap());

class GetPolicyModel {
  int? status;
  bool? success;
  Data1? data;

  GetPolicyModel({
    this.status,
    this.success,
    this.data,
  });

  factory GetPolicyModel.fromMap(Map<String, dynamic> json) => GetPolicyModel(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null ? null : Data1.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "data": data?.toMap(),
      };
}

class Data1 {
  Policy? cancelPolicy;
  Policy? noSHowPolicy;

  Data1({
    this.cancelPolicy,
    this.noSHowPolicy,
  });

  factory Data1.fromMap(Map<String, dynamic> json) => Data1(
        cancelPolicy: Policy.fromMap(json["cancelPolicy"] ?? {}),
        noSHowPolicy: Policy.fromMap(json["noSHowPolicy"] ?? {}),
      );

  Map<String, dynamic> toMap() => {
        "cancelPolicy": cancelPolicy?.toMap(),
        "noSHowPolicy": noSHowPolicy?.toMap(),
      };
}

class Policy {
  String? policy;
  String? title;

  Policy({
    this.policy,
    this.title,
  });

  factory Policy.fromMap(Map<String, dynamic> json) => Policy(
        policy: json["policy"] ?? "",
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "policy": policy,
        "title": title,
      };
}

/// get Portfolio Model Data Class ///

GetPortfolioModel getPortfolioModelFromMap(String str) =>
    GetPortfolioModel.fromMap(json.decode(str));

String getPortfolioModelToMap(GetPortfolioModel data) =>
    json.encode(data.toMap());

class GetPortfolioModel {
  int? status;
  bool? success;
  List<String>? data;

  GetPortfolioModel({
    this.status,
    this.success,
    this.data,
  });

  factory GetPortfolioModel.fromMap(Map<String, dynamic> json) =>
      GetPortfolioModel(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
