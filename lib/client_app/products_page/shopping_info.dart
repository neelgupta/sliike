// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/appointments.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/edit_address.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../Beautician_screen/custom_widget/textcommon/textcommon.dart';

class shopping_info extends StatefulWidget {
  const shopping_info({Key? key}) : super(key: key);

  @override
  State<shopping_info> createState() => _shopping_infoState();
}

class _shopping_infoState extends State<shopping_info> {
  final CalendarController _controller = CalendarController();
  String _text = '';
  String s_method = "Canada Post Expedited Parcel";
  String pickedtime = "";
  List timer = [
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
    "11:45",
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
  String? place = "expedited";
  DateTime datetime = DateTime.now();
  bool pickup = false;
  bool delivery = true;
  bool method = false;
  bool edit = false;
  bool billing = false;
  bool time = false;

  @override
  void initState(){
    super.initState();
    datetime = getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/bgappbar.png"),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("shipping_info",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)).tr(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.01,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: height*0.05,
              alignment: Alignment.center,
              color: const Color(0xFFF3F3F3),
              child: Row(
                children: [
                  const Text("shipping_info",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: "spartan")).tr(),
                  const Spacer(),
                  Image(image: const AssetImage("assets/images/Group 13106.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,color: const Color(0xffDD6A03),),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 500.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 13112.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 13111.png"),height: height*0.03,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: height*0.04,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            pickup = true;
                            delivery = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height*0.05,
                          width: width*0.30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: pickup?const Color(0xFFDD5103):Colors.black),
                              color: pickup?const Color(0xFFDD5103):Colors.white
                          ),
                          child: Text("pick_up",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: pickup?Colors.white:Colors.black)).tr(),
                        ),
                      ),
                      SizedBox(width: width*0.02,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            pickup = false;
                            delivery = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height*0.05,
                          width: width*0.30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: delivery?const Color(0xFFDD5103):Colors.black),
                              color: delivery?const Color(0xFFDD5103):Colors.white
                          ),
                          child: Text("delivery",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: delivery?Colors.white:Colors.black)).tr(),
                        ),
                      ),
                    ],
                  ),
                  delivery == true ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.03,),
                      const Text("select_method",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold)).tr(),
                      SizedBox(height: height*0.02,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            method = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: width,
                          height: height*0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(s_method,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: "spartan")),
                              ),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Icon(Icons.keyboard_arrow_down_rounded,size: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.01,),
                      method == true ? Container(
                        width: width,
                        height: height*0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Column(
                            children: [
                              SizedBox(height: height*0.01,),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: const Color(0xFFDD6A03),
                                    value: "expedited", groupValue: place, onChanged: (value) {
                                    setState(() {
                                      place = value.toString();
                                      s_method = "Canada Post Expedited Parcel";
                                      method = false;
                                    });
                                  },),
                                  const Text("Canada Post Expedited Parcel",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan")),
                                  const Spacer(),
                                  const Text("\$16.80",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: const Color(0xFFDD6A03),
                                    value: "regular", groupValue: place, onChanged: (value) {
                                    setState(() {
                                      place = value.toString();
                                      s_method = "Canada Post Regular Parcel";
                                      method = false;
                                    });
                                  },),
                                  const Text("Canada Post Regular Parcel ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan")),
                                  const Spacer(),
                                  const Text("\$16.80",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: const Color(0xFFDD6A03),
                                    value: "xpress", groupValue: place, onChanged: (value) {
                                    setState(() {
                                      place = value.toString();
                                      s_method = "Canada Post Xpress post ";
                                      method = false;
                                    });
                                  },),
                                  const Text("Canada Post Xpress post ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan")),
                                  const Spacer(),
                                  const Text("\$27.95",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: const Color(0xFFDD6A03),
                                    value: "priority", groupValue: place, onChanged: (value) {
                                    setState(() {
                                      place = value.toString();
                                      s_method = "Canada Post Priority";
                                      method = false;
                                    });
                                    // Future.delayed(Duration(seconds: 1)).then((value) {
                                    //   setState(() {
                                    //     method = false;
                                    //   });
                                    // });
                                  },),
                                  const Text("Canada Post Priority",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan")),
                                  const Spacer(),
                                  const Text("\$50.56",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ): Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("set_default_address",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)).tr(),
                              const Spacer(),
                              SizedBox(
                                height: height*0.05,
                                width: width*0.05,
                                child: Checkbox(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: const Color(0xFFDD6A03),
                                  value: edit,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      edit = value!;
                                    });
                                  },),
                              )
                            ],
                          ),
                          SizedBox(height: height*0.01,),
                          Row(
                            children: [
                              const Text("Esther Britney",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: "spartan")),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const edit_address();
                                  },));
                                },
                                child: const Text("edit",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFDD5103),
                                        fontFamily: "spartan")).tr(),
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.01,),
                          const Text("825 Dawson Island\nApt 30\nToronto, DE 63324\nCanada",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontFamily: "spartan")),
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      const Divider(color: Colors.black54,),
                      SizedBox(height: height*0.03,),
                      const Text("billing_address",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold)).tr(),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          SizedBox(
                            height: height*0.05,
                            width: width*0.05,
                            child: Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              activeColor: const Color(0xFFDD6A03),
                              value: billing,
                              onChanged: (bool? value) {
                                setState(() {
                                  billing = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: width*0.04,),
                          const Text("same_as",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontFamily: "spartan")).tr(),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Image(image: const AssetImage("assets/images/Group 12095.png"),height: height*0.04,width: width*0.06,),
                          SizedBox(width: width*0.02,),
                          const Text("different",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "spartan",
                                  color: Color(0xffDD6A03))).tr(),
                        ],
                      ),
                      SizedBox(height: height*0.04,),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(alignment: Alignment.center,
                              height: height*0.07,
                              width: width*0.43,
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: const BorderRadius.all(Radius.circular(5))),
                              child: const Text("back",style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)).tr(),),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const appointments();
                              },));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: height*0.07,
                              width: width*0.43,
                              decoration: BoxDecoration(border: Border.all(color: const Color(0xffDD6A03) ),color:const Color(0xffDD6A03) ,borderRadius: const BorderRadius.all(Radius.circular(5))),
                              child: const Text("go_to_payment",style: TextStyle(color: Colors.white,fontSize: 14,
                                fontFamily: "spartan",),).tr(),),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.04,)
                    ],
                  ) : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.04,),
                      const Text("set_pickup",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black
                          )
                      ).tr(),
                      SizedBox(height: height*0.02,),
                      Container(
                        height: 48,
                        width: width,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff707070), width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('$_text $pickedtime',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff707070),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w500)).tr(),
                              const Spacer(),
                              const VerticalDivider(color: Colors.black54,),
                              InkWell(
                                child: const Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Color(0xff707070),
                                ),
                                onTap: () {
                                  setState(() {
                                    datewtimeDialog();
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      const Text("confirm_details",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black
                          )
                      ).tr(),
                      SizedBox(height: height*0.02,),
                      TextField(
                        style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "first_name".tr(),
                        ),
                      ),
                      SizedBox(height: height*0.04,),
                      TextField(
                        style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "email".tr(),
                        ),
                      ),
                      SizedBox(height: height*0.04,),
                      TextField(
                        style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "phone".tr(),
                        ),
                      ),
                      SizedBox(height: height*0.20,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: height*0.07,
                              width: width*0.43,
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: const BorderRadius.all(Radius.circular(5))),
                              child: const Text("back",style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)).tr(),),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const appointments();
                              },));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: height*0.07,
                              width: width*0.43,
                              decoration: BoxDecoration(border: Border.all(color: const Color(0xffDD6A03) ),color:const Color(0xffDD6A03) ,borderRadius: const BorderRadius.all(Radius.circular(5))),
                              child: const Text("go_to_payment",style: TextStyle(color: Colors.white,fontSize: 14,
                                fontFamily: "spartan",),).tr(),),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.04,),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  DateTime getDateTime() {
    final now = DateTime.now();
    return DateTime(now.year,now.month,now.day,now.hour,0);
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
            builder: (context, setState) {
              return Container(
                height: height - 60,
                width: width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.02,),
                      textComoon("Select Appointment Date", 12, const Color(0xff111111), FontWeight.w600),
                      SizedBox(height: height*0.01,),
                      Stack(
                        children: [
                          SizedBox(
                            height: height * 0.38,
                            child: SfCalendar(
                                controller: _controller,
                                viewNavigationMode: ViewNavigationMode.none,
                                onSelectionChanged: selectionChanged,
                                headerHeight: 55,
                                headerStyle: const CalendarHeaderStyle(
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                      fontFamily: 'spartan',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFDD6A03),
                                      fontSize: 20,
                                    )),
                                todayTextStyle: const TextStyle(fontFamily: 'spartan'),
                                cellBorderColor: Colors.transparent,
                                view: CalendarView.month,
                                viewHeaderStyle: const ViewHeaderStyle(
                                    dayTextStyle: TextStyle(
                                        color: Color(0xFFDD6A03))),
                                selectionDecoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xFFDD6A03)),
                                ),
                                todayHighlightColor: const Color(0xFFDD6A03),
                                monthViewSettings: const MonthViewSettings(
                                  monthCellStyle: MonthCellStyle(
                                      textStyle: TextStyle(
                                          fontFamily: 'spartan',
                                          color: Colors.black)),
                                  appointmentDisplayMode: MonthAppointmentDisplayMode
                                      .none,
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
                                  child: const Icon(Icons.arrow_forward_ios_sharp,size: 25,color: Color(0xFFDD6A03),)
                              )
                          ),
                          Positioned(
                              left: 10,
                              top: 13,
                              child: InkWell(
                                  onTap: () {
                                    _controller.backward!();
                                  },
                                  child: const Icon(Icons.arrow_back_ios_new,size: 25,color: Color(0xFFDD6A03),)
                              )
                          )
                        ],
                      ),
                      const Divider(thickness: 1,color: Color(0xffCFCFCF),),
                      SizedBox(height: height*0.02,),
                      textComoon("Select Appointment Start Time", 12, const Color(0xff111111), FontWeight.w600),
                      SizedBox(height: height*0.01,),
                      SizedBox(
                        height: height * 0.30,
                        child: CupertinoPicker(
                          itemExtent: 60,
                          onSelectedItemChanged: (index) {
                            setState((){
                              pickedtime = timer[index];
                            });
                          },
                          children: timer
                              .map((text) => Center(
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
                      // Container(
                      //   height: height*0.30,
                      //   child: CupertinoDatePicker(
                      //     initialDateTime: datetime,
                      //     onDateTimeChanged: (DateTime) {
                      //       setState(() => this.datetime = datetime);
                      //     },
                      //     use24hFormat: true,
                      //     mode: CupertinoDatePickerMode.time,
                      //     minuteInterval: 5,
                      //   )
                      // ),
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
                      SizedBox(height: height*0.03,),
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
  void selectionChanged(CalendarSelectionDetails details) {
    if (_controller.view == CalendarView.month ||
        _controller.view == CalendarView.timelineMonth) {
      _text = DateFormat('dd, MMMM yyyy').format(details.date!).toString();
    } else {
      _text =
          DateFormat('dd, MMMM yyyy hh:mm a').format(details.date!).toString();
    }
  }
}
