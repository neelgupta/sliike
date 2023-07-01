import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/appointment_details_model.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/calender/send_notifi_message_or_phone/new_appoinment/new_appinment_viewall_add_another/new_appoinment_view_Add.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/models/getStaffDataModel.dart';
import 'package:new_sliikeapps_apps/models/serviceDetailModel.dart';
import 'package:new_sliikeapps_apps/services/appointment_services.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class edit_add_service extends StatefulWidget {
  String clientID;
  AData ? data;
  int ? status;
   edit_add_service(this.clientID,{Key? key,this.data,this.status}) : super(key: key);

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
  List<Datum> localSearchData = [];
  List DurationTimeradioList = [
    "30 min",
    "60 min",
    "90 min",
    "120 min",
    "150 min",
    "180 min",
    "210 min",
    "240 min",
    "270 min",
    "300 min",
    "330 min",
    "360 min",
    "390 min",
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

  String date = "";

  String _serviceName = "";
  String _duration = "";
  String duration = "";
  String _price = "";
  String serviceId = "";
  String employeeId = "";

  String _date = "";

  String? selectedvaluemin = "30 min";
  String? selectedvalueminnewformat = "00:30";

  int RecurringVal = 0;

  convertIntoTimeFormat(selectedValue) {
    selectedvaluemin = selectedValue;
    if ("30 min" == selectedValue) {
      selectedvalueminnewformat = "00:30";
    } else if ("60 min" == selectedValue) {
      selectedvalueminnewformat = "01:00";
    } else if ("90 min" == selectedValue) {
      selectedvalueminnewformat = "01:30";
    } else if ("120 min" == selectedValue) {
      selectedvalueminnewformat = "02:00";
    } else if ("150 min" == selectedValue) {
      selectedvalueminnewformat = "02:30";
    } else if ("180 min" == selectedValue) {
      selectedvalueminnewformat = "03:00";
    } else if ("210 min" == selectedValue) {
      selectedvalueminnewformat = "03:30";
    } else if ("240 min" == selectedValue) {
      selectedvalueminnewformat = "04:00";
    } else if ("270 min" == selectedValue) {
      selectedvalueminnewformat = "04:30";
    } else if ("300 min" == selectedValue) {
      selectedvalueminnewformat = "05:00";
    } else if ("330 min" == selectedValue) {
      selectedvalueminnewformat = "05:30";
    } else if ("360 min" == selectedValue) {
      selectedvalueminnewformat = "06:00";
    } else if ("390 min" == selectedValue) {
      selectedvalueminnewformat = "06:30";
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.clientID);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      getServiceDetailsModel =  await _appointmentService.getServiceDetails(context);
      getStaffDataModel = await _appointmentService.getStaffData(context);
      for (var i in getStaffDataModel!.data!){
        staffValue = i.title!;
        staffValuesList.add(i.title!);
      }
      log("staffValuesList :: ${staffValuesList}");
    });

    if(widget.status==2 || widget.status==5 || widget.status==1 || widget.status==0){
      setState(() {
        duration = widget.data?.serviceDetails.duration ?? "";
        serviceId = widget.data?.serviceDetails.serviceId ?? "";
        selectdradioValue = widget.data?.serviceDetails.serviceName ?? "";
        _serviceName = widget.data?.serviceDetails.serviceName ?? "";
        _duration = Util().formatMinuteDuration(
          hour: widget.data?.serviceDetails.duration.split(':')[0] ?? "",
          min: widget.data?.serviceDetails.duration.split(':')[1] ?? "",
        );
        widget.data?.serviceDetails.duration ?? "";
        _price =  widget.data?.serviceDetails.price.toString() ?? "";
        _text = DateFormat('dd, MMMM').format(widget.data!.dateTime).toString();
        pickedtime = DateFormat("HH:mm").format(widget.data!.dateTime);
        _date = "${date+" "+pickedtime}";
      });
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
                              child: Text(widget.status==2 || widget.status==5 ? "Rebook Appointment" : widget.status==1 || widget.status==0? "Edit Appointment" : "Add Service",
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
                    setState((){
                    findservice(context);
                    });
                  },
                  child: Container(
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff01635D)),
                    child: selectdradioValue!="" ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${_serviceName} | ${_duration} for ${"\$"}${_price}",
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w500)),
                      ],
                    ) : Row(
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
                              Text("${_duration!="" ? "${_duration}" : "Duration"}",
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
                        for(var i in getStaffDataModel!.data!){
                          if(staffValue == i.title){
                            employeeId = i.id!;
                            setState(() {});
                          }
                        }
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
                CommonButton(context, "SAVE", 12, FontWeight.w600, Colors.white, () async {
                  if(serviceId == ""){
                    Fluttertoast.showToast(msg: "Please select one service type!");
                  }else if(_date == ""){
                    Fluttertoast.showToast(msg: "Please select date & time!");
                  }
                  // else if(employeeId == ""){
                  //   Fluttertoast.showToast(msg: "Please select any staff!");
                  // }
                  else if(_price == ""){
                    Fluttertoast.showToast(msg: "Price cannot be empty!");
                  }else if(duration == ""){
                    Fluttertoast.showToast(msg: "Duration cannot be empty!");
                  }else{
                    Map<String , dynamic> Body = {
                      "customerId" : widget.clientID,
                      "serviceId" : serviceId,
                      "dateTime" : _date,
                      "employeeId" : employeeId,
                      "price" : _price,
                      "serviceDuration" : duration,
                      "place" : "0",
                      "recurringOpt" : RecurringVal,
                    };
                    log("Body :: ${Body}");
                    if(widget.status==2 || widget.status==5  || widget.status==0){
                      print("Update");
                      await _appointmentService.updateAppointment(context, Body,widget.data!.id).then((value){
                        setState(() {
                          // selectdradioValue = "";
                          // _date = "";
                          // _duration = "";
                          // recurringOptionsRadio = "";
                          // _text = "";
                          // pickedtime = "";
                        });
                      });
                    }else{
                      print("Create");
                         await _appointmentService.addBAppointment(context, Body).then((value){
                           if(value!=null){
                             // setState(() {
                             //   selectdradioValue = "";
                             //   _date = "";
                             //   _duration = "";
                             //   recurringOptionsRadio = "";
                             //   _text = "";
                             //   pickedtime = "";
                             //   serviceId = "";
                             // });
                           }
                      });
                    }
                    // _appointmentService.appointmentIds.clear();
                  }
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return newAppoinment_Viwe_Add([]);
                  // },));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  findservice(context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: EdgeInsets.all(10),
              child: Container(
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
                                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                  setState((){
                                    searchService(search.text);
                                  });
                                });
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
                                                  isLocalSearch ? "${localSearchData[index].serviceType!.serviceTypeName!}" : "${getServiceDetailsModel!.data![index].serviceType!.serviceTypeName}",
                                                  style: TextStyle(fontFamily: 'spartan',
                                                      color: Color(0xff292929),
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16),
                                                ),
                                                isLocalSearch ?  Text(
                                                  "\$${localSearchData[index].price} for ${Util().formatMinuteDuration(
                                                    hour: localSearchData[index].duration!.split(':')[0],
                                                    min: localSearchData[index].duration!.split(':')[1],
                                                  )}",
                                                  style: TextStyle(fontFamily: 'spartan',
                                                      color: Color(0xff414141),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10),
                                                ) :  Text(
                                                  "\$${getServiceDetailsModel!.data![index].price} for ${Util().formatMinuteDuration(
                                                    hour: getServiceDetailsModel!.data![index].duration!.split(':')[0],
                                                    min: getServiceDetailsModel!.data![index].duration!.split(':')[1],
                                                  )}",
                                                  style: TextStyle(fontFamily: 'spartan',
                                                      color: Color(0xff414141),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10),
                                                )
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          isLocalSearch ? Radio<String>(
                                            value: localSearchData[index].serviceType!.serviceTypeName!,
                                            activeColor:
                                            Color(0xff01635D),
                                            groupValue: selectdradioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectdradioValue = value.toString();
                                                serviceId = getServiceDetailsModel!.data![index].id!;
                                                _serviceName = getServiceDetailsModel!.data![index].serviceType!.serviceTypeName!;
                                                duration = getServiceDetailsModel!.data![index].duration!;
                                                _duration = Util().formatMinuteDuration(
                                                  hour: getServiceDetailsModel!.data![index].duration!.split(':')[0],
                                                  min: getServiceDetailsModel!.data![index].duration!.split(':')[1],
                                                );
                                                _price = getServiceDetailsModel!.data![index].price!.toString();
                                                Navigator.pop(context);
                                              });
                                            },
                                          ) : Radio<String>(
                                            value: getServiceDetailsModel!.data![index].serviceType!.serviceTypeName!,
                                            activeColor:
                                            Color(0xff01635D),
                                            groupValue: selectdradioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectdradioValue = value.toString();
                                                serviceId = getServiceDetailsModel!.data![index].id!;
                                                _serviceName = getServiceDetailsModel!.data![index].serviceType!.serviceTypeName!;
                                                duration = getServiceDetailsModel!.data![index].duration!;
                                                _duration = Util().formatMinuteDuration(
                                                  hour: getServiceDetailsModel!.data![index].duration!.split(':')[0],
                                                  min: getServiceDetailsModel!.data![index].duration!.split(':')[1],
                                                );
                                                _price = getServiceDetailsModel!.data![index].price!.toString();
                                                print(selectdradioValue);
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
              ),
            );
          },
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
                              convertIntoTimeFormat(selecttimedradioValue);
                              print("selectedvalue==${selecttimedradioValue}");
                              print("selectedvaluemin==${selectedvaluemin}");
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
                          RecurringVal = 0;
                          setState(() {
                          recurringOptionsRadio = recurringOptionsList[index];
                          });
                          if(recurringOptionsRadio == recurringOptionsList[0]){
                            setState(() {
                            RecurringVal = 0;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[1]){
                            setState(() {
                              RecurringVal = 1;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[2]){
                            setState(() {
                              RecurringVal = 14;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[3]){
                            setState(() {
                              RecurringVal = 21;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[4]){
                            setState(() {
                              RecurringVal = 28;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[5]){
                            setState(() {
                              RecurringVal = 56;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[6]){
                            setState(() {
                              RecurringVal = 84;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[7]){
                            setState(() {
                              RecurringVal = 112;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[8]){
                            setState(() {
                              RecurringVal = 140;
                            });
                          }else if(recurringOptionsRadio == recurringOptionsList[9]){
                            setState(() {
                              RecurringVal = 168;
                            });
                          }else{
                            setState(() {
                              RecurringVal = 336;
                            });
                          }
                          print("------$recurringOptionsRadio");
                          print("------$RecurringVal");
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
                                        RecurringVal = 0;
                                        setState(() {
                                          recurringOptionsRadio = recurringOptionsList[index];
                                        });
                                        if(recurringOptionsRadio == recurringOptionsList[0]){
                                          setState(() {
                                            RecurringVal = 0;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[1]){
                                          setState(() {
                                            RecurringVal = 1;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[2]){
                                          setState(() {
                                            RecurringVal = 14;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[3]){
                                          setState(() {
                                            RecurringVal = 21;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[4]){
                                          setState(() {
                                            RecurringVal = 28;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[5]){
                                          setState(() {
                                            RecurringVal = 56;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[6]){
                                          setState(() {
                                            RecurringVal = 84;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[7]){
                                          setState(() {
                                            RecurringVal = 112;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[8]){
                                          setState(() {
                                            RecurringVal = 140;
                                          });
                                        }else if(recurringOptionsRadio == recurringOptionsList[9]){
                                          setState(() {
                                            RecurringVal = 168;
                                          });
                                        }else{
                                          setState(() {
                                            RecurringVal = 336;
                                          });
                                        }
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
                                  allowedViews: [
                                    CalendarView.day,
                                    CalendarView.week,
                                    CalendarView.workWeek,
                                    CalendarView.month,
                                    CalendarView.timelineDay,
                                    CalendarView.timelineWeek,
                                    CalendarView.timelineWorkWeek,
                                    CalendarView.timelineMonth
                                  ],
                                  controller: _controller,
                                  minDate: DateTime.now(),
                                  viewNavigationMode: ViewNavigationMode.none,
                                  onSelectionChanged:  (details) {
                                    if (_controller.view == CalendarView.month ||
                                        _controller.view == CalendarView.timelineMonth) {
                                      pickedtime = "";
                                      _text = DateFormat('dd, MMMM').format(details.date!).toString();
                                     date = DateFormat('dd MMMM yyyy').format(details.date!).toString();
                                      print(_text);
                                      print(date);
                                    } else {
                                      pickedtime = "";
                                      _text = DateFormat('dd, MMMM').format(details.date!).toString();
                                      date = DateFormat('dd MMMM yyyy').format(details.date!).toString();
                                      print(_text);
                                      print(date);
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
                               _date = "${date+" "+pickedtime}";
                                pickedtime = timer[index];
                                // print("pickedtime : ${_date}");
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
                            _date = "${date+" "+pickedtime}";
                            Navigator.pop(context);
                            print(_date);
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
        date = details.date.toString();
      print(_text);
    } else {
        _text = DateFormat('dd, MMMM').format(details.date!).toString();
        date = details.date.toString();
      print(_text);
    }


  }

  searchService(String value) {
    if (value.isNotEmpty) {
      localSearchData.clear();
      for (int i = 0; i < getServiceDetailsModel!.data!.length; i++) {
        if (getServiceDetailsModel!.data![i].serviceType!.serviceTypeName!.toLowerCase().contains(value.toLowerCase())) {
          localSearchData.add(getServiceDetailsModel!.data![i]);
          isLocalSearch = true;
          setState(() {});
        }
      }
      log("localSearchData :: ${localSearchData}");
    }
  }
}
