import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/getAppointmentDetailsModel.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/calender/send_notifi_message_or_phone/new_appoinment/new_appoinment.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/add_your_work_hours.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../services/calender_service.dart';
import '../../../../b_model/employee_get_list.dart';
import '../confirmed_Future_Apoi/confirmed_appoinment/future_appointment/appointment_detail_screen.dart';
import 'allow_location.dart';
import 'appointment_data_source.dart';

// ignore: camel_case_types
class calender extends StatefulWidget {
  const calender({
    Key? key,
  }) : super(key: key);
  @override
  State<calender> createState() => _calenderState();
}

// ignore: camel_case_types
class _calenderState extends State<calender> {
  DateTime pickeddate = DateTime.now();
  List<DateTime> dates = [];
  // List<EmployeeData> employeesList = [];
  bool highlight = false;

  OverlayEntry? popupDialog;

  GetAppointmentDetailModel? appointMentDetails;
  List<EmployeeData> employeeDataList = [];
  List<AppointmentDatum> appointDataList = [];
  bool isThereAnyEvent = false;

  CalenderService calenderService = CalenderService();
  CalendarController calendarcontroller = CalendarController();

  bool isLoading = false;
  bool isAppointmentsLoading = false;

  ScrollController _scrollController = ScrollController();

  int Index = 0;

