import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'allow_location.dart';
import 'filter.dart';

// ignore: camel_case_types
class calender extends StatefulWidget {
  const calender({Key? key,}) : super(key: key);
  @override
  State<calender> createState() => _calenderState();
}

// ignore: camel_case_types
class _calenderState extends State<calender> {
  DateTime? pickeddate = DateTime.now();
  List<DateTime> dates = [];
  bool highlight = false;

  getDates(DateTime date) {
    setState(() {
      dates.clear();
      int noOfDays = DateTimeRange(start: DateTime(date.year, date.month, 1), end: DateTime(date.year, date.month + 1)).duration.inDays;
      for(int i = 1;i<=noOfDays;i++) {
        dates.add(DateTime(date.year, date.month, i));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDates(DateTime.now());
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
                    InkWell(
                      onTap: () async {
                        DateTime date = await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const allow_location();
                          },
                        ));
                        print(date);
                        getDates(date);
                        setState(() {
                          pickeddate = date;
                          highlight = true;
                        });
                      },
                      child: Row(
                        children: [
                          Text(displayDate,
                              style: const TextStyle(
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 10,
                            width: 15,
                            child: Image.asset("assets/images/arrowdown.png"),
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
      // floatingActionButton: SpeedDial(
      //   spaceBetweenChildren: 12,
      //   animatedIcon: AnimatedIcons.add_event,
      //   backgroundColor: Color(0xff01635D),
      //   children: [
      //     SpeedDialChild(
      //       child: Center(child: Image(image: AssetImage("assets/images/clock.png"),height: 20,color: Colors.white,)),
      //       backgroundColor: Color(0xffDD6A03),
      //       label: "New Break Time"
      //     ),
      //     SpeedDialChild(
      //         child: Center(child: Image(image: AssetImage("assets/images/calender.png"),height: 20,color: Colors.white,)),
      //         backgroundColor: Color(0xffDD6A03),
      //         label: "New Appointment",
      //     ),
      //   ],
      // ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Container(
      //       child: Image(
      //         image: AssetImage("assets/images/Group 12096.png"),
      //         fit: BoxFit.cover,
      //         height: 60,
      //         width: 60,
      //       ),
      //     ),
      //     SizedBox(
      //       height: height * 0.04,
      //     ),
      //     FloatingActionButton(
      //       backgroundColor: Color(0xff01635D),
      //       onPressed: () {
      //         setState(() {
      //           Navigator.push(context, MaterialPageRoute(
      //             builder: (context) {
      //               return newAppointment();
      //             },
      //           ));
      //         });
      //       },
      //       child: Icon(
      //         Icons.add,
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        SizedBox(
          height: height*0.10,
          width: width,
          child: ListView.builder(itemCount: dates.length,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: height * 0.02,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Text(DateFormat('E').format(dates[index]),
                          style: const TextStyle(
                              fontFamily: "spartan",
                              color: Colors.black,
                              fontSize: 15)),
                      ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    // ignore: unrelated_type_equality_checks
                    decoration: height != true ? BoxDecoration(
                      color: dates[index]==pickeddate? const Color(0xff01635D):Colors.transparent,
                      shape: BoxShape.circle,
                    ):null,
                    child: Text("${dates[index].day}",
                        style: TextStyle(
                            fontFamily: "spartan",
                            color: dates[index]==pickeddate? Colors.white:Colors.black,
                            fontSize: 15)),
                  ),
                ],
              ),
            );
          },),
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
}
