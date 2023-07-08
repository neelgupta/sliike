import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/calender/send_notifi_message_or_phone/calender_screen/calender.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import '../../../../../../../services/calender_service.dart';
import '../../../../../../../utils/util.dart';
import '../../../../../../b_model/appointment_details_model.dart';
import '../../../new_appoinment/new_appoinment.dart';
import '../../../payment_detail/payment_details_screen.dart';
import 'edit_apoinment/edit_add_service.dart';

class AppointmentDetailScreen extends StatefulWidget {
  const AppointmentDetailScreen({
    Key? key,
    required this.appointmentId,
    required this.isFuture,
  }) : super(key: key);

  final String appointmentId;
  final bool isFuture;

  @override
  State<AppointmentDetailScreen> createState() =>
      AppointmentDetailScreenState();
}

class AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  bool isloading = false;
  String appointmentStatus = "";
  Color statusAppbarColor = const Color(0xff01635D);

  AppointmentDetailsModel? appointmentDetails;

  CalenderService calenderService = CalenderService();

  getAppointmentDetails() async {
    setState(() {
      isloading = true;
    });
    // var date = DateFormat('yyyy-MM-dd').format(pickeddate);
    await calenderService
        .getAppointmentData(
      appointmentId: widget.appointmentId,
    )
        .then((details) {
      appointmentDetails = details;
      if (details != null) {
        if (details.data.status == 0) {
          appointmentStatus = "PENDING!";
          // pending
          statusAppbarColor = const Color(0xFFF2C94C);
        } else if (details.data.status == 1) {
          //Accepted
          appointmentStatus = "CONFIRMED!";
          statusAppbarColor = const Color(0xFF219653);
        } else if (details.data.status == 2) {
          //delivered
          appointmentStatus = "DELIVERED";
          statusAppbarColor = const Color(0xFF67E1FC);
        } else if (details.data.status == 3) {
          //cancelByClient
          appointmentStatus = "CANCEL BY CLIENT";
          statusAppbarColor = const Color(0xFFFF2A1C);
        } else if (details.data.status == 4) {
          //cancelByBeautician
          appointmentStatus = "CANCEL BY BEAUTICIAN";
          statusAppbarColor = const Color(0xFFFF2A1C);
        } else if (details.data.status == 5) {
          //client no show
          appointmentStatus = "NO-SHOW";
          statusAppbarColor = const Color(0xFFFF927B);
        }
        setState(() {});

        log("appointmentStatus :: $appointmentStatus");
        log("statusAppbarColor :: $statusAppbarColor");
      }
      return null;
    });

    setState(() {
      isloading = false;
    });
  }

  handlePastAppointmentChangeStatus(String appoId, String newStatus) async {
    setState(() {
      isloading = true;
    });

    // var date = DateFormat('yyyy-MM-dd').format(selectedDate);
    bool callStatus = await calenderService.pastAppointmentChangeStatus(
      appointmentId: appointmentDetails!.data.id,
      newStatus: newStatus,
    );

    if (callStatus) {
      Navigator.pop(context, true);

      // if (appointDataList.isNotEmpty) {
      //   getAppointDataSource();
      // }
    }
    setState(() {
      isloading = false;
    });
  }

  cancelAppointmentById(String appoId) async {
    setState(() {
      isloading = true;
    });

    // var date = DateFormat('yyyy-MM-dd').format(selectedDate);
    bool callStatus = await calenderService.cancelAppointment(
      appointmentId: appointmentDetails!.data.id,
    );

    if (callStatus) {
      Navigator.pop(context, true);

      // if (appointDataList.isNotEmpty) {
      //   getAppointDataSource();
      // }
    }
    setState(() {
      isloading = false;
    });
  }


  SendAppointmentReminderById(String appoId) async {
    setState(() {
      isloading = true;
    });

    // var date = DateFormat('yyyy-MM-dd').format(selectedDate);
    bool callStatus = await calenderService.SendAppointmentReminder(
      appointmentId: appointmentDetails!.data.id,
    );

    if (callStatus) {
      Navigator.pop(context, true);

      // if (appointDataList.isNotEmpty) {
      //   getAppointDataSource();
      // }
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAppointmentDetails();
  }

  futureAppDialogBody(height) {
    return Column(
      children: <Widget>[
        SizedBox(height: height * 0.03),
        InkWell(
          onTap: () {
            Navigator.pop(context);
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return const edit_add_service();
            //   },
            // ));
          },
          child: InkWell(
            onTap: (){
              if(appointmentDetails?.data.status==0){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return  edit_add_service(appointmentDetails!.data.clientData.customerId,data: appointmentDetails!.data,status:appointmentDetails!.data.status);
                    },
                  ),
                );
              }else{
                showToast(message: "Confirmed appointment cannot be edited");
              }
            },
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  child: Image.asset("assets/images/edit.png"),
                ),
                const SizedBox(
                  width: 20,
                ),
                textComoon(
                  "Edit appointment",
                  14,
                  const Color(0xff111111),
                  FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        InkWell(
          onTap: () {
            setState(() {
              Navigator.pop(context);
              canceldialog();
              // cancelAppointmentById(
              //   appointmentDetails!.data.id,
              // );
            });
          },
          child: Row(
            children: [
              SizedBox(
                height: 30,
                child: Image.asset("assets/images/cancel_circle.png"),
              ),
              const SizedBox(
                width: 20,
              ),
              textComoon(
                "Cancel appointment",
                14,
                const Color(0xff111111),
                FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        commonButtonborder(
          context,
          "CLOSE",
          12,
          FontWeight.w600,
          const Color(0xff01635D),
          () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    );
  }

  pastAppDialogBody(height) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: height * 0.03,
        ),
        InkWell(
          onTap: () {
            setState(() {
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return const dlivered();
              //   },
              // ));
              appointmentDetails?.data.status==2 || appointmentDetails!.data.status==5?
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  edit_add_service(appointmentDetails!.data.clientData.customerId,data: appointmentDetails!.data,status:appointmentDetails!.data.status);
                  },
                ),
              ):
              handlePastAppointmentChangeStatus(
                appointmentDetails!.data.id,
                "delivered",
              );
            });
          },
          child: Row(
            children: [
              appointmentDetails?.data.status==2 || appointmentDetails!.data.status==5? Icon(Icons.refresh) :  SizedBox(
                height: 30,
                child: Image.asset(
                  "assets/images/Group 12079.png",
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 18),
              textComoon(
                appointmentDetails?.data.status==2 || appointmentDetails!.data.status==5? "Rebook Appointment" : "Mark as delivered",
                14,
                const Color(0xff111111),
                FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
            appointmentDetails!.data.status==5?
            handlePastAppointmentChangeStatus(
              appointmentDetails!.data.id,
              "delivered",
            ):
            handlePastAppointmentChangeStatus(
              appointmentDetails!.data.id,
              "no-show",
            );
          },
          child: Row(
            children: [
              appointmentDetails!.data.status==5?
              SizedBox(
                height: 30,
                child: Image.asset(
                  "assets/images/Group 12079.png",
                  height: 20,
                  width: 20,
                ),
              ):
              SizedBox(
                height: 30,
                child: Image.asset(
                  "assets/images/close_red_circle.png",
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 18),
              textComoon(
                appointmentDetails!.data.status==5? "Mark as delivered"  :   "Mark as no show",
                14,
                const Color(0xff111111),
                FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        commonButtonborder(
            context, "CLOSE", 12, FontWeight.w600, const Color(0xff01635D), () {
          Navigator.pop(context);
        }),
        SizedBox(
          height: height * 0.03,
        ),
      ],
    );
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
      appBar: isloading
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: height * 0.13, //
              flexibleSpace: Container(
                color: statusAppbarColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              // padding: const EdgeInsets.all(8),
                              height: height * 0.06,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                      "assets/images/cancel1.png",
                                    ),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            appointmentStatus,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      alignment: Alignment.bottomCenter,
                                      insetPadding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 30,
                                      ),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      title: StatefulBuilder(
                                        builder: (context, setState) {
                                          return widget.isFuture
                                              ? futureAppDialogBody(height)
                                              : pastAppDialogBody(height);
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: const Icon(
                                  Icons.more_vert,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                height: height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF3F3F3),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Date",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff707070),
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        Util().eMMMdformatter.format(
                                              appointmentDetails!.data.dateTime
                                                  .toLocal(),
                                            ),
                                        // "Wed, Mar 16",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff292929),
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: VerticalDivider(
                                  color: Color(0xffCFCFCF),
                                  thickness: 1,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Time",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff707070),
                                            fontFamily: "spartan",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        Util().hhmmaformatter.format(
                                              appointmentDetails!.data.dateTime,
                                            ),
                                        // "9:00 AM",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff292929),
                                            fontFamily: "spartan",
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffCFCFCF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        appointmentDetails!
                                            .data.clientData.firstName
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          color: Color(0xFF86A19A),
                                          fontSize: 18,
                                        ),
                                      ),
                                    )
                                    // Image.asset(
                                    //     "assets/images/profile.png",
                                    //     fit: BoxFit.fill),
                                    ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${appointmentDetails!.data.clientData.firstName} ${appointmentDetails!.data.clientData.lastName}",
                                      // "Joe Cambell",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff414141),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      "${appointmentDetails!.data.clientData.phoneNumber}", // "+1 514 888 7722",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff707070),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Divider(
                              thickness: 1,
                              color: (Color(0xffCFCFCF)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Service",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff707070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                appointmentDetails!
                                    .data.serviceDetails.serviceName,
                                // "Men’s Cut",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff111111),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                appointmentDetails!
                                            .data.serviceDetails.duration !=
                                        ""
                                    ? Util().formatMinuteDuration(
                                        hour: appointmentDetails!
                                            .data.serviceDetails.duration
                                            .split(':')[0],
                                        min: appointmentDetails!
                                            .data.serviceDetails.duration
                                            .split(':')[1],
                                      )
                                    : "${appointmentDetails!.data.serviceDetails.duration} minutes",
                                // "30 minutes",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff707070),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                // appointmentDetails!.data.serviceDetails.duration,
                                "\$${appointmentDetails!.data.serviceDetails.price}.00",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff707070),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 1,
                        color: (Color(0xffCFCFCF)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        color: const Color(0xffEBEFEE),
                        height: height * 0.06,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textComoon("Payments", 14,
                              Colors.black, FontWeight.w600),
                        )),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          if(appointmentDetails!.data.status!=0){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return PaymentDetailScreen(appointmentId: appointmentDetails!.data.id,);},),);
                          }
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffCFCFCF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          "assets/images/card.png",
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textComoon(
                                            "Credit Card",
                                            14,
                                            const Color(0xff292929),
                                            FontWeight.w700),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Container(
                                            child: textComoon(
                                              appointmentDetails!.data.paymentDetails.paymentStatus == 0
                                                  ? "Not Paid"
                                                  : appointmentDetails!
                                                              .data
                                                              .paymentDetails
                                                              .paymentStatus ==
                                                          1
                                                      ? "confirmed"
                                                      : appointmentDetails!
                                                                  .data
                                                                  .paymentDetails
                                                                  .paymentStatus ==
                                                              2
                                                          ? "Failed"
                                                          : "Paid",
                                              10,
                                                appointmentDetails!.data.paymentDetails.paymentStatus == 0? Color(0xffF2C94C) : Color(0xff219653),
                                              FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Container(
                                        child: textComoon(
                                            "\$${appointmentDetails!.data.serviceDetails.price}.00",
                                            12,
                                            const Color(0xff01635D),
                                            FontWeight.w700),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        alignment: Alignment.topRight,
                                        height: 15,
                                        width: 15,
                                        child: Image.asset(
                                          "assets/images/righticon.png",
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        thickness: 1,
                        color: (Color(0xffCFCFCF)),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: CommonButton(
                        context,
                        appointmentDetails!.data.status==0?
                        "SEND REMINDER" :
                        widget.isFuture
                            ? "EDIT APPOINTMENT"
                            : appointmentDetails!.data.status==2 || appointmentDetails!.data.status==5?
                              "REBOOK APPOINTMENT":
                               "MARK AS DELIVERED",
                        12,
                        FontWeight.w600,
                        Colors.white,
                        () {
                          if(appointmentDetails!.data.status==0){
                            SendAppointmentReminderById(appointmentDetails!.data.id);
                          }
                          else if (widget.isFuture) {
                            if(appointmentDetails?.data.status==0){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return  edit_add_service(appointmentDetails!.data.clientData.customerId,data: appointmentDetails!.data,status:appointmentDetails!.data.status);
                                  },
                                ),
                              );
                            }else{
                              showToast(message: "Confirmed appointment cannot be edited");
                            }

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return  edit_add_service(appointmentDetails!.data.clientData.customerId,data: appointmentDetails!.data,status:appointmentDetails!.data.status);
                            //     },
                            //   ),
                            // );
                          } else {
                            appointmentDetails!.data.status==2 ||  appointmentDetails!.data.status==5?
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return  edit_add_service(appointmentDetails!.data.clientData.customerId,data: appointmentDetails!.data,status:appointmentDetails!.data.status);
                                },
                              ),
                            ):
                            handlePastAppointmentChangeStatus(
                              appointmentDetails!.data.id,
                              "delivered",
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return const PaymentDetailScreen();
                            //     },
                            //   ),
                            // );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  canceldialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Image.asset("assets/images/redclose.png"),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: textComoon("Cancel Appointment?", 14,
                        const Color(0xff111111), FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: textComoon(
                        "Cancelling this appointment would\nremove it from your appointment list",
                        12,
                        const Color(0xff414141),
                        FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: textComoon("Do you want to continue?", 12,
                        const Color(0xff111111), FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: const Color(0xff414141), width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              child: Center(
                                child: textComoon("NO,CANCEL", 10,
                                    const Color(0xff828282), FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cancelAppointmentById(
                              appointmentDetails!.data.id,
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffFF2A1C),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              child: Center(
                                child: textComoon("YES, CANCEL", 10,
                                    const Color(0xffFFFFFF), FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
