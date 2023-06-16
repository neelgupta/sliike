import 'dart:convert';
import 'dart:developer';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/addworkhours_model.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/addwork_hours_save_or_thanks_page.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/breaktime_select_page.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import '../../../bottomnavbar/More/business_setup/busines_setup/calendar_management/busines_hours.dart';
import 'package:http/http.dart' as http;
import '../../../custom_widget/checkbox.dart';

// ignore: camel_case_types
class add_Your_Work_Hours extends StatefulWidget {
  add_Your_Work_Hours({Key? key,required this.secondflow,this.Day,this.startTime,this.endTime,this.isOpen,this.breakendTime,this.breakstartTime}) : super(key: key);
  final bool secondflow;
  String ? Day;
  String  ? startTime;
  String  ? endTime;
  bool  ? isOpen;
  String  ? breakstartTime;
  String  ? breakendTime;

  @override
  State<add_Your_Work_Hours> createState() => _add_Your_Work_HoursState();
}

// ignore: camel_case_types
class _add_Your_Work_HoursState extends State<add_Your_Work_Hours> {
  bool isLoading = false;
  Duration initialTimer = const Duration();
  bool backworkhours = true;
  bool status = true;
  AddWorkModel? addworkMmdel;
  bool isbottomSheet = true;

  int startTimeIndex = 0;
  int endTimeIndex = 0;

  FixedExtentScrollController? _scrollWheelController;
    FixedExtentScrollController ?_scrollControllerEndTime;

