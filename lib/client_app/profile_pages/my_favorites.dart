// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../../client_model/get_favorite_list_model.dart';
import '../../utils/app_colors.dart';
import '../home_screen/search_screen.dart';

class my_favorites extends StatefulWidget {
  const my_favorites({Key? key}) : super(key: key);

  @override
  State<my_favorites> createState() => _my_favoritesState();
}

class _my_favoritesState extends State<my_favorites> {
  bool isLoading = false;
  bool service = true;
  bool products = false;
  bool brands = false;
  FavoriteListModel? f;
  String latitude = "";
  String longitude = "";
  String favoritesId = "";
  List<FavoritesData> favoritelist = [];

  @override
  void initState() {
    getClientFavoriteList();
    super.initState();
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: height * 0.06,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "my_favorites",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold,
                                ),
                              ).tr(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              service = true;
                              products = false;
                              brands = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width * 0.30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: service
                                        ? const Color(0xFFDD5103)
                                        : Colors.black),
                                color: service
                                    ? const Color(0xFFDD5103)
                                    : Colors.white),
                            child: Text(
                              "services",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: service ? Colors.white : Colors.black,
                              ),
                            ).tr(),
                          ),
                        ),
                        // SizedBox(width: width*0.02,),
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       service = false;
                        //       products = true;
                        //       brands = false;
                        //     });
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     height: height*0.05,
                        //     width: width*0.25,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //         border: Border.all(color: products?const Color(0xFFDD5103):Colors.black),
                        //         color: products?const Color(0xFFDD5103):Colors.white
                        //     ),
                        //     child: Text("products",
                        //         style: TextStyle(
                        //             fontSize: 14,
                        //             fontFamily: "spartan",
                        //             color: products?Colors.white:Colors.black)).tr(),
                        //   ),
                        // ),
                        // SizedBox(width: width*0.02,),
                        // InkWell(
                        //   onTap: () {
                        //     setState(() {
                        //       service = false;
                        //       products = false;
                        //       brands = true;
                        //     });
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     height: height*0.05,
                        //     width: width*0.25,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //         border: Border.all(color: brands?const Color(0xFFDD5103):Colors.black),
                        //         color: brands?const Color(0xFFDD5103):Colors.white
                        //     ),
                        //     child: Text("brands",
                        //         style: TextStyle(
                        //             fontSize: 14,
                        //             fontFamily: "spartan",
                        //             color: brands?Colors.white:Colors.black)).tr(),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    service == true
                        ? SizedBox(
                            height: height * 0.80,
                            child: favoritelist.isEmpty
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.20,
                                      ),
                                      SizedBox(
                                        height: height * 0.15,
                                        width: width * 0.30,
                                        child: Image.asset(
                                          "assets/images/Group 13183.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      const Text(
                                        "favorites",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).tr(),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      const Text(
                                        "about",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontFamily: "spartan",
                                        ),
                                      ).tr(),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          // var locationData =
                                          await getLocation();
                                          // if (latitude == "" ||
                                          //     longitude == "") {
                                          //   showToast(
                                          //       message: "Please enable Location");
                                          // } else {}
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: width,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color(0xffDD6A03),
                                          ),
                                          child: Text(
                                            "find",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "spartan",
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.25,
                                            ),
                                          ).tr(),
                                        ),
                                      ),
                                    ],
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: favoritelist.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return services(
                                                    beauticianId:
                                                        favoritelist[index]
                                                            .id!);
                                              },
                                            ),
                                          ).then((value) {
                                            getClientFavoriteList();
                                          });
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black54),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: height * 0.12,
                                                      width: width * 0.25,
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            favoritelist[index]
                                                                    .logoPath ??
                                                                '',
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          height: height * 0.18,
                                                          width: width * 0.6,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              image: DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .fill)),
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(5),
                                                        ),
                                                        progressIndicatorBuilder: (context,
                                                                url, process) =>
                                                            Container(
                                                                height: height *
                                                                    0.18,
                                                                width:
                                                                    width * 0.6,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(5),
                                                                child: const Center(
                                                                    child:
                                                                        CircularProgressIndicator())),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Container(
                                                          height: height * 0.18,
                                                          width: width * 0.6,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .greyColor
                                                                  .withOpacity(
                                                                      0.25),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          8))),
                                                          child: Center(
                                                            child: Column(
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
                                                                    height: 5),
                                                                const Text(
                                                                    "No Image")
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                                "${favoritelist[index].businessName}",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        "spartan",
                                                                    color: Colors
                                                                        .black)),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            if (favoritelist[
                                                                        index]
                                                                    .isLicensed ==
                                                                "1")
                                                              SizedBox(
                                                                height: height *
                                                                    0.03,
                                                                child: const Image(
                                                                    image: AssetImage(
                                                                        "assets/images/Subtract (1).png")),
                                                              )
                                                          ],
                                                        ),
                                                        Text(
                                                          "${favoritelist[index].address!.apartment}\n${favoritelist[index].address!.city} ${favoritelist[index].address!.zipCode}",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "spartan",
                                                            color: AppColors
                                                                .blueColor,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ))
                        : products == true
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.20,
                                  ),
                                  SizedBox(
                                    height: height * 0.15,
                                    width: width * 0.30,
                                    child: Image.asset(
                                      "assets/images/Group 13183.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  const Text(
                                    "favorites",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ).tr(),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  const Text("about",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontFamily: "spartan"))
                                      .tr(),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: width,
                                    height: height * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffDD6A03)),
                                    child: const Text("find",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "spartan",
                                                color: Colors.white))
                                        .tr(),
                                  ),
                                ],
                                // children: [
                                //   SizedBox(height: height*0.04,),
                                //   Row(
                                //     children: [
                                //       SizedBox(
                                //           height: height*0.12,
                                //           width: width*0.25,
                                //           child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                                //       SizedBox(width: width*0.04,),
                                //       Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           Row(
                                //             children: [
                                //               const Text("Subaru Hair Dye",
                                //                   style: TextStyle(
                                //                       fontSize: 16,
                                //                       fontFamily: "spartan",
                                //                       color: Colors.black)),
                                //               SizedBox(width: width*0.20,),
                                //               Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                                //             ],
                                //           ),
                                //           const Text("\$999",
                                //               style: TextStyle(
                                //                   fontSize: 18,
                                //                   fontFamily: "spartan",
                                //                   color: Colors.black)),
                                //         ],
                                //       )
                                //     ],
                                //   ),
                                //   SizedBox(height: height*0.02,),
                                //   const Divider(color: Colors.black54,),
                                //   SizedBox(height: height*0.02,),
                                //   Row(
                                //     children: [
                                //       SizedBox(
                                //           height: height*0.12,
                                //           width: width*0.25,
                                //           child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                                //       SizedBox(width: width*0.04,),
                                //       Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           Row(
                                //             children: [
                                //               const Text("Subaru Hair Dye",
                                //                   style: TextStyle(
                                //                       fontSize: 16,
                                //                       fontFamily: "spartan",
                                //                       color: Colors.black)),
                                //               SizedBox(width: width*0.20,),
                                //               Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                                //             ],
                                //           ),
                                //           const Text("\$999",
                                //               style: TextStyle(
                                //                   fontSize: 18,
                                //                   fontFamily: "spartan",
                                //                   color: Colors.black)),
                                //         ],
                                //       )
                                //     ],
                                //   ), SizedBox(height: height*0.02,),
                                //   const Divider(color: Colors.black54,),
                                // ],
                              )
                            : Column(children: [
                                SizedBox(
                                  height: height * 0.20,
                                ),
                                SizedBox(
                                  height: height * 0.15,
                                  width: width * 0.30,
                                  child: Image.asset(
                                    "assets/images/Group 13183.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Text("favorites",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: "spartan",
                                            fontWeight: FontWeight.bold))
                                    .tr(),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Text("about",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                            fontFamily: "spartan"))
                                    .tr(),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffDD6A03)),
                                  child: const Text("find",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "spartan",
                                              color: Colors.white))
                                      .tr(),
                                ),
                              ]
                                // children: [
                                //   SizedBox(height: height*0.04,),
                                //   Row(
                                //     children: [
                                //       SizedBox(
                                //           height: height*0.12,
                                //           width: width*0.25,
                                //           child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                                //       SizedBox(width: width*0.04,),
                                //       Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           Row(
                                //             children: [
                                //               const Text("Lakme",
                                //                   style: TextStyle(
                                //                       fontSize: 18,
                                //                       fontFamily: "spartan",
                                //                       color: Colors.black)),
                                //               SizedBox(width: width*0.35,),
                                //               Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                                //             ],
                                //           ),
                                //           const Text("Beauty Brand",
                                //               style: TextStyle(
                                //                   fontSize: 14,
                                //                   fontFamily: "spartan",
                                //                   color: Colors.black)),
                                //         ],
                                //       )
                                //     ],
                                //   ),
                                //   SizedBox(height: height*0.02,),
                                //   const Divider(color: Colors.black54,),
                                //   SizedBox(height: height*0.02,),
                                //   Row(
                                //     children: [
                                //       SizedBox(
                                //           height: height*0.12,
                                //           width: width*0.25,
                                //           child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                                //       SizedBox(width: width*0.04,),
                                //       Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           Row(
                                //             children: [
                                //               const Text("Joe Fresh",
                                //                   style: TextStyle(
                                //                       fontSize: 18,
                                //                       fontFamily: "spartan",
                                //                       color: Colors.black)),
                                //               SizedBox(width: width*0.30,),
                                //               Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                                //             ],
                                //           ),
                                //           const Text("Fashion Brand",
                                //               style: TextStyle(
                                //                   fontSize: 14,
                                //                   fontFamily: "spartan",
                                //                   color: Colors.black)),
                                //         ],
                                //       )
                                //     ],
                                //   ), SizedBox(height: height*0.02,),
                                //   const Divider(color: Colors.black54,),
                                // ],
                                ),
                  ],
                ),
              ),
            ),
    );
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
        setState(() {
          isLoading = false;
        });
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
      isLoading = false;
    }
  }

  Future getLocation() async {
    try {
      setState(() {
        isLoading = true;
      });

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return searchScreen(
                myPlace: "",
                selectedService: [],
                selectedDemography: [],
                gender: "",
                sortBy: "",
                priceValue: 0,
                latitude: latitude,
                longitude: longitude,
              );
            },
          ),
        ).then((value) {
          getClientFavoriteList();
        });
        setState(() {
          isLoading = false;
        });
      } else {}
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
    // return await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
  }
}
