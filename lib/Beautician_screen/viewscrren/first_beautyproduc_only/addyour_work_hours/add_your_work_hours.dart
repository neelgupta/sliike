import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/addworkhours_model.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/addwork_hours_save_or_thanks_page.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/breaktime_select_page.dart';
import 'package:new_sliikeapps_apps/utils/app_colors.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

import '../../../custom_widget/checkbox.dart';

// ignore: camel_case_types
class add_Your_Work_Hours extends StatefulWidget {
  add_Your_Work_Hours(
      {Key? key,
      required this.secondflow,
      this.Day,
      this.startTime,
      this.endTime,
      this.isOpen,
      this.breakendTime,
      this.breakstartTime})
      : super(key: key);
  final bool secondflow;
  String? Day;
  String? startTime;
  String? endTime;
  bool? isOpen;
  String? breakstartTime;
  String? breakendTime;

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
  FixedExtentScrollController? _scrollControllerEndTime;

  List<DayDetails> dayDetailsList = [
    DayDetails(
      day: "Monday",
      startTime: "00:00",
      endTime: "",
      breakStartTime: "",
      breakEndTime: "",
      isOpen: false,
    ),
    DayDetails(
        day: "Tuesday",
        startTime: "00:00",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Wednesday",
        startTime: "00:00",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Thursday",
        startTime: "00:00",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Friday",
        startTime: "00:00",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Saturday",
        startTime: "00:00",
        endTime: "",
        breakStartTime: "",
        breakEndTime: "",
        isOpen: false),
    DayDetails(
        day: "Sunday",
        startTime: "00:00",
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
    "00:15",
    "00:30",
    "00:45",
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
    "00:15",
    "00:30",
    "00:45",
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
  int selectedValueIndex = 0;

  onoffchanged({
    required bool isOpen,
  }) {
    for (var item in dayDetailsList) {
      if (item.day == selectedValue) {
        item.isOpen = isOpen;
        log("item. :${item.isOpen}");
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
    startTime = time[startTimeIndex];
    endTime = timeend[endTimeIndex];
    if (!widget.secondflow) {
      print(widget.Day);
      print(widget.startTime);
      print(widget.endTime);
      print(widget.breakstartTime);
      print(widget.breakendTime);
      print(widget.isOpen);
      selectedValue = widget.Day ?? "";
      startTime = widget.startTime ?? "";
      endTime = widget.endTime ?? "";
      breakstartTime = widget.breakstartTime ?? "";
      breakendTime = widget.breakendTime ?? "";
      Onoff = widget.isOpen ?? false;
      if (selectedValue == "Monday") {
        selectedValueIndex = 0;
      } else if (selectedValue == "Tuesday") {
        selectedValueIndex = 1;
      } else if (selectedValue == "Wednesday") {
        selectedValueIndex = 2;
      } else if (selectedValue == "Thursday") {
        selectedValueIndex = 3;
      } else if (selectedValue == "Friday") {
        selectedValueIndex = 4;
      } else if (selectedValue == "Saturday") {
        selectedValueIndex = 5;
      } else if (selectedValue == "Sunday") {
        selectedValueIndex = 6;
      }
      for (var i in dayDetailsList) {
        if (i.day == selectedValue) {
          i.startTime = widget.startTime ?? "";
          i.endTime = widget.endTime ?? "";
          i.breakStartTime = widget.breakstartTime ?? "";
          i.breakEndTime = widget.breakendTime ?? "";
          i.isOpen = Onoff;
          setState(() {});
          print(selectedValue);
          print(i.startTime);
          print(i.endTime);
          print(i.breakStartTime);
          print(i.breakEndTime);
          print(i.isOpen);
        }
      }
      setState(() {});
      print(selectedValue);
      print(startTime);
      print(endTime);
      print(breakstartTime);
      print(breakendTime);
      print(Onoff);
    }

    for (int i = 0; i < time.length; i++) {
      if (startTime == time[i]) {
        startTimeIndex = i;

        _scrollWheelController = FixedExtentScrollController(
          initialItem: startTimeIndex,
        );
        print(startTimeIndex);
        break;
      }
    }
    for (int i = 0; i < timeend.length; i++) {
      if (endTime == timeend[i]) {
        endTimeIndex = i;

        _scrollControllerEndTime = FixedExtentScrollController(
          initialItem: endTimeIndex,
        );
        print(startTimeIndex);
        break;
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
      onWillPop: () async {
        return await true;
      },
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
                              Navigator.pop(context);
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
                              Text(
                                "Add Your Work Hours",
                                style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
        body: SizedBox(
          width: width,
          child: Column(
            children: [
              SizedBox(height: 20),
              !widget.secondflow
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: widget.secondflow == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "4/",
                                  style: TextStyle(
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                                Text(
                                  "4",
                                  style: TextStyle(
                                    color: Color(0xffA0A0A0),
                                    fontFamily: "spartan",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "3/",
                                  style: TextStyle(
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(
                                    color: Color(0xffA0A0A0),
                                    fontFamily: "spartan",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.25,
                                  ),
                                ),
                              ],
                            ),
                    ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IgnorePointer(
                      ignoring: !widget.secondflow,
                      child: DropdownButtonHideUnderline(
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
                            color: Color(0xff292929),
                            fontFamily: " spartan",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                          onChanged: (String? value) {
                            if (widget.secondflow) {
                              setState(() {
                                selectedValue = value!;
                                if (selectedValue == "Monday") {
                                  selectedValueIndex = 0;
                                } else if (selectedValue == "Tuesday") {
                                  selectedValueIndex = 1;
                                } else if (selectedValue == "Wednesday") {
                                  selectedValueIndex = 2;
                                } else if (selectedValue == "Thursday") {
                                  selectedValueIndex = 3;
                                } else if (selectedValue == "Friday") {
                                  selectedValueIndex = 4;
                                } else if (selectedValue == "Saturday") {
                                  selectedValueIndex = 5;
                                } else if (selectedValue == "Sunday") {
                                  selectedValueIndex = 6;
                                }
                              });
                            }
                          },
                          buttonHeight: 40,
                          dropdownMaxHeight: 300,
                          buttonWidth: 120,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        FlutterSwitch(
                          width: 50,
                          height: 24,
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
                        const SizedBox(height: 8),
                        Onoff
                            ? const Text(
                                "Open",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff707070),
                                    fontFamily: "spartan"),
                              )
                            : const Text(
                                "Close",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff707070),
                                  fontFamily: "spartan",
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
                indent: 10,
                endIndent: 10,
              ),
              // const SizedBox(height: 15),
              dayDetailsList[selectedValueIndex].isOpen!
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          startTimePiker(),
                          dayDetailsList[selectedValueIndex].breakStartTime! !=
                                  ""
                              ? BreakTimeCommon()
                              : AddButtonbreak()
                        ],
                      ),
                    )
                  : Container(
                      height: height * 0.01,
                    ),
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            if (!widget.secondflow) {
              // if (Onoff) {
              if (endTime == startTime) {
                showToast(message: "Start Time and End Time cannot be same !");
              } else if (startTimeIndex > endTimeIndex) {
                showToast(
                    message: "Choose Valid Selected Start And End time !");
              } else if (selectedValue.isEmpty) {
                showToast(message: "Please select week day !");
              } else if (startTime.isEmpty) {
                showToast(message: "Please select start time !");
              } else if (endTime.isEmpty) {
                showToast(message: "Please select end time !");
              } else if (breakstartTime.isEmpty) {
                showToast(message: "Please select break start time !");
              } else if (breakendTime.isEmpty) {
                showToast(message: "Please select break end time !");
              } else {
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
              }
              // }
            } else {
              if (Onoff) {
                if (startTimeIndex == endTimeIndex) {
                  showToast(message: "Start Time and End Time can not be same");
                } else if (startTimeIndex > endTimeIndex) {
                  showToast(message: "Start Time Should be Before End Time");
                } else {
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
                                    SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text(
                                          "Want To Copy Work Hours To\nOther Days?",
                                          style: TextStyle(
                                            color: Color(0xff292929),
                                            fontFamily: "spartan",
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text(
                                          "Would you like to apply the already setup working\n"
                                          "hours to other days? If so, select days from the list.",
                                          style: TextStyle(
                                            color: Color(0xff414141),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.19,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    const Divider(
                                      thickness: 1,
                                      color: Color(0xffCFCFCF),
                                    ),
                                    ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: dayDetailsList.length,
                                      separatorBuilder: (context, index) =>
                                          Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Divider(
                                          color: AppColors.greyColor,
                                        ),
                                      ),
                                      itemBuilder: (context, index) {
                                        return Commoncheckbox(context,
                                            dayDetailsList[index].isOpen,
                                            (value) {
                                          if (value) {
                                            openOtherDaySelectChanged(
                                              selectedDay:
                                                  dayDetailsList[index].day!,
                                              index: index,
                                              value: value,
                                            );
                                            setState(() {
                                              dayDetailsList[index].isOpen =
                                                  value;
                                            });
                                          } else {
                                            for (var item in dayDetailsList) {
                                              if (item.day ==
                                                  dayDetailsList[index].day!) {
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
                                            dayDetailsList[index].isOpen!
                                                ? dayDetailsList[index]
                                                    .startTime
                                                    .toString()
                                                : "",
                                            dayDetailsList[index].isOpen!
                                                ? "to"
                                                : "",
                                            dayDetailsList[index].isOpen!
                                                ? dayDetailsList[index]
                                                    .endTime
                                                    .toString()
                                                : "");
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
                                          await navigtorbackshowdialodhide(
                                              context);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: width,
                                          height: height * 0.06,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xff01635D)),
                                          child: const Text(
                                            "SAVE",
                                            style: TextStyle(
                                              fontFamily: "spartan",
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
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
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: width,
                                          height: height * 0.06,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: const Color(0xff01635D),
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
                                    SizedBox(height: height * 0.05),
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
                }
              } else {
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
                                  SizedBox(height: 40),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        "Want To Copy Work Hours To\nOther Days?",
                                        style: TextStyle(
                                          color: Color(0xff292929),
                                          fontFamily: "spartan",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        "Would you like to apply the already setup working\n"
                                        "hours to other days? If so, select days from the list.",
                                        style: TextStyle(
                                          color: Color(0xff414141),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.19,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  const Divider(
                                    thickness: 1,
                                    color: Color(0xffCFCFCF),
                                  ),
                                  ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: dayDetailsList.length,
                                    separatorBuilder: (context, index) =>
                                        Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Divider(
                                        color: AppColors.greyColor,
                                      ),
                                    ),
                                    itemBuilder: (context, index) {
                                      return Commoncheckbox(
                                          context, dayDetailsList[index].isOpen,
                                          (value) {
                                        if (value) {
                                          openOtherDaySelectChanged(
                                            selectedDay:
                                                dayDetailsList[index].day!,
                                            index: index,
                                            value: value,
                                          );
                                          setState(() {
                                            dayDetailsList[index].isOpen =
                                                value;
                                          });
                                        } else {
                                          for (var item in dayDetailsList) {
                                            if (item.day ==
                                                dayDetailsList[index].day!) {
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
                                          dayDetailsList[index].day.toString(),
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
                                        await navigtorbackshowdialodhide(
                                            context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width,
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color(0xff01635D)),
                                        child: const Text(
                                          "SAVE",
                                          style: TextStyle(
                                            fontFamily: "spartan",
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
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
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width,
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: const Color(0xff01635D),
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
                                  SizedBox(height: height * 0.05),
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
            // }
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 10),
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff01635D)),
              child: const Text(
                "SAVE",
                style: TextStyle(
                  fontFamily: "spartan",
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
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
    return !Onoff
        ? SizedBox()
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 40,
            width: width * 0.5,
            child: InkWell(
              onTap: () async {
                if (Onoff) {
                  if (endTime == startTime) {
                    showToast(
                        message: "Start Time and End Time can not be same");
                  } else if (startTimeIndex > endTimeIndex) {
                    showToast(message: "Start Time Should be Before End Time");
                  } else if (selectedValue.isEmpty) {
                    showToast(message: "Please select day");
                  } else if (startTime.isEmpty) {
                    showToast(message: "Please select start time");
                  } else if (endTime.isEmpty) {
                    showToast(message: "Please select end time");
                  } else {
                    await navigateBreakTimeScreen(context);
                    setState(() {});
                  }
                  print("onofffalse=$Onoff");
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    size: 24,
                    color: Color(0xff2F80ED),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "ADD BREAK TIME",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff2F80ED),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
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
      height: 90,
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
                color: Color(0xff707070),
                fontFamily: "spartan",
                fontSize: 17,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.25,
              ),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () async {
              await navigateBreakTimeScreen(context);
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayDetailsList[selectedValueIndex].breakStartTime ?? "",
                  style: const TextStyle(
                    color: Color(0xff707070),
                    fontFamily: "spartan",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.25,
                  ),
                ),
                SizedBox(width: 50),
                const Text(
                  "to",
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontFamily: "spartan",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.25,
                  ),
                ),
                SizedBox(width: 50),
                Text(
                  dayDetailsList[selectedValueIndex].breakEndTime ?? "",
                  style: const TextStyle(
                    color: Color(0xff707070),
                    fontFamily: "spartan",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.25,
                  ),
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

    return SizedBox(
      height: height * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: CupertinoPicker(
              itemExtent: 60,
              squeeze: 1.5,
              scrollController: _scrollWheelController,
              onSelectedItemChanged: (index) {
                setState(() {
                  startTime = time[index];
                  startTimeIndex = index;
                  for (var item in dayDetailsList) {
                    if (item.day == selectedValue) {
                      item.startTime = startTime;
                      log("item.startTime :${item.startTime}");
                      log("item.day :${item.day}");
                    }
                  }
                });
              },
              children: time
                  .map((text) => Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black,
                            ),
                          ),
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
              squeeze: 1.5,
              onSelectedItemChanged: (index) {
                setState(() {
                  endTimeIndex = index;
                  endTime = time[index];
                  for (var item in dayDetailsList) {
                    if (item.day == selectedValue) {
                      item.endTime = endTime;
                      log("item.startTime : ${item.endTime}");
                      log("item.day : ${item.day}");
                    }
                  }
                });
              },
              children: timeend
                  .map((text2) => Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            text2,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black,
                            ),
                          ),
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
        return BreakTimeSelect(
          startTime: startTime,
          endTime: endTime,
          dayName: selectedValue,
        );
      },
    ));

    if (!mounted) return;
    dynamic data = await result;
    if (data != null && data.length > 1) {
      for (var item in dayDetailsList) {
        if (item.day == selectedValue) {
          item.breakStartTime = data[0];
          item.breakEndTime = data[1];
          log("item.startTime :${item.breakEndTime}");
          log("item.endTime :${item.breakEndTime}");
        }
      }
    }
  }

  Future<void> navigtorbackshowdialodhide(BuildContext context) async {
    final result1 = Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return addWork_Save_or_NoThanks_Page(
            widget.secondflow,
            dayDetailsList,
          );
        },
      ),
      // (route) => false,
    );
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
            SizedBox(width: width * 0.03),
            Text(
              starttime,
              style: const TextStyle(
                  color: Color(0xff292929),
                  fontWeight: FontWeight.w300,
                  fontFamily: "spartan",
                  fontSize: 14),
            ),
            SizedBox(width: 8),
            Text(
              to,
              style: const TextStyle(
                color: Color(0xff292929),
                fontWeight: FontWeight.w300,
                fontFamily: "spartan",
                fontSize: 14,
              ),
            ),
            SizedBox(width: 8),
            Text(
              endtime,
              style: const TextStyle(
                color: Color(0xff292929),
                fontWeight: FontWeight.w300,
                fontFamily: "spartan",
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
