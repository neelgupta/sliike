// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/booking_receipt.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/manage_appoinment.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_screen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class booking_summary_paymentconfirm extends StatefulWidget {
  String bookingId;
  booking_summary_paymentconfirm({Key? key, required this.bookingId})
      : super(key: key);

  @override
  State<booking_summary_paymentconfirm> createState() =>
      _booking_summary_paymentconfirmState();
}

class _booking_summary_paymentconfirmState
    extends State<booking_summary_paymentconfirm> {
  bool isLoading = false;
  List<Datum> appointment = [];
  AppointmentDetails? ad;
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
    // TODO: implement initState
    super.initState();
    appointmentDetails();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
      body:isLoading
          ? const Center(child: CircularProgressIndicator(
          color: Color(0xffDD6A03),
        ),)
          : appointment.isNotEmpty ?  SingleChildScrollView(
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
                    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                    //   return homescreen(selectedIndex: 0,);
                    // },),(route) => false,);
                  },child: const Icon(Icons.arrow_back_sharp,size: 30,)),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: width*0.35,
                    height: height*0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green
                    ),
                    child: const Text("confirmed",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Colors.white)).tr(),
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
                  CachedNetworkImage(
                    imageUrl: appointment[0].beauticianDetails.logo,
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
                  Expanded(
=======
>>>>>>> Stashed changes
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffDD6A03),
                ),
              )
            : appointment.isNotEmpty
                ? SingleChildScrollView(
<<<<<<< Updated upstream
=======
>>>>>>> e085634eae0e013d6477208019282c52491b566b
>>>>>>> Stashed changes
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
                              SizedBox(height: height * 0.01,),
                              const Text("stylist",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "spartan",
                                      color: Colors.black54)).tr(),
                              SizedBox(width: width * 0.02,),
                              appointment[0].appointmentDetails[index].stylist.isNotEmpty?Row(
                                children: [
                                  Image(
                                    image: const AssetImage("assets/images/Ellipse 150.png"),
                                    height: height * 0.04,
                                    width: width * 0.06,),
                                  SizedBox(width: width * 0.02,),
                                  Text("${appointment[0].appointmentDetails[index].stylist[0].firstName ?? ""} ${appointment[0].appointmentDetails[index].stylist[0].lastName ?? ""}",
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return manage_appoinment(
                                category: appointment[0].serviceTypeDetails[0].serviceTypeName,
                                time: "$startData - $endData",
                                businessName: appointment[0].beauticianDetails.businessName,
                                bookingId: appointment[0].appointmentDetails[index].id,
                                price: "${appointment[0].appointmentDetails[index].price}",
                                serviceDuration: appointment[0].appointmentDetails[index].serviceDetails.duration,
                                serviceId: appointment[0].appointmentDetails[index].serviceId,
                                beauticianId: appointment[0].appointmentDetails[index].beauticianId,
                              );
                            },));
                          },
                          child: Row(
                            children: [
                              const Text("mange_appointment",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "spartan",
                                      color: Color(0xffDD6A03))).tr(),
                              SizedBox(width: width*0.02,),
                              const Icon(Icons.arrow_forward_ios_sharp,size: 25,color: Color(0xffDD6A03),)
=======
>>>>>>> Stashed changes
                              InkWell(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return homescreen(
                                            selectedIndex: 0,
                                          );
                                        },
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_sharp,
                                    size: 30,
                                  )),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.35,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                child: const Text("confirmed",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.white))
                                    .tr(),
                              )
