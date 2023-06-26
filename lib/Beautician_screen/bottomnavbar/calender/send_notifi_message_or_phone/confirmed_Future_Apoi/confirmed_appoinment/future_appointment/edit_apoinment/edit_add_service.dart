import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/calender/send_notifi_message_or_phone/new_appoinment/new_appinment_viewall_add_another/new_appoinment_view_Add.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/models/getStaffDataModel.dart';
import 'package:new_sliikeapps_apps/models/serviceDetailModel.dart';
import 'package:new_sliikeapps_apps/services/appointment_services.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../../More/business_setup/busines_setup/service_setup/setup_main.dart';


class edit_add_service extends StatefulWidget {
  const edit_add_service({Key? key}) : super(key: key);

  @override
  State<edit_add_service> createState() => _add_SreviceState();
}

class _add_SreviceState extends State<edit_add_service> {
  TextEditingController search = TextEditingController();
  String? selectdradioValue = "";

  String staffValue = "";

  bool isLocalSearch = false;

  List findserviceradioList = [];
  List<String> staffValuesList = [];
  List<Datums> localSearchData = [];
  List DurationTimeradioList = [
    "5 min",
    "10 min",
    "15 min",
    "20 min",
    "25 min",
    "30 min",
    "35 min",
    "40 min",
    "45 min",
    "50 min",
    "55 min",
    "1hr",
  ];
  String? selecttimedradioValue = "";

  List recurringOptionsList = [
    "Doesn’t recur",
    "Daily",
    "Weekly",
    "Every 2 weeks",
    "Every 3 weeks",
    "Every month",
    "Every 2 months",
    "Every 3 months",
    "Every 4 months",
    "Every 5 months",
    "Every 6 months",
    "Every year",
  ];
  String? recurringOptionsRadio = "";

  AppointmentService _appointmentService = AppointmentService();

  GetServiceDetailsModel ? getServiceDetailsModel;

  GetStaffDataModel ? getStaffDataModel;

  final CalendarController _controller = CalendarController();

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

