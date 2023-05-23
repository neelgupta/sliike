// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import '../ beautician _page/manage_appoinment.dart';

class booking_panding extends StatefulWidget {
  const booking_panding({Key? key}) : super(key: key);

  @override
  State<booking_panding> createState() => _booking_pandingState();
}

class _booking_pandingState extends State<booking_panding> {
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
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Color(0xffDD6A03),
        ),
      ) :SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.08,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(onTap: () {
                    Navigator.pop(context);
                  },child: const Icon(Icons.arrow_back_sharp,size: 35,)),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: width*0.35,
                    height: height*0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.yellow
                    ),
                    child: const Text("pending",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Colors.black)).tr(),
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text("appointment_details",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black)).tr(),
            ),
            SizedBox(height: height*0.01,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
                          Text("${appointmentData[0].beauticianId!.businessName}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                          SizedBox(width: width*0.20,),
                          Image(image: const AssetImage("assets/images/Star 1.png"),height: height*0.04,width: width*0.04,),
                          SizedBox(width: width*0.01,),
                          const Text("4.0",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ],
                      ),
                      Text("${appointmentData[0].beauticianId!.address!.apartment} ${appointmentData[0].beauticianId!.address!.province} ${appointmentData[0].beauticianId!.address!.city} ${appointmentData[0].beauticianId!.address!.zipCode}",
                          style: const TextStyle(
                              fontSize: 10,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                      Row(
                        children: [
                          Image(image: const AssetImage("assets/images/Map pin.png"),height: height*0.04,width: width*0.04,),
                          SizedBox(width: width*0.02,),
                          const Text("6.05km",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(
              height: height * 0.5,
              child: ListView.builder(
                itemCount: appointmentData.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  beauticianId = appointmentData[index].beauticianId!.id!;
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const manage_appoinment();
                          },));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text("mange_appointment",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "spartan",
                                      color: Color(0xffDD6A03))).tr(),
                              SizedBox(width: width*0.02,),
                              const Icon(Icons.arrow_forward_ios_sharp,size: 25,color: Color(0xffDD6A03),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height*0.04,),
            Container(
              alignment: Alignment.center,
              height: height*0.06,
              color: const Color(0xFFF3F3F3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("total",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "spartan",
                            color: Colors.black)).tr(),
                    const Spacer(),
                    const Text("\$70.00",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "spartan",
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text("booking_id",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(width: width*0.02,),
                  const Text("#12DA481",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "spartan",
                          color: Colors.black54)),
                ],
              ),
            ),
            SizedBox(height: height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {},
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

                    )
                ),
              ),
            SizedBox(height: height*0.04,)
          ],
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

      print("getStylistList url is ====> $geturi ");
      var response = await http.get(geturi,headers: headers);
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
  int? price;
  int? place;
  String? note;
  int? status;
  String? createdBy;
  String? recurringOpt;
  String? createdAt;
  String? updatedAt;
  int? v;

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
    this.v,
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
      price: map1['price'] ?? 0,
      place: map1['place'] ?? 0,
      note: map1['note'] ?? "",
      status: map1['status'] ?? 0,
      createdBy: map1['createdBy'] ?? "",
      recurringOpt: map1['recurringOpt'] ?? "",
      createdAt: map1['createdAt'] ?? "",
      updatedAt: map1['updatedAt'] ?? "",
      v: map1['__v'] ?? 0,
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
      id: map3['_id'] ?? "",
      firstName: map3['firstName'] ?? "",
      lastName: map3['lastName'] ?? "",
      address: PenddingAddress.fromjson(map3['address'] ?? ""),
      businessName: map3['businessName'],
    );
  }
}

class PenddingAddress{
  String? id;
  String? address;
  String? province;
  String? apartment;
  String? city;
  int? zipCode;

  PenddingAddress({this.id,this.address,this.province,this.apartment,this.city,this.zipCode});
  factory PenddingAddress.fromjson(Map<dynamic, dynamic>map){
    return PenddingAddress(
      id: map['_id'] ?? "",
      address: map['address'] ?? "",
      province: map['province'] ?? "",
      apartment: map['apartment'] ?? "",
      city: map['city'] ?? "",
      zipCode: map['zipCode'] ?? 0,
    );
  }
}

class ServiceId {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  int? price;
  String? description;

  ServiceId({this.id,this.beauticianId,this.serviceCategory,this.serviceType,this.duration,this.price,this.description});
  factory ServiceId.fromjson(Map<dynamic,dynamic>map4){
    return ServiceId(
      id: map4['_id'] ?? "",
      beauticianId: map4['beauticianId'] ?? "",
      serviceCategory: ServiceCategory.fromjson(map4['serviceCategory'] ?? {}),
      serviceType: ServiceType.fromjson(map4['serviceType'] ?? {}),
      duration: map4['duration'] ?? "",
      price: map4['price'] ?? 0,
      description: map4['description'] ?? "",
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
      id: map3['_id'] ?? "",
      firstName: map3['firstName'] ?? "",
      lastName: map3['lastName'] ?? "",
      profileImage: map3['profileImage'] ?? "",
    );
  }
}

class ServiceCategory{
  String? id;
  String? serviceCategoryName;

  ServiceCategory({this.id,this.serviceCategoryName});
  factory ServiceCategory.fromjson(Map<dynamic,dynamic>map5){
    return ServiceCategory(
      id: map5['_id'] ?? "",
      serviceCategoryName: map5['serviceCategoryName'] ?? "",
    );
  }
}

class ServiceType{
  String? id;
  String? serviceTypeName;

  ServiceType({this.id,this.serviceTypeName});
  factory ServiceType.fromjson(Map<dynamic,dynamic>map5){
    return ServiceType(
      id: map5['_id'] ?? "",
      serviceTypeName: map5['serviceTypeName'] ?? "",
    );
  }
}
