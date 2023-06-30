import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/add_service.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/profile_images.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../../../../../../utils/app_colors.dart';

class service_Setup_Main extends StatefulWidget {
  const service_Setup_Main({Key? key}) : super(key: key);

  @override
  State<service_Setup_Main> createState() => _service_Setup_MainState();
}

class _service_Setup_MainState extends State<service_Setup_Main> {
  bool isLoading = false;
  GetServiceDetailsData? getServiceDetailsData;

  List<Datum> localSearchData = [];
  bool isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetServiceDetails();
  }

  TextEditingController txtSearch = TextEditingController();

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
          toolbarHeight: height * 0.14, //
          flexibleSpace: Container(
            color: Color(0xffF5F7F7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Color(0xff414141))),
                              child: Center(
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/Group 55.png"),
                                      color: Color(0xff414141),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Service Set-Up",
                                    style: TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xff292929),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
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
            ? Center(
                child: CircularProgressIndicator(color: Color(0xff01635D)),
              )
            : (getServiceDetailsData != null &&
                    getServiceDetailsData!.data!.length != 0)
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: width,
                            // height: height * 0.055,

                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  searchService(value);
                                });
                              },
                              controller: txtSearch,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 12),
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.black45),
                                border: InputBorder.none,
                                hintText: "Search for services",
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: txtSearch.text.isEmpty
                                ? getServiceDetailsData!.data!.length
                                : localSearchData.length,
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: (Color(0xffCFCFCF)),
                                thickness: 1,
                                height: 1,
                              );
                            },
                            itemBuilder: (context, index) {
                              var singleServiceData = txtSearch.text.isEmpty
                                  ? getServiceDetailsData!.data![index]
                                  : localSearchData[index];

                              String previousCatName = index > 0
                                  ? txtSearch.text.isEmpty
                                      ? getServiceDetailsData!.data![index - 1]
                                          .serviceCategory!.serviceCategoryName!
                                      : localSearchData[index - 1]
                                          .serviceCategory!
                                          .serviceCategoryName!
                                  : '';
                              String catName = singleServiceData
                                  .serviceCategory!.serviceCategoryName!;

                              return Column(
                                children: [
                                  previousCatName != catName
                                      ? Container(
                                          height: 32,
                                          width: double.infinity,
                                          padding: EdgeInsets.only(left: 12),
                                          decoration: BoxDecoration(
                                            color: AppColors.greyColor
                                                .withOpacity(0.25),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                singleServiceData
                                                    .serviceCategory!
                                                    .serviceCategoryName!,
                                                style: TextStyle(
                                                  fontFamily: 'spartan',
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Profile_Images(
                                                txtSearch.text.isEmpty
                                                    ? getServiceDetailsData!
                                                        .data![index].id!
                                                    : localSearchData[index]
                                                        .id!,
                                              );
                                            },
                                          ),
                                        ).then((value) {
                                          GetServiceDetails();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  deleteServiceDetails(
                                                      txtSearch.text.isEmpty
                                                          ? getServiceDetailsData!
                                                              .data![index].id!
                                                          : localSearchData[
                                                                  index]
                                                              .id!,
                                                      index);
                                                },
                                                child: Container(
                                                  child: Image.asset(
                                                    "assets/images/delete.png",
                                                    height: 30,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    txtSearch.text.isEmpty
                                                        ? "${getServiceDetailsData!.data![index].serviceType!.serviceTypeName ?? ""}"
                                                        : "${localSearchData[index].serviceType!.serviceTypeName ?? ""}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff414141),
                                                      fontFamily: "spartan",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: height * 0.01),
                                                  Text(
                                                    txtSearch.text.isEmpty
                                                        ? "\$${getServiceDetailsData!.data![index].price ?? ""} for ${getServiceDetailsData!.data![index].duration ?? ""}"
                                                        : "\$${localSearchData[index].price ?? ""} for ${localSearchData[index].duration ?? ""}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff707070),
                                                      fontFamily: "spartan",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                  //   return ();
                                                  // },));
                                                },
                                                child: Container(
                                                  height: 15,
                                                  width: 30,
                                                  child: Image.asset(
                                                      "assets/images/righticon.png"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                    "No Data Found !!!",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return addService();
              },
            )).then((value) => GetServiceDetails());
          },
          child: Container(
            height: 50,
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff01635D),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                textComoon("ADD SERVICE", 12, Colors.white, FontWeight.w600),
                SizedBox(
                  width: width * 0.02,
                ),
                Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }

  GetServiceDetails() async {
    setState(() {
      isLoading = true;
    });
    var getUri = Uri.parse("${ApiUrlList.GetServiceDetails}");
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.get(
      getUri,
      headers: Headers,
    );
    log("GetServiceDetails Body ==> ${response.body}");
    log("GetServiceDetails Code ==> ${response.statusCode}");
    log("GetServiceDetails Code ==> ${Headers}");
    Map map = jsonDecode(response.body);
    if (map["status"] == 200) {
      getServiceDetailsData =
          GetServiceDetailsData.fromJson(jsonDecode(response.body));
      setState(() {});
    } else if (response.statusCode == 401) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return signInScreen();
        },
      ), (route) => false);
    }
    setState(() {
      isLoading = false;
    });
  }

  deleteServiceDetails(String Id, int index) async {
    setState(() {
      isLoading = true;
    });
    var getUri = Uri.parse("${ApiUrlList.deleteServiceDetails}$Id");
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.delete(
      getUri,
      headers: Headers,
    );
    log("deleteServiceDetails Body ==> ${response.body}");
    log("deleteServiceDetails Code ==> ${response.statusCode}");
    Map map = jsonDecode(response.body);
    setState(() {
      isLoading = false;
    });
    if (map["status"] == 202) {
      if (txtSearch.text.isEmpty) {
        getServiceDetailsData!.data!.removeAt(index);
      } else {
        for (int i = 0; i < getServiceDetailsData!.data!.length; i++) {
          if (localSearchData[index] == getServiceDetailsData!.data![i]) {
            getServiceDetailsData!.data!.removeAt(i);
            localSearchData.removeAt(index);
          }
        }
      }
      setState(() {});
    } else if (response.statusCode == 401) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return signInScreen();
        },
      ), (route) => false);
    }
  }

  searchService(String value) {
    if (txtSearch.text.isNotEmpty) {
      localSearchData.clear();
      for (int i = 0; i < getServiceDetailsData!.data!.length; i++) {
        if (getServiceDetailsData!
            .data![i].serviceCategory!.serviceCategoryName!
            .toLowerCase()
            .contains(txtSearch.text.toLowerCase())) {
          localSearchData.add(getServiceDetailsData!.data![i]);
          setState(() {});
        }
      }
    }
  }
}

