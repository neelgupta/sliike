import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: camel_case_types
class allow_location extends StatefulWidget {
  const allow_location({Key? key, required this.getDate}) : super(key: key);

  final DateTime getDate;

  @override
  State<allow_location> createState() => _allow_locationState();
}

// ignore: camel_case_types
class _allow_locationState extends State<allow_location> {
  DateTime now = DateTime.now();
  DateTime? pickeddate = DateTime.now();
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    pickeddate = widget.getDate;
    _calendarController.displayDate = widget.getDate;
  }

  @override
  Widget build(BuildContext context) {
    var displayDate = DateFormat('E, d MMM yyyy').format(pickeddate!);
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, pickeddate);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.14, //
          elevation: 1,
          flexibleSpace: Container(
            color: const Color(0xffF5F7F7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _calendarController.backward!();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 22,
                            ),
                          ),
                          // SizedBox(
                          //   width: width * 0.17,
                          // ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    displayDate,
                                    style: const TextStyle(
                                      fontFamily: 'spartan',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff01635D),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_up,
                                    color: Color(0xff01635D),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "THIS MONTH",
                                style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   width: width * 0.17,
                          // ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              _calendarController.forward!();
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 22,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: height * 0.54,
                child: SfCalendar(
                  controller: _calendarController,
                  viewNavigationMode: ViewNavigationMode.none,
                  initialSelectedDate: pickeddate,
                  initialDisplayDate: pickeddate,
                  onTap: (calendarTapDetails) {
                    pickeddate = calendarTapDetails.date;
                    log("pickeddate :; $pickeddate");
                    Navigator.pop(context, calendarTapDetails.date);
                  },
                  selectionDecoration: const BoxDecoration(
                    // color: Color(0xff01635D),
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //   color: const Color(0xFFDD6A03),
                    // ),
                  ),
                  monthCellBuilder: (context, details) {
                    var gotDate = details.date;
                    return Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: (gotDate.day == pickeddate!.day &&
                                gotDate.month == pickeddate!.month &&
                                gotDate.year == pickeddate!.year)
                            ? const Color(0xff01635D)
                            : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "${details.date.day}",
                          style: TextStyle(
                            color: (gotDate.day == pickeddate!.day &&
                                    gotDate.month == pickeddate!.month &&
                                    gotDate.year == pickeddate!.year)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                  headerHeight: 100,
                  headerStyle: const CalendarHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'spartan',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  todayTextStyle: const TextStyle(
                    fontFamily: 'spartan',
                  ),
                  cellBorderColor: Colors.transparent,
                  view: CalendarView.month,
                  backgroundColor: Colors.white,
                  // todayHighlightColor: const Color(0xff01635D),
                  monthViewSettings: const MonthViewSettings(
                    monthCellStyle: MonthCellStyle(
                      textStyle: TextStyle(
                        fontFamily: 'spartan',
                        color: Colors.black,
                      ),
                    ),
                    appointmentDisplayMode: MonthAppointmentDisplayMode.none,
                    showTrailingAndLeadingDates: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