<<<<<<< Updated upstream
=======
>>>>>>> e085634eae0e013d6477208019282c52491b566b
>>>>>>> Stashed changes
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("appointment_details",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "spartan",
                                      color: Colors.black))
                              .tr(),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: appointment[0].beauticianDetails.logo,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  padding: const EdgeInsets.all(10),
                                  height: height * 0.15,
                                  width: width * 0.30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill)),
                                  margin: const EdgeInsets.all(5),
                                ),
                                progressIndicatorBuilder:
                                    (context, url, process) => Container(
                                        height: height * 0.15,
                                        width: width * 0.30,
                                        margin: const EdgeInsets.all(5),
                                        child: const Center(
                                            child:
                                                CircularProgressIndicator())),
                                errorWidget: (context, url, error) => Container(
                                    height: height * 0.15,
                                    width: width * 0.30,
                                    margin: const EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    child: Center(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.error),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        const Text("No Image")
                                      ],
                                    ))),
                              ),
                              SizedBox(
                                width: width * 0.04,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            appointment[0]
                                                .beauticianDetails
                                                .businessName,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: "spartan",
                                                color: Colors.black)),
                                        SizedBox(
                                          width: width * 0.12,
                                        ),
                                      ],
                                    ),
                                    appointment[0].beauticianDetails != null
                                        ? Text(
                                            "${appointment[0].beauticianDetails.address.address} \n ${appointment[0].beauticianDetails.address.city} ${appointment[0].beauticianDetails.address.zipCode}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontFamily: "spartan",
                                                color: Colors.blue))
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: appointment[0].appointmentDetails.length,
                            itemBuilder: (context, index) {
                              var startData = DateFormat('dd MMM,yyyy  |  h:mm')
                                  .format(DateTime.parse(
                                      '${appointment[0].appointmentDetails[index].dateTime}'));
                              var endData = DateFormat('h:mm').format(
                                  DateTime.parse(
                                      '${appointment[0].appointmentDetails[index].endDateTime}'));
                              if (appointment[0]
                                      .appointmentDetails[index]
                                      .place ==
                                  0) {
                                place = "Beautician's place";
                              } else {
                                place = "At my place";
                              }
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "$startData - $endData",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: "spartan",
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                appointment[0]
                                                    .serviceTypeDetails[0]
                                                    .serviceTypeName,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                            const Spacer(),
                                            Text(
                                                "\$${appointment[0].appointmentDetails[index].price}",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "spartan",
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        SizedBox(height: height * 0.01),
                                        // Row(
                                        //   crossAxisAlignment: CrossAxisAlignment.end,
                                        //   mainAxisAlignment: MainAxisAlignment.end,
                                        //   children: [
                                        //     Text("for ${getTimeFormatedValue(appointmentData[index].serviceId!.duration.toString())}",
                                        //         style: const TextStyle(
                                        //             fontSize: 18,
                                        //             fontFamily: "spartan",
                                        //             color: Colors.black54)),
                                        //   ],
                                        // ),
                                        SizedBox(height: height * 0.02),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          const Text(
                                            "stylist",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "spartan",
                                              color: Colors.black54,
                                            ),
                                          ).tr(),
                                          SizedBox(width: width * 0.02),
                                          appointment[0]
                                                  .appointmentDetails[index]
                                                  .stylist
                                                  .isNotEmpty
                                              ? Row(
                                                  children: [
                                                    Image(
                                                      image: const AssetImage(
                                                          "assets/images/Ellipse 150.png"),
                                                      height: height * 0.04,
                                                      width: width * 0.06,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    Text(
                                                      "${appointment[0].appointmentDetails[index].stylist[0].firstName} ${appointment[0].appointmentDetails[index].stylist[0].lastName}",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "spartan",
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : const Text(
                                                  "No Preference",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "spartan",
                                                    color: Colors.black,
                                                  ),
                                                ),
                                        ],
                                      )),
                                  SizedBox(height: height * 0.01),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Preferred place of service:",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "spartan",
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.01,
                                        ),
                                        Text(
                                          place,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: "spartan",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return manage_appoinment(
                                              category: appointment[0]
                                                  .serviceTypeDetails[0]
                                                  .serviceTypeName,
                                              time: "$startData - $endData",
                                              businessName: appointment[0]
                                                  .beauticianDetails
                                                  .businessName,
                                              bookingId: appointment[0]
                                                  .appointmentDetails[index]
                                                  .id,
                                              price:
                                                  "${appointment[0].appointmentDetails[index].price}",
                                              serviceDuration: appointment[0]
                                                  .appointmentDetails[index]
                                                  .serviceDetails
                                                  .duration,
                                              serviceId: appointment[0]
                                                  .appointmentDetails[index]
                                                  .serviceId,
                                              beauticianId: appointment[0]
                                                  .appointmentDetails[index]
                                                  .beauticianId,
                                            );
                                          },
                                        ));
                                      },
                                      child: Row(
                                        children: [
                                          const Text(
                                            "mange_appointment",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "spartan",
                                              color: Color(0xffDD6A03),
                                            ),
                                          ).tr(),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 25,
                                            color: Color(0xffDD6A03),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Container(
                          height: height * 0.06,
                          color: const Color(0xFFF3F3F3),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "total",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                  ),
                                ).tr(),
                                const Spacer(),
                                Text(
                                  "\$${appointment[0].totalPrice}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                "booking_id".tr(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(appointment[0].bookingId,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "spartan",
                                      color: Colors.black54)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return booking_receipt(
                                    bookingId: widget.bookingId,
                                  );
                                },
                              ));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: width,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffDD6A03)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: const AssetImage(
                                          "assets/images/message-text.png"),
                                      height: height * 0.05,
                                      width: width * 0.05,
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    const Text("view_receipt",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "spartan",
                                                color: Colors.white))
                                        .tr(),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFFDF8F2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Text("important_info",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "spartan",
                                              color: Color(0xffDD6A03)))
                                      .tr(),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Text("info",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: "spartan",
                                              color: Colors.black))
                                      .tr(),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Text("late_cancel",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "spartan",
                                              color: Color(0xffDD6A03)))
                                      .tr(),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        )
                      ],
                    ),
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("info",
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "spartan",
                              color: Colors.black)).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("late_cancel",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.05,)
          ],
        ),
      ):
            const Center(
        child: Text("No Data Found!!!"),
      )
    );
