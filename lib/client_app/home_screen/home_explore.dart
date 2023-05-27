// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/Filter.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/Search_services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/my_favorites_viewall.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/recently_viewed_viewall.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/recommended_viewall.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/search_screen.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/view_page.dart';
import 'package:http/http.dart' as http;
import '../../client_model/get_favorite_list_model.dart';
import '../../commonClass.dart';
import '../../utils/apiurllist.dart';
import '../../utils/preferences.dart';

class home_explore extends StatefulWidget {
  home_explore({Key? key,}) : super(key: key);

  @override
  State<home_explore> createState() => _home_exploreState();
}

class _home_exploreState extends State<home_explore> {
  bool isLoading = false;
  ServiceCategories? s;
  Recommended? r;
  String selectedServiceIdValue = "";
  String? allItemName;
  FavoriteListModel? f;
  RecentBeauticians? rb;
  String latitude = "";
  String longitude = "";
  String favoritesId = "";
  List<FavoritesData> favoritelist = [];
  List<ServiceCategorieData> serviceName = [];
  List<RecentList> recentList = [];
  List<Datum> recommended = [];
  List<String> selectedService = [];

  @override
  void initState() {
    getLocation();
    fetchServiceCategories();
    getClientFavoriteList();
    getRecentBeauticians();
    Helper.serviceId.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;
    return Scaffold(
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Color(0xffDD6A03),
        ),
      ) : RefreshIndicator(
        color: const Color(0xFFDD6A03),
        onRefresh: () async {
          setState(() {
            fetchServiceCategories();
            getClientFavoriteList();
            getRecentBeauticians();
            getRecomadedBeauticians();
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(width, 45)),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/client_home_bg.png"),
                          fit: BoxFit.fill),
                    ),
                    // child: Image.asset("assets/images/client_home_bg.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: width * 0.06, top: height * 0.07),
                    alignment: Alignment.centerRight,
                    child: Image.asset("assets/images/cart.png",
                        height: width * 0.13),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.06, top: height * 0.3),
                    alignment: Alignment.bottomLeft,
                    child: const Text("find_services",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w600))
                        .tr(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.06, top: height * 0.35),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const searchservices();
                              },
                            )).then((value) {
                              getLocation();
                              fetchServiceCategories();
                              getClientFavoriteList();
                              getRecentBeauticians();
                              setState(() {});
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03),
                            width: width * 0.7,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                Image.asset("assets/images/search.png",
                                    height: height * 0.03),
                                SizedBox(width: width * 0.03),
                                const Text(
                                  "search_services",
                                  style: TextStyle(fontSize: 12),
                                ).tr()
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const filterpage();
                              },
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset(
                              "assets/images/setting-4.png",
                              height: width * 0.08,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.02)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.46),
                    child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.02),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: const Text("top_categories",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: "spartan",
                                                  fontWeight: FontWeight.w600)).tr(),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return const viewpage();
                                                  },
                                                )).then((value) {
                                              getLocation();
                                              fetchServiceCategories();
                                              getClientFavoriteList();
                                              getRecentBeauticians();
                                              setState(() {});
                                            });
                                          },
                                          child: Container(
                                            child: const Text("view_all",
                                                style: TextStyle(
                                                  color:
                                                  Color(0xFFDD5103),
                                                  fontSize: 14,
                                                  fontFamily: "spartan",
                                                )).tr(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: height * 0.18,
                              child: ListView.builder(
                                itemCount: serviceName.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  allItemName = serviceName[index].serviceCategoryName;
                                  return GestureDetector(
                                    onTap: () {
                                      print("selectedService id is  =====> ${ serviceName[index].id.toString()}");
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return searchScreen(
                                                  selectedService: [serviceName[index].id.toString(),]);
                                            },
                                          )).then((value) {
                                        getLocation();
                                        fetchServiceCategories();
                                        getClientFavoriteList();
                                        getRecentBeauticians();
                                        setState(() {});
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: serviceName[index].imgPath ?? '',
                                          imageBuilder: (context, imageProvider) => Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            height: height * 0.13,
                                            width: width * 0.27,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                image: DecorationImage(image: imageProvider,fit: BoxFit.fill)
                                            ),
                                            margin: const EdgeInsets.all(5),
                                          ),
                                          progressIndicatorBuilder: (context, url, process) => Container(
                                              height: height * 0.13,
                                              width: width * 0.27,
                                              margin: const EdgeInsets.all(5),
                                              child: const Center(child: CircularProgressIndicator())
                                          ),
                                          errorWidget: (context, url, error) => Container(
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
                                          ),
                                        ),
                                        Text(
                                            "${serviceName[index].serviceCategoryName}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontFamily: "spartan",
                                            )),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(

                                          child: const Text(
                                              "my_favorites",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily:
                                                  "spartan",
                                                  fontWeight:
                                                  FontWeight
                                                      .w600))
                                              .tr(),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return const MyFavoritesViewAll();
                                            },)).then((value) {
                                              getLocation();
                                              fetchServiceCategories();
                                              getClientFavoriteList();
                                              getRecentBeauticians();
                                              setState(() {});
                                            });
                                          },
                                          child: Container(
                                            child: const Text("view_all",
                                                style: TextStyle(
                                                  color: Color(0xFFDD5103),
                                                  fontSize: 14,
                                                  fontFamily: "spartan",
                                                )).tr(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: height * 0.31,
                              child: favoritelist.isEmpty
                                  ? const Center(
                                child: Text(
                                  "No Favourite Products",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                  ),
                                ),
                              )
                                  : ListView.builder(
                                itemCount: favoritelist.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  favoritesId = favoritelist[index].id!;
                                  print("listId ======> $favoritesId");
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return services(
                                            beauticianId: favoritelist[index].id!);
                                      }),
                                      ).then((value) {
                                        getLocation();
                                        fetchServiceCategories();
                                        getClientFavoriteList();
                                        getRecentBeauticians();
                                        setState(() {});
                                      });
                                      print("selectedFavoritesId ======> ${favoritelist[index].id!}");
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: favoritelist[index].country ?? '',
                                          imageBuilder: (context, imageProvider) => Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            height: height * 0.18,
                                            width: width * 0.6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                image: DecorationImage(image: imageProvider,fit: BoxFit.fill)
                                            ),
                                            margin: const EdgeInsets.all(5),
                                          ),
                                          progressIndicatorBuilder: (context, url, process) => Container(
                                              height: height * 0.18,
                                              width: width * 0.6,
                                              margin: const EdgeInsets.all(5),
                                              child: const Center(child: CircularProgressIndicator())
                                          ),
                                          errorWidget: (context, url, error) => Container(
                                              height: height * 0.18,
                                              width: width * 0.6,
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
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(left: 15,),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      child: Text("${favoritelist[index].businessName}",
                                                          style: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                              fontFamily: "spartan",
                                                              fontWeight: FontWeight.w600)),
                                                    ),
                                                    const SizedBox(width: 5,),
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      child: const Image(image: AssetImage("assets/images/Subtract (1).png")),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                favoritelist[index].address == null
                                                    ? const SizedBox()
                                                    : Text(
                                                    "${favoritelist[index].address!.apartment} ${favoritelist[index].address!.city} ${favoritelist[index].address!.zipCode}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "spartan")),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                // Row(
                                                //   children: [
                                                //     SizedBox(
                                                //       height:
                                                //           height *
                                                //               0.02,
                                                //       child: const Image(
                                                //           image: AssetImage(
                                                //               "assets/images/Star 1.png")),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //     Container(
                                                //       alignment:
                                                //           Alignment
                                                //               .topLeft,
                                                //       child: const Text(
                                                //           "4.0 Ratings",
                                                //           style: TextStyle(
                                                //               color: Colors
                                                //                   .black,
                                                //               fontSize:
                                                //                   14,
                                                //               fontFamily:
                                                //                   "spartan")),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //     Container(
                                                //       alignment:
                                                //           Alignment
                                                //               .topLeft,
                                                //       child: const Text(
                                                //           "120reviews",
                                                //           style: TextStyle(
                                                //               color: Colors
                                                //                   .grey,
                                                //               fontSize:
                                                //                   14,
                                                //               fontFamily:
                                                //                   "spartan")),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: const Text(
                                              "recently_viewed",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily:
                                                  "spartan",
                                                  fontWeight:
                                                  FontWeight
                                                      .w600))
                                              .tr(),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return const RecentlyViewedViewAll();
                                            },)).then((value) {
                                              getLocation();
                                              fetchServiceCategories();
                                              getClientFavoriteList();
                                              getRecentBeauticians();
                                              setState(() {});
                                            });
                                          },
                                          child: Container(
                                            child: const Text("view_all",
                                                style: TextStyle(
                                                  color: Color(0xFFDD5103),
                                                  fontSize: 14,
                                                  fontFamily: "spartan",
                                                )).tr(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: height * 0.31,
                              child: recentList.isEmpty
                                  ? const Center(
                                child: Text(
                                  "No Data Found!!!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                  ),
                                ),
                              )
                                  : ListView.builder(
                                itemCount: recentList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return services(
                                                beauticianId: "${recentList[index].id}",
                                                businessName: "${recentList[index].businessName}",
                                              );
                                            },
                                          )).then((value) {
                                        getLocation();
                                        fetchServiceCategories();
                                        getClientFavoriteList();
                                        getRecentBeauticians();
                                        setState(() {});
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: recentList[index].logo ?? '',
                                          imageBuilder: (context, imageProvider) => Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            height: height * 0.18,
                                            width: width * 0.6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                image: DecorationImage(image: imageProvider,fit: BoxFit.fill)
                                            ),
                                            margin: const EdgeInsets.all(5),
                                          ),
                                          progressIndicatorBuilder: (context, url, process) => Container(
                                              height: height * 0.18,
                                              width: width * 0.6,
                                              margin: const EdgeInsets.all(5),
                                              child: const Center(child: CircularProgressIndicator())
                                          ),
                                          errorWidget: (context, url, error) => Container(
                                              height: height * 0.18,
                                              width: width * 0.6,
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
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                              left: 15,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                      Alignment
                                                          .topLeft,
                                                      child: Text(
                                                          "${recentList[index].businessName}",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize:
                                                              18,
                                                              fontFamily:
                                                              "spartan",
                                                              fontWeight:
                                                              FontWeight.w600)),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                      height *
                                                          0.03,
                                                      child: const Image(
                                                          image: AssetImage(
                                                              "assets/images/Subtract (1).png")),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${recentList[index].address!.apartment} ${recentList[index].address!.city} ${recentList[index].address!.zipCode}",
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize:
                                                        12,
                                                        fontFamily:
                                                        "spartan")),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                // Row(
                                                //   children: [
                                                //     SizedBox(
                                                //       height:
                                                //           height *
                                                //               0.02,
                                                //       child: const Image(
                                                //           image: AssetImage(
                                                //               "assets/images/Star 1.png")),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //     Container(
                                                //       alignment:
                                                //           Alignment
                                                //               .topLeft,
                                                //       child: const Text(
                                                //           "4.0 Ratings",
                                                //           style: TextStyle(
                                                //               color: Colors
                                                //                   .black,
                                                //               fontSize:
                                                //                   14,
                                                //               fontFamily:
                                                //                   "spartan")),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //     Container(
                                                //       alignment:
                                                //           Alignment
                                                //               .topLeft,
                                                //       child: const Text(
                                                //           "120reviews",
                                                //           style: TextStyle(
                                                //               color: Colors
                                                //                   .grey,
                                                //               fontSize:
                                                //                   14,
                                                //               fontFamily:
                                                //                   "spartan")),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: const Text("recommended",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily:
                                                  "spartan",
                                                  fontWeight:
                                                  FontWeight
                                                      .w600))
                                              .tr(),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return const RecommendedViewAll();
                                            },)).then((value) {
                                              getLocation();
                                              fetchServiceCategories();
                                              getClientFavoriteList();
                                              getRecentBeauticians();
                                              setState(() {});
                                            });
                                          },
                                          child: Container(
                                            child: const Text("view_all",
                                                style: TextStyle(
                                                  color: Color(0xFFDD5103),
                                                  fontSize: 14,
                                                  fontFamily: "spartan",
                                                )).tr(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: height * 0.31,
                              child:  recommended.isEmpty
                                  ? const Center(
                                child: Text(
                                  "No Data Found!!!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                  ),
                                ),
                              ) :ListView.builder(
                                itemCount: recommended.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return services(
                                                beauticianId: recommended[index].id,
                                                businessName: recommended[index].businessName,
                                              );
                                            },
                                          )).then((value) {
                                        getLocation();
                                        fetchServiceCategories();
                                        getClientFavoriteList();
                                        getRecentBeauticians();
                                        setState(() {});
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: recommended[index].logo ?? '',
                                          imageBuilder: (context, imageProvider) => Container(
                                            padding:
                                            const EdgeInsets.all(10),
                                            height: height * 0.18,
                                            width: width * 0.6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                image: DecorationImage(image: imageProvider,fit: BoxFit.fill)
                                            ),
                                            margin: const EdgeInsets.all(5),
                                          ),
                                          progressIndicatorBuilder: (context, url, process) => Container(
                                              height: height * 0.18,
                                              width: width * 0.6,
                                              margin: const EdgeInsets.all(5),
                                              child: const Center(child: CircularProgressIndicator())
                                          ),
                                          errorWidget: (context, url, error) => Container(
                                              height: height * 0.18,
                                              width: width * 0.6,
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
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                      Alignment.topLeft,
                                                      child: Text(
                                                          recommended[index].businessName,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 18,
                                                              fontFamily:
                                                              "spartan",
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600)),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.03,
                                                      child: const Image(
                                                          image: AssetImage(
                                                              "assets/images/Subtract (1).png")),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${recommended[index].address.apartment} ${recommended[index].address.city} ${recommended[index].address.zipCode}",
                                                    style: const TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize: 12,
                                                        fontFamily:
                                                        "spartan")),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                // Row(
                                                //   children: [
                                                //     SizedBox(
                                                //       height: height * 0.02,
                                                //       child: const Image(
                                                //           image: AssetImage(
                                                //               "assets/images/Star 1.png")),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //     Container(
                                                //       alignment:
                                                //           Alignment.topLeft,
                                                //       child: const Text(
                                                //           "4.0 Ratings",
                                                //           style: TextStyle(
                                                //               color: Colors
                                                //                   .black,
                                                //               fontSize: 14,
                                                //               fontFamily:
                                                //                   "spartan")),
                                                //     ),
                                                //     const SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //     Container(
                                                //       alignment:
                                                //           Alignment.topLeft,
                                                //       child: const Text(
                                                //           "120reviews",
                                                //           style: TextStyle(
                                                //               color: Colors
                                                //                   .grey,
                                                //               fontSize: 14,
                                                //               fontFamily:
                                                //                   "spartan")),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                          ],
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  fetchServiceCategories() async {
    var geturi = Uri.parse(ApiUrlList.fetchServiceCategories);
    try {
      setState(() {
        isLoading = true;
      });
      print("fetchServiceCategories url is :: $geturi");
      var response = await http.get(geturi);
      print("fetchServiceCategories status code ==> ${response.statusCode}");
      print("fetchServiceCategories res body is :  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          s = ServiceCategories.fromjson(map);
          serviceName = s!.data!;
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

  getClientFavoriteList() async {
    var Posturi = Uri.parse(ApiUrlList.getClientFavoriteList);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      print("getClientFavoriteList url is ====> $Posturi");

      var response = await http.get(
        Posturi,
        headers: headers,
      );

      print("getClientFavoriteList status code ====> ${response.statusCode}");
      log(" getClientFavoriteList res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          f = FavoriteListModel.fromjson(map);
          favoritelist = f!.data!.favoritesList!;
        }
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  getRecentBeauticians() async {
    var Geturi = Uri.parse(ApiUrlList.getRecentBeauticians);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        // 'Content-Type': "application/json; charset=utf-8",
        "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      print("getRecentBeauticians url is ====> $Geturi");

      var response = await http.get(
        Geturi,
        headers: headers,
      );

      print("getRecentBeauticians status code ====> ${response.statusCode}");
      print(" getRecentBeauticians res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          rb = RecentBeauticians.fromjson(map);
          recentList = rb!.data!.recentList!;
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

  getRecomadedBeauticians() async {
    var posturi = Uri.parse(ApiUrlList.getRecomadedBeauticians);
    setState(() {
      isLoading = true;
    });
    var headers = {
      // 'Content-Type': "application/json; charset=utf-8",
      "authorization":
      "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };

    print("longitude ===> $longitude");
    print("latitude ===> $latitude");

    var bodydata = {
      "longitude": longitude,
      "latitude": latitude,
    };

    print("getRecomadedBeauticians url is ====> $posturi");

    var response = await http.post(
      posturi,
      body: bodydata,
      headers: headers,
    );

    print("getRecomadedBeauticians status code ====> ${response.statusCode}");
    print("getRecomadedBeauticians res body is ====>  ${response.body}");
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
        r = Recommended.fromJson(jsonDecode(response.body));
        recommended = r!.beauticians.data;
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == LocationPermission.denied) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Navigator.pop(context);
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position? p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = p.latitude.toString();
      longitude = p.longitude.toString();
      print("///lat${p.latitude}");
      print("///long${p.longitude}");
      getRecomadedBeauticians();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

class ServiceCategories {
  int? status;
  bool? success;
  List<ServiceCategorieData>? data;
  String? message;

  ServiceCategories({this.status, this.success, this.data, this.message});

  factory ServiceCategories.fromjson(Map<dynamic, dynamic> map) {
    List list = map['data'] ?? "";
    List<ServiceCategorieData> data =
    list.map((e) => ServiceCategorieData.fromjson(e)).toList();
    return ServiceCategories(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      data: data,
      message: map['message'] ?? "",
    );
  }
}

class ServiceCategorieData {
  String? id;
  String? serviceCategoryName;
  String? imgPath;
  bool? isSelected;

  ServiceCategorieData(
      {this.id,
        this.serviceCategoryName,
        this.imgPath,
        this.isSelected = false});

  factory ServiceCategorieData.fromjson(Map<dynamic, dynamic> map1) {
    return ServiceCategorieData(
      id: map1['_id'] ?? "",
      serviceCategoryName: map1['serviceCategoryName'] ?? "",
      imgPath: map1['imgPath'] ?? "",
    );
  }
}

class RecentBeauticians {
  int? status;
  bool? success;
  String? message;
  Data? data;

  RecentBeauticians({this.status, this.success, this.message, this.data});

  factory RecentBeauticians.fromjson(Map<dynamic, dynamic> map) {
    return RecentBeauticians(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? "",
      data: Data.fromjson(map['data'] ?? {}),
    );
  }
}

class Data {
  int? count;
  List<RecentList>? recentList;

  Data({this.count, this.recentList});

  factory Data.fromjson(Map<dynamic, dynamic> map) {
    List list = map['recentList'] ?? [];
    List<RecentList> recentList =
    list.map((e) => RecentList.fromjson(e)).toList();
    return Data(
      count: map['count'] ?? 0,
      recentList: recentList,
    );
  }
}

class RecentList {
  String? id;
  String? uid;
  String? firstName;
  String? lastName;
  String? country;
  String? country_code;
  List<String>? beauticianServiceId;
  int? isProvideService;
  int? isProvideProduct;
  int? totalEmployee;
  List<String>? demographicIds;
  int? hasShop;
  int? IsServeAtClient;
  int? IsServeAtOwnPlace;
  int? screenStatus;
  int? isDeleted;
  String? profileImage;
  List<String>? workSpaceImgs;
  String? DOB;
  String? gender;
  String? logo;
  String? businessName;
  int? businessNumber;
  Location? location;
  Address? address;

  RecentList(
      {this.id,
        this.uid,
        this.firstName,
        this.lastName,
        this.country,
        this.country_code,
        this.beauticianServiceId,
        this.isProvideService,
        this.isProvideProduct,
        this.totalEmployee,
        this.demographicIds,
        this.hasShop,
        this.IsServeAtClient,
        this.IsServeAtOwnPlace,
        this.screenStatus,
        this.isDeleted,
        this.profileImage,
        this.workSpaceImgs,
        this.DOB,
        this.gender,
        this.logo,
        this.businessName,
        this.businessNumber,
        this.location,
        this.address});

  factory RecentList.fromjson(Map<dynamic, dynamic> map) {
    return RecentList(
      id: map['_id'] ?? "",
      uid: map['uid'] ?? "",
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      country: map['country'] ?? "",
      country_code: map['country_code'] ?? "",
      beauticianServiceId:
      List<String>.from(map['beauticianServiceId'] ?? [].map((e) => e)),
      isProvideService: map['isProvideService'] ?? 0,
      isProvideProduct: map['isProvideProduct'] ?? 0,
      totalEmployee: map['totalEmployee'] ?? 0,
      demographicIds:
      List<String>.from(map['demographicIds'] ?? [].map((e) => e)),
      hasShop: map['hasShop'] ?? 0,
      IsServeAtClient: map['IsServeAtClient'] ?? 0,
      IsServeAtOwnPlace: map['IsServeAtOwnPlace'] ?? 0,
      screenStatus: map['screenStatus'] ?? 0,
      isDeleted: map['isDeleted'] ?? 0,
      profileImage: map['profileImage'] ?? "",
      workSpaceImgs:
      List<String>.from(map['workSpaceImgs'] ?? [].map((e) => e)),
      DOB: map['DOB'] ?? "",
      gender: map['gender'] ?? "",
      logo: map['logo'] ?? "",
      businessNumber: map['businessNumber'] ?? 0,
      businessName: map['businessName'] ?? "",
      location: Location.fromjson(map['location'] ?? {}),
      address: Address.fromjson(map['address'] ?? {}),
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
  int? zipCode;

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
      zipCode: map['zipCode'] ?? 0,
    );
  }
}

class Recommended {
  int status;
  bool success;
  Beauticians beauticians;

  Recommended({
    required this.status,
    required this.success,
    required this.beauticians,
  });

  factory Recommended.fromJson(Map<String, dynamic> json) => Recommended(
    status: json["status"],
    success: json["success"],
    beauticians: Beauticians.fromJson(json["beauticians"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "beauticians": beauticians.toJson(),
  };
}

class Beauticians {
  int count;
  List<Datum> data;

  Beauticians({
    required this.count,
    required this.data,
  });

  factory Beauticians.fromJson(Map<String, dynamic> json) => Beauticians(
    count: json["count"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String businessName;
  RecommendedLocation location;
  Dis dis;
  dynamic logo;
  RecommendedAddress address;
  dynamic rating;

  Datum({
    required this.id,
    required this.businessName,
    required this.location,
    required this.dis,
    this.logo,
    required this.address,
    this.rating,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    businessName: json["businessName"],
    location: RecommendedLocation.fromJson(json["location"]),
    dis: Dis.fromJson(json["dis"]),
    logo: json["logo"],
    address: RecommendedAddress.fromJson(json["address"]),
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "businessName": businessName,
    "location": location.toJson(),
    "dis": dis.toJson(),
    "logo": logo,
    "address": address.toJson(),
    "rating": rating,
  };
}

class RecommendedAddress {
  String address;
  String province;
  String apartment;
  String city;
  int zipCode;

  RecommendedAddress({
    required this.address,
    required this.province,
    required this.apartment,
    required this.city,
    required this.zipCode,
  });

  factory RecommendedAddress.fromJson(Map<String, dynamic> json) => RecommendedAddress(
    address: json["address"],
    province: json["province"],
    apartment: json["apartment"],
    city: json["city"],
    zipCode: json["zipCode"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "province": province,
    "apartment": apartment,
    "city": city,
    "zipCode": zipCode,
  };
}

class Dis {
  double calculated;

  Dis({
    required this.calculated,
  });

  factory Dis.fromJson(Map<String, dynamic> json) => Dis(
    calculated: json["calculated"],
  );

  Map<String, dynamic> toJson() => {
    "calculated": calculated,
  };
}

class RecommendedLocation {
  String type;
  List<double> coordinates;

  RecommendedLocation({
    required this.type,
    required this.coordinates,
  });

  factory RecommendedLocation.fromJson(Map<String, dynamic> json) => RecommendedLocation(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

