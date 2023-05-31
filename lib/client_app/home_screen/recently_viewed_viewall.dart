import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_explore.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

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
      body: isLoading
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
                    padding: const EdgeInsets.only(top: 40),
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
                              image: AssetImage("assets/images/Vector (1).png"),
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
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: height * 0.85,
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
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return services(
                                        beauticianId: "${recentList[index].id}",
                                        businessName:
                                            "${recentList[index].businessName}",
                                      );
                                    },
                                  ));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width,
                                      alignment: Alignment.center,
                                      child: CachedNetworkImage(
                                        imageUrl: recentList[index].logo ?? '',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          padding: const EdgeInsets.all(10),
                                          height: height * 0.18,
                                          width: width * 0.6,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill)),
                                          margin: const EdgeInsets.all(5),
                                        ),
                                        progressIndicatorBuilder: (context, url,
                                                process) =>
                                            Container(
                                                height: height * 0.18,
                                                width: width * 0.6,
                                                margin: const EdgeInsets.all(5),
                                                child: const Center(
                                                    child:
                                                        CircularProgressIndicator())),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                                height: height * 0.18,
                                                width: width * 0.6,
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
                                                ))),
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
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      "${recentList[index].businessName}",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily: "spartan",
                                                          fontWeight:
                                                              FontWeight.w600)),
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
                                                "${recentList[index].address!.apartment} ${recentList[index].address!.city} ${recentList[index].address!.zipCode}",
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
                  )
                ],
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
      }else if(response.statusCode == 401){
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return signInScreen();
        },), (route) => false);
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
