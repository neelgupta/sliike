// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/beutician_location.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/near_you_screen.dart';
import 'package:http/http.dart' as http;
import '../../commonClass.dart';
import '../../utils/apiurllist.dart';
import '../../utils/preferences.dart';

class searchScreen extends StatefulWidget {
  bool? isAdvanced = false;
  List<String>? selectedService;
  List<String>? selectedDemography;
  List<String>? searchService;
  String? gender;
  String? sortBy;
  String? myPlace;
  int? priceValue;
  String? latitude;
  String? longitude;

  searchScreen(
      {Key? key,
      this.isAdvanced,
      this.selectedService,
      this.selectedDemography,
      this.gender,
      this.sortBy,
      this.myPlace,
      this.priceValue,
      this.searchService,
      this.latitude,
      this.longitude,
      })
      : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController search = TextEditingController();
  String yearlyv = '2022';
  ServicesFilter? sf;
  bool isLoading = true;
  List<Datum> datum = [];
  MyFavorites? mf;
  String beauticianId = "";
  String businessName = "";
  List businessAddress = [];
  bool? like;
  // String latitude = "";
  // String longitude = "";
  List<String> selectedServiceByAdvance = [];
  var yearly = [
    '2022',
    '2023',
  ];
  double height = 0;
  double width = 0;
  List name = [
    'All Categories',
    'Barber',
    'Hair Care',
    'Make-up',
    'Spa',
    'Tatto Art',
    'Nals',
    'Photography'
  ];

