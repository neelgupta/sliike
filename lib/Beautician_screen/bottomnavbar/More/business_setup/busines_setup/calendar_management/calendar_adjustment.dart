import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../custom_widget/textcommon/textcommon.dart';

class calendar_Adjustment extends StatefulWidget {
  const calendar_Adjustment({Key? key}) : super(key: key);

  @override
  State<calendar_Adjustment> createState() => _calendar_AdjustmentState();
}

class _calendar_AdjustmentState extends State<calendar_Adjustment> {
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
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
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
                                  image:
                                  AssetImage("assets/images/cancel.png"),

                                )),
                          ),
                        ),
                      ),
                      SizedBox(width: width*0.09,),
                      Container(
                        child: Text("Calendar Management",
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SfCalendar(
              headerHeight: 70,
              headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,)
              ),
              todayTextStyle: TextStyle(fontFamily: 'spartan'),
              cellBorderColor: Colors.transparent,
              view: CalendarView.month,
              selectionDecoration: BoxDecoration(
                  border: Border.all(color: Color(0xff01635D))
              ),
              todayHighlightColor: Color(0xff01635D),
              monthViewSettings: MonthViewSettings(
                monthCellStyle: MonthCellStyle(
                    textStyle: TextStyle(fontFamily: 'spartan',color: Colors.black)
                ),
                appointmentDisplayMode: MonthAppointmentDisplayMode.none,
                showTrailingAndLeadingDates: false,
              )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: textComoon("Independently adjust work hours for any day.", 11, Color(0xff414141), FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: dividerCommon(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  width: width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monday",
                        style: TextStyle(
                            color: Color(0xff292929),
                            fontWeight: FontWeight.w300,
                            fontFamily: "spartan",
                            fontSize: 14),
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                            color: Color(0xff292D32),
                            fontWeight: FontWeight.normal,
                            fontFamily: "spartan",
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "9:00 - 17:00",
                        style: TextStyle(
                            color: Color(0xff292929),
                            fontWeight: FontWeight.w300,
                            fontFamily: "spartan",
                            fontSize: 12),
                      ),
                      Text(
                        "Break: 9:00 - 17:00",
                        style: TextStyle(
                            color: Color(0xff292D32),
                            fontWeight: FontWeight.normal,
                            fontFamily: "spartan",
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),

                  Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                  child: Image.asset("assets/images/righticon.png"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: dividerCommon(),
          ),
        ],
      ),
    );
  }
}