  List<DayDetails> dayDetailsList = [
    DayDetails(
      day: "Monday",
      startTime: "",
      endTime: "",
      breakStartTime: "",
      breakEndTime: "",
      isOpen: false,
    ),
    DayDetails(
        day: "Tuesday",
        startTime: "",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Wednesday",
        startTime: "",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Thursday",
        startTime: "",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Friday",
        startTime: "",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Saturday",
        startTime: "",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Sunday",
        startTime: "",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
  ];

  bool emptystartendtime() {
    bool? isValid = true;
    if (selectedValue == "Monday") {
      var dayd = dayDetailsList[0];

      if (dayd.startTime == "" || dayd.endTime == "") {
        isValid = false;
        print("isValid=$isValid");
      } else if (dayd.startTime == "00:00" || dayd.endTime == "00:00") {
        isValid = false;
        print("isValid00=$isValid");
      }
    } else if (selectedValue == "Tuesday") {
      var dayd = dayDetailsList[1];

      if (dayd.startTime == "" || dayd.endTime == "") {
        isValid = false;
      } else if (dayd.startTime == "00:00" || dayd.endTime == "00:00") {
        isValid = false;
        print("isValid00=$isValid");
      }
    } else if (selectedValue == "Wednesday") {
      var dayd = dayDetailsList[2];

      if (dayd.startTime == "" || dayd.endTime == "") {
        isValid = false;
      } else if (dayd.startTime == "00:00" || dayd.endTime == "00:00") {
        isValid = false;
        print("isValid00=$isValid");
      }
    } else if (selectedValue == "Thursday") {
      var dayd = dayDetailsList[3];

      if (dayd.startTime == "" || dayd.endTime == "") {
        isValid = false;
      } else if (dayd.startTime == "00:00" || dayd.endTime == "00:00") {
        isValid = false;
        print("isValid00=$isValid");
      }
    } else if (selectedValue == "Friday") {
      var dayd = dayDetailsList[4];

      if (dayd.startTime == "" || dayd.endTime == "") {
        isValid = false;
      } else if (dayd.startTime == "00:00" || dayd.endTime == "00:00") {
        isValid = false;
        print("isValid00=$isValid");
      }
    } else if (selectedValue == "Saturday") {
      var dayd = dayDetailsList[5];

      if (dayd.startTime == "" || dayd.endTime == "") {
        isValid = false;
      } else if (dayd.startTime == "00:00" || dayd.endTime == "00:00") {
        isValid = false;
        print("isValid00=$isValid");
      }
    } else if (selectedValue == "Sunday") {
      var dayd = dayDetailsList[6];

      if (dayd.startTime == "" || dayd.endTime == "") {
        isValid = false;
      } else if (dayd.startTime == "00:00" || dayd.endTime == "00:00") {
        isValid = false;
        print("isValid00=$isValid");
      }
    }
    setState(() {});
    return isValid;
  }

  // ignore: non_constant_identifier_names
  bool Onoff = false;
  String startTime = "";
  String endTime = "";
  String breakstartTime = "";
  String breakendTime = "";
  List time = [
    "00:00",
    "01:00",
    "01:15",
    "01:30",
    "01:45",
    "02:00",
    "02:15",
    "02:30",
    "02:45",
    "03:00",
    "03:15",
    "03:30",
    "03:45",
    "04:00",
    "04:15",
    "04:30",
    "04:45",
    "05:00",
    "05:15",
    "05:30",
    "05:45",
    "06:00",
    "06:15",
    "06:30",
    "06:45",
    "07:00",
    "07:15",
    "07:30",
    "07:45",
    "08:00",
    "08:15",
    "08:30",
    "08:45",
    "09:00",
    "09:15",
    "09:30",
    "09:45",
    "10:00",
    "10:15",
    "10:30",
    "10:45",
    "11:00",
    "11:15",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "13:00",
    "13:15",
    "13:30",
    "13:45",
    "14:00",
    "14:15",
    "14:30",
    "14:45",
    "15:00",
    "15:15",
    "15:30",
    "15:45",
    "16:00",
    "16:15",
    "16:30",
    "16:45",
    "17:00",
    "17:15",
    "17:30",
    "17:45",
    "18:00",
    "18:15",
    "18:30",
    "18:45",
    "19:00",
    "19:15",
    "19:30",
    "19:45",
    "20:00",
    "20:15",
    "20:30",
    "20:45",
    "21:00",
    "21:15",
    "21:30",
    "21:45",
    "22:00",
    "22:15",
    "22:30",
    "22:45",
    "23:00",
    "23:15",
    "23:30",
    "23:45",
    "24:00",
  ];
  List timeend = [
    "00:00",
    "01:00",
    "01:15",
    "01:30",
    "01:45",
    "02:00",
    "02:15",
    "02:30",
    "02:45",
    "03:00",
    "03:15",
    "03:30",
    "03:45",
    "04:00",
    "04:15",
    "04:30",
    "04:45",
    "05:00",
    "05:15",
    "05:30",
    "05:45",
    "06:00",
    "06:15",
    "06:30",
    "06:45",
    "07:00",
    "07:15",
    "07:30",
    "07:45",
    "08:00",
    "08:15",
    "08:30",
    "08:45",
    "09:00",
    "09:15",
    "09:30",
    "09:45",
    "10:00",
    "10:15",
    "10:30",
    "10:45",
    "11:00",
    "11:15",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "13:00",
    "13:15",
    "13:30",
    "13:45",
    "14:00",
    "14:15",
    "14:30",
    "14:45",
    "15:00",
    "15:15",
    "15:30",
    "15:45",
    "16:00",
    "16:15",
    "16:30",
    "16:45",
    "17:00",
    "17:15",
    "17:30",
    "17:45",
    "18:00",
    "18:15",
    "18:30",
    "18:45",
    "19:00",
    "19:15",
    "19:30",
    "19:45",
    "20:00",
    "20:15",
    "20:30",
    "20:45",
    "21:00",
    "21:15",
    "21:30",
    "21:45",
    "22:00",
    "22:15",
    "22:30",
    "22:45",
    "23:00",
    "23:15",
    "23:30",
    "23:45",
    "24:00",
  ];
  String pickedtime = "";

  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;

  final List<String> items = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  String selectedValue = "Monday";

  onDayStartTimeChanged({
    required String startTime,
  }) {
    if (selectedValue == "Monday") {
      for (var item in dayDetailsList) {
        if (item.day == "Monday") {
          item.startTime = startTime;
          log("item.startTime :${item.startTime}");
        }
      }
    } else if (selectedValue == "Tuesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Tuesday") {
          item.startTime = startTime;
        }
      }
    } else if (selectedValue == "Wednesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Wednesday") {
          item.startTime = startTime;
        }
      }
    } else if (selectedValue == "Thursday") {
      for (var item in dayDetailsList) {
        if (item.day == "Thursday") {
          item.startTime = startTime;
        }
      }
    } else if (selectedValue == "Friday") {
      for (var item in dayDetailsList) {
        if (item.day == "Friday") {
          item.startTime = startTime;
        }
      }
    } else if (selectedValue == "Saturday") {
      for (var item in dayDetailsList) {
        if (item.day == "Saturday") {
          item.startTime = startTime;
        }
      }
    } else if (selectedValue == "Sunday") {
      for (var item in dayDetailsList) {
        if (item.day == "Sunday") {
          item.startTime = startTime;
        }
      }
    }
  }

  onDayendtimeChanged({required String endTime}) {
    if (selectedValue == "Monday") {
      for (var item in dayDetailsList) {
        if (item.day == "Monday") {
          item.endTime = endTime;
          log("item.startTime :${item.endTime}");
        }
      }
    } else if (selectedValue == "Tuesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Tuesday") {
          item.endTime = endTime;
        }
      }
    } else if (selectedValue == "Wednesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Wednesday") {
          item.endTime = endTime;
        }
      }
    } else if (selectedValue == "Thursday") {
      for (var item in dayDetailsList) {
        if (item.day == "Thursday") {
          item.endTime = endTime;
        }
      }
    } else if (selectedValue == "Friday") {
      for (var item in dayDetailsList) {
        if (item.day == "Friday") {
          item.endTime = endTime;
        }
      }
    } else if (selectedValue == "Saturday") {
      for (var item in dayDetailsList) {
        if (item.day == "Saturday") {
          item.endTime = endTime;
        }
      }
    } else if (selectedValue == "Sunday") {
      for (var item in dayDetailsList) {
        if (item.day == "Sunday") {
          item.endTime = endTime;
        }
      }
    }
  }

  onDayBreakStartTimeChanged({
    required String breakstartTime,
  }) {
    if (selectedValue == "Monday") {
      for (var item in dayDetailsList) {
        if (item.day == "Monday") {
          item.breakStartTime = breakstartTime;
          log("item.startTime :${item.breakStartTime}");
        }
      }
    } else if (selectedValue == "Tuesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Tuesday") {
          item.breakStartTime = breakstartTime;
        }
      }
    } else if (selectedValue == "Wednesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Wednesday") {
          item.breakStartTime = breakstartTime;
        }
      }
    } else if (selectedValue == "Thursday") {
      for (var item in dayDetailsList) {
        if (item.day == "Thursday") {
          item.breakStartTime = breakstartTime;
        }
      }
    } else if (selectedValue == "Friday") {
      for (var item in dayDetailsList) {
        if (item.day == "Friday") {
          item.breakStartTime = breakstartTime;
        }
      }
    } else if (selectedValue == "Saturday") {
      for (var item in dayDetailsList) {
        if (item.day == "Saturday") {
          item.breakStartTime = breakstartTime;
        }
      }
    } else if (selectedValue == "Sunday") {
      for (var item in dayDetailsList) {
        if (item.day == "Sunday") {
          item.breakStartTime = breakstartTime;
        }
      }
    }
  }

  onDayBreakEndTimeChanged({
    required String breakendTime,
  }) {
    if (selectedValue == "Monday") {
      for (var item in dayDetailsList) {
        if (item.day == "Monday") {
          item.breakEndTime = breakendTime;
          log("item.startTime :${item.breakEndTime}");
        }
      }
    } else if (selectedValue == "Tuesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Tuesday") {
          item.breakEndTime = breakendTime;
        }
      }
    } else if (selectedValue == "Wednesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Wednesday") {
          item.breakEndTime = breakendTime;
        }
      }
    } else if (selectedValue == "Thursday") {
      for (var item in dayDetailsList) {
        if (item.day == "Thursday") {
          item.breakEndTime = breakendTime;
        }
      }
    } else if (selectedValue == "Friday") {
      for (var item in dayDetailsList) {
        if (item.day == "Friday") {
          item.breakEndTime = breakendTime;
        }
      }
    } else if (selectedValue == "Saturday") {
      for (var item in dayDetailsList) {
        if (item.day == "Saturday") {
          item.breakEndTime = breakendTime;
        }
      }
    } else if (selectedValue == "Sunday") {
      for (var item in dayDetailsList) {
        if (item.day == "Sunday") {
          item.breakEndTime = breakendTime;
        }
      }
    }
  }

  onoffchanged({
    required bool isOpen,
  }) {
    if (selectedValue == "Monday") {
      for (var item in dayDetailsList) {
        if (item.day == "Monday") {
          item.isOpen = isOpen;
          log("item. :${item.isOpen}");
        }
      }
    } else if (selectedValue == "Tuesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Tuesday") {
          item.isOpen = isOpen;
        }
      }
    } else if (selectedValue == "Wednesday") {
      for (var item in dayDetailsList) {
        if (item.day == "Wednesday") {
          item.isOpen = isOpen;
        }
      }
    } else if (selectedValue == "Thursday") {
      for (var item in dayDetailsList) {
        if (item.day == "Thursday") {
          item.isOpen = isOpen;
        }
      }
    } else if (selectedValue == "Friday") {
      for (var item in dayDetailsList) {
        if (item.day == "Friday") {
          item.isOpen = isOpen;
        }
      }
    } else if (selectedValue == "Saturday") {
      for (var item in dayDetailsList) {
        if (item.day == "Saturday") {
          item.isOpen = isOpen;
        }
      }
    } else if (selectedValue == "Sunday") {
      for (var item in dayDetailsList) {
        if (item.day == "Sunday") {
          item.isOpen = isOpen;
        }
      }
    }
  }

  openOtherDaySelectChanged({
    required String selectedDay,
    required int index,
    required bool value,
  }) {
    String day = "";
    String startTimeS = "";
    String endTimeS = "";
    String breakStartTimeS = "";
    String breakEndTimeS = "";
    print("selectedDay. :$selectedDay");

    // for (var item in dayDetailsList) {
    //   log("item.day : ${item.day} . ${item.startTime} . ${item.endTime}");
    //   if (item.isOpen! == true) {
    //     day = item.day!;
    //     startTimeS = item.startTime!;
    //     endTimeS = item.endTime!;
    //     print("item.day :${day} . ${startTimeS} . ${endTimeS}");
    //   }
    // }

    var anyThere = dayDetailsList.any((item) {
      // log("firs ttt.day : ${item.day} . ${item.startTime} . ${item.endTime}");
      if (item.isOpen!) {
        day = item.day!;
        startTimeS = item.startTime!;
        endTimeS = item.endTime!;
        breakStartTimeS = item.breakStartTime!;
        breakEndTimeS = item.breakEndTime!;
        log("item.day :$day . $startTimeS . $endTimeS");
        return true;
      }
      return false;
    });

    if (anyThere) {
      for (var dval in dayDetailsList) {
        if (selectedDay == dval.day) {
          for (var dayT in dayDetailsList) {
            if (dayT.day == day) {
              dval.startTime = dayT.startTime;
              dval.endTime = dayT.endTime;
              dval.breakStartTime = dayT.breakStartTime;
              dval.breakEndTime = dayT.breakEndTime;
              print("item.startTime==:${dval.startTime}");
              print("item.endTime==:${dval.endTime}");
            }
          }
        }
      }
      // log("item. :${item.isOpen}");
      setState(() {});
    }
  }

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.Day!;
    startTime = widget.startTime!;
    endTime = widget.endTime!;
    Onoff = widget.isOpen!;
    for(var i in dayDetailsList){
      i.isOpen = widget.isOpen;
      setState(() {});
    }

    for(int i = 0; i < time.length; i++){
      if(startTime == time[i]){
        startTimeIndex = i;

        _scrollWheelController = FixedExtentScrollController(
          initialItem: startTimeIndex,
        );
        print(startTimeIndex);

      }
    }
    for(int i = 0; i < timeend.length; i++){
      if(endTime == timeend[i]){
        endTimeIndex = i;

        _scrollControllerEndTime = FixedExtentScrollController(
          initialItem: endTimeIndex,
        );
        print(startTimeIndex);

      }
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

    return WillPopScope(
      onWillPop: backwillpop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.18, //
          flexibleSpace: Container(
            color: const Color(0xff01635D),
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
                              backwillpop();
                              // if(isbottomSheet==false){
                              //    navigtorbackshowdialodhide(context);
                              // }else{
                              //   Navigator.pop(context);
                              // }
                              //
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                              child: Center(
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Image(
                                      image: AssetImage(
                                          "assets/images/backwhite.png"),
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Add Your Work Hours",
                                  style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 60,
                          ),
                          Expanded(
                            child: Text(
                                "That is your available work hours that\nyour clients can see.",
                                style: TextStyle(
                                    fontSize: 10,
                                    // you can change it accordingly
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.normal)),
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
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                !widget.secondflow?SizedBox():Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: widget.secondflow == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "4/",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff292929),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffA0A0A0),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "3/",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff292929),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffA0A0A0),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          dropdownWidth: 250,
                          dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: const Color(0xffE7E7E7))),
                          isExpanded: true,
                          items: _addDividersAfterItems(items),
                          customItemsHeights: _getCustomItemsHeights(),
                          value: selectedValue,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff292929),
                              fontFamily: " spartan",
                              fontWeight: FontWeight.bold),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                          buttonHeight: 40,
                          dropdownMaxHeight: 300,
                          buttonWidth: 130,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                      Column(
                        children: [
                          FlutterSwitch(
                            width: 55.0,
                            height: 25.0,
                            valueFontSize: 12.0,
                            toggleSize: 18.0,
                            activeColor: const Color(0xff01635D),
                            value: selectedValue == "Monday"
                                ? dayDetailsList[0].isOpen!
                                : selectedValue == "Tuesday"
                                    ? dayDetailsList[1].isOpen!
                                    : selectedValue == "Wednesday"
                                        ? dayDetailsList[2].isOpen!
                                        : selectedValue == "Thursday"
                                            ? dayDetailsList[3].isOpen!
                                            : selectedValue == "Friday"
                                                ? dayDetailsList[4].isOpen!
                                                : selectedValue == "Saturday"
                                                    ? dayDetailsList[5].isOpen!
                                                    : selectedValue == "Sunday"
                                                        ? dayDetailsList[6]
                                                            .isOpen!
                                                        : Onoff,
                            onToggle: (value) {
                              setState(() {
                                // onoffchanged(isOpen: value) ;
                                onoffchanged(isOpen: value);
                                Onoff = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Onoff
                              ? const Text(
                                  "Open",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff707070),
                                      fontFamily: "spartan"),
                                )
                              : const Text("Close",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff707070),
                                      fontFamily: "spartan")),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),

                selectedValue == "Monday"
                    ? dayDetailsList[0].isOpen!
                        ? startTimePiker()
                        : SizedBox(
                            height: height * 0.45,
                          )
                    : const SizedBox(),
                selectedValue == "Tuesday"
                    ? dayDetailsList[1].isOpen!
                        ? startTimePiker()
                        : SizedBox(
                            height: height * 0.45,
                          )
                    : const SizedBox(),

                selectedValue == "Wednesday"
                    ? dayDetailsList[2].isOpen!
                        ? startTimePiker()
                        : SizedBox(
                            height: height * 0.45,
                          )
                    : const SizedBox(),

                selectedValue == "Thursday"
                    ? dayDetailsList[3].isOpen!
                        ? startTimePiker()
                        : SizedBox(
                            height: height * 0.45,
                          )
                    : const SizedBox(),
                selectedValue == "Friday"
                    ? dayDetailsList[4].isOpen!
                        ? startTimePiker()
                        : SizedBox(
                            height: height * 0.45,
                          )
                    : const SizedBox(),
                selectedValue == "Saturday"
                    ? dayDetailsList[5].isOpen!
                        ? startTimePiker()
                        : SizedBox(
                            height: height * 0.45,
                          )
                    : const SizedBox(),
                selectedValue == "Sunday"
                    ? dayDetailsList[6].isOpen!
                        ? startTimePiker()
                        : SizedBox(
                            height: height * 0.45,
                          )
                    : const SizedBox(),

                ///BreakTime

                selectedValue == "Monday"
                    ? dayDetailsList[0].breakStartTime! != ""
                        ? BreakTimeCommon()
                        : AddButtonbreak()
                    : const SizedBox(),
                selectedValue == "Tuesday"
                    ? dayDetailsList[1].breakStartTime! != ""
                        ? BreakTimeCommon()
                        : AddButtonbreak()
                    : const SizedBox(),
                selectedValue == "Wednesday"
                    ? dayDetailsList[2].breakStartTime! != ""
                        ? BreakTimeCommon()
                        : AddButtonbreak()
                    : const SizedBox(),
                selectedValue == "Thursday"
                    ? dayDetailsList[3].breakStartTime! != ""
                        ? BreakTimeCommon()
                        : AddButtonbreak()
                    : const SizedBox(),
                selectedValue == "Friday"
                    ? dayDetailsList[4].breakStartTime! != ""
                        ? BreakTimeCommon()
                        : AddButtonbreak()
                    : const SizedBox(),
                selectedValue == "Saturday"
                    ? dayDetailsList[5].breakStartTime! != ""
                        ? BreakTimeCommon()
                        : AddButtonbreak()
                    : const SizedBox(),
                selectedValue == "Sunday"
                    ? dayDetailsList[6].breakStartTime! != ""
                        ? BreakTimeCommon()
                        : AddButtonbreak()
                    : const SizedBox(),

                ///...............
                // Onoff == true
                //     ? breakstartTime == ""
                //         ? SizedBox(height: 0)
                //         :
                // BreakTimeCommon(): Container(
                //         // height: height * 0.1,
                //         ),

                InkWell(
                  onTap: () {
                    if(!widget.secondflow){
                      Navigator.pop(context, {
                        "day": selectedValue,
                        "startTime": startTime,
                        "endTime": endTime,
                        "breakStartTime": breakstartTime,
                        "breakEndTime": breakendTime,
                        "isOpen": Onoff,
                      });
                      print("POp Data :  ${{
                        "day": selectedValue,
                        "startTime": startTime,
                        "endTime": endTime,
                        "breakStartTime": breakstartTime,
                        "breakEndTime": breakendTime,
                        "isOpen": Onoff,
                      }}");
                    }else{
                      if (Onoff == false) {
                        Fluttertoast.showToast(
                            msg: "Enter Your Switch Open",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        print("onofffalse=$Onoff");
                      }
                      else if (startTimeIndex == endTimeIndex) {
                        Fluttertoast.showToast(msg: "Time cannot be same");
                      } else if (startTimeIndex > endTimeIndex) {
                        Fluttertoast.showToast(msg: "Invaild selected time !");
                      }
                      // else {
                      //   onDayendtimeChanged(endTime: endTime);
                      // }
                      // else if (!emptystartendtime()) {
                      //   Fluttertoast.showToast(
                      //       msg: "Enter Your Start End Time",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.BOTTOM,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Colors.black,
                      //       textColor: Colors.white,
                      //       fontSize: 16.0);
                      //   print("startendtime=====");
                      // }
                      else {
                        onDayendtimeChanged(endTime: endTime);
                        if (isbottomSheet == true) {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                )),
                            builder: (BuildContext context) {
                              return Container(
                                height: height - height * 0.12,
                                width: width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: const Text(
                                                "Want To Copy Work Hours To\nOther Days?",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff292929),
                                                    fontFamily: "spartan",
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: const Text(
                                                "Would you like to apply the already setup working\n"
                                                    "hours to other days? If so, select days from the list.",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xff414141),
                                                    fontFamily: "spartan",
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          const Divider(
                                            thickness: 1,
                                            color: Color(0xffCFCFCF),
                                          ),
                                          ListView.separated(
                                            separatorBuilder: (context, index) =>
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Divider(
                                                color: Colors.black,
                                              ),
                                            ),
                                            physics:
                                            const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: dayDetailsList.length,
                                            itemBuilder: (context, index) {
                                              return Commoncheckbox(context,
                                                  dayDetailsList[index].isOpen,
                                                      (value) {
                                                    if (value) {
                                                      openOtherDaySelectChanged(
                                                        selectedDay:
                                                        dayDetailsList[index]
                                                            .day!,
                                                        index: index,
                                                        value: value,
                                                      );
                                                      setState(() {
                                                        dayDetailsList[index].isOpen =
                                                            value;
                                                      });
                                                    } else {
                                                      for (var item
                                                      in dayDetailsList) {
                                                        if (item.day ==
                                                            dayDetailsList[index]
                                                                .day!) {
                                                          item.startTime = "";
                                                          item.endTime = "";
                                                        }
                                                      }
                                                      setState(() {
                                                        dayDetailsList[index].isOpen =
                                                            value;
                                                      });
                                                    }
                                                  },
                                                  dayDetailsList[index]
                                                      .day
                                                      .toString(),
                                                  dayDetailsList[index]
                                                      .startTime
                                                      .toString(),
                                                  dayDetailsList[index].isOpen!
                                                      ? "to"
                                                      : "",
                                                  dayDetailsList[index]
                                                      .endTime
                                                      .toString());
                                            },
                                          ),
                                          SizedBox(
                                            height: height * 0.06,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                await navigtorbackshowdialodhide(context);
                                                // if(!widget.secondflow){
                                                //   Navigator.pop(context);
                                                //   Navigator.pop(context,dayDetailsList);
                                                // }else{
                                                // Navigator.pop(context);
                                                // await navigtorbackshowdialodhide(context);
                                                // }
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: width,
                                                height: height * 0.06,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(5),
                                                    color:
                                                    const Color(0xff01635D)),
                                                child: const Text("SAVE",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: "spartan",
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                // Navigator.push(context,
                                                //     MaterialPageRoute(
                                                //   builder: (context) {
                                                //     return addWork_Save_or_NoThanks_Page(
                                                //         widget.secondflow);
                                                //   },
                                                // ));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: width,
                                                height: height * 0.06,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color:
                                                      const Color(0xff01635D),
                                                      width: 1),
                                                ),
                                                child: const Text(
                                                  "No, Thanks",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "spartan",
                                                    color: Color(0xff01635D),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.05,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          navigtorbackshowdialodhide(context);
                        }
                        print("onoffftrue=$Onoff");
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff01635D)),
                      child: const Text("SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  // ignore: non_constant_identifier_names
  Widget AddButtonbreak() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        height: height * 0.1,
        width: width * 0.5,
        child: InkWell(
          onTap: () async {
            await navigateBreakTimeScreen(context);
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add_circle_outline_rounded,
                size: 25,
                color: Color(0xff2F80ED),
              ),
              SizedBox(
                width: 5,
              ),
              Text("ADD BREAK TIME",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff2F80ED),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BreakTimeCommon() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return SizedBox(
      height: height * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 1,
              color: Color(0xffCFCFCF),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: const Text(
                "Break Time",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff707070),
                    fontFamily: "spartan",
                    fontWeight: FontWeight.normal),
              )),
          InkWell(
            onTap: () async {
              await navigateBreakTimeScreen(context);
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  breakstartTime,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.08,
                ),
                const Text(
                  "to",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.08,
                ),
                Text(
                  breakendTime,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff707070),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 1,
              color: Color(0xffCFCFCF),
            ),
          ),
        ],
      ),
    );
  }

  Widget startTimePiker() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    // double width = MediaQuery.of(context).size.width -
    //     MediaQuery.of(context).padding.right -
    //     MediaQuery.of(context).padding.left;

    return SizedBox(
      height: height * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: CupertinoPicker(
              itemExtent: 60,
              scrollController: _scrollWheelController,
              onSelectedItemChanged: (index) {
                setState(() {
                  startTime = time[index];
                  startTimeIndex = index;
                  onDayStartTimeChanged(startTime: time[index]);
                  print("startTime$startTime");
                });
              },
              children: time.map((text) => Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(text,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
                textComoon("to", 15, const Color(0xff292929), FontWeight.w500),
          ),
          SizedBox(
            width: 100,
            child: CupertinoPicker(
              scrollController: _scrollControllerEndTime,
              itemExtent: 60,
              onSelectedItemChanged: (index) {
                setState(() {
                  endTimeIndex = index;
                  endTime = time[index];
//               var now =DateTime.now()
// ;              var sTim = DateTime(now.year,);
//               var eTime = DateTime(now.year,);
                  // print("endTime$endTime");
                });
                  if (endTime == startTime) {
                    Fluttertoast.showToast(msg: "Time cannot be same");
                  } else if (startTimeIndex > endTimeIndex) {
                    Fluttertoast.showToast(msg: "Invaild selected time !");
                  } else {
                    onDayendtimeChanged(endTime: time[index]);
                  }
              },
              children: timeend
                  .map((text2) => Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(text2,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  ///NAvigor back Screen data................
  Future<void> navigateBreakTimeScreen(BuildContext context) async {
    final result = Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return brealTime_Select();
      },
    ));

    if (!mounted) return;
    dynamic data = await result;
    if (data != null && data.length > 1) {
      onDayBreakStartTimeChanged(breakstartTime: breakstartTime = data[0]);
      onDayBreakEndTimeChanged(breakendTime: breakendTime = data[1]);
      // breakendTime = data[1];
    }
    log("breakstartTime $breakstartTime");
    log("breakendTime $breakendTime");
  }

  Future<void> navigtorbackshowdialodhide(BuildContext context) async {
    final result1 = Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return addWork_Save_or_NoThanks_Page(
              widget.secondflow, dayDetailsList);
        },
      ),
      (route) => false,
    );

    if (!mounted) return;
    // bool? data1 = await result1;
    dynamic data1 = await result1;

    if (data1 != null && data1.length > 1) {
      isbottomSheet = data1[0];
      selectedValue = data1[1];
      onDayStartTimeChanged(startTime: startTime = data1[2]);
      onDayendtimeChanged(endTime: endTime = data1[3]);
      breakstartTime = data1[4];
      breakendTime = data1[5];
      setState(() {});

      // breakendTime = data[1];
    }

    // onDayStartTimeChanged(startTime: time.first=data1[2]);
    // onDayendtimeChanged(endTime: timeend.first=data1[3]);
    log("isbottomSheet $isbottomSheet");
    log("startTime:==== $startTime");
    log("endTime:==== $endTime");
  }

  Future<bool> backwillpop() async {
    if (isbottomSheet == false) {
      await navigtorbackshowdialodhide(context);
    } else {
      Navigator.pop(context, true);
    }
    return false;
  }
}

