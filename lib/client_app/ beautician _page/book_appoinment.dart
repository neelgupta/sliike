// ignore_for_file: use_build_context_synchronously, camel_case_types, must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/booking_summary.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/booking_panding.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import '../../commonClass.dart';

class book_appoinment extends StatefulWidget {
  String? serviceTypeName;
  String? price;
  String? duration;
  String? beauticianId;
  String? serviceId;
  String? serviceDuration;
  String? bookingId;

  book_appoinment({Key? key,
    this.serviceTypeName,
    this.price,
    this.duration,
    this.beauticianId,
    this.serviceId,
    this.serviceDuration,
    this.bookingId}) : super(key: key);

  @override
  State<book_appoinment> createState() => _book_appoinmentState();
}

class _book_appoinmentState extends State<book_appoinment> {
  final CalendarController _controller = CalendarController();
  TextEditingController note = TextEditingController();
  StylistList? sl;
  String _text = '';
  String pickedtime = "";
  String status = "";
  int i = 0;
  String calenderTime = "";
  String calenderDate = "";
  OnlyoneModal? onlyonemodal;
  String StylistId = "";
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
  getTimeFormatedValue(String minute) {
    String formatedTime = "";
    switch (minute) {
      case "00:30":
        formatedTime = "30 min";
        break;
      case "01:00":
        formatedTime = "60 min";
        break;
      case "01:30":
        formatedTime = "90 min";
        break;
      case "02:00":
        formatedTime = "110 min";
        break;
      case "02:30":
        formatedTime = "140 min";
        break;
      case "03:00":
        formatedTime = "170 min";
        break;
      case "03:30":
        formatedTime = "200 min";
        break;
      case "04:00":
        formatedTime = "230 min";
        break;
      case "04:30":
        formatedTime = "260 min";
        break;
      case "05:00":
        formatedTime = "290 min";
        break;
      case "05:30":
        formatedTime = "310 min";
        break;
      case "06:00":
        formatedTime = "340 min";
        break;
      case "06:30":
        formatedTime = "360 min";
        break;
    }
    return formatedTime;
  }
  DateTime datetime = DateTime.now();
  List<Data> stylistName = [];
  List servicePlace = [
    "Beautician’s place",
    "At my place",
  ];
  String? _selectedLocation;
  String? _selectedPlace;
  bool isLoading = false;
  Appointment? a;
  int? placeid;
  bool dateTime = false;

