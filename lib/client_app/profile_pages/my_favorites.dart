// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';


class my_favorites extends StatefulWidget {
  const my_favorites({Key? key}) : super(key: key);

  @override
  State<my_favorites> createState() => _my_favoritesState();
}

class _my_favoritesState extends State<my_favorites> {
  bool services = true;
  bool products = false;
  bool brands = false;
  bool isLoading = false;
  FavoriteList ? f;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Color(0xffDD6A03),
        ),
      ) :SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("my_favorites",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)).tr(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.04,),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        services = true;
                        products = false;
                        brands = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height*0.05,
                      width: width*0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: services?const Color(0xFFDD5103):Colors.black),
                          color: services?const Color(0xFFDD5103):Colors.white
                      ),
                      child: Text("services",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "spartan",
                              color: services?Colors.white:Colors.black)).tr(),
                    ),
                  ),
                  SizedBox(width: width*0.02,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        services = false;
                        products = true;
                        brands = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height*0.05,
                      width: width*0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: products?const Color(0xFFDD5103):Colors.black),
                          color: products?const Color(0xFFDD5103):Colors.white
                      ),
                      child: Text("products",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: products?Colors.white:Colors.black)).tr(),
                    ),
                  ),
                  SizedBox(width: width*0.02,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        services = false;
                        products = false;
                        brands = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height*0.05,
                      width: width*0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: brands?const Color(0xFFDD5103):Colors.black),
                          color: brands?const Color(0xFFDD5103):Colors.white
                      ),
                      child: Text("brands",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: brands?Colors.white:Colors.black)).tr(),
                    ),
                  ),
                ],
              ),
              services == true?Column(
                children: [
                  SizedBox(height: height*0.20,),
                  SizedBox(
                    height: height*0.15,
                    width: width*0.30,
                    child: Image.asset("assets/images/Group 13183.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(height: height*0.02,),
                  const Text("favorites",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)).tr(),
                  SizedBox(height: height*0.02,),
                  const Text("about",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontFamily: "spartan")).tr(),
                  SizedBox(height: height*0.02,),
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
                            color: Colors.white)).tr(),
                  ),
                ],
              ):products == true? Column(
                children: [
                  SizedBox(height: height*0.04,),
                  Row(
                    children: [
                      SizedBox(
                          height: height*0.12,
                          width: width*0.25,
                          child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                      SizedBox(width: width*0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Subaru Hair Dye",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "spartan",
                                      color: Colors.black)),
                              SizedBox(width: width*0.20,),
                              Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                            ],
                          ),
                          const Text("\$999",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      SizedBox(
                          height: height*0.12,
                          width: width*0.25,
                          child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                      SizedBox(width: width*0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Subaru Hair Dye",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "spartan",
                                      color: Colors.black)),
                              SizedBox(width: width*0.20,),
                              Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                            ],
                          ),
                          const Text("\$999",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ), SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                ],
              ): Column(
                children: [
                  SizedBox(height: height*0.04,),
                  Row(
                    children: [
                      SizedBox(
                          height: height*0.12,
                          width: width*0.25,
                          child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                      SizedBox(width: width*0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Lakme",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "spartan",
                                      color: Colors.black)),
                              SizedBox(width: width*0.35,),
                              Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                            ],
                          ),
                          const Text("Beauty Brand",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      SizedBox(
                          height: height*0.12,
                          width: width*0.25,
                          child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                      SizedBox(width: width*0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Joe Fresh",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "spartan",
                                      color: Colors.black)),
                              SizedBox(width: width*0.30,),
                              Image(image: const AssetImage("assets/images/heart-2.png"),height: height*0.04,),
                            ],
                          ),
                          const Text("Fashion Brand",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ), SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                ],
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
        "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      log("addPersonalInfo url is :: $Posturi");

      var response = await http.get(
        Posturi,
        headers: headers,
      );

      log("addPersonalInfo status code ==> ${response.statusCode}");
      log(" addPersonalInfo res body is :  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          f = FavoriteList.fromjson(map);
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
}

class FavoriteList {
  String? status;
  String? success;
  String? data;
  String? message;

  FavoriteList({this.status,this.success,this.data,this.message});

  factory FavoriteList.fromjson(Map<dynamic, dynamic>map){
    return FavoriteList(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      data: map['data'],
      message: map['message'] ?? ""
    );
  }
}

// class Data {
//  List<favoritesData>? favoritesList;
//
// }