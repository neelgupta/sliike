// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/book_appoinment_payment.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_screen.dart';

import '../../commonClass.dart';
import '../../utils/apiurllist.dart';
import '../../utils/preferences.dart';

class booking_summary extends StatefulWidget {
  const booking_summary({Key? key}) : super(key: key);

  @override
  State<booking_summary> createState() => _booking_summaryState();
}

class _booking_summaryState extends State<booking_summary> {
  bool isLoading = false;
  BookedPendingAppointment? ba;
  List<Data> appointmentData = [];
  String beauticianId = "";
  String place = "";
  getTimeFormatedValue(String minute) {
    String formatedTime = "";
    switch (minute) {
      case "00:30":
        formatedTime = "30 min";
        break;
      case "01:00":
        formatedTime = "60 min";
        break;
      case "01:30":
        formatedTime = "90 min";
        break;
      case "02:00":
        formatedTime = "110 min";
        break;
      case "02:30":
        formatedTime = "140 min";
        break;
      case "03:00":
        formatedTime = "170 min";
        break;
      case "03:30":
        formatedTime = "200 min";
        break;
      case "04:00":
        formatedTime = "230 min";
        break;
      case "04:30":
        formatedTime = "260 min";
        break;
      case "05:00":
        formatedTime = "290 min";
        break;
      case "05:30":
        formatedTime = "310 min";
        break;
      case "06:00":
        formatedTime = "340 min";
        break;
      case "06:30":
        formatedTime = "360 min";
        break;
    }
    return formatedTime;
  }
  @override
  void initState() {
    super.initState();
    getBookedPendingAppointment();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return homescreen();
        },), (route) => false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.13, // Set this height
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFCF0E6),
                image: DecorationImage(
                    image: AssetImage("assets/images/bgappbar.png"),
                    fit: BoxFit.fill)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                            return homescreen();
                          },), (route) => false);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: height * 0.06,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(image: AssetImage(
                                  "assets/images/Group 55.png"),
                                color: Colors.black,)),
                        ),
                      ),
                      SizedBox(width: width * 0.10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("appointment_summary",
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
              ],
            ),
          ),
        ),
        body: isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xffDD6A03),
          ),
        ) :SingleChildScrollView(
          child: appointmentData.isNotEmpty ?
          Column(
            children: [
              SizedBox(height: height * 0.04,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                        height: height * 0.15,
                        width: width * 0.30,
                        child: const Image(
                          image: AssetImage("assets/images/Rectangle 944.png"),
                          fit: BoxFit.fill,)),
                    SizedBox(width: width * 0.04,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("${appointmentData[0].beauticianId!.businessName}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "spartan",
                                    color: Colors.black)),
                            SizedBox(width: width * 0.12,),
                            // Image(image: const AssetImage(
                            //     "assets/images/Star 1.png"),
                            //   height: height * 0.04,
                            //   width: width * 0.04,),
                            // SizedBox(width: width * 0.01,),
                            // const Text("4.0",
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontFamily: "spartan",
                            //         color: Colors.black)),
                          ],
                        ),
                        Text("${appointmentData[0].beauticianId!.address!.apartment} ${appointmentData[0].beauticianId!.address!.province} ${appointmentData[0].beauticianId!.address!.city} ${appointmentData[0].beauticianId!.address!.zipCode}",
                            style: const TextStyle(
                                fontSize: 10,
                                fontFamily: "spartan",
                                color: Colors.black54)),
                        // Row(
                        //   children: [
                        //     Image(image: const AssetImage(
                        //         "assets/images/Map pin.png"),
                        //       height: height * 0.04,
                        //       width: width * 0.04,),
                        //     SizedBox(width: width * 0.02,),
                        //     const Text("6.05km",
                        //         style: TextStyle(
                        //             fontSize: 16,
                        //             fontFamily: "spartan",
                        //             color: Colors.black)),
                        //   ],
                        // )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.02,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.black54,),
              ),
              SizedBox(
                height: height * 0.5,
                child: ListView.builder(
                  itemCount: appointmentData.length,
                    itemBuilder: (context, index) {
                      String beauticianId = appointmentData[index].beauticianId!.id!;
                      var startData = DateFormat('dd MMM,yyyy  |  h:mm').format(DateTime.parse('${appointmentData[index].dateTime}'));
                      var endData = DateFormat('h:mm').format(DateTime.parse('${appointmentData[index].endDateTime}'));
                      print("stylist name ====> ${appointmentData[index].stylistID?.firstName}");
                      if(appointmentData[index].place == 0){
                        place = "Beautician’s place";
                      }else{
                        place = "At my place";
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.03,),
                                Row(
                                  children: [
                                    Text("$startData - $endData",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  ],
                                ),
                                SizedBox(height: height * 0.03,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("${appointmentData[index].serviceId!.serviceType!.serviceTypeName}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                    const Spacer(),
                                    Text("\$${appointmentData[index].serviceId!.price}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  ],
                                ),
                                SizedBox(height: height * 0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("for ${getTimeFormatedValue(appointmentData[index].serviceId!.duration.toString())}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "spartan",
                                            color: Colors.black54)),
                                  ],
                                ),
                                SizedBox(height: height * 0.02,),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(color: Colors.black54,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                SizedBox(height: height * 0.01,),
                                const Text("stylist",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black54)).tr(),
                                SizedBox(width: width * 0.02,),
                                appointmentData[index].stylistID!.firstName != ""?Row(
                                  children: [
                                    Image(
                                      image: const AssetImage("assets/images/Ellipse 150.png"),
                                      height: height * 0.04,
                                      width: width * 0.06,),
                                    SizedBox(width: width * 0.02,),
                                    Text("${appointmentData[index].stylistID!.firstName} ${appointmentData[index].stylistID!.lastName}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.black
                                        )
                                    ),
                                  ],
                                ): const Text("No Preference",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black)),
                              ],
                            )
                          ),
                          SizedBox(height: height * 0.01,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(color: Colors.black54,),
                          ),
                          SizedBox(height: height * 0.01,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Preferred place of service:",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black54)),
                                SizedBox(width: width*0.01,),
                                Text(place,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(color: Colors.black54,),
                          ),
                        ],
                      );
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return services(beauticianId: beauticianId);
                    },));
                  },
                  child: Row(
                    children: [
                      Image(image: const AssetImage(
                          "assets/images/Group 12095.png"),
                        height: height * 0.04,
                        width: width * 0.06,),
                      SizedBox(width: width * 0.02,),
                      const Text("add_another_service",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))).tr(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    appointmentData.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const book_appoinment_payment();
                    },));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffDD6A03)),
                    child: const Text("go_to_payment",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.white)).tr(),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05,)
            ],
          ) : const SizedBox(child: const Center(child: Text('No Data Found'),),),
        ),
      ),
    );
  }
  getBookedPendingAppointment() async {
    var geturi = Uri.parse(ApiUrlList.getBookedPendingAppointment);
    try {
      setState(() {
        isLoading = true;
      });

      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var bodydata = {
        "appointmentIds": Helper.serviceId
      };

      print("booking summary body : ${jsonEncode(bodydata)}");

      print("getStylistList url is ====> $geturi ");
      var response = await http.post(
          geturi,
          body: jsonEncode(bodydata),
          headers: headers);
      print("getStylistList status code ====> ${response.statusCode}");
      log(" getStylistList res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          ba = BookedPendingAppointment.fromjson(map);
          appointmentData = ba!.data!;
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

class BookedPendingAppointment {
  int? status;
  bool? success;
  List<Data>? data;

  BookedPendingAppointment({this.status, this.success, this.data});

  factory BookedPendingAppointment.fromjson(Map<dynamic, dynamic>map){
    List list = map['data'];
    List<Data> data = list.map((e) => Data.fromjson(e)).toList();
    return BookedPendingAppointment(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      data: data,
    );
  }
}

class Data {
  String? id;
  String? clientId;
  BeauticianId? beauticianId;
  ServiceId? serviceId;
  StylistID? stylistID;
  String? dateTime;
  String? endDateTime;
  String? price;
  String? place;
  String? note;
  String? status;
  String? createdBy;
  String? recurringOpt;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.clientId,
    this.beauticianId,
    this.serviceId,
    this.stylistID,
    this.dateTime,
    this.endDateTime,
    this.price,
    this.place,
    this.note,
    this.status,
    this.createdBy,
    this.recurringOpt,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromjson(Map<dynamic, dynamic>map1){
    return Data(
      id: map1['_id'] ?? "",
      clientId: map1['clientId'] ?? "",
      beauticianId: BeauticianId.fromjson(map1['beauticianId'] ?? {}),
      serviceId: ServiceId.fromjson(map1['serviceId'] ?? {}),
      stylistID: StylistID.fromjson(map1['stylistID'] ?? {}),
      dateTime: map1['dateTime'] ?? "",
      endDateTime: map1['endDateTime'] ?? "",
      price: (map1['price'] ?? 0).toString(),
      place: (map1['place'] ?? 0).toString(),
      note: map1['note'] ?? "",
      status: (map1['status'] ?? 0).toString(),
      createdBy: (map1['createdBy'] ?? "").toString(),
      recurringOpt: (map1['recurringOpt'] ?? "").toString(),
      createdAt: (map1['createdAt'] ?? ""),
      updatedAt: map1['updatedAt'] ?? "",
    );
  }
}

class BeauticianId {
  String? id;
  String? firstName;
  String? lastName;
  PenddingAddress? address;
  String? businessName;

  BeauticianId({this.id,this.firstName,this.lastName,this.address,this.businessName});
  factory BeauticianId.fromjson(Map<dynamic,dynamic>map3){
    return BeauticianId(
      id: (map3['_id'] ?? "").toString(),
      firstName: (map3['firstName'] ?? "").toString(),
      lastName: (map3['lastName'] ?? "").toString(),
      address: PenddingAddress.fromjson(map3['address'] ?? ""),
      businessName: (map3['businessName'] ?? "").toString(),
    );
  }
}

class PenddingAddress{
  String? id;
  String? address;
  String? province;
  String? apartment;
  String? city;
  String? zipCode;

  PenddingAddress({this.id,this.address,this.province,this.apartment,this.city,this.zipCode});
  factory PenddingAddress.fromjson(Map<dynamic, dynamic>map){
    return PenddingAddress(
      id: (map['_id'] ?? "").toString(),
      address: (map['address'] ?? "").toString(),
      province: (map['province'] ?? "").toString(),
      apartment: (map['apartment'] ?? "").toString(),
      city: (map['city'] ?? "".toString()),
      zipCode: (map['zipCode'] ?? "0").toString(),
    );
  }
}

class ServiceId {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  String? price;
  String? description;

  ServiceId({this.id,this.beauticianId,this.serviceCategory,this.serviceType,this.duration,this.price,this.description});
  factory ServiceId.fromjson(Map<dynamic,dynamic>map4){
    return ServiceId(
      id: (map4['_id'] ?? "").toString(),
      beauticianId: (map4['beauticianId'] ?? "").toString(),
      serviceCategory: ServiceCategory.fromjson(map4['serviceCategory'] ?? {}),
      serviceType: ServiceType.fromjson(map4['serviceType'] ?? {}),
      duration: (map4['duration'] ?? "").toString(),
      price: (map4['price'] ?? "0").toString(),
      description: (map4['description'] ?? "").toString(),
    );
  }
}

class StylistID {
  String? id;
  String? firstName;
  String? lastName;
  String? profileImage;

  StylistID({this.id,this.firstName,this.lastName,this.profileImage});
  factory StylistID.fromjson(Map<dynamic,dynamic>map3){
    return StylistID(
      id: (map3['_id'] ?? "").toString(),
      firstName: (map3['firstName'] ?? "").toString(),
      lastName: (map3['lastName'] ?? "").toString(),
      profileImage: (map3['profileImage'] ?? "").toString(),
    );
  }
}

class ServiceCategory{
  String? id;
  String? serviceCategoryName;

  ServiceCategory({this.id,this.serviceCategoryName});
  factory ServiceCategory.fromjson(Map<dynamic,dynamic>map5){
    return ServiceCategory(
      id: (map5['_id'] ?? "").toString(),
      serviceCategoryName: (map5['serviceCategoryName'] ?? "").toString(),
    );
  }
}

class ServiceType{
  String? id;
  String? serviceTypeName;

  ServiceType({this.id,this.serviceTypeName});
  factory ServiceType.fromjson(Map<dynamic,dynamic>map5){
    return ServiceType(
      id: (map5['_id'] ?? "").toString(),
      serviceTypeName: (map5['serviceTypeName'] ?? "").toString(),
    );
  }
}