  @override
  void initState() {
    super.initState();
    datetime = getDateTime();
    print(widget.beauticianId);
    widget.bookingId != null ? getAppointmentPastList(widget.bookingId):getStylistList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height -
        MediaQuery
            .of(context)
            .padding
            .top -
        MediaQuery
            .of(context)
            .padding
            .bottom;
    double width = MediaQuery
        .of(context)
        .size
        .width -
        MediaQuery
            .of(context)
            .padding
            .right -
        MediaQuery
            .of(context)
            .padding
            .left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(
                  image: AssetImage("assets/images/bgappbar.png"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.06,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              image: AssetImage("assets/images/Group 55.png"),
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("set_appointment",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold))
                            .tr(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Color(0xffDD6A03),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              width: width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(onlyonemodal != null ? "${onlyonemodal!.data!.serviceId!.serviceType!.serviceTypeName}":"${widget.serviceTypeName}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "spartan",
                            color: Colors.black)),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(onlyonemodal != null ? "\$${onlyonemodal!.data!.serviceId!.price}":"\$${widget.price}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Text(onlyonemodal != null ? "for ${getTimeFormatedValue(onlyonemodal!.data!.serviceId!.duration.toString())}":"${widget.duration}",
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("Set_date_time",
                    style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xff111111),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w500))
                    .tr(),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 48,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xff707070), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$_text $calenderTime',
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            color: Color(0xff707070),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w500,))
                      ,
                      const Spacer(),
                      const VerticalDivider(
                        color: Colors.black54,
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Color(0xff707070),
                        ),
                        onTap: () {
                          setState(() {
                            dateTime = false;
                            datewtimeDialog();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            dateTime
                ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.topLeft,
              height: 30,
              child: Text(status,
                style: const TextStyle(
                    fontFamily: 'spartan',
                    fontSize: 12,
                    color: Colors.red
                ),
              ),
            ) : SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("select_stylist",
                    style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xff111111),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w500))
                    .tr(),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 48,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xff707070), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    underline: Container(
                      color: Colors.white,
                    ),
                    style: const TextStyle(
                        fontFamily: "spartan", color: Colors.black),
                    isExpanded: true,
                    icon: Row(
                      children: const [
                        VerticalDivider(
                          color: Colors.black54,
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined,
                            size: 30),
                      ],
                    ),
                    hint: const Text('No Preference'),
                    // Not necessary for Option 1
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        dateTime = false;
                        _selectedLocation = newValue;
                        StylistId = _selectedLocation!;
                      });
                    },
                    items: stylistName.map((stylist) {
                      return DropdownMenuItem<String>(
                        value: stylist.id,
                        child: Text(
                            "${stylist.firstName} ${stylist.lastName}"),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("Preferred place of service",
                    style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xff111111),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w500))
                    .tr(),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 48,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xff707070), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    underline: Container(
                      color: Colors.white,
                    ),
                    style: const TextStyle(
                        fontFamily: "spartan", color: Colors.black),
                    isExpanded: true,
                    icon: Row(
                      children: const [
                        VerticalDivider(
                          color: Colors.black54,
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined,
                            size: 30),
                      ],
                    ),
                    hint: const Text('Select Place'),
                    // Not necessary for Option 1
                    value: _selectedPlace,
                    onChanged: (newValue) {
                      if (newValue == "Beautician’s place") {
                        placeid = 0;
                      } else {
                        placeid = 1;
                      }
                      setState(() {
                        _selectedPlace = newValue;
                      });
                    },
                    items: servicePlace.map((servicePlace) {
                      return DropdownMenuItem<String>(
                        value: servicePlace,
                        child: Text(servicePlace),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("drop_a_note",
                    style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Color(0xff111111),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w500))
                    .tr(),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("note_info",
                    style: TextStyle(
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black54,
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w500))
                    .tr(),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: note,
                style:
                const TextStyle(fontFamily: "spartan", fontSize: 12),
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'note_hint'.tr(),
                  labelStyle: const TextStyle(
                      fontFamily: 'spartan', color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  if(widget.bookingId != null){
                    updateAppointment(widget.bookingId);
                  } else if (pickedtime.isEmpty && _text.isEmpty) {
                    setState(() {
                      dateTime = true;
                      status = "Please select Date and Time";
                    });
                  } else {
                    setState(() {
                      addAppointment();
                    });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffDD6A03)),
                  child: const Text("continue",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white))
                      .tr(),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
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
          insetPadding: const EdgeInsets.all(10),
          child: StatefulBuilder(
            builder: (context, setState1) {
              return Container(
                height: height - 60,
                width: width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      textComoon("Select Appointment Date", 12,
                          const Color(0xff111111), FontWeight.w600),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: height * 0.38,
                            child: SfCalendar(
                                controller: _controller,
                                viewNavigationMode: ViewNavigationMode.none,
                                onSelectionChanged: (details) {
                                },
                                onTap: (details) {
                                  if (_controller.view == CalendarView.month ||
                                      _controller.view ==
                                          CalendarView.timelineMonth) {
                                    _text = DateFormat('dd, MMMM yyyy')
                                        .format(details.date!)
                                        .toString();
                                    setState1(() {});
                                  } else {
                                    _text = DateFormat('dd, MMMM yyyy hh:mm a')
                                        .format(details.date!)
                                        .toString();
                                    setState1(() {});
                                  }
                                },
                                headerHeight: 55,
                                headerStyle: const CalendarHeaderStyle(
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                      fontFamily: 'spartan',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFDD6A03),
                                      fontSize: 20,
                                    )),
                                todayTextStyle:
                                const TextStyle(fontFamily: 'spartan'),
                                cellBorderColor: Colors.transparent,
                                view: CalendarView.month,
                                viewHeaderStyle: const ViewHeaderStyle(
                                    dayTextStyle:
                                    TextStyle(color: Color(0xFFDD6A03))),
                                selectionDecoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xFFDD6A03)),
                                ),
                                todayHighlightColor: const Color(0xFFDD6A03),
                                monthViewSettings: const MonthViewSettings(
                                  monthCellStyle: MonthCellStyle(
                                      textStyle: TextStyle(
                                          fontFamily: 'spartan',
                                          color: Colors.black)),
                                  appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.none,
                                  showTrailingAndLeadingDates: false,
                                )),
                          ),
                          Positioned(
                              right: 10,
                              top: 13,
                              child: InkWell(
                                  onTap: () {
                                    _controller.forward!();
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    size: 25,
                                    color: Color(0xFFDD6A03),
                                  ))),
                          Positioned(
                              left: 10,
                              top: 13,
                              child: InkWell(
                                  onTap: () {
                                    _controller.backward!();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 25,
                                    color: Color(0xFFDD6A03),
                                  )))
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color(0xffCFCFCF),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      textComoon("Select Appointment Start Time", 12,
                          const Color(0xff111111), FontWeight.w600),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.30,
                        child: CupertinoPicker(
                          itemExtent: 60,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              pickedtime = time[index];
                              calenderTime = pickedtime;
                            });
                          },
                          children: time.map((text) =>
                              Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(text,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                ),
                              )).toList(),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width,
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xffDD6A03)),
                          child: const Text("Done",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
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

  DateTime getDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }

  getAppointmentPastList(id) async {
    try {
      setState(() {
        isLoading = true;
      });
      var geturi = Uri.parse("${ApiUrlList.getSingleAppointmentData}$id");
      print("getSingleAppointmentData uri=$geturi");
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      print("bookingId ====> ${widget.bookingId}");
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getSingleAppointmentData response.body ==> ${response.body}");
      log("getSingleAppointmentData status code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        onlyonemodal = OnlyoneModal.fromJson(jsonDecode(response.body));
        note.text = onlyonemodal!.data!.note ?? "";
        _selectedPlace = onlyonemodal!.data!.place == 0?"Beautician’s place":"At my place";
        var startData = DateFormat('dd MMM,yyyy').format(DateTime.parse('${onlyonemodal!.data!.dateTime}'));
        _text = startData;
        var endData = DateFormat('h:mm').format(DateTime.parse('${onlyonemodal!.data!.endDateTime}'));
        calenderTime = endData;
        setState(() {});
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  getStylistList() async {
    var posturi = Uri.parse(ApiUrlList.getStylistList);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {
        "beauticianId": widget.beauticianId,
        "serviceId": widget.serviceId,
      };
      print("getStylistList url is ====> $posturi ");
      print("getStylistList bodydata ====> $bodydata ");
      print("serviceId ====> ${widget.serviceId} ");
      var response = await http.post(
        posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("getStylistList status code ====> ${response.statusCode}");
      print(" getStylistList res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          sl = StylistList.fromjson(map);
          stylistName = sl!.data!;
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  addAppointment() async {
    var posturi = Uri.parse(ApiUrlList.addAppointment);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var bodydata = {
        "serviceId": widget.serviceId,
        "dateTime": "$_text $pickedtime",
        "employeeId": StylistId,
        "price": widget.price,
        "serviceDuration": widget.serviceDuration,
        "place": placeid,
        "note": note.text,
      };
      print("addAppointment url is ====> $posturi ");
      print("addAppointment bodydata ====> $bodydata ");
      var response = await http.post(posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("addAppointment status code ====> ${response.statusCode}");
      print("addAppointment res body is ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print("addAppointment status ====>  ${map['status']}");
        a = Appointment.fromjson(map);
        Helper.serviceId.add(map['data']['appointmentId']);
        print(Helper.serviceId);
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return booking_summary(beauticianId: widget.beauticianId,);
          },
        ));
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  updateAppointment(id) async {
    var posturi = Uri.parse("${ApiUrlList.updateAppointment}$id");
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var bodydata = {
        "serviceId": widget.serviceId,
        "dateTime": "$_text $pickedtime",
        "employeeId": StylistId,
        "price": widget.price,
        "serviceDuration": widget.serviceDuration,
        "place": placeid,
        "note": note.text,
      };
      print("updateAppointment url is ====> $posturi ");
      print("updateAppointment bodydata ====> $bodydata ");
      var response = await http.post(posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );
      print("updateAppointment status code ====> ${response.statusCode}");
      print("updateAppointment res body is ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print("updateAppointment status ====>  ${map['status']}");
        a = Appointment.fromjson(map);
        if(onlyonemodal!.data!.status == 0){
          Navigator.pop(context);
          Navigator.pop(context);
        } else if(onlyonemodal!.data!.status == 1){
          Helper.serviceId.add(map['data']['appointmentId']);
          Navigator.pop(context);
          Navigator.pop(context);
        }else if(onlyonemodal!.data!.status == 2){
          Helper.serviceId.add(map['data']['appointmentId']);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return booking_summary(beauticianId: widget.beauticianId,);
            },
          ));
        }else if(onlyonemodal!.data!.status == 3){
          Helper.serviceId.add(map['data']['appointmentId']);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return booking_summary(beauticianId: widget.beauticianId,);
            },
          ));
        }else if(response.statusCode == 401){
          logoutdata();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
            return signInScreen();
          },), (route) => false);
        }else{
          Navigator.pop(context);
          Navigator.pop(context);
        }
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

