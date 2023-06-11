import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_explore.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;



class RecommendedViewAll extends StatefulWidget {
  const RecommendedViewAll({Key? key}) : super(key: key);

  @override
  State<RecommendedViewAll> createState() => _RecommendedViewAllState();
}

class _RecommendedViewAllState extends State<RecommendedViewAll> {

  bool isLoading = false;
  Recommended? r;
  String latitude = "";
  String longitude = "";
  List<Datum> recommended = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height - MediaQuery
        .of(context)
        .padding
        .top - MediaQuery
        .of(context)
        .padding
        .bottom;
    double width = MediaQuery
        .of(context)
        .size
        .width - MediaQuery
        .of(context)
        .padding
        .right - MediaQuery
        .of(context)
        .padding
        .left;
    return Scaffold(
      body: isLoading ? const Center(
        child: CircularProgressIndicator(color: Color(0xffDD6A03),),) : Padding(
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
                        image: AssetImage("assets/images/Vector (1).png"),),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.05,
                    width: width * 0.8,
                    child: const Text("Recommended", style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w600)),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              height: height * 0.85,
              child: recommended.isEmpty
                  ? const Center(
                child: Text(
                  "No Data Found!!!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "spartan",
                  ),
                ),
              ) : ListView.builder(
                itemCount: recommended.length,
                scrollDirection: Axis.vertical,
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
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            imageUrl: recommended[index].logo ?? '',
                            imageBuilder: (context, imageProvider) =>
                                Container(
                                  padding:
                                  const EdgeInsets.all(10),
                                  height: height * 0.18,
                                  width: width * 0.6,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill)
                                  ),
                                  margin: const EdgeInsets.all(5),
                                ),
                            progressIndicatorBuilder: (context, url, process) =>
                                Container(
                                    height: height * 0.18,
                                    width: width * 0.6,
                                    margin: const EdgeInsets.all(5),
                                    child: const Center(
                                        child: CircularProgressIndicator())
                                ),
                            errorWidget: (context, url, error) =>
                                Container(
                                    height: height * 0.18,
                                    width: width * 0.6,
                                    margin: const EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    child: Center(child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        const Icon(Icons.error),
                                        SizedBox(height: height * 0.02,),
                                        const Text("No Image")
                                      ],
                                    ))
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
                                    if(recommended[index].isLicensed=="1")
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
                                    "${recommended[index].address
                                        .apartment} ${recommended[index].address
                                        .city} ${recommended[index].address
                                        .zipCode}",
                                    style: const TextStyle(
                                        color:
                                        Colors.black,
                                        fontSize: 12,
                                        fontFamily:
                                        "spartan")),
                                const SizedBox(
                                  height: 5,
                                ),
                                if(recommended[index].noOfReviews!="0" && recommended[index].rating!="0")
                                Row(
                                  children: [
                                    SizedBox(
                                      height: height * 0.02,
                                      child: const Image(
                                          image: AssetImage(
                                              "assets/images/Star 1.png")),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      alignment:
                                          Alignment.topLeft,
                                      child: Text(
                                          "${recommended[index].rating} Ratings",
                                          style: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 14,
                                              fontFamily:
                                                  "spartan")),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      alignment:
                                          Alignment.topLeft,
                                      child: Text(
                                          "${recommended[index].noOfReviews} reviews",
                                          style: TextStyle(
                                              color: Colors
                                                  .grey,
                                              fontSize: 14,
                                              fontFamily:
                                                  "spartan")),
                                    ),
                                  ],
                                ),
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

  getRecomadedBeauticians() async {
    var posturi = Uri.parse(ApiUrlList.getRecomadedBeauticians);

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
    }else if(response.statusCode == 401){
      logoutdata();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return signInScreen();
      },), (route) => false);
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    setState(() {
      isLoading = true;
    });

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