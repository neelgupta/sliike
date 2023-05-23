import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../bottomnavbar/calender/send_notifi_message_or_phone/confirmed_Future_Apoi/confirmed_appoinment/future_appointment/confirmad_appo_.dart';
import '../../../bottomnavbar/calender/send_notifi_message_or_phone/confirmed_Future_Apoi/confirmed_appoinment/past_appoinment/confirmed_appo_past.dart';
import '../../../bottomnavbar/calender/send_notifi_message_or_phone/confirmed_Future_Apoi/confirmed_appoinment/pendind_apoinment/pending/pendind_apoinment.dart';
import '../new_appoinment/new_appoinment.dart';
import 'allow_location.dart';
import 'filter.dart';

// ignore: camel_case_types
class calender extends StatefulWidget {
  const calender({Key? key}) : super(key: key);

  @override
  State<calender> createState() => _calenderState();
}

// ignore: camel_case_types
class _calenderState extends State<calender> {
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
          color: const Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20, bottom: height * 0.03, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Thu, 03 Mar 2022",
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: SizedBox(
                            height: 10,
                            width: 15,
                            child: Image.asset("assets/images/arrowdown.png"),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const allow_location();
                              },
                            ));
                          },
                        ),
                        const Spacer(),
                        InkWell(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset("assets/images/setting-4.png"),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const filter();
                              },
                            ));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text("TODAY - TUESDAY",
                          style: TextStyle(
                              fontSize: 10,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Image(
            image: AssetImage("assets/images/Group 12096.png"),
            fit: BoxFit.cover,
            height: 60,
            width: 60,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          FloatingActionButton(
            backgroundColor: const Color(0xff01635D),
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return newAppointment();
                  },
                ));
              });
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
      Stack(
        children: [
          SizedBox(
            height: height * 0.86 - 56,
            child: SfCalendar(
              view: CalendarView.day,
              headerHeight: 0,
              initialSelectedDate: DateTime.now().add(const Duration(days: 2)),
              initialDisplayDate: DateTime.now().add(const Duration(days: 2)),
              viewHeaderHeight: 0,
              viewNavigationMode: ViewNavigationMode.none,
              timeSlotViewSettings: const TimeSlotViewSettings(
                allDayPanelColor: Colors.yellow,
                timeIntervalWidth: 50,
                startHour: 8,
                endHour: 23,
                numberOfDaysInView: 31,
                timeInterval: Duration(minutes: 15),
                timeFormat: 'h:mm a',
                timeIntervalHeight: 50,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: width * 0.4,
                margin: const EdgeInsets.only(left: 52, top: 50),
                padding: const EdgeInsets.only(left: 10, top: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFF005874),
                    borderRadius: BorderRadius.circular(7)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const confirmed_fut_appoinment();
                      },
                    ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "8:15 am - 8:45 am",
                        style: TextStyle(
                            fontFamily: "spartan",
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Joe cambel",
                        style: TextStyle(
                            fontFamily: "spartan",
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Men's Cut",
                        style: TextStyle(
                            fontFamily: "spartan",
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: width * 0.4,
                margin: const EdgeInsets.only(left: 10, top: 50),
                padding: const EdgeInsets.only(left: 10, top: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFF005874),
                    borderRadius: BorderRadius.circular(7)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const confirmed_Apoi_Past();
                      },
                    ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "8:15 am - 8:45 am",
                        style: TextStyle(
                            fontFamily: "spartan",
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Joe cambel",
                        style: TextStyle(
                            fontFamily: "spartan",
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hair Wash",
                        style: TextStyle(
                            fontFamily: "spartan",
                            color: Colors.white,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: width*0.4,
                margin: const EdgeInsets.only(left: 52,top: 250),
                padding: const EdgeInsets.only(left: 10,top: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFF005874),
                    borderRadius: BorderRadius.circular(7)
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const pendind_apoinment();
                    },));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("8:15 am - 8:45 am",style: TextStyle(fontFamily: "spartan",color: Colors.white,fontSize: 12),),
                      SizedBox(height: 10,),
                      Text("Joe cambel",style: TextStyle(fontFamily: "spartan",color: Colors.white,fontSize: 12),),
                      SizedBox(height: 10,),
                      Text("Beard Trim",style: TextStyle(fontFamily: "spartan",color: Colors.white,fontSize: 12),),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: width,
            color: Colors.green,
          ),
        ],
      ),
        ],
      ),
    );
  }
}
