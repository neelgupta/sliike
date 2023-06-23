import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/add_your_work_hours.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/addwork_hours_save_or_thanks_page.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../../../custom_widget/textcommon/textcommon.dart';
import 'package:http/http.dart' as http;

class calendar_Adjustment extends StatefulWidget {
  const calendar_Adjustment({Key? key}) : super(key: key);

  @override
  State<calendar_Adjustment> createState() => _calendar_AdjustmentState();
}
class _calendar_AdjustmentState extends State<calendar_Adjustment> {
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var displayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var displayDay = DateFormat('EEEE').format(DateTime.now());
    getScheduleForDate(displayDate,displayDay.toString());
  }

  bool isLoading = false;

  GetScheduledData ? getScheduledData;

  DateTime? pickedDate = DateTime.now();

  Map<String,dynamic> Data = {};

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
                          print(Helper.prefs!.getString(UserPrefs.keyutoken));
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
      body: isLoading ?
          Center(child: CircularProgressIndicator(color: Color(0xff01635D)),):
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SfCalendar(
              viewHeaderHeight: 50,
              headerHeight: 50,
              headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,)
              ),
              todayTextStyle: TextStyle(fontFamily: 'spartan',color: Colors.white),
              cellBorderColor: Colors.transparent,
              view: CalendarView.month,
              controller: _calendarController,
              initialSelectedDate: pickedDate,
              initialDisplayDate: pickedDate,
              onTap: (calendarTapDetails) {
                pickedDate = calendarTapDetails.date;
                // var displayDate = DateFormat('E, d MMM yyyy').format(pickedDate!);
                var displayDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
                var displayDay = DateFormat('EEEE').format(pickedDate!);
                print("displayDay :: ${displayDay}");
                log("displayDate :; $displayDate");
                log("displayDay :; $displayDay");
                getScheduleForDate(displayDate,displayDay.toString());
              },
              selectionDecoration: BoxDecoration(
                // color: Color(0xff01635D),
                shape: BoxShape.circle,
                border: Border.all(width: 2,color: Color(0xff01635D)),
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
            child:
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {return add_Your_Work_Hours(
                    secondflow: false,
                    Day: getScheduledData!.data!.day,
                    startTime: getScheduledData!.data!.startTime,
                    endTime: getScheduledData!.data!.endTime,
                    isOpen: getScheduledData!.data!.isOpen,
                    breakendTime: getScheduledData!.data!.breakEndTime,
                    breakstartTime: getScheduledData!.data!.breakStartTime,

                );},)).then((value) {
                  print("value : ${value}");
                  print("value.runtimeType : ${value.runtimeType}");
                  print("value : ${value}");
                  var displayDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
                  Map<String,dynamic> valuesMap = value;
                  if(value!=null) {
                    var data = getData(
                      isOpen: valuesMap["isOpen"],
                      breakEndTime: valuesMap["breakEndTime"] ?? null,
                      breakStartTime: valuesMap["breakStartTime"] ?? null,
                      day: valuesMap["day"],
                      endTime: valuesMap["endTime"],
                      startTime: valuesMap["startTime"],
                      date: displayDate,
                    );

                    getScheduledData!.data = data;
                    // value;
                    setState(() {});
                    print("getScheduledData ${getScheduledData!.data!}");
                    print("valuesMap ${valuesMap["isOpen"]}");
                    print("valuesMap ${displayDate}");
                  }
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${getScheduledData!.data!.day}",
                          style: TextStyle(
                              color: Color(0xff292929),
                              fontWeight: FontWeight.w300,
                              fontFamily: "spartan",
                              fontSize: 14),
                        ),
                        // Text(
                        //   "Today",
                        //   style: TextStyle(
                        //       color: Color(0xff292D32),
                        //       fontWeight: FontWeight.normal,
                        //       fontFamily: "spartan",
                        //       fontSize: 10),
                        // ),
                      ],
                    ),
                  ),

                  Container(
                    child: getScheduledData!.data!.isOpen! ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${getScheduledData!.data!.startTime} - ${getScheduledData!.data!.endTime}",
                          style: TextStyle(
                              color: Color(0xff292929),
                              fontWeight: FontWeight.w300,
                              fontFamily: "spartan",
                              fontSize: 12),
                        ),
                        Text(
                          "Break: ${getScheduledData!.data!.breakStartTime} - ${getScheduledData!.data!.breakEndTime}",
                          style: TextStyle(
                              color: Color(0xff292D32),
                              fontWeight: FontWeight.normal,
                              fontFamily: "spartan",
                              fontSize: 10),
                        ),
                      ],
                    ) : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Closed",
                          style: TextStyle(
                              color: Color(0xff292929),
                              fontWeight: FontWeight.w300,
                              fontFamily: "spartan",
                              fontSize: 12),
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
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: dividerCommon(),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
              child: CommonButton(context, "SAVE",12, FontWeight.w600, Colors.white, () {
                saveCalenderAdjustment();
              })),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }

  getScheduleForDate(String date,String day) async {
    setState(() {
      isLoading = true;
    });
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var Body = {
      "date" : date,
      "day" : day
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.getScheduleForDate),
      body: jsonEncode(Body),
      headers: Headers,
    );
    print(Headers);
    log("getScheduleForDate Code : ${response.statusCode}");
    log("getScheduleForDate Body : ${response.body}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 200) {
      setState(() {
        isLoading = false;
        getScheduledData =  GetScheduledData.fromJson(jsonDecode(response.body));
      });
      // Fluttertoast.showToast(
      //     msg: map["message"],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    } else {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }


  saveCalenderAdjustment() async {
    setState(() {
      isLoading = true;
    });
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var Body = getScheduledData!.data;
    log("Body => ${jsonEncode(Body)}");
    var response = await http.post(
      Uri.parse(ApiUrlList.saveCalenderAdjustment),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("saveCalenderAdjustment Code : ${response.statusCode}");
    log("saveCalenderAdjustment Body : ${response.body}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 200) {
      var displayDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
      var displayDay = DateFormat('EEEE').format(pickedDate!);
      getScheduleForDate(displayDate,displayDay.toString());
      setState(() {
        // isLoading = false;
        getScheduledData =  GetScheduledData.fromJson(jsonDecode(response.body));
      });
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
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
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }



}

GetScheduledData getScheduledDataFromJson(String str) => GetScheduledData.fromJson(json.decode(str));

String getScheduledDataToJson(GetScheduledData data) => json.encode(data.toJson());

class GetScheduledData {
  int? status;
  bool? success;
  getData? data;

  GetScheduledData({
    this.status,
    this.success,
    this.data,
  });

  factory GetScheduledData.fromJson(Map<String, dynamic> json) => GetScheduledData(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : getData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
  };
}

class getData {
  String? day;
  String? startTime;
  String? endTime;
  String? breakStartTime;
  String? breakEndTime;
  bool? isOpen;
  String? id;
  String? date;

  getData({
    this.day,
    this.startTime,
    this.endTime,
    this.breakStartTime,
    this.breakEndTime,
    this.isOpen,
    this.id,
    this.date
  });

  factory getData.fromJson(Map<String, dynamic> json) => getData(
    day: json["day"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    breakStartTime: json["breakStartTime"],
    breakEndTime: json["breakEndTime"],
    isOpen: json["isOpen"],
    id: json["_id"],
    date: json["date"]
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "startTime": startTime,
    "endTime": endTime,
    "breakStartTime": breakStartTime,
    "breakEndTime": breakEndTime,
    "isOpen": isOpen,
    "_id": id,
    "date" : date,
  };
}

