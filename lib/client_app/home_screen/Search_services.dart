// ignore_for_file: use_build_context_synchronously, camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/near_you_screen.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/search_screen.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';

class searchservices extends StatefulWidget {
  const searchservices({Key? key}) : super(key: key);

  @override
  State<searchservices> createState() => _searchservicesState();
}

class _searchservicesState extends State<searchservices> {
  List<ServiceCategorieData> serviceName = [];
  ServiceCategories? s;
  bool isLoading = false;
  List<String> selectedService = [];
  List<String> selectedServiceSearch = [];
  List<String> selectedServiceId = [];
  List<String> selectedDemography = [];
  List<ServiceTypes> searchData = [];
  SearchService? ss;
  TextEditingController searchCotroller = TextEditingController();
  double height = 0;
  double width = 0;
  bool searchbyservice = false;
  String ShowServiceName = "";
  String latitude = "";
  String longitude = "";
  String address = "";

  @override
  void initState() {
    super.initState();
    fetchServiceCategories();
    // searchServiceType();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return WillPopScope(
        onWillPop: () async {
      if(searchbyservice) {
        setState(() {
          searchbyservice = false;
        });
        return false;
      } else {
        Navigator.pop(context);
        return true;
      }
    },
      child: Scaffold(
        body: isLoading
            ? const Center(
            child: CircularProgressIndicator(
            color: Color(0xffDD6A03),
          ),
        ) :
         SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      if(searchbyservice) {
                        setState(() {
                          searchbyservice = false;
                        });
                      } else {Navigator.pop(context);}
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(height:height*0.03 ,"assets/images/Group 55.png",),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                        if(!searchbyservice) {
                          setState(() {
                            searchbyservice = true;
                          });
                        }
                        print(searchbyservice);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: height*0.07,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: TextField(
                        controller: searchCotroller,
                        readOnly: !searchbyservice,
                        onTap: () {
                          if(!searchbyservice) {
                            setState(() {
                              searchbyservice = true;
                            });
                          }
                        },
                        onEditingComplete: () {
                            setState(() {
                              searchServiceType();
                            });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for services or stylist",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  searchbyservice?serviceSearch():search()
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  Widget search() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const NearYou();
                      },
                    )).then((value) {
                      if (value != null) {
                        latitude = value[0];
                        longitude = value[1];
                        address = value[2];
                        setState(() {});
                      }
                    });
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10)),
                          border:
                          Border.all(color: Colors.grey)),
                      height: height * 0.06,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 10),
                            child: Image(
                                image: const AssetImage(
                                  "assets/images/Group 71.png",
                                ),
                                color: const Color(0xFFDD5103),
                                height: height * 0.03),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              address.isEmpty
                                  ? "Near You"
                                  : address,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                              const TextStyle(fontSize: 12),
                            ),
                          ),
                          address.isEmpty
                              ? Container()
                              : InkWell(
                              onTap: () {
                                setState(() {
                                  address = "";
                                  latitude = "";
                                  longitude = "";
                                });
                              },
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.black12,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)),
                        border: Border.all(color: Colors.grey)),
                    height: height * 0.06,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 5),
                          child: Image(
                              image: const AssetImage(
                                "assets/images/note.png",
                              ),
                              color: const Color(0xFFDD5103),
                              height: height * 0.03),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "When?",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          runSpacing: 10,
          spacing: 8,
          children: [
            for (int i = 0; i < serviceName.length; i++)
              GestureDetector(
                onTap: () {
                  ShowServiceName = "";
                  setState(() {
                    serviceName[i].isSelected = !serviceName[i].isSelected;
                    ShowServiceName  = serviceName[i].serviceCategoryName!;
                  });
                  print(ShowServiceName);
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
        const SizedBox(height: 30,),
        GestureDetector(
          onTap: () {
            selectedService.clear();
            for (var item in serviceName) {
              if (item.isSelected) {
                selectedService.add(item.id!);
              }
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return searchScreen(
                selectedService: selectedService,
                  serviceName: ShowServiceName,
                latitude: latitude,
                longitude: longitude,
                isMultipleSearched: selectedService.length == 1 ?false : true,
              );
            },));
          },
          child: Container(
            alignment: Alignment.center,
            height: height * 0.07,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFDD5103)),
                color: const Color(0xFFDD5103),
                borderRadius: const BorderRadius.all(
                    Radius.circular(5)
                )
            ),
            child: const Text(
              "APPLY",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          alignment: Alignment.topLeft,
          child: const Text("Recent searches",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: height*0.6,
          child: const Center(child: Text("No data Found!!",style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: "spartan")))
          // ListView.builder(itemCount: 5,itemBuilder: (context, index) {
          //   return Container(
          //     margin: const EdgeInsets.symmetric(vertical: 5),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           width: width*0.15,
          //           height: width*0.15,
          //           decoration: BoxDecoration(
          //               image: const DecorationImage(
          //                 image: AssetImage("assets/images/Group 12006.jpg"),
          //                 fit: BoxFit.fill
          //               ),
          //               borderRadius: BorderRadius.circular(5)
          //           ),
          //         ),
          //         SizedBox(
          //           width: width*0.02,
          //         ),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(width: width*0.75,child: const Text("Queens Palace",style: TextStyle(fontSize: 13,fontFamily: "spartan",color: Colors.black45),)),
          //             SizedBox(width: width*0.75,child: const Text("Route Du 3e-rang,Collingwood, qc, Canada",style: TextStyle(fontSize: 12,fontFamily: "spartan",color: Color(0xFF1571ED))))
          //           ],
          //         )
          //       ],
          //     ),
          //   );
          // },),
        )
      ],
    );
  }

  Widget serviceSearch() {
    height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    return isLoading
        ? const Center(
      child: CircularProgressIndicator(
        color: Color(0xffDD6A03),
      ),
    ) :
    searchData.isNotEmpty ? Column(
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
    ):
    searchCotroller.text.isEmpty ? Container() :
    Container(
    height: height *0.75,
      child: const Center(
        child: Text("Not yet available. More beauty experience coming soon.")
      ));
  }

  fetchServiceCategories() async {
    var geturi = Uri.parse(ApiUrlList.fetchServiceCategories);
    try {
      setState(() {
        isLoading = true;
      });
      log("addPersonalInfo url is :: $geturi");
      var response = await http.get(geturi);
      selectedService.clear();
      log("addPersonalInfo status code ==> ${response.statusCode}");
      log(" addPersonalInfo res body is :  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          s = ServiceCategories.fromjson(map);
          serviceName = s!.data!;
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

  searchServiceType() async {
    var geturi = Uri.parse("https://sliike-server.onrender.com/api/v1/client/searchServiceType?search=${searchCotroller.text}");
    try {
      setState(() {
        isLoading = true;
      });
      log("searchServiceType url is :: $geturi");
      var response = await http.get(geturi);
      selectedServiceSearch.clear();
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
  bool isSelected;

  ServiceCategorieData(
      {this.id, this.serviceCategoryName, this.isSelected = false});

  factory ServiceCategorieData.fromjson(Map<dynamic, dynamic> map1) {
    return ServiceCategorieData(
      id: map1['_id'] ?? "",
      serviceCategoryName: map1['serviceCategoryName'] ?? "",
    );
  }
}


class SearchService{
  int? status;
  Data? data;

  SearchService({this.status,this.data});
  factory SearchService.fromjson(Map<dynamic, dynamic>map){
    return SearchService(
      status: map['status'] ?? 0,
      data: Data.fromjson(map['data'] ?? {}),
    );
  }
}

class Data{
  List<ServiceTypes>? serviceTypes;
  List<BeuticianTypes>? beuticianTypes;

  Data({this.serviceTypes,this.beuticianTypes});
  factory Data.fromjson(Map<dynamic,dynamic>map){
    List list = map['serviceTypes'];
    List list1 = map['beuticianTypes'];
    List<ServiceTypes> serviceTypes = list.map((e) => ServiceTypes.fromjson(e)).toList();
    List<BeuticianTypes> beuticianTypes = list1.map((e) => BeuticianTypes.fromjson(e)).toList();
    return Data(
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
