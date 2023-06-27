import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_explore.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../../utils/app_colors.dart';

class RecentlyViewedViewAll extends StatefulWidget {
  const RecentlyViewedViewAll({Key? key}) : super(key: key);

  @override
  State<RecentlyViewedViewAll> createState() => _RecentlyViewedViewAllState();
}

class _RecentlyViewedViewAllState extends State<RecentlyViewedViewAll> {
  bool isLoading = false;
  RecentBeauticians? rb;
  List<RecentList> recentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecentBeauticians();
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
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffDD6A03),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              height: height * 0.055,
                              width: width * 0.05,
                              child: const Image(
                                image:
                                    AssetImage("assets/images/Vector (1).png"),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width * 0.8,
                            child: const Text("Recently Viewed",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w600)),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
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
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount: recentList.length,
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 12);
                              },
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return services(
                                            beauticianId:
                                                "${recentList[index].id}",
                                            businessName:
                                                "${recentList[index].businessName}",
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.greyColor
                                              .withOpacity(0.12),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: width,
                                          alignment: Alignment.center,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                recentList[index].logoPath ??
                                                    '',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              padding: const EdgeInsets.all(10),
                                              height: 150,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill)),
                                              margin: const EdgeInsets.all(5),
                                            ),
                                            progressIndicatorBuilder: (context,
                                                    url, process) =>
                                                Container(
                                                    height: 150,
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    child: const Center(
                                                        child:
                                                            CircularProgressIndicator())),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              height: 150,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: AppColors.greyColor
                                                    .withOpacity(0.15),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
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
                                                    SizedBox(height: 10),
                                                    const Text("No Image")
                                                  ],
                                                ),
                                              ),
                                            ),
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
                                                          "${recentList[index].businessName}",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  "spartan",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                    if (recentList[index]
                                                            .isLicensed ==
                                                        "1")
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 8),
                                                        child: Image.asset(
                                                          "assets/images/Subtract (1).png",
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                      ),
                                                    if (recentList[index]
                                                            .hasShop ==
                                                        0)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: Image.asset(
                                                          "assets/images/independentmen.png",
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                      )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${recentList[index].address!.apartment} ${recentList[index].address!.city} ${recentList[index].address!.zipCode}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "spartan")),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                // if(recentList[index].rating!="0" && recentList[index].noOfReviews!="0")
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
                                                //       child: Text(
                                                //           "${recentList[index].rating} Ratings",
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
                                                //       child: Text(
                                                //           "${recentList[index].noOfReviews} reviews",
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
                                  ),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  getRecentBeauticians() async {
    var Geturi = Uri.parse(ApiUrlList.getRecentBeauticians);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        // 'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
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
      setState(() {
        isLoading = false;
      });
    }
  }
}