// ignore: non_constant_identifier_names
Widget Commoncheckbox(BuildContext context, dynamic values, dynamic onChangedm,
    String day, String starttime, String to, String endtime) {
  // double height = MediaQuery.of(context).size.height -
  //     MediaQuery.of(context).padding.top -
  //     MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;

  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Custom_Checkbox(
                isChecked: values,
                onChange: onChangedm,
                backgroundColor: const Color(0xff01635D),
                borderColor: const Color(0xff01635D),
                icon: Icons.check,
                size: 20,
                iconSize: 18,
              ),
            ),
            // Checkbox(
            //   activeColor: Color(0xff01635D),
            //   value: values,
            //   onChanged: on
            //
            //   Changedm,
            // ),
            SizedBox(
              width: width * 0.3,
              child: Text(
                day,
                style: const TextStyle(
                    color: Color(0xff292929),
                    fontWeight: FontWeight.w300,
                    fontFamily: "spartan",
                    fontSize: 14),
              ),
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              starttime,
              style: const TextStyle(
                  color: Color(0xff292929),
                  fontWeight: FontWeight.w300,
                  fontFamily: "spartan",
                  fontSize: 14),
            ),

            Text(to,
                style: const TextStyle(
                    color: Color(0xff292929),
                    fontWeight: FontWeight.w300,
                    fontFamily: "spartan",
                    fontSize: 14)),
            Text(
              endtime,
              style: const TextStyle(
                  color: Color(0xff292929),
                  fontWeight: FontWeight.w300,
                  fontFamily: "spartan",
                  fontSize: 14),
            ),
          ],
        ),
      ],
    ),
  );
}