class Appointment {
  int? status;
  bool? success;
  String? message;

  Appointment({this.status, this.success, this.message});

  factory Appointment.fromjson(Map<dynamic, dynamic> map) {
    return Appointment(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? "",
    );
  }
}

class StylistList {
  int? status;
  bool? success;
  String? message;
  List<Data>? data;

  StylistList({this.status, this.success, this.message, this.data});

  factory StylistList.fromjson(Map<dynamic, dynamic> map) {
    List list = map['data'];
    List<Data> data = list.map((e) => Data.fromjson(e)).toList();
    return StylistList(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      message: map['message'] ?? "",
      data: data,
    );
  }
}

class Data {
  String? id;
  String? firstName;
  String? lastName;

  Data({this.id, this.firstName, this.lastName});

  factory Data.fromjson(Map<dynamic, dynamic> map1) {
    return Data(
      id: map1['_id'] ?? "",
      firstName: map1['firstName'] ?? "",
      lastName: map1['lastName'] ?? "",
    );
  }
}

class UpdateUppointment {
  bool success;
  int status;
  String message;

  UpdateUppointment({
    required this.success,
    required this.status,
    required this.message,
  });

  factory UpdateUppointment.fromJson(Map<String, dynamic> json) => UpdateUppointment(
    success: json["success"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "message": message,
  };
}
