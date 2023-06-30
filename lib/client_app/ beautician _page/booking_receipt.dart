// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/booking_summary_paymentconfirm.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../../Beautician_screen/bottomnavbar/More/help_center/contact_us_help.dart';
import '../../commonClass.dart';
import '../../utils/app_colors.dart';

class booking_receipt extends StatefulWidget {
  final String bookingId;

  booking_receipt({Key? key, required this.bookingId}) : super(key: key);

  @override
  State<booking_receipt> createState() => _booking_receiptState();
}

class _booking_receiptState extends State<booking_receipt> {
  bool isLoading = false;
  List<Datum> appointment = [];
  AppointmentDetails? ad;
  int serviceNumber = 1;
  String startDate = "";
  String endDate = "";

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xffDD6A03),
              ),
            )
          : appointment.isNotEmpty
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.08,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Image(
                                  image: AssetImage("assets/images/Vector.png"),
                                  height: 18,
                                  width: 18,
                                )),
                            SizedBox(width: width * 0.30),
                            const Text(
                              "receipt",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                color: Colors.black,
                              ),
                            ).tr(),
                          ],
                        ),
                        SizedBox(height: height * 0.04),
                        Image(
                          image:
                              const AssetImage("assets/images/Group 13210.png"),
                          height: height * 0.22,
                          width: width,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "total",
                              style: TextStyle(
                                fontSize: 25,
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
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("subtotal",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black))
                                .tr(),
                            const Spacer(),
                            Text("\$${appointment[0].subTotal}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "spartan",
                                    color: Colors.black)),
                          ],
                        ),

                        appointment[0].discount == 0
                            ? SizedBox()
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "discount",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ).tr(),
                                    const Spacer(),
                                    Text(
                                      "\$${appointment[0].discount}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                        appointment[0].gst != "0.00"
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "gst",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ).tr(),
                                    const Spacer(),
                                    Text(
                                      "\$${appointment[0].gst}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),

                        appointment[0].hst != "0.00"
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "hst",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ).tr(),
                                    const Spacer(),
                                    Text(
                                      "\$${appointment[0].hst}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),

                        appointment[0].qst != "0.00"
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "qst",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ).tr(),
                                    const Spacer(),
                                    Text(
                                      "\$${appointment[0].qst}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),

                        appointment[0].pst != "0.00"
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "pst",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ).tr(),
                                    const Spacer(),
                                    Text(
                                      "\$${appointment[0].pst}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(height: height * 0.02),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "total_charged",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "spartan",
                                color: Colors.black,
                              ),
                            ).tr(),
                            const Spacer(),
                            Text(
                              "\$${appointment[0].totalPrice}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                  "assets/images/Frame 427320901.png"),
                              height: 34,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: width * 0.03),
                            Text(
                              appointment[0].cardDetails != null
                                  ? "${appointment[0].cardDetails!.cardBrand}"
                                  : "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.08),
                        const Text(
                          "service_details",
                          style: TextStyle(
                            fontFamily: "spartan",
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ).tr(),
                        Text(
                          "$startDate - $endDate",
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 24),
                        ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          itemCount:
                              // appointment[0].appointmentDetails != []
                              //     ?
                              appointment[0].appointmentDetails.length,
                          // : null,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.greyColor
                                            .withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: appointment[0]
                                            .beauticianDetails
                                            .logo,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 77,
                                          width: 87,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fill),
                                          ),
                                          margin: const EdgeInsets.all(5),
                                        ),
                                        progressIndicatorBuilder:
                                            (context, url, process) =>
                                                Container(
                                          height: 77,
                                          width: 87,
                                          margin: const EdgeInsets.all(5),
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          height: 77,
                                          width: 87,
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
                                                SizedBox(height: 10),
                                                const Text("No Image")
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: width * 0.04),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                appointment[0]
                                                    .beauticianDetails
                                                    .businessName,
                                                style: const TextStyle(
                                                  fontFamily: "spartan",
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(width: width * 0.1),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "${appointment[0].beauticianDetails.address.address} \n${appointment[0].beauticianDetails.address.city} ${appointment[0].beauticianDetails.address.zipCode}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "spartan",
                                              color: AppColors.blueColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 24),
                                Text(
                                  "service : ",
                                  style: TextStyle(
                                    fontFamily: "spartan",
                                    color: AppColors.blackTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${appointment[0].serviceTypeDetails.first.serviceTypeName}",
                                      style: TextStyle(
                                        fontFamily: "spartan",
                                        color: AppColors.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${appointment[0].appointmentDetails.first.serviceDetails.duration}",
                                      style: TextStyle(
                                        fontFamily: "spartan",
                                        color: AppColors.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                const Divider(
                                  color: Colors.black54,
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      "Stylist:",
                                      style: TextStyle(
                                        fontFamily: "spartan",
                                        color: AppColors.blackTextColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "No preference",
                                      style: TextStyle(
                                        fontFamily: "spartan",
                                        color: AppColors.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(height: 8),
                                // const Divider(
                                //   color: Colors.black54,
                                // ),
                                // SizedBox(height: 15),
                                // Row(
                                //   children: [
                                //     Image.asset(
                                //       "assets/images/Map pin.png",
                                //       height: 24,
                                //       width: 24,
                                //     ),
                                //     SizedBox(width: 10),
                                //     Text(
                                //       "Preffered place of service:",
                                //       style: TextStyle(
                                //         fontFamily: "spartan",
                                //         color: AppColors.blackTextColor,
                                //         fontSize: 15,
                                //         fontWeight: FontWeight.w500,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Text(
                                //   "${appointment[0].serviceTypeDetails.first}",
                                //   style: TextStyle(
                                //     fontFamily: "spartan",
                                //     color: AppColors.blackTextColor,
                                //     fontSize: 15,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                              ],
                            );
                          },
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       decoration: BoxDecoration(
                        //         color: AppColors.greyColor.withOpacity(0.15),
                        //         borderRadius: BorderRadius.circular(8),
                        //       ),
                        //       child: CachedNetworkImage(
                        //         imageUrl: appointment[0].beauticianDetails.logo,
                        //         imageBuilder: (context, imageProvider) =>
                        //             Container(
                        //           padding: const EdgeInsets.all(10),
                        //           height: 77,
                        //           width: 87,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(8),
                        //               image: DecorationImage(
                        //                   image: imageProvider,
                        //                   fit: BoxFit.fill)),
                        //           margin: const EdgeInsets.all(5),
                        //         ),
                        //         progressIndicatorBuilder:
                        //             (context, url, process) => Container(
                        //           height: 77,
                        //           width: 87,
                        //           margin: const EdgeInsets.all(5),
                        //           child: const Center(
                        //               child: CircularProgressIndicator()),
                        //         ),
                        //         errorWidget: (context, url, error) => Container(
                        //             height: 77,
                        //             width: 87,
                        //             margin: const EdgeInsets.all(5),
                        //             alignment: Alignment.center,
                        //             child: Center(
                        //                 child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.center,
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               children: [
                        //                 const Icon(Icons.error),
                        //                 SizedBox(height: 10),
                        //                 const Text("No Image")
                        //               ],
                        //             ))),
                        //       ),
                        //     ),
                        //     SizedBox(width: width * 0.04),
                        //     Expanded(
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               appointment[0]
                        //                           .beauticianDetails
                        //                           .businessName ==
                        //                       null
                        //                   ? Text("")
                        //                   : Text(
                        //                       appointment[0]
                        //                           .beauticianDetails
                        //                           .businessName,
                        //                       style: const TextStyle(
                        //                         fontFamily: "spartan",
                        //                         color: Colors.black,
                        //                         fontSize: 15,
                        //                         fontWeight: FontWeight.w500,
                        //                       ),
                        //                     ),
                        //               SizedBox(width: width * 0.12),
                        //             ],
                        //           ),
                        //           Text(
                        //             "${appointment[0].beauticianDetails.address.address} \n${appointment[0].beauticianDetails.address.city} ${appointment[0].beauticianDetails.address.zipCode}",
                        //             style: TextStyle(
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w500,
                        //               fontFamily: "spartan",
                        //               color: AppColors.blueColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // ),
                        SizedBox(height: 10),
                        // appointment[0].appointmentDetails.isNotEmpty
                        //     ?
                        // ListView.builder(
                        //   shrinkWrap: true,
                        //   itemCount:
                        //       // appointment[0].appointmentDetails != []
                        //       //     ?
                        //       appointment[0].appointmentDetails.length,
                        //   // : null,
                        //   itemBuilder: (context, index) {
                        //     return Column(
                        //       children: [
                        //         Text("Service $serviceNumber:",
                        //             style: const TextStyle(
                        //                 fontSize: 16,
                        //                 fontFamily: "spartan",
                        //                 color: Colors.black54)),
                        //         SizedBox(height: height * 0.01),
                        //         Row(
                        //           crossAxisAlignment: CrossAxisAlignment.end,
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //                 appointment[0]
                        //                     .serviceTypeDetails[0]
                        //                     .serviceTypeName,
                        //                 style: const TextStyle(
                        //                     fontSize: 18,
                        //                     fontFamily: "spartan",
                        //                     color: Colors.black)),
                        //             const Spacer(),
                        //             Text(
                        //                 "for ${getTimeFormatedValue(appointment[0].appointmentDetails[0].serviceDetails.duration)}",
                        //                 style: const TextStyle(
                        //                     fontSize: 16,
                        //                     fontFamily: "spartan",
                        //                     color: Colors.black)),
                        //           ],
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // ),
                        // : Container(),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        // appointment[0].appointmentDetails == []
                        //     ? const Center(
                        //         child: Text("No Data Found!!"),
                        //       )
                        //     : Row(
                        //         children: [
                        //           CachedNetworkImage(
                        //             imageUrl:
                        //                 appointment[0].appointmentDetails == []
                        //                     ? appointment[0]
                        //                         .appointmentDetails[0]
                        //                         .stylist[0]
                        //                         .profileImage
                        //                     : "",
                        //             imageBuilder: (context, imageProvider) =>
                        //                 Container(
                        //               padding: const EdgeInsets.all(10),
                        //               height: height * 0.15,
                        //               width: width * 0.30,
                        //               decoration: BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(8),
                        //                   image: DecorationImage(
                        //                       image: imageProvider,
                        //                       fit: BoxFit.fill)),
                        //               margin: const EdgeInsets.all(5),
                        //             ),
                        //             progressIndicatorBuilder:
                        //                 (context, url, process) => Container(
                        //                     height: height * 0.15,
                        //                     width: width * 0.30,
                        //                     margin: const EdgeInsets.all(5),
                        //                     child: const Center(
                        //                         child:
                        //                             CircularProgressIndicator())),
                        //             errorWidget: (context, url, error) =>
                        //                 Container(
                        //                     height: height * 0.15,
                        //                     width: width * 0.30,
                        //                     margin: const EdgeInsets.all(5),
                        //                     alignment: Alignment.center,
                        //                     child: Center(
                        //                         child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.center,
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment.center,
                        //                       children: [
                        //                         const Icon(Icons.error),
                        //                         SizedBox(
                        //                           height: height * 0.02,
                        //                         ),
                        //                         const Text("No Image")
                        //                       ],
                        //                     ))),
                        //           ),
                        //           SizedBox(
                        //             width: width * 0.02,
                        //           ),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               const Text("stylist",
                        //                       style: TextStyle(
                        //                           fontSize: 16,
                        //                           fontFamily: "spartan",
                        //                           color: Colors.black54))
                        //                   .tr(),
                        //               SizedBox(
                        //                 height: height * 0.01,
                        //               ),
                        //               appointment[0]
                        //                       .appointmentDetails
                        //                       .isNotEmpty
                        //                   ? Text(
                        //                       appointment[0]
                        //                               .appointmentDetails[0]
                        //                               .stylist
                        //                               .isNotEmpty
                        //                           ? "${appointment[0].appointmentDetails[0].stylist[0].firstName} ${appointment[0].appointmentDetails[0].stylist[0].lastName}"
                        //                           : "",
                        //                       style: const TextStyle(
                        //                           fontSize: 16,
                        //                           fontFamily: "spartan",
                        //                           color: Colors.black))
                        //                   : Text("")
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        // SizedBox(height: 10),
                        // const Divider(
                        //   color: Colors.black54,
                        // ),
                        // SizedBox(
                        //   height: height * 0.03,
                        // ),
                        const Text(
                          "download_pdf",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Color(0xffDD6A03),
                          ),
                        ).tr(),
                        SizedBox(height: 10),
                        const Divider(
                          color: Colors.black54,
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return contact_us_beauty();
                              },
                            ));
                          },
                          child: Row(
                            children: [
                              const Text(
                                "contact_support",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Color(0xffDD6A03),
                                ),
                              ).tr(),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Color(0xffDD6A03),
                              ),
                              SizedBox(width: 5)
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Text("No Data Found!!!"),
                ),
    );
  }

  appointmentDetails() async {
    var posturi = Uri.parse(ApiUrlList.appointmentDetails);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var bodydata = {
        "bookingId": widget.bookingId,
        "appointmentIds": Helper.serviceId,
      };
      print("addAppointment url is ====> $posturi ");
      print("addAppointment bodydata ====> $bodydata ");
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

        if (appointment[0].appointmentDetails.isNotEmpty) {
          log("appointment[0].appointmentDetails[0].dateTime : ${appointment[0].appointmentDetails[0].dateTime}");
          log("appointment[0].appointmentDetails[0].endDateTime : ${appointment[0].appointmentDetails[0].endDateTime}");
          startDate = DateFormat('dd MMM,yyyy  |  h:mm').format(DateTime.parse(
              '${appointment[0].appointmentDetails[0].dateTime}'));
          // endDate = DateFormat('h:mm').format(DateTime.parse(
          //     '${appointment[0].appointmentDetails[0].endDateTime} '));
        }

        print("addAppointment status ====>  ${map['status']}");
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      } else {}
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
