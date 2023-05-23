// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/client_app/home_screen/search_screen.dart';
import 'dart:convert';
import '../../utils/apiurllist.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key,}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {

  bool isLoading = false;
  ServiceCategories? s;
  String selectedServiceIdValue = "";
  String? allItemName;
  List<ServiceCategorieData>? serviceName;

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
        body: isLoading ? const Center(child: CircularProgressIndicator(color: Color(0xffDD6A03),),):
          SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        },
                      child: SizedBox(
                        height: height*0.055,
                        width: width*0.05,
                        child: const Image(image: AssetImage("assets/images/Vector (1).png"),),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height*0.05,
                      width: width*0.8,
                      child: const Text("All Categories",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Expanded(
                child: GridView.builder(
                  itemCount: serviceName!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 5
                  ),
                  itemBuilder: (context, index) {
                  return  GestureDetector(
                    onTap: () {
                      print("selectedService id is  =====> ${serviceName![index].id.toString()}");
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return searchScreen(selectedService: [serviceName![index].id.toString(),]);
                      },));
                    },
                    child: Column(
                          children: [
                            Container(
                              height: height*0.20,
                              width: width*0.40,
                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Image.network("${serviceName![index].imgPath}",fit: BoxFit.fill,),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: Text("${serviceName![index].serviceCategoryName}",style: const TextStyle(color: Colors.black,fontSize: 12,fontFamily: "spartan",),
                              ),
                            ),
                          ],
                        ),
                  );
                },),
              ),
              SizedBox(height: height*0.03,)
            ],
          ),
        )
      ),
    )
    );
  }
  fetchServiceCategories() async {
    var geturi = Uri.parse(ApiUrlList.fetchServiceCategories);
    try {
      setState(() {
        isLoading = true;
      });
      print("addPersonalInfo url is :: $geturi");
      var response = await http.get(geturi);
      print("addPersonalInfo status code ==> ${response.statusCode}");
      print(" addPersonalInfo res body is :  ${response.body}");
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

  ServiceCategorieData(
      {this.id, this.serviceCategoryName,this.imgPath});

  factory ServiceCategorieData.fromjson(Map<dynamic, dynamic> map1) {
    return ServiceCategorieData(
      id: map1['_id'] ?? "",
      serviceCategoryName: map1['serviceCategoryName'] ?? "",
        imgPath: map1['imgPath'] ?? ""
    );
  }
}