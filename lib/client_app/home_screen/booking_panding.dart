// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/select_address.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import '../ beautician _page/manage_appoinment.dart';

class booking_panding extends StatefulWidget {
  String? id;
  bool ? isPast;
  booking_panding({Key? key,this.id, this.isPast}) : super(key: key);

  @override
  State<booking_panding> createState() => _booking_pandingState();
}

class _booking_pandingState extends State<booking_panding> {
  bool isLoading = false;
  OnlyoneModal? onlyonemodal;
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
        formatedTime = "120 min";
        break;
      case "02:30":
        formatedTime = "150 min";
        break;
      case "03:00":
        formatedTime = "180 min";
        break;
      case "03:30":
        formatedTime = "210 min";
        break;
      case "04:00":
        formatedTime = "240 min";
        break;
      case "04:30":
        formatedTime = "270 min";
        break;
      case "05:00":
        formatedTime = "300 min";
        break;
      case "05:30":
        formatedTime = "330 min";
        break;
      case "06:00":
        formatedTime = "360 min";
        break;
      case "06:30":
        formatedTime = "390 min";
        break;
    }
    return formatedTime;
  }
  @override
  void initState() {
    super.initState();
    print("widget.id =====> ${widget.id}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        getAppointmentPastList(widget.id);
        print(widget.isPast);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var startData = onlyonemodal != null ? DateFormat('dd MMM,yyyy  |  h:mm').format(DateTime.parse('${onlyonemodal!.data!.dateTime}')): "";
    var endData = onlyonemodal != null ? DateFormat('h:mm').format(DateTime.parse('${onlyonemodal!.data!.endDateTime}')): "";
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
        body: isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xffDD6A03),
          ),
        ) : onlyonemodal != null ? SingleChildScrollView(
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: onlyonemodal!.data!.beauticianId!.logoPath ?? '',
                      imageBuilder: (context, imageProvider) => Container(
                        padding:
                        const EdgeInsets.all(10),
                        height: height * 0.15,
                        width: width * 0.30,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(8),
                            image: DecorationImage(image: imageProvider,fit: BoxFit.fill)
                        ),
                        margin: const EdgeInsets.all(5),
                      ),
                      progressIndicatorBuilder: (context, url, process) => Container(
                          height: height * 0.15,
                          width: width * 0.30,
                          margin: const EdgeInsets.all(5),
                          child: const Center(child: CircularProgressIndicator())
                      ),
                      errorWidget: (context, url, error) => Container(
                          height: height * 0.15,
                          width: width * 0.30,
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
                    SizedBox(width: width*0.04,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("${onlyonemodal!.data!.beauticianId!.businessName}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "spartan",
                                    color: Colors.black)),
                            SizedBox(width: width*0.20,),
                            // Image(image: const AssetImage("assets/images/Star 1.png"),height: height*0.04,width: width*0.04,),
                            // SizedBox(width: width*0.01,),
                            // const Text("4.0",
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontFamily: "spartan",
                            //         color: Colors.black)),
                          ],
                        ),
                        Text("${onlyonemodal!.data!.beauticianId!.address!.apartment} ${onlyonemodal!.data!.beauticianId!.address!.city} ${onlyonemodal!.data!.beauticianId!.address!.zipCode}",
                            style: const TextStyle(
                                fontSize: 10,
                                fontFamily: "spartan",
                                color: Colors.black54)),
                        // Row(
                        //   children: [
                        //     Image(image: const AssetImage("assets/images/Map pin.png"),height: height*0.04,width: width*0.04,),
                        //     SizedBox(width: width*0.02,),
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
              SizedBox(height: height*0.02,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.black54,),
              ),
              Column(
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
                            Text("${onlyonemodal!.data!.serviceId!.serviceType!.serviceTypeName}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "spartan",
                                    color: Colors.black)),
                            const Spacer(),
                            Text("\$${onlyonemodal!.data!.serviceId!.price}",
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
                            Text("for ${getTimeFormatedValue(onlyonemodal!.data!.serviceId!.duration.toString())}",
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
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Divider(color: Colors.black54,),
                  // ),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20),
                  //     child: Row(
                  //       children: [
                  //         SizedBox(height: height * 0.01,),
                  //         const Text("stylist",
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontFamily: "spartan",
                  //                 color: Colors.black54)).tr(),
                  //         SizedBox(width: width * 0.02,),
                  //         onlyonemodal!.data!.stylistID!.firstName != ""?Row(
                  //           children: [
                  //             Image(
                  //               image: const AssetImage("assets/images/Ellipse 150.png"),
                  //               height: height * 0.04,
                  //               width: width * 0.06,),
                  //             SizedBox(width: width * 0.02,),
                  //             Text("${appointmentData[index].stylistID!.firstName} ${appointmentData[index].stylistID!.lastName}",
                  //                 style: const TextStyle(
                  //                     fontSize: 16,
                  //                     fontFamily: "spartan",
                  //                     color: Colors.black
                  //                 )
                  //             ),
                  //           ],
                  //         ): const Text("No Preference",
                  //             style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontFamily: "spartan",
                  //                 color: Colors.black)),
                  //       ],
                  //     )
                  // ),
                  // SizedBox(height: height * 0.01,),
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
                  if(widget.isPast ?? true)GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return  manage_appoinment(
                          category: onlyonemodal!.data!.serviceId!.serviceType!.serviceTypeName,
                          time: "$startData - $endData",
                          businessName: onlyonemodal!.data!.beauticianId!.businessName,
                          bookingId: widget.id,
                          price: "${onlyonemodal!.data!.serviceId!.price}",
                          serviceDuration: onlyonemodal!.data!.serviceId!.duration,
                          serviceId: onlyonemodal!.data!.serviceId!.id,
                          beauticianId: onlyonemodal!.data!.serviceId!.beauticianId,
                        );
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
              ),
              // SizedBox(
              //   height: height * 0.5,
              //   child: ListView.builder(
              //     itemCount: appointmentData.length,
              //     padding: EdgeInsets.zero,
              //     itemBuilder: (context, index) {
              //       var startData = DateFormat('dd MMM,yyyy  |  h:mm').format(DateTime.parse('${appointmentData[index].dateTime}'));
              //       var endData = DateFormat('h:mm').format(DateTime.parse('${appointmentData[index].endDateTime}'));
              //       return ;
              //     },
              //   ),
              // ),
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
                      Text("\$${onlyonemodal!.data!.serviceId!.price}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.05,),
              if(widget.isPast ?? true)Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                    onTap: () {
                      Helper.serviceId.clear();
                      Helper.serviceId.add(widget.id);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const SelectAddress();
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

                    )
                ),
              ),
              SizedBox(height: height*0.04,)
            ],
          )
        ): const Center(
    child: Text(
    "No Data Found!!!",
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: "spartan",
      ),
    ),
    ),
    );
  }
  getAppointmentPastList(id) async {
    try {
      setState(() {
        isLoading = true;
      });
      var geturi = Uri.parse("${ApiUrlList.getSingleAppointmentData}$id");
      print("getSingleAppointmentData uri=$geturi");
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getSingleAppointmentData response.body ==> ${response.body}");
      log("getSingleAppointmentData status code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        onlyonemodal = OnlyoneModal.fromJson(jsonDecode(response.body));
        if(onlyonemodal!.data!.place == 0){
          setState(() {
            place = "Beautician’s place";
          });
        }else{
          setState(() {
            place = "At my place";
          });
        }
        setState(() {});
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

class OnlyoneModal {
  int? status;
  bool? success;
  Data? data;
  String? message;

  OnlyoneModal({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  factory OnlyoneModal.fromJson(Map<String, dynamic> json) => OnlyoneModal(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  String? id;
  String? clientId;
  BeauticianId? beauticianId;
  ServiceId? serviceId;
  // dynamic stylistId;
  DateTime? dateTime;
  DateTime? endDateTime;
  int? price;
  int? place;
  String? note;
  int? status;
  String? createdBy;
  // dynamic recurringOpt;
  String? createdAt;
  String? updatedAt;
  // int? v;
  PaymentDetails? paymentDetails;
  RatingData? ratingData;

  Data({
    this.id,
    this.clientId,
    this.beauticianId,
    this.serviceId,
    // this.stylistId,
    this.dateTime,
    this.endDateTime,
    this.price,
    this.place,
    this.note,
    this.status,
    this.createdBy,
    // this.recurringOpt,
    this.createdAt,
    this.updatedAt,
    // this.v,
    this.paymentDetails,
    this.ratingData
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    clientId: json["clientId"],
    beauticianId: json["beauticianId"] == null ? null : BeauticianId.fromJson(json["beauticianId"]),
    serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
    // stylistId: json["stylistID"],
    dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    endDateTime: json["endDateTime"] == null ? null : DateTime.parse(json["endDateTime"]),
    //   dateTime: json["dateTime"] == null ? null : "",
    // endDateTime: json["endDateTime"] == null ? null : "",
    price: json["price"],
    place: json["place"],
    note: json["note"],
    status: json["status"],
    createdBy: json["createdBy"],
    // recurringOpt: json["recurringOpt"],
    // createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    // updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    // v: json["__v"],
    paymentDetails: json["paymentDetails"] == null ? null :  PaymentDetails.fromJson(json["paymentDetails"]),
    ratingData: json["ratingData"] == null ? null : RatingData.fromJson(json["ratingData"])
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "clientId": clientId,
    "beauticianId": beauticianId?.toJson(),
    "serviceId": serviceId?.toJson(),
    // "stylistID": stylistId,
    // "dateTime": dateTime?.toIso8601String(),
    // "endDateTime": endDateTime?.toIso8601String(),
    "price": price,
    "place": place,
    "note": note,
    "status": status,
    "createdBy": createdBy,
    // "recurringOpt": recurringOpt,
    // "createdAt": createdAt?.toIso8601String(),
    // "updatedAt": updatedAt?.toIso8601String(),
    // "__v": v,
    "paymentDetails": paymentDetails,
    "ratingData" : ratingData
  };
}

class BeauticianId {
  String? id;
  Address? address;
  String? businessName;
  String? logoPath;
  // List<dynamic>? workSpaceImgPaths;
  // String? beauticianIdId;

  BeauticianId({
    this.id,
    this.address,
    this.businessName,
    // this.logoPath,
    // this.workSpaceImgPaths,
    // this.beauticianIdId,
  });

  factory BeauticianId.fromJson(Map<String, dynamic> json) => BeauticianId(
    id: json["_id"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    businessName: json["businessName"],
    // logoPath: json["logoPath"] ?? "",
    // workSpaceImgPaths: json["workSpaceImgPaths"] == null ? [] : List<dynamic>.from(json["workSpaceImgPaths"]!.map((x) => x)),
    // beauticianIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address?.toJson(),
    "businessName": businessName,
    // "logoPath": logoPath,
    // "workSpaceImgPaths": workSpaceImgPaths == null ? [] : List<dynamic>.from(workSpaceImgPaths!.map((x) => x)),
    // "id": beauticianIdId,
  };
}

class Address {
  String? id;
  String? address;
  Province? province;
  String? apartment;
  String? city;
  String? zipCode;

  Address({
    this.id,
    this.address,
    this.province,
    this.apartment,
    this.city,
    this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["_id"],
    address: json["address"],
    province: Province.fromjson(json["province"]),
    apartment: json["apartment"],
    city: json["city"],
    zipCode: json["zipCode"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "address": address,
    "province": province,
    "apartment": apartment,
    "city": city,
    "zipCode": zipCode,
  };
}

class Province{
  String? id;
  String? name;

  Province({
    this.id,
    this.name
  });

  factory Province.fromjson(Map<dynamic, dynamic>map){
    return Province(
      id: map['_id'] ?? "",
      name:                                   map['name'] ?? "",
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

  ServiceId({
    this.id,
    this.beauticianId,
    this.serviceCategory,
    this.serviceType,
    this.duration,
    this.price,
    this.description,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    beauticianId: json["beauticianId"],
    serviceCategory: json["serviceCategory"] == null ? null : ServiceCategory.fromJson(json["serviceCategory"]),
    serviceType: json["serviceType"] == null ? null : ServiceType.fromJson(json["serviceType"]),
    duration: json["duration"],
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "beauticianId": beauticianId,
    "serviceCategory": serviceCategory?.toJson(),
    "serviceType": serviceType?.toJson(),
    "duration": duration,
    "price": price,
    "description": description,
  };
}

class ServiceCategory {
  String? id;
  String? serviceCategoryName;

  ServiceCategory({
    this.id,
    this.serviceCategoryName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => ServiceCategory(
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
    id: json["_id"] ?? "",
    serviceTypeName: json["serviceTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceTypeName": serviceTypeName,
  };
}

class PaymentDetails {
  String id;
  String bookingId;

  PaymentDetails({
    required this.id,
    required this.bookingId,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
    id: json["_id"],
    bookingId: json["BookingId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "BookingId": bookingId,
  };
}

class RatingData {
  double rating;
  String reviews;

  RatingData({
    required this.rating,
    required this.reviews,
  });

  factory RatingData.fromJson(Map<String, dynamic> json) => RatingData(
    rating: json["rating"] ?? 0.0,
    reviews: json["reviews"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "reviews": reviews,
  };
}