=======
>>>>>>> Stashed changes
                  )
                : const Center(
                    child: Text("No Data Found!!!"),
                  ));
<<<<<<< Updated upstream
=======
>>>>>>> e085634eae0e013d6477208019282c52491b566b
>>>>>>> Stashed changes
  }

  appointmentDetails() async {
    var posturi = Uri.parse(ApiUrlList.appointmentDetails);
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
        "bookingId": widget.bookingId,
        "appointmentIds": Helper.serviceId,
      };
      print(headers);
      print("addAppointment url is ====> $posturi ");
      log("addAppointment bodydata ====> $bodydata ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("addAppointment status code ====> ${response.statusCode}");
      log("addAppointment res body is ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        ad = AppointmentDetails.fromMap(jsonDecode(response.body));
        appointment = ad!.data;
        print("addAppointment status ====>  ${map['status']}");
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
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

class AppointmentDetails {
  int status;
  bool success;
  List<Datum> data;

  AppointmentDetails({
    required this.status,
    required this.success,
    required this.data,
  });

  factory AppointmentDetails.fromMap(Map<String, dynamic> json) =>
      AppointmentDetails(
        status: json["status"],
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  String id;
  int subTotal;
  int discount;
  String gstORhst;
  String pstORqst;
  String totalPrice;
  int gstORhstInPer;
  int pstORqstInPer;
  int total;
  String bookingId;
  int paymentStatus;
  CardDetails cardDetails;
  List<AppointmentDetail> appointmentDetails;
  BeauticianDetails beauticianDetails;
  List<ServiceTypeDetail> serviceTypeDetails;

  Datum({
    required this.id,
    required this.subTotal,
    required this.discount,
    required this.gstORhst,
    required this.pstORqst,
    required this.totalPrice,
    required this.gstORhstInPer,
    required this.pstORqstInPer,
    required this.total,
    required this.bookingId,
    required this.paymentStatus,
    required this.cardDetails,
    required this.appointmentDetails,
    required this.beauticianDetails,
    required this.serviceTypeDetails,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        subTotal: json["subTotal"],
        discount: json["discount"],
        gstORhst: json["gstORhst"],
        pstORqst: json["pstORqst"],
        totalPrice: json["TotalPrice"],
        gstORhstInPer: json["gstORhstInPer"],
        pstORqstInPer: json["pstORqstInPer"],
        total: json["total"],
        bookingId: json["BookingId"],
        paymentStatus: json["paymentStatus"],
        cardDetails: CardDetails.fromMap(json["cardDetails"]),
        appointmentDetails: List<AppointmentDetail>.from(
            json["appointmentDetails"]
                    .map((x) => AppointmentDetail.fromMap(x)) ??
                []),
        beauticianDetails:
            BeauticianDetails.fromMap(json["beauticianDetails"] ?? {}),
        serviceTypeDetails: List<ServiceTypeDetail>.from(
            json["ServiceTypeDetails"]
                .map((x) => ServiceTypeDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "subTotal": subTotal,
        "discount": discount,
        "gstORhst": gstORhst,
        "pstORqst": pstORqst,
        "TotalPrice": totalPrice,
        "gstORhstInPer": gstORhstInPer,
        "pstORqstInPer": pstORqstInPer,
        "total": total,
        "BookingId": bookingId,
        "paymentStatus": paymentStatus,
        "cardDetails": cardDetails.toMap(),
        "appointmentDetails":
            List<dynamic>.from(appointmentDetails.map((x) => x.toMap())),
        "beauticianDetails": beauticianDetails.toMap(),
        "ServiceTypeDetails":
            List<dynamic>.from(serviceTypeDetails.map((x) => x.toMap())),
      };
}

class AppointmentDetail {
  String id;
  String clientId;
  String beauticianId;
  String serviceId;
  String stylistId;
  DateTime dateTime;
  DateTime endDateTime;
  int price;
  int place;
  String note;
  int status;
  String paymentDetails;
  ServiceDetails serviceDetails;
  List<dynamic> stylist;

  AppointmentDetail({
    required this.id,
    required this.clientId,
    required this.beauticianId,
    required this.serviceId,
    required this.stylistId,
    required this.dateTime,
    required this.endDateTime,
    required this.price,
    required this.place,
    required this.note,
    required this.status,
    required this.paymentDetails,
    required this.serviceDetails,
    required this.stylist,
  });

  factory AppointmentDetail.fromMap(Map<String, dynamic> json) =>
      AppointmentDetail(
        id: json["_id"],
        clientId: json["clientId"],
        beauticianId: json["beauticianId"],
        serviceId: json["serviceId"],
        stylistId: json["stylistID"],
        dateTime: DateTime.parse(json["dateTime"]),
        endDateTime: DateTime.parse(json["endDateTime"]),
        price: json["price"],
        place: json["place"],
        note: json["note"],
        status: json["status"],
        paymentDetails: json["paymentDetails"],
        serviceDetails: ServiceDetails.fromMap(json["serviceDetails"]),
        stylist: List<dynamic>.from(json["Stylist"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "clientId": clientId,
        "beauticianId": beauticianId,
        "serviceId": serviceId,
        "stylistID": stylistId,
        "dateTime": dateTime.toIso8601String(),
        "endDateTime": endDateTime.toIso8601String(),
        "price": price,
        "place": place,
        "note": note,
        "status": status,
        "paymentDetails": paymentDetails,
        "serviceDetails": serviceDetails.toMap(),
        "Stylist": List<dynamic>.from(stylist.map((x) => x)),
      };
}

class ServiceDetails {
  String id;
  String serviceCategory;
  String serviceType;
  String duration;
  int price;
  String description;

  ServiceDetails({
    required this.id,
    required this.serviceCategory,
    required this.serviceType,
    required this.duration,
    required this.price,
    required this.description,
  });

  factory ServiceDetails.fromMap(Map<String, dynamic> json) => ServiceDetails(
        id: json["_id"],
        serviceCategory: json["serviceCategory"],
        serviceType: json["serviceType"],
        duration: json["duration"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "serviceCategory": serviceCategory,
        "serviceType": serviceType,
        "duration": duration,
        "price": price,
        "description": description,
      };
}

class BeauticianDetails {
  Address address;
  String businessName;
  dynamic logo;

  BeauticianDetails({
    required this.address,
    required this.businessName,
    this.logo,
  });

  factory BeauticianDetails.fromMap(Map<String, dynamic> json) =>
      BeauticianDetails(
        address: Address.fromMap(json["address"] ?? {}),
        businessName: json["businessName"],
        logo: json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "address": address.toMap(),
        "businessName": businessName,
        "logo": logo,
      };
}

class Address {
  String address;
  String province;
  String city;
  String zipCode;

  Address({
    required this.address,
    required this.province,
    required this.city,
    required this.zipCode,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        address: json["address"],
        province: json["province"],
        city: json["city"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "province": province,
        "city": city,
        "zipCode": zipCode,
      };
}

class CardDetails {
  String id;
  String cardBrand;

  CardDetails({
    required this.id,
    required this.cardBrand,
  });

  factory CardDetails.fromMap(Map<String, dynamic> json) => CardDetails(
        id: json["_id"],
        cardBrand: json["cardBrand"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "cardBrand": cardBrand,
      };
}

class ServiceTypeDetail {
  String id;
  String serviceCategoryId;
  String serviceTypeName;

  ServiceTypeDetail({
    required this.id,
    required this.serviceCategoryId,
    required this.serviceTypeName,
  });

  factory ServiceTypeDetail.fromMap(Map<String, dynamic> json) =>
      ServiceTypeDetail(
        id: json["_id"],
        serviceCategoryId: json["serviceCategoryId"],
        serviceTypeName: json["serviceTypeName"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "serviceCategoryId": serviceCategoryId,
        "serviceTypeName": serviceTypeName,
      };
}
