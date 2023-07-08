// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/client_app/brands_page/product_description.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

import '../../utils/apiurllist.dart';

class product_info extends StatefulWidget {
  const product_info({Key? key}) : super(key: key);

  @override
  State<product_info> createState() => _product_infoState();
}

class _product_infoState extends State<product_info> {
  bool isSelected = false;
  MyFavorites? mf;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle 28.png"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
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
                              image: AssetImage("assets/images/Group 55.png"),
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Matte Liquid Lipstick",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xffDD6A03),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: width,
                        height: height * 0.6,
                        child: Image.asset(
                          "assets/images/Rectangle 907 (1).png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: const Text("Rose",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w600)),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (isSelected) {
                                  setState(() {
                                    removeFromMyFavorites();
                                    isSelected = false;
                                  });
                                } else {
                                  setState(() {
                                    addToMyFavorites();
                                    isSelected = true;
                                  });
                                }
                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffffffff),
                                    border: Border.all(
                                        color: const Color(0xffCFCFCF),
                                        width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    "assets/images/fav_ornage.png",
                                    fit: BoxFit.fill,
                                    height: 20,
                                    color: isSelected
                                        ? const Color(0xFFDD6A03)
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text("Rose",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600)),
                              ),
                              const Text("Makeup kit",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: "spartan")),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (isSelected) {
                                setState(() {
                                  removeFromMyFavorites();
                                  isSelected = false;
                                });
                              } else {
                                setState(() {
                                  addToMyFavorites();
                                  isSelected = true;
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xffCFCFCF),
                                      width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/fav_ornage.png",
                                  fit: BoxFit.fill,
                                  height: 20,
                                  color: isSelected
                                      ? const Color(0xFFDD6A03)
                                      : Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xffCFCFCF),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: textComoon("Rose Products", 15, Colors.black87,
                            FontWeight.w700),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: MasonryGridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: height * 0.30,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color(
                                  0xffE7E7E7,
                                ),
                                width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const product_description();
                                    },
                                  ));
                                },
                                child: Container(
                                  height: height * 0.20,
                                  width: width,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Rectangle 946.png"),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 10),
                                child: textComoon("Rose Lip Gloss", 14,
                                    Colors.black87, FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  top: 5,
                                ),
                                child: textComoon("\$999", 14, Colors.black87,
                                    FontWeight.w700),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                ],
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
        "beauticianId": "644fc30825a9d72cd96329eb",
      };
      print("addPersonalInfo url is ====> $posturi ");
      print("req bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("addPersonalInfo status code ====> ${response.statusCode}");
      print(" addPersonalInfo res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          mf = MyFavorites.fromjson(map);
          showToast(
            message: "${map['message']}",);
        } else {
          showToast(
            message: "${map['message']}",);
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
        "beauticianId": "644fc30825a9d72cd96329eb",
      };
      print("addPersonalInfo url is ====> $posturi ");
      print("req bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("addPersonalInfo status code ====> ${response.statusCode}");
      print(" addPersonalInfo res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          mf = MyFavorites.fromjson(map);
          showToast(
            message: "${map['message']}",);
        } else {
          showToast(
            message: "${map['message']}",);
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
