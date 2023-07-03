import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/add_your_work_hours.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/utils/userdetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../utils/constants.dart';
import '../../../../../b_model/addworkhours_model.dart';

class busines_Hours extends StatefulWidget {
  const busines_Hours({Key? key}) : super(key: key);

  @override
  State<busines_Hours> createState() => _busines_HoursState();
}

class _busines_HoursState extends State<busines_Hours> {
  bool isLoading = false;
  GetWorkHoursData? getWorkHoursData;

  List addTimeMap = [];
  List<DayDetails>? dayDetailsList1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWorkHours();
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
          toolbarHeight: height * 0.13, //
          flexibleSpace: Container(
            color: Color(0xffFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 10),
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
                        SizedBox(
                          width: width * 0.19,
                        ),
                        Container(
                          child: Text("Busines Hours",
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(color: Color(0xff01635D)),
              )
            : getWorkHoursData != null && getWorkHoursData!.data!.length != 0
                ? SingleChildScrollView(
                    child: Container(
                      height: height * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            textComoon("Business Hours", 14, Color(0xff292929),
                                FontWeight.w700),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            textComoonfade(
                                "Set your standard business hours here. If you need to adjust specific dates, use calendar above.",
                                12,
                                Color(0xff707070),
                                FontWeight.w500),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            dividerCommon(),
                            Container(
                              // color: Colors.red,
                              height: height * 0.55,
                              child: ListView.builder(
                                itemCount: getWorkHoursData!
                                    .data![0].dayDetails!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 12,
                                      ),
                                      getWorkHoursData!
                                                      .data![0]
                                                      .dayDetails![index]
                                                      .startTime !=
                                                  "" &&
                                              getWorkHoursData!
                                                      .data![0]
                                                      .dayDetails![index]
                                                      .endTime !=
                                                  ""
                                          ? InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return add_Your_Work_Hours(
                                                        secondflow: false,
                                                        Day: getWorkHoursData!
                                                            .data![0]
                                                            .dayDetails![index]
                                                            .day!,
                                                        startTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .startTime!,
                                                        endTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .endTime!,
                                                        isOpen:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .isOpen!,
                                                        breakendTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .breakEndTime!,
                                                        breakstartTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .breakStartTime!);
                                                  },
                                                )).then((value) {
                                                  print("value : ${value}");
                                                  print(
                                                      "value.runtimeType : ${value.runtimeType}");
                                                  print("value : ${value}");

                                                  Map<String, dynamic>
                                                      valuesMap = value;
                                                  if (value != null) {
                                                    getWorkHoursData!.data![0]
                                                            .dayDetails![
                                                        index] = DayDetail(
                                                      id: getWorkHoursData!
                                                          .data![0]
                                                          .dayDetails![index]
                                                          .id,
                                                      isOpen:
                                                          valuesMap["isOpen"],
                                                      breakEndTime: valuesMap[
                                                          "breakEndTime"],
                                                      breakStartTime: valuesMap[
                                                          "breakStartTime"],
                                                      day: valuesMap["day"],
                                                      endTime:
                                                          valuesMap["endTime"],
                                                      startTime: valuesMap[
                                                          "startTime"],
                                                    );
                                                    // value;
                                                    setState(() {});
                                                    print(
                                                        "getWorkHoursData ${getWorkHoursData!.data![0].dayDetails![index]}");
                                                  }
                                                });
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "${getWorkHoursData!.data![0].dayDetails![index].day}",
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Color(
                                                                    0xff292929),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontFamily:
                                                                    "spartan",
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${getWorkHoursData!.data![0].dayDetails![index].startTime} - ${getWorkHoursData!.data![0].dayDetails![index].endTime} ",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff292929),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontFamily:
                                                                      "spartan",
                                                                  fontSize: 12),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Break: ${getWorkHoursData!.data![0].dayDetails![index].breakStartTime} - ${getWorkHoursData!.data![0].dayDetails![index].breakEndTime}",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff292D32),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      "spartan",
                                                                  fontSize: 10),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.08,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 15,
                                                          width: 15,
                                                          child: Image.asset(
                                                              "assets/images/righticon.png"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return add_Your_Work_Hours(
                                                        secondflow: false,
                                                        Day: getWorkHoursData!
                                                            .data![0]
                                                            .dayDetails![index]
                                                            .day!,
                                                        startTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .startTime!,
                                                        endTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .endTime!,
                                                        isOpen:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .isOpen!,
                                                        breakendTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .breakEndTime!,
                                                        breakstartTime:
                                                            getWorkHoursData!
                                                                .data![0]
                                                                .dayDetails![
                                                                    index]
                                                                .breakEndTime!);
                                                  },
                                                )).then((value) {
                                                  print("value : ${value}");
                                                  print(
                                                      "value.runtimeType : ${value.runtimeType}");
                                                  print("value : ${value}");

                                                  Map<String, dynamic>
                                                      valuesMap = value;
                                                  if (value != null) {
                                                    getWorkHoursData!.data![0]
                                                            .dayDetails![
                                                        index] = DayDetail(
                                                      id: getWorkHoursData!
                                                          .data![0]
                                                          .dayDetails![index]
                                                          .id,
                                                      isOpen:
                                                          valuesMap["isOpen"],
                                                      breakEndTime: valuesMap[
                                                          "breakEndTime"],
                                                      breakStartTime: valuesMap[
                                                          "breakStartTime"],
                                                      day: valuesMap["day"],
                                                      endTime:
                                                          valuesMap["endTime"],
                                                      startTime: valuesMap[
                                                          "startTime"],
                                                    );
                                                    // value;
                                                    setState(() {});
                                                    print(
                                                        "getWorkHoursData ${getWorkHoursData!.data![0].dayDetails![index]}");
                                                  }
                                                });
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: width * 0.4,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            "${getWorkHoursData!.data![0].dayDetails![index].day}",
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Color(
                                                                    0xff292929),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontFamily:
                                                                    "spartan",
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Text(
                                                            //   "${getWorkHoursData!.data![0].dayDetails![index].startTime} - ${getWorkHoursData!.data![0].dayDetails![index].endTime} ",
                                                            //   style: TextStyle(
                                                            //       color: Color(0xff292929),
                                                            //       fontWeight: FontWeight.w300,
                                                            //       fontFamily: "spartan",
                                                            //       fontSize: 12),
                                                            // ),
                                                            // SizedBox(height: 5,),
                                                            // Text(
                                                            //   "Break: ${getWorkHoursData!.data![0].dayDetails![index].breakStartTime} - ${getWorkHoursData!.data![0].dayDetails![index].breakEndTime}",
                                                            //   style: TextStyle(
                                                            //       color: Color(0xff292D32),
                                                            //       fontWeight: FontWeight.normal,
                                                            //       fontFamily: "spartan",
                                                            //       fontSize: 10),
                                                            // ),
                                                            Text(
                                                              "Closed",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff292929),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontFamily:
                                                                      "spartan",
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.35,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 15,
                                                          width: 15,
                                                          child: Image.asset(
                                                              "assets/images/righticon.png"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      dividerCommon(),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Spacer(),
                            CommonButton(context, "SAVE", 12, FontWeight.w600,
                                Colors.white, () {
                              addWorkHours(context);
                            }),
                            // SizedBox(height: height*0.03,),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(child: Text("Something went Wrong !!")));
  }

  getWorkHours() async {
    try {
      setState(() {
        isLoading = true;
      });
      var Headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var getUri = Uri.parse(ApiUrlList.getWorkHours);
      var response = await http.get(
        getUri,
        headers: Headers,
      );
      log("getWorkHours Code  ====> ${response.statusCode}");
      log(" getWorkHours Body ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          getWorkHoursData =
              GetWorkHoursData.fromJson(jsonDecode(response.body));
          setState(() {});
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> addWorkHours(BuildContext context) async {
    try {
      var prefs = await SharedPreferences.getInstance();
      Userdetail.userToken = prefs.getString(UserPrefs.keyutoken) ?? "";
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xff01635D)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      Map reqBody = {};
      List dayDetailsList = [];
      for (var item in getWorkHoursData!.data![0].dayDetails!) {
        var singleDayData = {
          "day": item.day,
          "startTime": item.startTime,
          "endTime": item.endTime,
          "breakStartTime": item.breakStartTime,
          "breakEndTime": item.breakEndTime,
          "isOpen": item.isOpen,
        };
        dayDetailsList.add(singleDayData);
      }

      reqBody = {
        "dayDetails": dayDetailsList,
      };
      print("ApiHeader.headers ${ApiHeader.headers}");
      print(
          "loginApi url : ${ApiUrlList.updateWorkHours}${getWorkHoursData!.data![0].id}");
      print("passing reqBody  : $reqBody");
      var response = await http.put(
        Uri.parse(
            "${ApiUrlList.updateWorkHours}${getWorkHoursData!.data![0].id}"),
        body: jsonEncode(reqBody),
        headers: ApiHeader.headers,
      );
      var map = jsonDecode(response.body.toString());
      print("statuscode : ${response.statusCode}");
      print("res  body :: ${response.body}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        getWorkHours();
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        print("else failed");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }
}

GetWorkHoursData getWorkHoursDataFromJson(String str) =>
    GetWorkHoursData.fromJson(json.decode(str));

String getWorkHoursDataToJson(GetWorkHoursData data) =>
    json.encode(data.toJson());

class GetWorkHoursData {
  int? status;
  bool? success;
  List<Datum>? data;
  String? message;

  GetWorkHoursData({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  factory GetWorkHoursData.fromJson(Map<String, dynamic> json) =>
      GetWorkHoursData(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String? id;
  List<DayDetail>? dayDetails;

  Datum({
    this.id,
    this.dayDetails,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        dayDetails: json["dayDetails"] == null
            ? []
            : List<DayDetail>.from(
                json["dayDetails"]!.map((x) => DayDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "dayDetails": dayDetails == null
            ? []
            : List<dynamic>.from(dayDetails!.map((x) => x.toJson())),
      };
}

class DayDetail {
  String? day;
  String? startTime;
  String? endTime;
  String? breakStartTime;
  String? breakEndTime;
  bool? isOpen;
  String? id;

  DayDetail({
    this.day,
    this.startTime,
    this.endTime,
    this.breakStartTime,
    this.breakEndTime,
    this.isOpen,
    this.id,
  });

  factory DayDetail.fromJson(Map<String, dynamic> json) => DayDetail(
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        breakStartTime: json["breakStartTime"],
        breakEndTime: json["breakEndTime"],
        isOpen: json["isOpen"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "breakStartTime": breakStartTime,
        "breakEndTime": breakEndTime,
        "isOpen": isOpen,
        "_id": id,
      };
}