  getDates(DateTime date) {
    setState(() {
      dates.clear();
      int noOfDays = DateTimeRange(
        start: DateTime(date.year, date.month, 1),
        end: DateTime(
          date.year,
          date.month + 1,
        ),
      ).duration.inDays;
      for (int i = 1; i <= noOfDays; i++) {
        log("Index ${Index}");
        dates.add(
          DateTime(date.year, date.month, i),
        );
      }
      if (_scrollController.hasClients) {
        for (int i = 0; i < dates.length; i++) {
          // log("pickeddate == dates[i] : ${pickeddate == dates[i]}");
          if (pickeddate == dates[i]) {
            log("pickeddate == dates[i] : ${pickeddate == dates[i]}");
            log("dates[i] : ${dates[i]}");
            log("i.toDouble() : ${i.toDouble()}");

            setState(() {
              _scrollController.jumpTo(
                  _scrollController.position.maxScrollExtent /
                      (dates.length - 6) *
                      i);
            });
          }
        }
      }
    });
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];
    if (appointMentDetails?.data?.timingOfDay?.breakStartTime != "" &&
        appointMentDetails?.data?.timingOfDay?.breakEndTime != "") {
      String bsHour = appointMentDetails?.data?.timingOfDay?.breakStartTime
              ?.split(":")[0] ??
          "00";
      String bsMinute = appointMentDetails?.data?.timingOfDay?.breakStartTime
              ?.split(":")[1] ??
          "00";
      var now = DateTime.now();
      DateTime startBreakDateTime = DateTime(
          pickeddate.year,
          pickeddate.month,
          pickeddate.day,
          // appointMentDetails?.data?.appointmentData?[0].dateTime!.year ?? now.year,
          // appointMentDetails?.data?.appointmentData?[0].dateTime!.month ?? now.month,
          // appointMentDetails?.data?.appointmentData?[0].dateTime!.day ?? now.day,
          int.parse(bsHour),
          int.parse(bsMinute));
      String beHour =
          appointMentDetails?.data?.timingOfDay?.breakEndTime?.split(":")[0] ??
              "00";
      String beMinute =
          appointMentDetails?.data?.timingOfDay?.breakEndTime?.split(":")[1] ??
              "00";
      DateTime endBreakDateTime = DateTime(
          pickeddate.year,
          pickeddate.month,
          pickeddate.day,
          // appointMentDetails?.data?.appointmentData?[0].endDateTime!.year ?? now.year,
          // appointMentDetails?.data?.appointmentData?[0].endDateTime!.month ?? now.month,
          // appointMentDetails?.data?.appointmentData?[0].endDateTime!.day ?? now.day,
          int.parse(beHour),
          int.parse(beMinute));
      log("startBreakDateTime ${startBreakDateTime}");
      log("endBreakDateTime ${endBreakDateTime}");
      regions.add(TimeRegion(
          startTime: startBreakDateTime,
          endTime: endBreakDateTime,
          enablePointerInteraction: false,
          color: Colors.grey.withOpacity(0.2),
          text: 'Break'));
    }
    return regions;
  }

  // setEmployeeDataList() {
  //   log("on mopnth changessssh");
  //   employeesList = [
  //     EmployeeData(
  //       empId: "11",
  //       empName: "Tolu Williams",
  //       empStartTime: DateTime.now(),
  //       empEndTime: DateTime.now().add(const Duration(hours: 8)),
  //       isSelected: true,
  //     ),
  //     EmployeeData(
  //       empId: "12",
  //       empName: "Rita Powel",
  //       empStartTime: DateTime.now(),
  //       empEndTime: DateTime.now().add(const Duration(hours: 8)),
  //       isSelected: false,
  //     ),
  //     EmployeeData(
  //       empId: "13",
  //       empName: "Gartel Miss",
  //       empStartTime: DateTime.now(),
  //       empEndTime: DateTime.now().add(const Duration(hours: 8)),
  //       isSelected: false,
  //     ),
  //   ];
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCalendarAppointments2(pickeddate);
    print(pickeddate);
  }

  // getCalendarAppointments(selectedDate, {String? stylishId}) async {
  //   setState(() {
  //     pickeddate = selectedDate;
  //     // isAppointmentLoading = true;
  //     isAppointmentsLoading = true;
  //   });
  //
  //   getDates(pickeddate);
  //
  //   appointDataList.clear();
  //
  //   var date = DateFormat('yyyy-MM-dd').format(selectedDate);
  //   appointMentDetails = await calenderService.getAppointmentDetailByDate(
  //     selectedDate: date,
  //     stylishId: stylishId,
  //   );
  //
  //   if (appointMentDetails != null) {
  //     if (appointMentDetails!.data.isNotEmpty) {
  //       appointDataList.addAll(appointMentDetails!.data);
  //
  //     } else {
  //       // appointDataList.clear();
  //     }
  //     // if (appointDataList.isNotEmpty) {
  //     //   getAppointDataSource();
  //     // }
  //   }
  //
  //   // log("appointDataList len ${appointDataList.length}");
  //   setState(() {
  //     isAppointmentsLoading = false;
  //   });
  // }

  getCalendarAppointments2(selectedDate, {String? stylishId}) async {
    setState(() {
      pickeddate = selectedDate;
      // isAppointmentLoading = true;
      isAppointmentsLoading = true;
    });

    appointDataList.clear();

    getDates(pickeddate);

    var date = DateFormat('yyyy-MM-dd').format(selectedDate);
    var day = DateFormat('EEEE').format(selectedDate);
    appointMentDetails = await calenderService.getAppointmentDetailByDate2(
        selectedDate: date, stylishId: stylishId, selectedDay: day);

    if (appointMentDetails != null) {
      if (appointMentDetails!.data!.appointmentData!.isNotEmpty) {
        setState(() {
          appointDataList.addAll(appointMentDetails!.data!.appointmentData!);
          log("appointDataList :: ${appointDataList.length}");
        });
      } else {
        // appointDataList.clear();
      }
      // if (appointDataList.isNotEmpty) {
      //   getAppointDataSource();
      // }
    }

    // log("appointDataList len ${appointDataList.length}");
    setState(() {
      isAppointmentsLoading = false;
    });
  }

  AppointmentDataSource getAppointDataSource() {
    List<Appointment> meetings = <Appointment>[];
    DateTime today = DateTime.now();
    DateTime startTime = DateTime.now();

    setState(() {
      isLoading = true;
    });

    DateTime endTime = startTime.add(
      const Duration(hours: 2),
    );
    // String startTimeZoneName = "";
    // String endTimeZoneName = "";

    if (appointDataList.isEmpty) {
      meetings = [];
    } else {
      for (int i = 0; i < appointDataList.length; i++) {
        setState(() {
          var singleData = appointDataList[i];

          // startTimeZoneName = singleData.dateTime.timeZoneName;
          // endTimeZoneName = singleData.endDateTime.timeZoneName;
          startTime = DateTime(
            singleData.dateTime!.year,
            singleData.dateTime!.month,
            singleData.dateTime!.day,
            singleData.dateTime!.hour,
            singleData.dateTime!.minute,
            singleData.dateTime!.second,
          );
          endTime = DateTime(
            singleData.endDateTime!.year,
            singleData.endDateTime!.month,
            singleData.endDateTime!.day,
            singleData.endDateTime!.hour,
            singleData.endDateTime!.minute,
            singleData.endDateTime!.second,
          );
          meetings.add(
            Appointment(
              isAllDay: false,
              id: singleData.id,
              subject:
                  "${singleData.clientData?.firstName} ${singleData.clientData?.lastName}(${singleData.serviceDetails?.serviceTypeName})",
              startTime: startTime.toLocal(),
              endTime: endTime.toLocal(),
              // startTimeZone: startTimeZoneName,
              // endTimeZone: endTimeZoneName,
              color: const Color(0xFF005874),
              // isAllDay: false,
            ),
          );
        });
      }
    }
    setState(() {
      isThereAnyEvent = meetings.isEmpty ? false : true;
      isLoading = false;
    });

    // dv.log("appointDataList len is :: ${appointDataList.length}");
    log("meetings len is :: ${meetings.length}");
    return AppointmentDataSource(meetings);
  }

  // Overlay.of(context).insert(some_created_overlay_entry);

  OverlayEntry showPopupAppointmentDialog() {
    return OverlayEntry(
      builder: (context) => Dialog(
        child: createPopupAppointment(),
      ),
    );
  }

  Widget createPopupAppointment() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // timeDisplayAppointment(),
              Text("appointment data"),
              // Image.network(url, fit: BoxFit.fitWidth),
              // serviceDisplayAppointment(),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var displayDate = DateFormat('E, d MMM yyyy').format(pickeddate);
    var weekDay = DateFormat('EEEE').format(pickeddate);
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
          color: const Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, bottom: height * 0.03, right: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  allow_location(getDate: pickeddate),
                            )).then((value) {
                          if (value != null) {
                            setState(() {
                              highlight = true;
                              getCalendarAppointments2(value);
                            });
                          }
                        });
                      },
                      // onTap: () async {
                      //   DateTime date = await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) {
                      //         return allow_location(
                      //           getDate: pickeddate,
                      //         );
                      //       },
                      //     ),
                      //   );
                      //   print(date);
                      //   setState(() {
                      //     pickeddate = date;
                      //     highlight = true;
                      //     getCalendarAppointments2(pickeddate);
                      //   });
                      // },
                      child: Row(
                        children: [
                          Text(
                            displayDate,
                            style: const TextStyle(
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 10,
                            width: 15,
                            child: Image.asset(
                              "assets/images/arrowdown.png",
                            ),
                          ),
                          const Spacer(),
                          // InkWell(
                          //   child: SizedBox(
                          //     height: 20,
                          //     width: 20,
                          //     child: Image.asset("assets/images/setting-4.png"),
                          //   ),
                          //   onTap: () {
                          //     Navigator.push(context, MaterialPageRoute(
                          //       builder: (context) {
                          //         return const filter();
                          //       },
                          //     ));
                          //   },
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "TODAY - ${DateFormat('EEEE').format(pickeddate).toUpperCase()}",
                        style: TextStyle(
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        spaceBetweenChildren: 12,
        animatedIcon: AnimatedIcons.add_event,
        backgroundColor: Color(0xff01635D),
        activeIcon: Icons.close,
        closeDialOnPop: true,
        children: [
          SpeedDialChild(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => add_Your_Work_Hours(
                        secondflow: false,
                        Day: appointMentDetails?.data?.timingOfDay?.day,
                        isOpen: appointMentDetails?.data?.timingOfDay?.isOpen,
                        startTime:
                            appointMentDetails?.data?.timingOfDay?.startTime,
                        endTime: appointMentDetails?.data?.timingOfDay?.endTime,
                        breakstartTime: appointMentDetails
                            ?.data?.timingOfDay?.breakStartTime,
                        breakendTime:
                            appointMentDetails?.data?.timingOfDay?.breakEndTime,
                      ),
                    )).then((value) {
                  var displayDate = DateFormat('yyyy-MM-dd').format(pickeddate);
                  Map<String, dynamic> body = {
                    "day": value["day"],
                    "date": displayDate,
                    "startTime": value["startTime"],
                    "endTime": value["endTime"],
                    "breakStartTime": value["breakStartTime"],
                    "breakEndTime": value["breakEndTime"],
                    "isOpen": value["isOpen"]
                  };
                  saveCalenderAdjustment(body);
                });
              },
              child: Center(
                  child: Image(
                image: AssetImage("assets/images/clock.png"),
                height: 20,
                color: Colors.white,
              )),
              backgroundColor: Color(0xffDD6A03),
              label: "New Break Time"),
          SpeedDialChild(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  newAppoinment_Viwe_Add(),));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => newAppointment("")));
            },
            child: Center(
                child: Image(
              image: AssetImage("assets/images/calender.png"),
              height: 20,
              color: Colors.white,
            )),
            backgroundColor: Color(0xffDD6A03),
            label: "New Appointment",
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.red,
                    height: 70,
                    width: width,
                    child: ListView.builder(
                      itemCount: dates.length,
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              pickeddate = dates[index];
                              calendarcontroller.displayDate = dates[index];
                            });
                            log("pickeddate :; ${pickeddate}");
                            log("calendarcontroller.displayDate :; ${calendarcontroller.displayDate}");
                            getCalendarAppointments2(dates[index]);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   height: height * 0.02,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  DateFormat('E').format(dates[index]),
                                  style: const TextStyle(
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                // ignore: unrelated_type_equality_checks
                                decoration: height != true
                                    ? BoxDecoration(
                                        color: (dates[index].day ==
                                                    pickeddate.day &&
                                                dates[index].month ==
                                                    pickeddate.month &&
                                                dates[index].year ==
                                                    pickeddate.year)
                                            ? const Color(0xff01635D)
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                      )
                                    : null,
                                child: Text(
                                  "${dates[index].day}",
                                  style: TextStyle(
                                    fontFamily: "spartan",
                                    color:
                                        (dates[index].day == pickeddate.day &&
                                                dates[index].month ==
                                                    pickeddate.month &&
                                                dates[index].year ==
                                                    pickeddate.year)
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    // child: SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal ,
                    //   child: Row(
                    //     children:  List.generate(
                    //       lastDayOfMonth.day, (index) => Padding(
                    //         padding: const EdgeInsets.only(right: 13,left: 13),
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //                 () {
                    //               final currentDate = lastDayOfMonth.add(Duration(days: index + 1));
                    //               final dateName = DateFormat('E').format(currentDate);
                    //               return Text(dateName,
                    //                   style: TextStyle(
                    //                       fontFamily: "spartan",
                    //                       color: Colors.black ,
                    //                       fontSize: 15));
                    //             }(),
                    //             SizedBox(height: height*0.01,),
                    //             Text("${index + 1}",
                    //                 style: TextStyle(
                    //                     fontFamily: "spartan",
                    //                     color: Colors.black ,
                    //                     fontSize: 15)),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ),
                  if (employeeDataList.isNotEmpty)
                    Container(
                      // color: Colors.green,
                      height: 70,
                      width: width,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ListView.separated(
                        itemCount: employeeDataList.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemBuilder: (context, index) {
                          var singleEmp = employeeDataList[index];
                          return GestureDetector(
                            onTap: () {
                              for (var item in employeeDataList) {
                                item.isSelected = false;
                              }
                              setState(() {
                                employeeDataList[index].isSelected = true;
                              });
                              // getCalendarAppointments(pickeddate);
                              getCalendarAppointments2(
                                pickeddate,
                                stylishId: employeeDataList[index].id,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 60 : 0,
                                top: 5,
                                bottom: 5,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                color: singleEmp.isSelected
                                    ? const Color(0xff01635D)
                                    : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: singleEmp.isSelected
                                          ? Colors.white.withOpacity(0.8)
                                          : const Color(0xff01635D)
                                              .withOpacity(0.15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        singleEmp.firstName
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff01635D),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 9),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${singleEmp.firstName} ${singleEmp.lastName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: singleEmp.isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        // "sjfbe",
                                        "${singleEmp.workHours.startTime} - ${singleEmp.workHours.endTime}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: singleEmp.isSelected
                                              ? Colors.white.withOpacity(0.65)
                                              : const Color(0xFF707070),
                                          fontSize: 9.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      // child: SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal ,
                      //   child: Row(
                      //     children:  List.generate(
                      //       lastDayOfMonth.day, (index) => Padding(
                      //         padding: const EdgeInsets.only(right: 13,left: 13),
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //                 () {
                      //               final currentDate = lastDayOfMonth.add(Duration(days: index + 1));
                      //               final dateName = DateFormat('E').format(currentDate);
                      //               return Text(dateName,
                      //                   style: TextStyle(
                      //                       fontFamily: "spartan",
                      //                       color: Colors.black ,
                      //                       fontSize: 15));
                      //             }(),
                      //             SizedBox(height: height*0.01,),
                      //             Text("${index + 1}",
                      //                 style: TextStyle(
                      //                     fontFamily: "spartan",
                      //                     color: Colors.black ,
                      //                     fontSize: 15)),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                  Stack(
                    children: [
                      Container(
                        // color: Colors.red
                        margin: const EdgeInsets.all(0),
                        height: height * 0.7,
                        width: double.infinity,
                        child: SfCalendar(
                          monthViewSettings:
                              const MonthViewSettings(showAgenda: true),
                          showCurrentTimeIndicator: true,
                          showWeekNumber: true,
                          specialRegions: _getTimeRegions(),
                          // allowAppointmentResize: true,
                          view: CalendarView.day,
                          firstDayOfWeek: 1,
                          headerHeight: 0,
                          viewHeaderHeight: 0,
                          initialSelectedDate: pickeddate,
                          initialDisplayDate: pickeddate,
                          controller: calendarcontroller,
                          loadMoreWidgetBuilder:
                              (context, loadMoreAppointments) {
                            return isAppointmentsLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const SizedBox();
                          },
                          allowViewNavigation: true,
                          todayHighlightColor: Colors.red,
                          onViewChanged: (viewChangedDetails) {
                            log("viewChangedDetails.visibleDates year :: ${viewChangedDetails.visibleDates.first.year.toString()}    pickeddate.month  ${pickeddate.year}");
                            log("viewChangedDetails.visibleDates month :: ${viewChangedDetails.visibleDates.first.month.toString()} ,,  pickeddate.month ${pickeddate.month}");
                            log("viewChangedDetails.visibleDates  :: ${viewChangedDetails.visibleDates.first.toString()} ,,  pickeddate $pickeddate");
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              getCalendarAppointments2(
                                  viewChangedDetails.visibleDates.first);
                            });
                          },
                          dataSource: getAppointDataSource(),
                          timeSlotViewSettings: TimeSlotViewSettings(
                            numberOfDaysInView: -1,
                            timeIntervalWidth: 50,
                            startHour: 0,
                            endHour: 24,
                            timeRulerSize: 50,
                            timeInterval: Duration(minutes: 15),
                            timelineAppointmentHeight: 50,
                            timeFormat: appointMentDetails
                                        ?.data?.calenderSetting?.formate ==
                                    12
                                ? 'h:mm a'
                                : 'HH:mm',
                            timeIntervalHeight: 35,
                          ),
                          appointmentBuilder: (context,
                              CalendarAppointmentDetails appoDetails) {
                            // log("appointment.subject :${appoDetails.appointments.first.subject}");
                            // log("appointment.startTime :${appoDetails.appointments.first.startTime}");
                            // log("appointment.endTime  :${appoDetails.appointments.first.endTime}");
                            return GestureDetector(
                              // onLongPress: () {
                              //   popupDialog = showPopupAppointmentDialog();
                              //   Overlay.of(context).insert(popupDialog!);
                              // },
                              // // remove the OverlayEntry from Overlay, so it would be hidden
                              // onLongPressEnd: (details) =>
                              //     popupDialog?.remove(),
                              onTap: () {
                                if (DateTime.now().isAfter(
                                    appoDetails.appointments.first.startTime)) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AppointmentDetailScreen(
                                        appointmentId:
                                            appoDetails.appointments.first.id,
                                        isFuture: false,
                                      ),
                                    ),
                                  );
                                  // log("value is : $value");
                                  // if (value as bool == true) {
                                  //   getCalenderAppointsApis();
                                  // }
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentDetailScreen(
                                          appointmentId:
                                              appoDetails.appointments.first.id,
                                          isFuture: true,
                                        ),
                                      ));
                                  // log("value is : $value");
                                  // if (value as bool) {
                                  //   getCalenderAppointsApis();
                                  // }
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 1,
                                  right: 0,
                                  bottom: 1,
                                  top: 1,
                                ),
                                padding: const EdgeInsets.all(7),
                                // width: 161,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  color: appoDetails.appointments.first.color,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Wrap(
                                  spacing: 10,
                                  children: [
                                    Text(
                                      "${DateFormat("hh:mm a").format(appoDetails.appointments.first.startTime)} - ${DateFormat("hh:mm a").format(appoDetails.appointments.first.endTime)}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      appoDetails.appointments.first.subject
                                          .toString()
                                          .split("(")
                                          .first,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "(${appoDetails.appointments.first.subject.toString().split("(")[1]}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Positioned(
                        right: 10,
                        bottom: 50,
                        child: Visibility(
                          visible: !isAppointmentsLoading,
                          child: Visibility(
                            visible: !isThereAnyEvent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "It's All Clear. No Events Today.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: width * 0.4,
                      //       margin: EdgeInsets.only(left: 52, top: 50),
                      //       padding: EdgeInsets.only(left: 10, top: 10),
                      //       decoration: BoxDecoration(
                      //           color: Color(0xFF005874),
                      //           borderRadius: BorderRadius.circular(7)),
                      //       child: InkWell(
                      //         onTap: () {
                      //           Navigator.push(context, MaterialPageRoute(
                      //             builder: (context) {
                      //               return confirmed_fut_appoinment();
                      //             },
                      //           ));
                      //         },
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "8:15 am - 8:45 am",
                      //               style: TextStyle(
                      //                   fontFamily: "spartan",
                      //                   color: Colors.white,
                      //                   fontSize: 12),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "Joe cambel",
                      //               style: TextStyle(
                      //                   fontFamily: "spartan",
                      //                   color: Colors.white,
                      //                   fontSize: 12),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "Men's Cut",
                      //               style: TextStyle(
                      //                   fontFamily: "spartan",
                      //                   color: Colors.white,
                      //                   fontSize: 12),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 100,
                      //       width: width * 0.4,
                      //       margin: EdgeInsets.only(left: 10, top: 50),
                      //       padding: EdgeInsets.only(left: 10, top: 10),
                      //       decoration: BoxDecoration(
                      //           color: Color(0xFF005874),
                      //           borderRadius: BorderRadius.circular(7)),
                      //       child: InkWell(
                      //         onTap: () {
                      //           Navigator.push(context, MaterialPageRoute(
                      //             builder: (context) {
                      //               return confirmed_Apoi_Past();
                      //             },
                      //           ));
                      //         },
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "8:15 am - 8:45 am",
                      //               style: TextStyle(
                      //                   fontFamily: "spartan",
                      //                   color: Colors.white,
                      //                   fontSize: 12),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "Joe cambel",
                      //               style: TextStyle(
                      //                   fontFamily: "spartan",
                      //                   color: Colors.white,
                      //                   fontSize: 12),
                      //             ),
                      //             SizedBox(
                      //               height: 10,
                      //             ),
                      //             Text(
                      //               "Hair Wash",
                      //               style: TextStyle(
                      //                   fontFamily: "spartan",
                      //                   color: Colors.white,
                      //                   fontSize: 12),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: width*0.4,
                      //       margin: EdgeInsets.only(left: 52,top: 250),
                      //       padding: EdgeInsets.only(left: 10,top: 10),
                      //       decoration: BoxDecoration(
                      //           color: Color(0xFF005874),
                      //           borderRadius: BorderRadius.circular(7)
                      //       ),
                      //       child: InkWell(
                      //         onTap: (){
                      //           Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //             return pendind_apoinment();
                      //           },));
                      //         },
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text("8:15 am - 8:45 am",style: TextStyle(fontFamily: "spartan",color: Colors.white,fontSize: 12),),
                      //             SizedBox(height: 10,),
                      //             Text("Joe cambel",style: TextStyle(fontFamily: "spartan",color: Colors.white,fontSize: 12),),
                      //             SizedBox(height: 10,),
                      //             Text("Beard Trim",style: TextStyle(fontFamily: "spartan",color: Colors.white,fontSize: 12),),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Positioned(
                      //   bottom: 180,
                      //   right: 10,
                      //   child: Image(
                      //     image: AssetImage("assets/images/Group 12096.png"),
                      //     fit: BoxFit.cover,
                      //     height: 60,
                      //     width: 60,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  saveCalenderAdjustment(Map<String, dynamic> body) async {
    setState(() {
      isLoading = true;
    });
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var Body = body;
    log("Body => ${jsonEncode(Body)}");
    var response = await http.post(
      Uri.parse(ApiUrlList.saveCalenderAdjustment),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("saveCalenderAdjustment Code : ${response.statusCode}");
    log("saveCalenderAdjustment Body : ${response.body}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      // var displayDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
      // var displayDay = DateFormat('EEEE').format(pickedDate!);
      // getScheduleForDate(displayDate,displayDay.toString());
      // setState(() {
      //   // isLoading = false;
      //   getScheduledData =  GetScheduledData.fromJson(jsonDecode(response.body));
      // });
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
