import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/search_screen.dart';

import '../../utils/apiurllist.dart';
import '../../utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/client_app/home_screen/near_you_screen.dart';
import '../../commonClass.dart';

class AdvancedSearch extends StatefulWidget {
  const AdvancedSearch({Key? key}) : super(key: key);

  @override
  State<AdvancedSearch> createState() => _AdvancedSearchState();
}

class _AdvancedSearchState extends State<AdvancedSearch> {
  TextEditingController search = TextEditingController();
  List<ServiceCategorieData> serviceName = [];
  List<String> selectedService = [];
  List<ServiceTypes> searchData = [];
  ServiceCategories? s;
  bool isLoading = false;
  bool isLoadingData = false;
  String latitude = "";
  String longitude = "";
  List<Datum> datum = [];
  ServicesFilter? sf;
  MyFavorites? mf;
  String beauticianId = "";
  SearchService? ss;

  @override
  void initState() {
    fetchServiceCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xffDD6A03),
          ),
        ) :
        SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bgappbar.png"),fit: BoxFit.fill,
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20,left: width*0.03,right: width*0.03,),
                        padding: const EdgeInsets.only(),
                        height: height*0.06,
                        width: width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: TextField(
                          controller: search,
                          onEditingComplete: (){
                            setState(() {
                              searchServiceType();
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What are you looking for?",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 12, right: 12, bottom: 10),
                              child: SizedBox(
                                height: 5,
                                child: Image.asset("assets/images/search-normal.png"),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white
                              ),
                              height: height*0.06,
                              width: width*0.43,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Image(image: const AssetImage("assets/images/Group 71.png",),color: const Color(0xFFDD5103),height: width*0.05),
                                  ),
                                  SizedBox(width: width*0.02,),
                                  InkWell(onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return const NearYou();
                                    },)).then((value) {
                                      if (value!=null) {
                                        latitude = value[0];
                                        longitude = value[1];
                                        setState(() {
                                          findServices();
                                        });
                                      }
                                    });
                                  },
                                      child: SizedBox(width: width*0.32,child: const Text("Near You",maxLines: 1,style: TextStyle(fontSize: 14,fontFamily: 'spartan'),)))
                                ],
                              )
                          ),
                          SizedBox(width: width*0.06,),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white
                              ),
                              height: height*0.06,
                              width: width*0.43,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Image(image: const AssetImage("assets/images/note.png",),color: const Color(0xFFDD5103),height: width*0.05),
                                  ),
                                  SizedBox(width: width*0.02,),
                                  SizedBox(width: width*0.32,child: const Text("When?",style: TextStyle(fontSize: 14,fontFamily: "spartan"),))
                                ],
                              )
                          ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: 10,
                        spacing: 25,
                        children: [
                          for (int i = 0; i < serviceName.length; i++)
                            GestureDetector(
                              onTap: () {
                                searchData.clear();
                                setState(() {
                                  serviceName[i].isSelected = !serviceName[i].isSelected;
                                  for (var item in serviceName) {
                                    if (item.isSelected) {
                                      selectedService.add(item.id!);
                                      findServices();
                                    }
                                  }
                                });
                              },
                              child: Container(
                                height: height * 0.06,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: serviceName[i].isSelected
                                            ? const Color(0xFFDD5103)
                                            : Colors.black45),
                                    color: serviceName[i].isSelected
                                        ? const Color(0xFFDD5103)
                                        : Colors.transparent),
                                child: Text(
                                  "${serviceName[i].serviceCategoryName}",
                                  style: TextStyle(
                                      fontFamily: "spartan",
                                      fontSize: 16,
                                      color: serviceName[i].isSelected
                                          ? Colors.white
                                          : Colors.black54),
                                ),
                              ),
                            )
                        ],
                      ),
                      SizedBox(height: height*0.04,),
                      if(datum.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 15),
                          child: Container(alignment: Alignment.centerLeft,child: Text("${datum.length} Result Found",style: const TextStyle(color: Colors.black,fontSize: 18,fontFamily: "spartan",fontWeight: FontWeight.w800))),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      isLoadingData
                          ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xffDD6A03),
                        ),
                      )  : SizedBox(),
                      if(datum.isNotEmpty) SizedBox(
                        height: height * 0.90,
                        child: datum.isNotEmpty?ListView.builder(
                          itemCount: datum.length,
                          itemBuilder: (context, index) {
                            beauticianId = datum[index].id;
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return services(beauticianId: datum[index].id,businessName: datum[index].businessName);
                                      }),
                                );
                                print("selectedFavoritesId ======> ${datum[index]}");
                              },
                              child: Container(
                                width: width,
                                color: Colors.white,
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 15),
                                      child: Container(
                                          height: height * 0.20,
                                          width: width,
                                          // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(s?.data?[index].imgPath!))),
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
                                    Padding(padding: const EdgeInsets.only(left: 20,right: 15),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(datum[index].businessName,style: const TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                                                ),
                                                SizedBox(width: width*0.01),
                                                if(datum[index].isLicensed=="1")
                                                SizedBox(height: height*0.03,
                                                  child: const Image(image: NetworkImage("assets/images/Subtract (1).png")),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    if (datum[index].isSelected = false) {
                                                      setState(() {
                                                        removeFromMyFavorites();
                                                        datum[index].isSelected = false;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        addToMyFavorites();
                                                        datum[index].isSelected = true;
                                                      });
                                                    }
                                                  },
                                                  child: Icon(Icons.favorite,color: datum[index].isSelected! ? const Color(0xFFDD5103) : Colors.black45,size: 30),
                                                ),
                                                SizedBox(width: width*0.02)

                                              ],
                                            ),
                                            const SizedBox(height: 5,),
                                            datum[index].address.isEmpty
                                                ? const SizedBox()
                                                : Text("${datum[index].address[0].apartment} ${datum[index].address[0].province} ${datum[index].address[0].city} ${datum[index].address[0].zipCode}",style: const TextStyle(color: Colors.black,fontSize: 12,fontFamily: "spartan")),
                                            const SizedBox(height: 5,),
                                            // Row(
                                            //   children: [
                                            //     SizedBox(height: height*0.02,
                                            //       child:const Image(image: AssetImage("assets/images/Star 1.png")),
                                            //     ),
                                            //     const SizedBox(width: 5,),
                                            //     Container(
                                            //       alignment: Alignment.topLeft,
                                            //       child: const Text("4.0 Ratings",style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: "spartan")),
                                            //     ),
                                            //     const SizedBox(width: 5,),
                                            //     Container(
                                            //       alignment: Alignment.topLeft,
                                            //       child: const Text("120reviews",style: TextStyle(color: Colors.grey,fontSize: 14,fontFamily: "spartan")),
                                            //     ),
                                            //
                                            //   ],
                                            // ),
                                            const SizedBox(height: 10,),
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              ),
                            );
                          },):
                        const Center(
                          child: Text("No Data Found!!!"),
                        ),
                      ),
                      if(searchData.isNotEmpty)Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          searchData.isNotEmpty?const Text("Services",style: TextStyle(fontFamily: "spartan",fontWeight: FontWeight.bold,fontSize: 18),):Container(),
                          searchData.isNotEmpty?SizedBox(height: height*0.03,):Container(),
                          searchData.isNotEmpty?ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchData.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: height*0.007),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return searchScreen(
                                        searchService: [searchData[index].serviceCategoryId!],
                                      );
                                    },));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: width*0.08,
                                        width: width*0.08,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFFF2994A)),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Image.asset("assets/images/search.png",height: width*0.04,color: const Color(0xFFF2994A),),
                                      ),
                                      SizedBox(width: width*0.02,),
                                      Text("${searchData[index].serviceTypeName}",style: const TextStyle(fontFamily: "spartan",color: Colors.black,fontSize: 12),)
                                    ],
                                  ),
                                ),
                              );
                            },):Container(),
                          searchData.isNotEmpty?SizedBox(height: height*0.02,):Container(),
                          ss!=null &&  ss!.data!=null&&  (ss!.data!.beuticianTypes ?? []).isNotEmpty?const Text("Beutician",style: TextStyle(fontFamily: "spartan",fontWeight: FontWeight.bold,fontSize: 18),):Container(),
                          SizedBox(height: height*0.03,),
                          ss!=null &&  ss!.data!=null&&  (ss!.data!.beuticianTypes ?? []).isNotEmpty?ListView.builder(
                            shrinkWrap: true,
                            itemCount: ss!.data!.beuticianTypes!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return services(
                                      beauticianId: "${ss!.data!.beuticianTypes![index].id}",
                                      businessName: ss!.data!.beuticianTypes![index].businessName,
                                    );
                                  },));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: height*0.007),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: width*0.08,
                                        width: width*0.08,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            image: const DecorationImage(
                                                image: AssetImage("assets/images/Group 12006.jpg"),
                                                fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                      SizedBox(width: width*0.02,),
                                      Text("${ss!.data!.beuticianTypes![index].businessName}",style: const TextStyle(fontFamily: "spartan",color: Colors.black,fontSize: 12),)
                                    ],
                                  ),
                                ),
                              );
                            },):Container(),
                        ],
                      ),
                      // search.text.isEmpty ? Container() :
                    ],
                  ),
                )
              ],
            )
        ),
      ),
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
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  fetchServiceCategories() async {
    var geturi = Uri.parse(ApiUrlList.fetchServiceCategories);
    try {
      setState(() {
        isLoading = true;
      });
      log("fetchServiceCategories url is :: $geturi");
      var response = await http.get(geturi);
      log("fetchServiceCategories status code ==> ${response.statusCode}");
      log(" fetchServiceCategories res body is :  ${response.body}");
      selectedService.clear();
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          s = ServiceCategories.fromjson(map);
          serviceName = s!.data!;
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
        isLoadingData = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      log("selectedService ====> $selectedService");
      var bodydata = {
        "services": selectedService,
        "demography": [],
        "maxPrice": "",
        "gender": "",
        "serveAt": "",
        "longitude": longitude,
        "latitude": latitude,
        "sortBy":  ""
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
          });
        }

        setState(() {
          isLoadingData = false;
        });
      }else if(response.statusCode == 401){
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return signInScreen();
        },), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }


  searchServiceType() async {
    var geturi = Uri.parse("https://sliike-server.onrender.com/api/v1/client/searchServiceType?search=${search.text}");
    try {
      setState(() {
        isLoading = true;
      });
      log("searchServiceType url is :: $geturi");
      var response = await http.get(geturi);
      datum.clear();
      log("searchServiceType status code ==> ${response.statusCode}");
      log(" searchServiceType res body is :  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          ss = SearchService.fromjson(map);
          searchData = ss!.data!.serviceTypes!;
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
  bool isSelected;

  ServiceCategorieData(
      {this.id, this.serviceCategoryName, this.imgPath,this.isSelected = false});

  factory ServiceCategorieData.fromjson(Map<dynamic, dynamic> map1) {
    return ServiceCategorieData(
        id: map1['_id'] ?? "",
        serviceCategoryName: map1['serviceCategoryName'] ?? "",
        imgPath: map1['imgPath'] ?? ""
    );
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
  Location location;
  List<BeauticianServiceDetail> beauticianServiceDetails;
  List<Address> address;
  bool? isSelected;
  int isLicensed;

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
    required this.location,
    required this.beauticianServiceDetails,
    required this.address,
    this.isSelected = false,
    required this.isLicensed,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] ?? "",
    userId: json["userId"] ?? "",
    uid: json["uid"] ?? "",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    workSpaceImgs: List<dynamic>.from(json["workSpaceImgs"] ?? [].map((x) => x)),
    country: json["country"] ?? "",
    countryCode: (json["country_code"] ?? "").toString(),
    beauticianServiceId: List<String>.from(json["beauticianServiceId"] ?? [].map((x) => x)),
    isProvideService: json["isProvideService"] ?? 0,
    isProvideProduct: json["isProvideProduct"] ?? 0,
    totalEmployee: json["totalEmployee"] ?? 0,
    demographicIds: List<dynamic>.from(json["demographicIds"] ?? [].map((x) => x)),
    hasShop: json["hasShop"] ?? 0,
    isServeAtClient: json["IsServeAtClient"] ?? 0,
    isServeAtOwnPlace: json["IsServeAtOwnPlace"] ?? 0 ,
    screenStatus: json["screenStatus"] ?? 0,
    isDeleted: json["isDeleted"] ?? 0,
    createdAt: DateTime.parse(json["createdAt"] ?? ""),
    updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
    v: json["__v"] ?? 0,
    businessName: json["businessName"] ?? "",
    businessNumber: json["businessNumber"] ?? 0,
    location: Location.fromJson(json["location"] ?? {}),
    beauticianServiceDetails: List<BeauticianServiceDetail>.from(json["beauticianServiceDetails"].map((x) => BeauticianServiceDetail.fromJson(x))),
    address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    isLicensed: json["isLicensed"] ?? 0
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
    "location": location.toJson(),
    "beauticianServiceDetails": List<dynamic>.from(beauticianServiceDetails.map((x) => x.toJson())),
    "address": List<dynamic>.from(address.map((x) => x.toJson())),
    "isLicensed" : isLicensed
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

  factory BeauticianServiceDetail.fromJson(Map<String, dynamic> json) => BeauticianServiceDetail(
    id: json["_id"] ?? "",
    beauticianId: json["beauticianId"] ?? "",
    serviceCategory: json["serviceCategory"] ?? "",
    serviceType: json["serviceType"] ?? "",
    duration: json["duration"] ?? "",
    price: json["price"] ?? 0,
    description: json["description"] ?? "",
    v: json["__v"] ?? 0,
    createdAt: DateTime.parse(json["createdAt"] ?? ""),
    updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
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
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"] ?? "",
    coordinates: List<double>.from(json["coordinates"] ?? [].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<double>.from(coordinates.map((x) => x)),
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


/// Advance Search Data Class ///
class SearchService{
  int? status;
  Datad? data;

  SearchService({this.status,this.data});
  factory SearchService.fromjson(Map<dynamic, dynamic>map){
    return SearchService(
      status: map['status'] ?? 0,
      data: Datad.fromjson(map['data'] ?? {}),
    );
  }
}

class Datad{
  List<ServiceTypes>? serviceTypes;
  List<BeuticianTypes>? beuticianTypes;

  Datad({this.serviceTypes,this.beuticianTypes});
  factory Datad.fromjson(Map<dynamic,dynamic>map){
    List list = map['serviceTypes'];
    List list1 = map['beuticianTypes'];
    List<ServiceTypes> serviceTypes = list.map((e) => ServiceTypes.fromjson(e)).toList();
    List<BeuticianTypes> beuticianTypes = list1.map((e) => BeuticianTypes.fromjson(e)).toList();
    return Datad(
      serviceTypes: serviceTypes,
      beuticianTypes: beuticianTypes,
    );
  }
}

class ServiceTypes{
  String? id;
  String? serviceCategoryId;
  String? serviceTypeName;
  bool isSelected;

  ServiceTypes({this.id,this.serviceCategoryId,this.serviceTypeName,this.isSelected = false});
  factory ServiceTypes.fromjson(Map<dynamic,dynamic>map1){
    return ServiceTypes(
      id: map1['_id'] ?? '',
      serviceCategoryId: map1['serviceCategoryId'] ?? '',
      serviceTypeName: map1['serviceTypeName'] ?? '',
    );
  }
}

class BeuticianTypes{
  String? id;
  String? businessName;

  BeuticianTypes({this.id,this.businessName});
  factory BeuticianTypes.fromjson(Map<dynamic,dynamic>map){
    return BeuticianTypes(
      id: map['_id'],
      businessName: map['businessName'],
    );
  }
}