  @override
  void initState() {
    super.initState();
      findServices();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          // padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: 10),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffDD6A03),
                  ),
                )
              : Column(
                  children: [
                    widget.isAdvanced ?? false
                        ? Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/bgappbar.png"),
                                  fit: BoxFit.fill,
                                )),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                        left: width * 0.03,
                                        right: width * 0.03,
                                      ),
                                      padding: const EdgeInsets.only(),
                                      height: height * 0.06,
                                      width: width,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: TextField(
                                        controller: search,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "What are you looking for?",
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                top: 12,
                                                right: 12,
                                                bottom: 10),
                                            child: SizedBox(
                                              height: 5,
                                              child: Image.asset(
                                                  "assets/images/search-normal.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                border: Border.all(
                                                    color: Colors.grey),
                                                color: Colors.white),
                                            height: height * 0.06,
                                            width: width * 0.43,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Image(
                                                      image: const AssetImage(
                                                        "assets/images/Group 71.png",
                                                      ),
                                                      color: const Color(
                                                          0xFFDD5103),
                                                      height: width * 0.05),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return const NearYou();
                                                        },
                                                      ));
                                                    },
                                                    child: SizedBox(
                                                        width: width * 0.32,
                                                        child: const Text(
                                                          "Near You",
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'spartan'),
                                                        )))
                                              ],
                                            )),
                                        SizedBox(
                                          width: width * 0.06,
                                        ),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                border: Border.all(
                                                    color: Colors.grey),
                                                color: Colors.white),
                                            height: height * 0.06,
                                            width: width * 0.43,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Image(
                                                      image: const AssetImage(
                                                        "assets/images/note.png",
                                                      ),
                                                      color: const Color(
                                                          0xFFDD5103),
                                                      height: width * 0.05),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                SizedBox(
                                                    width: width * 0.32,
                                                    child: const Text(
                                                      "When?",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              "spartan"),
                                                    ))
                                              ],
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Wrap(
                              //   alignment: WrapAlignment.start,
                              //   runSpacing: 10,
                              //   spacing: 8,
                              //   children: [
                              //     for (int i = 0; i < serviceName.length; i++)
                              //       GestureDetector(
                              //         onTap: () {
                              //           setState(() {
                              //             serviceName[i].isSelected =
                              //             !serviceName[i].isSelected;
                              //           });
                              //         },
                              //         child: Container(
                              //           height: height * 0.06,
                              //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                              //           decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(20),
                              //               border: Border.all(
                              //                   color: serviceName[i].isSelected
                              //                       ? const Color(0xFFDD5103)
                              //                       : Colors.black45),
                              //               color: serviceName[i].isSelected
                              //                   ? const Color(0xFFDD5103)
                              //                   : Colors.transparent),
                              //           child: Text(
                              //             "${serviceName[i].serviceCategoryName}",
                              //             style: TextStyle(
                              //                 fontFamily: "spartan",
                              //                 fontSize: 16,
                              //                 color: serviceName[i].isSelected
                              //                     ? Colors.white
                              //                     : Colors.black54),
                              //           ),
                              //         ),
                              //       )
                              //   ],
                              // ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              GestureDetector(
                                // onTap: () {
                                //   setState(() {
                                //     findServices();
                                //   });
                                // },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.07,
                                    width: width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFDD5103)),
                                        color: const Color(0xFFDD5103),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: const Text(
                                      "APPLY",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              )
                            ],
                          )
                        : Container(
                            padding: const EdgeInsets.only(
                                bottom: 20, top: 10, left: 20, right: 20),
                            color: Colors.white,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SizedBox(
                                    height: width * 0.04,
                                    width: width * 0.04,
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/images/Vector (1).png"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: width*0.04,),
                                Container(
                                  alignment: Alignment.center,
                                  height: height * 0.05,
                                  width: width * 0.8,
                                  child: const Text("Your Selected Service",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.w800)),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (datum.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text("${datum.length} Result Found",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w800))),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Stack(children: [
                        SizedBox(
                          height: height,
                          child: datum.isNotEmpty
                              ? ListView.builder(
                                  itemCount: datum.length,
                                  itemBuilder: (context, index) {
                                    beauticianId = datum[index].id;
                                    businessName = datum[index].businessName;
                                    businessAddress = datum[index].address;
                                     like = datum[index].isFav!;
                                    return GestureDetector(
                                      onTap: () {
                                        // print("data =====> ${datum[index].id}");
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return services(
                                                beauticianId: datum[index].id,
                                                businessName:
                                                    datum[index].businessName);
                                          }),
                                        );
                                        print("selectedFavoritesId ======> ${datum[index]}");
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Container(
                                                padding: const EdgeInsets.all(10),
                                                alignment: Alignment.center,
                                                height: height * 0.25,
                                                width: width,
                                                decoration: BoxDecoration(
                                                    // image: const DecorationImage(
                                                    //     image: AssetImage(
                                                    //         "assets/images/Rectangle 863.png"),
                                                    //     fit: BoxFit.fill),
                                                    // color: Colors.yellow,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                margin: const EdgeInsets.all(5),
                                                child: const Text("No Image Found!!!"),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 15),
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
                                                              datum[index]
                                                                  .businessName,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      "spartan",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                width * 0.01),
                                                        SizedBox(
                                                          height: height * 0.03,
                                                          child: const Image(
                                                              image: AssetImage(
                                                                  "assets/images/Subtract (1).png")),
                                                        ),
                                                        const Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (like!) {
                                                              setState(() {
                                                                removeFromMyFavorites(datum[index].id);
                                                              });
                                                            } else {
                                                              setState(() {
                                                                addToMyFavorites(datum[index].id
                                                                );
                                                              });
                                                            }
                                                          },
                                                          child: Icon( like! ? Icons.favorite : Icons.favorite_border_outlined,color: const Color(0xFFDD5103),size: 30),
                                                        ),
                                                        SizedBox(
                                                            width: width * 0.02)
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    datum[index].address.isEmpty
                                                        ? const SizedBox()
                                                        : Text(
                                                            "${datum[index].address[0].apartment} ${datum[index].address[0].city} ${datum[index].address[0].zipCode}",
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
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
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text("No Data Found!!!"),
                                ),
                        ),
                        if(datum.isNotEmpty)Positioned(
                          right: 10,
                          top: 150,
                          child: SizedBox(
                            height: height*0.10,
                            width: width*0.20,
                            child: GestureDetector(
                              onTap: () {
                                if((widget.latitude ?? "").isEmpty) {
                                  getLocation();
                                } else {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return BeuticianLocation(
                                          locationData: datum,
                                          lat: double.parse(widget.latitude!),
                                          long: double.parse(widget.longitude!),);
                                      },));
                                }
                              },
                                child: Image.asset("assets/images/Group 12530.png",fit: BoxFit.fill,)
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  addToMyFavorites(beauticianId) async {
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
          like = true;
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          findServices();
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

  removeFromMyFavorites(beauticianId) async {
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
          like = false;
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          findServices();
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

  findServices() async {
    var posturi = Uri.parse(ApiUrlList.findServices);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("selectedService ====> ${widget.selectedService}");
      var bodydata = {
        "services": widget.selectedService ?? widget.searchService,
        "demography": [],
        "maxPrice": widget.priceValue,
        "gender": widget.gender ?? "",
        "serveAt": widget.myPlace ?? "",
        "longitude": widget.longitude ?? "",
        "latitude": widget.latitude ?? "",
        "sortBy": widget.sortBy ?? ""
      };
      print("addPersonalInfo url is ====> $posturi ");
      log("req bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("addPersonalInfo status code ====> ${response.statusCode}");
      log(" addPersonalInfo res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          setState(() {
            sf = ServicesFilter.fromJson(jsonDecode(response.body));
            datum = sf!.data.data;
            like;
            print("like =====> $like");
          });
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
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
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

      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return BeuticianLocation(
              locationData: datum,
              lat: double.parse(p.latitude.toString()),
              long: double.parse(p.longitude.toString()),);
          },));
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

class ServicesFilter {
  int status;
  Data data;

  ServicesFilter({
    required this.status,
    required this.data,
  });

  factory ServicesFilter.fromJson(Map<String, dynamic> json) => ServicesFilter(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  int count;
  List<Datum> data;

  Data({
    required this.count,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  Location? location;
  List<BeauticianServiceDetail> beauticianServiceDetails;
  List<Address> address;
  bool? isFav;

  Datum({
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
    this.location,
    required this.beauticianServiceDetails,
    required this.address,
    this.isFav,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"] ?? "",
        userId: json["userId"] ?? "",
        uid: json["uid"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        workSpaceImgs:
            List<dynamic>.from(json["workSpaceImgs"] ?? [].map((x) => x)),
        country: json["country"] ?? "",
        countryCode: json["country_code"] ?? "",
        beauticianServiceId:
            List<String>.from(json["beauticianServiceId"] ?? [].map((x) => x)),
        isProvideService: json["isProvideService"] ?? 0,
        isProvideProduct: json["isProvideProduct"] ?? 0,
        totalEmployee: json["totalEmployee"] ?? 0,
        demographicIds:
            List<dynamic>.from(json["demographicIds"] ?? [].map((x) => x)),
        hasShop: json["hasShop"] ?? 0,
        isServeAtClient: json["IsServeAtClient"] ?? 0,
        isServeAtOwnPlace: json["IsServeAtOwnPlace"] ?? 0,
        screenStatus: json["screenStatus"] ?? 0,
        isDeleted: json["isDeleted"] ?? 0,
        createdAt: DateTime.parse(json["createdAt"] ?? ""),
        updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
        v: json["__v"] ?? 0,
        businessName: json["businessName"] ?? "",
        businessNumber: json["businessNumber"] ?? 0,
        location: json["location"]!=null?Location.fromJson(json["location"]):null,
        beauticianServiceDetails: List<BeauticianServiceDetail>.from(
            json["beauticianServiceDetails"]
                .map((x) => BeauticianServiceDetail.fromJson(x))),
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    isFav: json["isFav"] ?? false
      );

  Map<String, dynamic> toJson() => {
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
        "location": location?.toJson(),
        "beauticianServiceDetails":
            List<dynamic>.from(beauticianServiceDetails.map((x) => x.toJson())),
        "address": List<Address>.from(address.map((x) => x)),
    "isFav": isFav
      };
}

class Address {
  String id;
  String address;
  String province;
  String apartment;
  String city;
  String zipCode;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Address({
    required this.id,
    required this.address,
    required this.province,
    required this.apartment,
    required this.city,
    required this.zipCode,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"] ?? "",
        address: json["address"] ?? "",
        province: json["province"] ?? "",
        apartment: json["apartment"] ?? "",
        city: json["city"] ?? "",
        zipCode: json["zipCode"].toString(),
        createdAt: DateTime.parse(json["createdAt"] ?? ""),
        updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "address": address,
        "province": province,
        "apartment": apartment,
        "city": city,
        "zipCode": zipCode,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class BeauticianServiceDetail {
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

  BeauticianServiceDetail({
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

  factory BeauticianServiceDetail.fromJson(Map<String, dynamic> json) =>
      BeauticianServiceDetail(
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

  Map<String, dynamic> toJson() => {
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

class Location {
  String type;
  List coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"] ?? "",
        coordinates: json["coordinates"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates,
      };
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
