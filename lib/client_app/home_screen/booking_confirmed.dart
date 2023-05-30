import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/booking_receipt.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/manage_appoinment.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/booking_panding.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class BookingConfirmed extends StatefulWidget {
  String? id;
  BookingConfirmed({Key? key,this.id}) : super(key: key);

  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        getAppointmentPastList(widget.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var startData = onlyonemodal != null ? DateFormat('dd MMM,yyyy  |  h:mm').format(DateTime.parse('${onlyonemodal!.data!.dateTime}')):const SizedBox();
    var endData = onlyonemodal != null ? DateFormat('h:mm').format(DateTime.parse('${onlyonemodal!.data!.endDateTime}')):const SizedBox();
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Color(0xffDD6A03),
        ),
      ) : onlyonemodal != null ? SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.08,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(onTap: () {
                    Navigator.pop(context);
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
                      Text("${onlyonemodal!.data!.beauticianId!.businessName}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Text("${onlyonemodal!.data!.beauticianId!.address!.apartment} ${onlyonemodal!.data!.beauticianId!.address!.city} ${onlyonemodal!.data!.beauticianId!.address!.zipCode}",
                          style: const TextStyle(
                              fontSize: 10,
                              fontFamily: "spartan",
                              color: Colors.blue)),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return manage_appoinment(
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
            SizedBox(height: height*0.04,),
            Container(
              height: height*0.06,
              color: const Color(0xFFF3F3F3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  Text(onlyonemodal!.data!.paymentDetails!.bookingId,
                      style: const TextStyle(
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return booking_receipt(bookingId: onlyonemodal!.data!.paymentDetails!.bookingId.toString());
                  },));
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
                        Image(image: const AssetImage("assets/images/message-text.png"),height: height*0.05,width: width*0.05,),
                        SizedBox(width: width*0.02,),
                        const Text("view_receipt",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.white)).tr(),
                      ],
                    )
                ),
              ),
            ),
            SizedBox(height: height*0.05,),
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
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("important_info",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))).tr(),
                    ),
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
        )
      ) : const Center(
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
