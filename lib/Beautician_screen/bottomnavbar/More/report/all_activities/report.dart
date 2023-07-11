import 'dart:math';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:d_chart/d_chart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/models/beautician_report_model%20/beauticianReportModel.dart';
import 'package:new_sliikeapps_apps/services/beautician_report_service.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  final _scrollController = ScrollController();
  ScrollController _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();
  var verticalScrollController2 = ScrollController();
  var horizontalScrollController2 = ScrollController();
  String? weekvalue;
  var weekitemslist = ["Today", "February"];
  List topservicecut = ["Men’s Cut", "Women’s Cut", "Beard Trim"];

  DateTime pickedDate = DateTime.now();

  BeauticianReport _beauticianReport = BeauticianReport();

  BeauticianReportModel? beauticianReportModel;

  List<AppointmentList> upComingAppointments = [];

  bool isLoadingUpComingAppointments = false;

  bool isupComing = true;

  bool noMore = false;

  bool isDataLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReports();
    _verticalScrollController.addListener(() {
      if (_verticalScrollController.position.maxScrollExtent ==
          _verticalScrollController.offset) {
        getReports();
      }
    });
  }

  getReports({String? date}) async {
    setState(() {
      isLoadingUpComingAppointments = true;
    });
    beauticianReportModel = await _beauticianReport.getBeauticianReports(
        DateFormat('yyyy-MM-dd').format(pickedDate),
        4,
        upComingAppointments.length);
    if (beauticianReportModel?.status == 200 ||
        beauticianReportModel?.status == 201) {
      setState(() {
        isupComing = false;
      });
    }
    setState(() {});
    if (beauticianReportModel!
        .data!.upcomingAppointment!.appointmentList!.isNotEmpty) {
      setState(() {
        upComingAppointments.addAll(
            beauticianReportModel!.data!.upcomingAppointment!.appointmentList ??
                []);
        isLoadingUpComingAppointments = false;
        isupComing = false;
        isDataLoading = false;
        print("upComingAppointments length ${upComingAppointments.length}");
      });
    } else {
      setState(() {
        isLoadingUpComingAppointments = false;
        isDataLoading = false;
        noMore = true;
      });
    }
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
          toolbarHeight: height * 0.13, //

          flexibleSpace: Container(
            color: Color(0xffFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                  child: Container(
                    child: Row(
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
                                border: Border.all(color: Colors.black)),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Container(
                          child: Text("Reports",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: isDataLoading
            ? Container(
                height: height,
                child: Center(
                  child: CircularProgressIndicator(color: Color(0xff01635D)),
                ))
            : beauticianReportModel?.data != null
                ? SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textComoon(
                              "Dashboard", 16, Colors.black, FontWeight.w700),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          textComoonfade(
                              "Track and manage all Services, Products and Brand sales here.",
                              12,
                              Color(0xff414141),
                              FontWeight.w500),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 35,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        width: 1, color: Color(0xffCFCFCF))),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.asset(
                                    "assets/images/left.png",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  datewtimeDialog();
                                },
                                child: Container(
                                  height: 35,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          width: 1, color: Color(0xffCFCFCF))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/calendar-2.png"),
                                                fit: BoxFit.fill)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      textComoon("TODAY", 10, Color(0xff414141),
                                          FontWeight.w500),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    datewtimeDialog();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Container(
                                      height: 35,
                                      width: width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xffCFCFCF))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                "${DateFormat("E,dd MMM yyyy").format(pickedDate)}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color(0xff111111),
                                                    fontFamily: "spartan",
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  datewtimeDialog();
                                },
                                child: Container(
                                  height: 35,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          width: 1, color: Color(0xffCFCFCF))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Image.asset(
                                      "assets/images/righticon.png",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xffF3F3F3),
                              border: Border.all(
                                  width: 1, color: Color(0xffFAFAFA)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 12, right: 12, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textComoon("Appointment Activities", 16,
                                      Colors.black, FontWeight.w700),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textComoon("Total Appointments:", 12,
                                          Color(0xff414141), FontWeight.w500),
                                      textComoon(
                                          "${beauticianReportModel?.data?.appointActivity?.totalAppointment}",
                                          12,
                                          Color(0xff111111),
                                          FontWeight.w600),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textComoon("Completed:", 12,
                                          Color(0xff414141), FontWeight.w500),
                                      textComoon(
                                          "${beauticianReportModel?.data?.appointActivity?.completed}",
                                          12,
                                          Color(0xff111111),
                                          FontWeight.w600),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textComoon("Not Completed:", 12,
                                          Color(0xff414141), FontWeight.w500),
                                      textComoon("0", 12, Color(0xff111111),
                                          FontWeight.w600),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textComoon("Cancelled:", 12,
                                          Color(0xff414141), FontWeight.w500),
                                      textComoon(
                                          "${beauticianReportModel?.data?.appointActivity?.cancelled}",
                                          12,
                                          Color(0xff111111),
                                          FontWeight.w600),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textComoon("No-show:", 12,
                                          Color(0xff414141), FontWeight.w500),
                                      textComoon(
                                          "${beauticianReportModel?.data?.appointActivity?.noShowStatus}",
                                          12,
                                          Color(0xff111111),
                                          FontWeight.w600),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          // Container(
                          //   width: width,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(5)),
                          //     color: Color(0xffF3F3F3),
                          //     border: Border.all(width: 1, color: Color(0xffFAFAFA)),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         top: 18, left: 12, right: 12, bottom: 25),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         textComoon("Sales", 16, Colors.black, FontWeight.w700),
                          //         SizedBox(
                          //           height: height * 0.02,
                          //         ),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             textComoon("Total Sales:", 12, Color(0xff414141),
                          //                 FontWeight.w500),
                          //             textComoon(
                          //                 "\$0:00", 12, Color(0xff111111), FontWeight.w600),
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           height: height * 0.02,
                          //         ),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             textComoon("Products:", 12, Color(0xff414141),
                          //                 FontWeight.w500),
                          //             textComoon(
                          //                 "\$0:00", 12, Color(0xff111111), FontWeight.w600),
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           height: height * 0.02,
                          //         ),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             textComoon("Shipping:", 12, Color(0xff414141),
                          //                 FontWeight.w500),
                          //             textComoon(
                          //                 "\$0:00", 12, Color(0xff111111), FontWeight.w600),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: textComoon(
                                        "Upcoming appointments",
                                        14,
                                        Color(0xff292929),
                                        FontWeight.w700)),
                              ),
                              // Container(
                              //   alignment: Alignment.center,
                              //   width: width * 0.25,
                              //   height: 40,
                              //   padding: EdgeInsets.only(left: 5, right: 5),
                              //   decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.circular(5),
                              //       border: Border.all(color: Colors.black38)),
                              //   child: DropdownButton(
                              //     hint: Text("TODAY"),
                              //     style: TextStyle(
                              //         fontSize: 10,
                              //         color: Color(0xff414141),
                              //         fontFamily: 'spartan',
                              //         fontWeight: FontWeight.w500),
                              //     underline: SizedBox(),
                              //     dropdownColor: Colors.white,
                              //     iconDisabledColor: Colors.black,
                              //     iconEnabledColor: Colors.yellow,
                              //     isExpanded: true,
                              //     icon: Icon(Icons.keyboard_arrow_down,
                              //         color: Color(0xff414141)),
                              //     value: weekvalue,
                              //     items: weekitemslist.map((String items) {
                              //       return DropdownMenuItem(
                              //         value: items,
                              //         child: Text(items),
                              //       );
                              //     }).toList(),
                              //     onChanged: (String? newValue) {
                              //       setState(() {
                              //         weekvalue = newValue!;
                              //       });
                              //     },
                              //   ),
                              // ),
                              // SizedBox(
                              // width: 10,
                              // )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          isupComing
                              ? Container(
                                  height: 280,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: Color(0xff01635D)),
                                  ))
                              : beauticianReportModel
                                          ?.data?.upcomingAppointment !=
                                      null
                                  ? Container(
                                      height: 280,
                                      width: width,
                                      child: AdaptiveScrollbar(
                                        // underColor: Colors.blueGrey.withOpacity(0.3),
                                        sliderDefaultColor: Colors.transparent,
                                        sliderActiveColor: Colors.transparent,
                                        controller: _verticalScrollController,
                                        child: AdaptiveScrollbar(
                                          controller:
                                              _horizontalScrollController,
                                          position: ScrollbarPosition.bottom,
                                          // underColor: Colors.blueGrey.withOpacity(0.3),
                                          sliderDefaultColor:
                                              Colors.grey.withOpacity(0.7),
                                          sliderActiveColor: Colors.grey,
                                          child: SingleChildScrollView(
                                            controller:
                                                _verticalScrollController,
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: [
                                                SingleChildScrollView(
                                                  controller:
                                                      _horizontalScrollController,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0,
                                                            bottom: 16.0),
                                                    child: DataTable(
                                                      headingRowColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  0xffE7E7E7)),
                                                      dataRowHeight: 70,
                                                      showCheckboxColumn: true,
                                                      columns: [
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Service",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Client",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Date & time",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Service location",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Service fee",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "GST/HST",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "QST/PST",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Sliike fee",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Sliike GST/HST fee",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Sliike PST/QST fee",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Discount given",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Total amount",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                        DataColumn(
                                                          label: textComoon(
                                                              "Status",
                                                              10,
                                                              Color(0xff707070),
                                                              FontWeight.w500),
                                                        ),
                                                      ],
                                                      rows: List<
                                                          DataRow>.generate(
                                                        upComingAppointments
                                                            .length,
                                                        (int index) => DataRow(
                                                          cells: <DataCell>[
                                                            DataCell(textComoon(
                                                                "${upComingAppointments[index].serviceName}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "${upComingAppointments[index].clientFirstName}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  textComoon(
                                                                      "${DateFormat('dd MMM,yyyy').format(upComingAppointments[index].dateTime ?? DateTime.now())}",
                                                                      // "20 Oct, 2022",
                                                                      10,
                                                                      Color(
                                                                          0xff111111),
                                                                      FontWeight
                                                                          .w500),
                                                                  textComoon(
                                                                      //         Util().formatMinuteDuration(
                                                                      //   hour: DateFormat('hm').format(upComingAppointments[index].dateTime),
                                                                      //   min: DateFormat('m').format(upComingAppointments[index].dateTime),
                                                                      // ),
                                                                      DateFormat('hh : mm').format(upComingAppointments[index]
                                                                              .dateTime ??
                                                                          DateTime
                                                                              .now()),
                                                                      10,
                                                                      Color(
                                                                          0xff414141),
                                                                      FontWeight
                                                                          .w500),
                                                                ],
                                                              ),
                                                            )),
                                                            DataCell(textComoon(
                                                                upComingAppointments[index]
                                                                            .place ==
                                                                        1
                                                                    ? "At the salon"
                                                                    : "Client's Place",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].subTotal}.00",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].gstORhst}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].pstORqst}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].sliikFee}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].sliikFeeGst}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].sliikFeePst}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].discount}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "\$${upComingAppointments[index].totalSum}",
                                                                10,
                                                                Color(
                                                                    0xff111111),
                                                                FontWeight
                                                                    .w500)),
                                                            DataCell(textComoon(
                                                                "Upcoming",
                                                                10,
                                                                Color(
                                                                    0xffF2994A),
                                                                FontWeight
                                                                    .w500)),
                                                          ],
                                                          // onSelectChanged: (bool? value) {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (isLoadingUpComingAppointments)
                                                  Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive(
                                                      strokeWidth: 50.0,
                                                      backgroundColor:
                                                          Color(0xff01635D),
                                                      value: 20,
                                                    ),
                                                  ),
                                                if (noMore)
                                                  Text(
                                                    "No More Upcoming Appointments",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff01635D)),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                      "No Upcoming Appointments !!!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff01635D)),
                                    )),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //           alignment: Alignment.topLeft,
                          //           child: textComoon("Product Sales", 14,
                          //               Color(0xff292929), FontWeight.w700)),
                          //     ),
                          //     Container(
                          //       alignment: Alignment.center,
                          //       width: width * 0.25,
                          //       height: 40,
                          //       padding: EdgeInsets.only(left: 5, right: 5),
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(5),
                          //           border: Border.all(color: Colors.black38)),
                          //       child: DropdownButton(
                          //         hint: Text("TODAY"),
                          //         style: TextStyle(
                          //             fontSize: 10,
                          //             color: Color(0xff414141),
                          //             fontFamily: 'spartan',
                          //             fontWeight: FontWeight.w500),
                          //         underline: SizedBox(),
                          //         dropdownColor: Colors.white,
                          //         iconDisabledColor: Colors.black,
                          //         iconEnabledColor: Colors.yellow,
                          //         isExpanded: true,
                          //         icon: Icon(Icons.keyboard_arrow_down,
                          //             color: Color(0xff414141)),
                          //         value: weekvalue,
                          //         items: weekitemslist.map((String items) {
                          //           return DropdownMenuItem(
                          //             value: items,
                          //             child: Text(items),
                          //           );
                          //         }).toList(),
                          //         onChanged: (String? newValue) {
                          //           setState(() {
                          //             weekvalue = newValue!;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     )
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: height * 0.01,
                          // ),
                          // Container(
                          //   height: 280,
                          //   width: width,
                          //   child: AdaptiveScrollbar(
                          //     // underColor: Colors.blueGrey.withOpacity(0.3),
                          //     sliderDefaultColor: Colors.grey.withOpacity(0.7),
                          //     sliderActiveColor: Colors.grey,
                          //     controller: verticalScrollController2,
                          //     child: AdaptiveScrollbar(
                          //       controller: horizontalScrollController2,
                          //       position: ScrollbarPosition.bottom,
                          //       // underColor: Colors.blueGrey.withOpacity(0.3),
                          //       sliderDefaultColor: Colors.grey.withOpacity(0.7),
                          //       sliderActiveColor: Colors.grey,
                          //       child: SingleChildScrollView(
                          //         physics: BouncingScrollPhysics(),
                          //         controller: verticalScrollController2,
                          //         scrollDirection: Axis.vertical,
                          //         child: SingleChildScrollView(
                          //           physics: BouncingScrollPhysics(),
                          //           controller: horizontalScrollController2,
                          //           scrollDirection: Axis.horizontal,
                          //           child: Padding(
                          //             padding:
                          //                 const EdgeInsets.only(right: 8.0, bottom: 16.0),
                          //             child: DataTable(
                          //               headingRowColor:
                          //                   MaterialStateProperty.all(Color(0xffE7E7E7)),
                          //               dataRowHeight: 70,
                          //               showCheckboxColumn: true,
                          //               columns: [
                          //                 DataColumn(
                          //                   label: textComoon("Product", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Vendor", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Purchase Date", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Delivery Date", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoonfade("Delivery location", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Price", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Shipping", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("GST/HST", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("QST/PST", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Sliike fee", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Sliike GST/HST fee", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Sliike PST/QST fee", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Discount given", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Total price", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //                 DataColumn(
                          //                   label: textComoon("Status", 10,
                          //                       Color(0xff707070), FontWeight.w500),
                          //                 ),
                          //               ],
                          //               rows: List<DataRow>.generate(
                          //                 4,
                          //                 (int index) => DataRow(
                          //                   cells: <DataCell>[
                          //                     DataCell(textComoon("Hair Clipper", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(Container(
                          //                       width: width * 0.2,
                          //                       child: textComoonfade("Fresh Cutz Barber",
                          //                           10, Color(0xff111111), FontWeight.w500),
                          //                     )),
                          //                     DataCell(textComoon("20 Oct, 2022", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("22 Oct, 2022", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(Container(
                          //                       width: width * 0.4,
                          //                       child: textComoonfade(
                          //                           "Route Du 3e-rang,Collingwood, QC, Canada",
                          //                           10,
                          //                           Color(0xff111111),
                          //                           FontWeight.w500),
                          //                     )),
                          //                     DataCell(textComoon("\$80.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$5.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$4.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$5.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$0.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$0.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$0.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$0.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("\$94.00", 10,
                          //                         Color(0xff111111), FontWeight.w500)),
                          //                     DataCell(textComoon("Delivered", 10,
                          //                         Color(0xff1571ED), FontWeight.w500)),
                          //                   ],
                          //                   // onSelectChanged: (bool? value) {},
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: height * 0.05,
                          // ),
                          // Container(
                          //   width: width,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(5),
                          //     border: Border.all(color: Color(0xffCFCFCF), width: 1),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         left: 10, top: 15, right: 10, bottom: 15),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Row(
                          //           crossAxisAlignment: CrossAxisAlignment.center,
                          //           children: [
                          //             Expanded(
                          //                 child: textComoon("Sales chart", 16,
                          //                     Color(0xff292929), FontWeight.w700)),
                          //             textComoon("31 Aug,2022", 10, Color(0xff292929),
                          //                 FontWeight.w500),
                          //             SizedBox(
                          //               width: 15,
                          //             ),
                          //             Container(
                          //               height: 20,
                          //               width: 20,
                          //               decoration: BoxDecoration(
                          //                   image: DecorationImage(
                          //                       image: AssetImage(
                          //                           "assets/images/calendar-2.png"),
                          //                       fit: BoxFit.fill)),
                          //             ),
                          //             SizedBox(
                          //               width: width * 0.05,
                          //             ),
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           height: height * 0.01,
                          //         ),
                          //         textComoon("Appointments and Products", 12,
                          //             Color(0xff292929), FontWeight.w500),
                          //         SizedBox(
                          //           height: height * 0.02,
                          //         ),
                          //         // example 1
                          //         AspectRatio(
                          //           aspectRatio: 16 / 9,
                          //           child: DChartBarCustom(
                          //             showDomainLine: true,
                          //             showMeasureLine: true,
                          //             showDomainLabel: true,
                          //             showMeasureLabel: true,
                          //             spaceBetweenItem: 8,
                          //             listData: [
                          //               DChartBarDataCustom(
                          //                 value: 13,
                          //                 label: 'Jan',
                          //                 color: Colors.blue,
                          //               ),
                          //               DChartBarDataCustom(value: 20, label: 'Jan'),
                          //               DChartBarDataCustom(value: 30, label: 'Feb'),
                          //               DChartBarDataCustom(value: 40, label: 'Mar'),
                          //               DChartBarDataCustom(value: 25, label: 'Apr'),
                          //               DChartBarDataCustom(value: 10, label: 'May'),
                          //               DChartBarDataCustom(value: 30, label: 'Jun'),
                          //               DChartBarDataCustom(value: 40, label: 'Jul'),
                          //               DChartBarDataCustom(value: 25, label: 'Aug'),
                          //               DChartBarDataCustom(value: 10, label: 'Sep'),
                          //               DChartBarDataCustom(value: 30, label: 'OCt'),
                          //               DChartBarDataCustom(value: 40, label: 'Nov'),
                          //               DChartBarDataCustom(value: 25, label: 'Dec'),
                          //             ],
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: height * 0.02,
                          //         ),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //               height: 20,
                          //               width: 20,
                          //               decoration: BoxDecoration(
                          //                 color: Color(0xff132C4E),
                          //                 borderRadius: BorderRadius.circular(2),
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 10,
                          //             ),
                          //             textComoon(
                          //                 "Services", 12, Colors.black, FontWeight.w500),
                          //             SizedBox(
                          //               width: 20,
                          //             ),
                          //             Container(
                          //               height: 20,
                          //               width: 20,
                          //               decoration: BoxDecoration(
                          //                 color: Color(0xff1571ED),
                          //                 borderRadius: BorderRadius.circular(2),
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               width: 10,
                          //             ),
                          //             textComoon(
                          //                 "Products", 12, Colors.black, FontWeight.w500)
                          //           ],
                          //         ),
                          //         SizedBox(
                          //           height: height * 0.02,
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Color(0xffCFCFCF), width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textComoon("Top Services", 16,
                                      Color(0xff292929), FontWeight.w700),
                                  SizedBox(
                                    height: height * 0.035,
                                  ),
                                  ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: beauticianReportModel!
                                        .data!.topServices!.length,
                                    shrinkWrap: true,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textComoon(
                                              "${beauticianReportModel!.data!.topServices![index].serviceTypeName}",
                                              14,
                                              Color(0xff292929),
                                              FontWeight.w700),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          textComoon(
                                              "${beauticianReportModel!.data!.topServices![index].lastMonth} Last month/ ${beauticianReportModel!.data!.topServices![index].currentMonth} This month",
                                              10,
                                              Color(0xff414141),
                                              FontWeight.w400),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: height * 0.05,
                          // ),
                          // Container(
                          //   width: width,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(5),
                          //     border: Border.all(color: Color(0xffCFCFCF), width: 1),
                          //   ),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         left: 15, right: 15, top: 15, bottom: 15),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         textComoon("Top Products", 16, Color(0xff292929),
                          //             FontWeight.w700),
                          //         SizedBox(
                          //           height: height * 0.035,
                          //         ),
                          //         ListView.separated(
                          //           physics: BouncingScrollPhysics(),
                          //           itemCount: 3,
                          //           shrinkWrap: true,
                          //           separatorBuilder: (BuildContext context, int index) =>
                          //               const Divider(),
                          //           itemBuilder: (BuildContext context, int index) {
                          //             return Column(
                          //               children: [
                          //                 Row(
                          //                   crossAxisAlignment: CrossAxisAlignment.center,
                          //                   mainAxisAlignment: MainAxisAlignment.start,
                          //                   children: [
                          //                     Container(
                          //                       height: 58,
                          //                       width: 58,
                          //                       decoration: BoxDecoration(
                          //                           borderRadius: BorderRadius.circular(10),
                          //                           image: DecorationImage(
                          //                               fit: BoxFit.fill,
                          //                               image: AssetImage(
                          //                                   "assets/images/Rectangle 967.png"))),
                          //                     ),
                          //                     SizedBox(
                          //                       width: 10,
                          //                     ),
                          //                     Container(
                          //                       child: Column(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.start,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           textComoon("Smoothning Cream", 12,
                          //                               Color(0xff000000), FontWeight.w800),
                          //                           SizedBox(
                          //                             height: 5,
                          //                           ),
                          //                           textComoonfade(
                          //                               "48 Last month/ 24 This month",
                          //                               10,
                          //                               Color(0xff414141),
                          //                               FontWeight.w400),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             );
                          //           },
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: height * 0.03,
                          // ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: height,
                    child: Center(child: Text("No Data Found !!")),
                  ));
  }

  datewtimeDialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(10),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: height * 0.43,
                width: width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.43,
                        child: SfCalendar(
                            onTap: (calendarTapDetails) {
                              isupComing = true;
                              Navigator.pop(context);
                              pickedDate =
                                  calendarTapDetails.date ?? DateTime.now();
                              print(pickedDate);
                              getReports(
                                  date: DateFormat('yyyy-MM-dd')
                                      .format(pickedDate));
                            },
                            headerHeight: 50,
                            headerStyle: CalendarHeaderStyle(
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff01635D),
                                  fontSize: 14,
                                )),
                            todayTextStyle: TextStyle(
                                fontFamily: 'spartan', color: Colors.white),
                            cellBorderColor: Colors.transparent,
                            view: CalendarView.month,
                            viewHeaderStyle: ViewHeaderStyle(
                                dayTextStyle:
                                    TextStyle(color: Color(0xff01635D))),
                            selectionDecoration: BoxDecoration(
                                border: Border.all(color: Color(0xff01635D))),
                            todayHighlightColor: Color(0xff01635D),
                            monthViewSettings: MonthViewSettings(
                              monthCellStyle: MonthCellStyle(
                                  textStyle: TextStyle(
                                      fontFamily: 'spartan',
                                      color: Colors.black)),
                              appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.none,
                              showTrailingAndLeadingDates: false,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