GetServiceDetailsData getServiceDetailsDataFromJson(String str) =>
    GetServiceDetailsData.fromJson(jsonDecode(str));

String getServiceDetailsDataToJson(GetServiceDetailsData data) =>
    jsonEncode(data.toJson());

class GetServiceDetailsData {
  int? status;
  bool? success;
  List<Datum>? data;
  String? message;

  GetServiceDetailsData({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  factory GetServiceDetailsData.fromJson(Map<String, dynamic> json) =>
      GetServiceDetailsData(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  int? price;
  String? description;
  int? isDelete;
  bool? showCancelPolicy;
  dynamic imageUrl;
  String? datumId;

  Datum({
    this.id,
    this.beauticianId,
    this.serviceCategory,
    this.serviceType,
    this.duration,
    this.price,
    this.description,
    this.isDelete,
    this.showCancelPolicy,
    this.imageUrl,
    this.datumId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        beauticianId: json["beauticianId"],
        serviceCategory: json["serviceCategory"] == null
            ? null
            : ServiceCategory.fromJson(json["serviceCategory"]),
        serviceType: json["serviceType"] == null
            ? null
            : ServiceType.fromJson(json["serviceType"]),
        duration: json["duration"],
        price: json["price"],
        description: json["description"],
        isDelete: json["isDelete"],
        showCancelPolicy: json["showCancelPolicy"],
        imageUrl: json["imageUrl"],
        datumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "beauticianId": beauticianId,
        "serviceCategory": serviceCategory?.toJson(),
        "serviceType": serviceType?.toJson(),
        "duration": duration,
        "price": price,
        "description": description,
        "isDelete": isDelete,
        "showCancelPolicy": showCancelPolicy,
        "imageUrl": imageUrl,
        "id": datumId,
      };
}

class ServiceCategory {
  String? id;
  String? serviceCategoryName;

  ServiceCategory({
    this.id,
    this.serviceCategoryName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        id: json["_id"],
        serviceCategoryName: json["serviceCategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceCategoryName": serviceCategoryName,
      };
}

class ServiceType {
  String? id;
  String? serviceTypeName;

  ServiceType({
    this.id,
    this.serviceTypeName,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["_id"],
        serviceTypeName: json["serviceTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceTypeName": serviceTypeName,
      };
}
