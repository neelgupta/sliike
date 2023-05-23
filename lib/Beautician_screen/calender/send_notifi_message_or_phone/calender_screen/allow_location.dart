import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// ignore: camel_case_types
class allow_location extends StatefulWidget {
  const allow_location({Key? key}) : super(key: key);

  @override
  State<allow_location> createState() => _allow_locationState();
}

// ignore: camel_case_types
class _allow_locationState extends State<allow_location> {
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
          color: const Color(0xffF5F7F7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20,right: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.arrow_back_ios_new),
                        SizedBox(
                          width: width*0.17,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Text("Thu, 03 Mar 2022",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Color(0xff01635D))),
                                Icon(Icons.keyboard_arrow_up)
                              ],
                            ),
                            const Text("THIS MONTH",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.black54))
                          ],
                        ),
                        SizedBox(
                          width: width*0.17,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded),
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
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(
              height: height*0.04,
            ),
            SizedBox(
              height: height*0.50,
              child: SfCalendar(
                headerHeight: 100,
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,)
                ),
                todayTextStyle: const TextStyle(fontFamily: 'spartan'),
                cellBorderColor: Colors.transparent,
                view: CalendarView.month,
                selectionDecoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff01635D))
                ),
                todayHighlightColor: const Color(0xff01635D),
                monthViewSettings: const MonthViewSettings(
                  monthCellStyle: MonthCellStyle(
                    textStyle: TextStyle(fontFamily: 'spartan',color: Colors.black)
                  ),
                  appointmentDisplayMode: MonthAppointmentDisplayMode.none,
                  showTrailingAndLeadingDates: false,
                  )
                ),
            ),
          ],
        ),
      )
    );
  }
}
