import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/models/GetAddBAppointment.dart';
import 'package:new_sliikeapps_apps/models/getAppointmentPreDetailsModel.dart';
import 'package:new_sliikeapps_apps/services/appointment_services.dart';


class newAppoinment_Viwe_Add extends StatefulWidget {
  List appointmentIds;
  newAppoinment_Viwe_Add(this.appointmentIds, {Key? key}) : super(key: key);

  @override
  State<newAppoinment_Viwe_Add> createState() => _newAppoinment_Viwe_AddState();
}

class _newAppoinment_Viwe_AddState extends State<newAppoinment_Viwe_Add> {
  bool Onoff = false;
  bool notesstatus = false;
  bool depositStatus = false;

  TextEditingController notes = TextEditingController();
  TextEditingController deposit = TextEditingController();

  AppointmentService _appointmentService = AppointmentService();

  GetAppointmentPreDetailsData ? getAppointmentPreDetailsData;


  // launchWhatsApp() async {
  //   final link = WhatsAppUnilink(
  //     phoneNumber: '+001-(555)1234567',
  //     text: "Hey! I'm inquiring about the apartment listing",
  //   );
  //   await launch('$link');
  // }

  String total = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
        getAppointmentPreDetailsData = await  _appointmentService.getAppointmentPreDetails(context,widget.appointmentIds);
        setState(() {});
    });
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
                            setState(() {
                            widget.appointmentIds.clear();
                            });
                            Navigator.pop(context);
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
                                    image:
                                        AssetImage("assets/images/cancel.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Create Appointment",
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
      body:  Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Client : ",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff414141),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 5,
                  ),
                  Text("${getAppointmentPreDetailsData?.data?.appointmentData?[0].clientId?.firstName ?? ""}",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff01635D),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w600))
                  // Spacer(),
                  // InkWell(
                  //   onTap: () {
                  //   showDialog(context: context, builder: (context) {
                  //     return AlertDialog(
                  //       alignment: Alignment.bottomCenter,
                  //       titlePadding: EdgeInsets.only(top: 12, left: 24, right: 12),
                  //       contentPadding: EdgeInsets.only(top: 12, left: 24, bottom: 20),
                  //       insetPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(10))),
                  //       title: StatefulBuilder(
                  //         builder: (context, setState) {
                  //           return Column(
                  //             children: <Widget>[
                  //               SizedBox(
                  //                 height: height * 0.03,
                  //               ),
                  //               Container(
                  //                 alignment: Alignment.center,
                  //                 child: Text(
                  //                   "View client profile",
                  //                   style: TextStyle(
                  //                       fontSize: 14,
                  //                       color: Color(0xff292929),
                  //                       fontFamily: "spartan",
                  //                       fontWeight: FontWeight.w600),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: height * 0.02,
                  //               ),
                  //               Divider(
                  //                 thickness: 1,
                  //                 color: Color(0xffCFCFCF),
                  //               ),
                  //               SizedBox(
                  //                 height: height * 0.02,
                  //               ),
                  //               Container(
                  //                 alignment: Alignment.center,
                  //                 child: Text(
                  //                   "Remove from appointment",
                  //                   style: TextStyle(
                  //                       fontSize: 14,
                  //                       color: Color(0xffEB5757),
                  //                       fontFamily: "spartan",
                  //                       fontWeight: FontWeight.w600),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: height * 0.04,
                  //               ),
                  //               commonButtonborder(context,"CLOSE",12,FontWeight.w600,Color(0xff01635D),(){
                  //                   Navigator.pop(context);
                  //               }),
                  //               SizedBox(
                  //                 height: height * 0.03,
                  //               ),
                  //
                  //             ],
                  //           );
                  //         },
                  //       ),
                  //     );
                  //   },);
                  //   },
                  //   child: Icon(Icons.more_vert, color: Color(0xff414141)),
                  // ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                // color: Colors.red,
                child : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: getAppointmentPreDetailsData!.data!.appointmentData!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text("Service",
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff414141),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color(0xffEBEFEE),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                child: Text("${index + 1}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xff01635D),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: Color(0xffEBEFEE),
                              )),
                          child: Container(
                            height: height * 0.22,
                            width: width,
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                              // border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    color: Color(0xff01635D),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                    // border: Border.all(width: 1, color: Colors.black),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("${DateFormat('dd, MMMM').format(getAppointmentPreDetailsData!.data!.appointmentData![index].dateTime!)}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    color: Color(0xffFFFFFF),
                                                    fontFamily: "spartan",
                                                    fontWeight: FontWeight.w600)),
                                            Text("${DateFormat('HH:mm a').format(getAppointmentPreDetailsData!.data!.appointmentData![index].dateTime!)}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    color: Color(0xffFFFFFF),
                                                    fontFamily: "spartan",
                                                    fontWeight: FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 12),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text("Service",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        color: Color(0xff707070),
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                        FontWeight.w600)),
                                                SizedBox(height: 5),
                                                Text("${getAppointmentPreDetailsData!.data!.appointmentData![index].serviceId!.serviceType!.serviceTypeName}",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        color: Colors.black,
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                        FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        indent: 10,
                                        color: Color(0xffEBEFEE),
                                        thickness: 1,
                                      ),
                                      // Container(width: width,
                                      //   height: 1,color: Color(0xffEBEFEE),),
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text("Price & duration",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        color: Color(0xff707070),
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                        FontWeight.w600)),
                                                SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    Text("\$${getAppointmentPreDetailsData!.data!.appointmentData![index].price}  for 30min",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            color: Colors.black,
                                                            fontFamily: "spartan",
                                                            fontWeight:
                                                            FontWeight.w600)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    // Text("with Tolu",
                                                    //     style: TextStyle(
                                                    //         fontSize: 12,
                                                    //         overflow: TextOverflow
                                                    //             .ellipsis,
                                                    //         color:
                                                    //         Color(0xff707070),
                                                    //         fontFamily: "spartan",
                                                    //         fontWeight:
                                                    //         FontWeight.w600)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add another service",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff2F80ED),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Color(0xff2F80ED),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // Divider(
              //   thickness: 1,
              //   color: Color(0xffCFCFCF),
              // ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             children: [
              //               Text("Request deposit",
              //                   style: TextStyle(
              //                       fontSize: 14,
              //                       overflow: TextOverflow.ellipsis,
              //                       color: Color(0xff292929),
              //                       fontFamily: "spartan",
              //                       fontWeight: FontWeight.bold)),
              //             ],
              //           ),
              //           SizedBox(
              //             height: height * 0.01,
              //           ),
              //           Row(
              //             children: [
              //               Text(
              //                   "Request a percentage of your\nservice charge from clients.",
              //                   style: TextStyle(
              //                       fontSize: 12,
              //                       overflow: TextOverflow.ellipsis,
              //                       color: Color(0xff292929),
              //                       fontFamily: "spartan",
              //                       fontWeight: FontWeight.w500)),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Row(
              //       children: [
              //         FlutterSwitch(
              //           width: 55.0,
              //           height: 25.0,
              //           valueFontSize: 12.0,
              //           toggleSize: 18.0,
              //           activeColor: Color(0xff01635D),
              //           value: Onoff,
              //           onToggle: (value) {
              //             setState(() {
              //               Onoff = value;
              //             });
              //           },
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              // Onoff == true
              //     ? Container(
              //         child: TextField(
              //           controller: deposit,
              //           style: TextStyle(color: Color(0xff292929)),
              //           onChanged: (value) {
              //             setState(() {
              //               depositStatus = false;
              //             });
              //           },
              //           decoration: InputDecoration(
              //             prefixIcon: Container(
              //               width: 80,
              //               child: IntrinsicHeight(
              //                 child: Row(
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           left: 20, right: 20),
              //                       child: Text("%",
              //                           style: TextStyle(
              //                               fontSize: 14,
              //                               overflow: TextOverflow.ellipsis,
              //                               color: Color(0xff707070),
              //                               fontFamily: "spartan",
              //                               fontWeight: FontWeight.w500)),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           top: 5, bottom: 5),
              //                       child: VerticalDivider(
              //                         color: Color(0xff707070),
              //                         thickness: 1,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             suffixIcon: Container(
              //               width: 80,
              //               child: IntrinsicHeight(
              //                 child: Row(
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(
              //                           top: 5, bottom: 5),
              //                       child: VerticalDivider(
              //                         color: Color(0xff707070),
              //                         thickness: 1,
              //                       ),
              //                     ),
              //                     Column(
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [
              //                         Text("Deposit",
              //                             style: TextStyle(
              //                                 fontSize: 10,
              //                                 overflow: TextOverflow.ellipsis,
              //                                 color: Color(0xff707070),
              //                                 fontFamily: "spartan",
              //                                 fontWeight: FontWeight.w500)),
              //                         Text("\$11.00",
              //                             style: TextStyle(
              //                                 fontSize: 12,
              //                                 overflow: TextOverflow.ellipsis,
              //                                 color: Color(0xff292929),
              //                                 fontFamily: "spartan",
              //                                 fontWeight: FontWeight.w500)),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             contentPadding: EdgeInsets.only(left: 20),
              //             labelStyle: TextStyle(
              //                 fontFamily: 'spartan', color: Colors.black54),
              //             focusedBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(5),
              //               borderSide: BorderSide(color: Colors.black38),
              //             ),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(5),
              //               borderSide: BorderSide(color: Colors.black38),
              //             ),
              //           ),
              //         ),
              //       )
              //     : Container(),
              // SizedBox(
              //   height: height * 0.01,
              // ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  Text("Notes ",
                      style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  Text("(Optional)",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.normal)),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: TextField(
                  controller: notes,
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      notesstatus = false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20,top: 20),
                    labelStyle:
                        TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Requested  deposit ",
                      style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff707070),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                  Text("\$${getAppointmentPreDetailsData?.data?.totalPrice ?? 0}",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CommonButton(
                  context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                    var Body = {
                      "appointmentIds" : widget.appointmentIds,
                      "isDepositReq" : true,
                      "depositAmtPercentage" : 100,
                      "note" : notes.text,
                    };
                _appointmentService.saveAppointmentDetails(context, Body,widget.appointmentIds);
              }),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      )
    );
  }
}