  String _text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      getServiceDetailsModel =  await _appointmentService.getServiceDetails(context);
      getStaffDataModel = await _appointmentService.getStaffData(context);
      for (var i in getStaffDataModel!.data!){
        staffValue = i.title!;
        staffValuesList.add(i.title!);
      }
      log("staffValuesList :: ${staffValuesList}");
    });
  }

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
          color: Color(0xffF5F7F7),
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
                            padding: EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image:
                                    AssetImage("assets/images/cancel.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text("Edit Appointment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
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
        physics: BouncingScrollPhysics(),
        child: Container(
          width: width,
          height: height * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Set Service",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff111111),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                ///find service
                InkWell(
                  onTap: () {
                    findservice();
                  },
                  child: Container(
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff01635D)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/search-whitenormal.png"),
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Find Service",
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.5,
                      child: Text("Set Date & Time",
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xff111111),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Duration",
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Color(0xff111111),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: ( )=> datewtimeDialog(context),
                      child: Container(
                        height: 48,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff707070), width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_text!="" && pickedtime!="" ? "${_text} | ${pickedtime}" : "Set Date & Time",
                                  style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w500)),
                              Icon(
                                Icons.keyboard_arrow_right,
                                size: 30,
                                color: Color(0xff707070),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => Durationdialog(context),
                        child: Container(
                          height: 48,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Color(0xff707070), width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${selecttimedradioValue!="" ? "${selecttimedradioValue}" : "Duration"}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xff292929),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w500)),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Color(0xff707070),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Staff",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff111111),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black38)),
                  child: DropdownButton(
                    hint: const Text("Select Staff"),
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'spartan',
                        fontWeight: FontWeight.w500),
                    underline: const SizedBox(),
                    dropdownColor: Colors.white,
                    iconDisabledColor: Colors.black,
                    iconEnabledColor: Colors.yellow,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_right,
                        color: Color(0xff414141)),
                    value: staffValue,
                    items: staffValuesList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        staffValue = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Recurring options",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff111111),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: (){
                    recurringoption(context);
                  },
                  child: Container(
                    height: 48,
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff707070), width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${recurringOptionsRadio!="" ? "${recurringOptionsRadio}" : "Recurring Options"}",
                              style: TextStyle(
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff707070),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w500)),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: Color(0xff707070),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                CommonButton(
                    context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return newAppoinment_Viwe_Add();
                  },));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
  findservice() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(10),
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
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Set Service",
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff292929),
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        child: TextField(
                          controller: search,
                          onChanged: (value) {
                            if(value.isEmpty){
                              setState((){
                                isLocalSearch = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20),
                            hintText: "Search service",
                            hintStyle:
                            TextStyle(color: Color(0xff707070)),
                            suffixIcon: InkWell(
                              onTap: (){
                                  searchService(search.text);
                              },
                              child: Container(
                                width: width * 0.2,
                                color: Color(0xff01635D),
                                height: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                      "assets/images/search-whitenormal.png"),
                                ),
                              ),
                            ),
                            labelStyle: TextStyle(
                                fontFamily: 'spartan',
                                color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Colors.black38),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: isLocalSearch? localSearchData.length : getServiceDetailsModel!.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                               isLocalSearch ? "${localSearchData[index].title!}" : "${getServiceDetailsModel!.data![index].serviceType!.serviceTypeName}",
                                                  style: TextStyle(fontFamily: 'spartan',
                                                      color: Color(0xff292929),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "\$${getServiceDetailsModel!.data![index].price} for ${Util().formatMinuteDuration(
                                                    hour: getServiceDetailsModel!.data![index].duration!.split(':')[0],
                                                    min: getServiceDetailsModel!.data![index].duration!.split(':')[1],
                                                  )}",
                                                  style: TextStyle(fontFamily: 'spartan',
                                                      color: Color(0xff414141),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Radio<String>(
                                            value: getServiceDetailsModel!.data![index].serviceType!.serviceTypeName!,
                                            activeColor:
                                            Color(0xff01635D),
                                            groupValue: selectdradioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectdradioValue = value.toString();
                                                Navigator.pop(context);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      Divider(thickness: 1, color: Color(0xffCFCFCF),),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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

  Durationdialog(context) {
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
          insetPadding: EdgeInsets.all(10),
          child: Container(
            height: height - 60,
            width: width - 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: DurationTimeradioList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selecttimedradioValue = DurationTimeradioList[index].toString();
                            Navigator.pop(context);
                            print(selecttimedradioValue);
                          });
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 20),
                                          child: Text(
                                            "${DurationTimeradioList[index]}",
                                            style: TextStyle(
                                                fontFamily: 'spartan',
                                                color: Color(0xff292929),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Radio<String>(
                                      value: DurationTimeradioList[index],
                                      activeColor: Color(0xff01635D),
                                      groupValue: selecttimedradioValue,
                                      fillColor: MaterialStateColor.resolveWith((states) => Color(0xff01635D)),
                                      onChanged: (value) {
                                            selecttimedradioValue = value.toString();
                                            print("===${selecttimedradioValue}");
                                            Navigator.pop(context);
                                      })
                                ],
                              ),

                              Divider(
                                thickness: 1,
                                color: Color(0xffCFCFCF),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  recurringoption(context) {
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
          insetPadding: EdgeInsets.all(10),
          child: Container(
            height: height - 60,
            width: width - 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recurringOptionsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                          recurringOptionsRadio = recurringOptionsList[index];
                          });
                          print("------$recurringOptionsRadio");
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 20),
                                          child: Text(
                                            "${recurringOptionsList[index]}",
                                            style: TextStyle(
                                                fontFamily: 'spartan',
                                                color: Color(0xff292929),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Radio<String>(
                                      value: recurringOptionsList[index],
                                      activeColor: Color(0xff01635D),
                                      groupValue: recurringOptionsRadio,
                                      fillColor: MaterialStateColor.resolveWith((states) => Color(0xff01635D)),
                                      onChanged: (newvalue) {
                                        setState(() {
                                        recurringOptionsRadio = newvalue.toString();
                                        });
                                        print("======${recurringOptionsRadio}");
                                        Navigator.pop(context);

                                      })
                                ],
                              ),

                              Divider(
                                thickness: 1,
                                color: Color(0xffCFCFCF),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  datewtimeDialog(context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          child: Dialog(
            insetPadding: const EdgeInsets.all(10),
            child: Container(
                  height: height  * 0.92,
                  width: width * 0.9,
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
                                  onSelectionChanged:  (details) {

                                    if (_controller.view == CalendarView.month ||
                                        _controller.view == CalendarView.timelineMonth) {
                                      _text = DateFormat('dd, MMMM').format(details.date!).toString();
                                      print(_text);
                                    } else {
                                      _text = DateFormat('dd, MMMM').format(details.date!).toString();
                                      print(_text);
                                    }

                                    WidgetsBinding.instance.addPostFrameCallback((_){


                                    setState(() {

                                    });

                                    });
                                   // return selectionChanged(detail);
                                  },
                                  headerHeight: 55,
                                  headerStyle: const CalendarHeaderStyle(
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyle(
                                        fontFamily: 'spartan',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff01635D),
                                        fontSize: 20,
                                      )),
                                  todayTextStyle: const TextStyle(fontFamily: 'spartan'),
                                  cellBorderColor: Colors.transparent,
                                  view: CalendarView.month,
                                  viewHeaderStyle: const ViewHeaderStyle(
                                      dayTextStyle: TextStyle(
                                          color: Color(0xff01635D))),
                                  selectionDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0xff01635D)),
                                  ),
                                  todayHighlightColor: const Color(0xff01635D),
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
                                    child: const Icon(Icons.arrow_forward_ios_sharp,size: 25,color: Color(0xff01635D),)
                                )
                            ),
                            Positioned(
                                left: 10,
                                top: 13,
                                child: InkWell(
                                    onTap: () {
                                      _controller.backward!();
                                    },
                                    child: const Icon(Icons.arrow_back_ios_new,size: 25,color: Color(0xff01635D),)
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
                                print("pickedtime : ${pickedtime}");
                              });
                            },
                            children: timer
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
                                color: const Color(0xff01635D)),
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
                ),
          ),
        );
      },
    );
  }

  void selectionChanged(CalendarSelectionDetails details) {
    if (_controller.view == CalendarView.month ||
        _controller.view == CalendarView.timelineMonth) {
        _text = DateFormat('dd, MMMM').format(details.date!).toString();
      print(_text);
    } else {
        _text = DateFormat('dd, MMMM').format(details.date!).toString();
      print(_text);
    }


  }

  searchService(String value) {
    if (value.isNotEmpty) {
      localSearchData.clear();
      for (int i = 0; i < getStaffDataModel!.data!.length; i++) {
        if (getStaffDataModel!.data![i].title!.toLowerCase().contains(value.toLowerCase())) {
          localSearchData.add(getStaffDataModel!.data![i]);
          setState(() {});
        }
      }
      log("localSearchData :: ${localSearchData}");
      isLocalSearch = true;
    }
  }
}
