import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/addworkhours_model.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/import_client_from_contact/congration_sucess/congratulation_screen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/utils/constants.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/userdetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types, must_be_immutable
class addWork_Save_or_NoThanks_Page extends StatefulWidget {
  bool secondflow;

  List<DayDetails> dayDetailsList;

  addWork_Save_or_NoThanks_Page(
    this.secondflow,
    this.dayDetailsList, {
    Key? key,
  }) : super(key: key);

  @override
  State<addWork_Save_or_NoThanks_Page> createState() =>
      _addWork_Save_or_NoThanks_PageState();
}

// ignore: camel_case_types
class _addWork_Save_or_NoThanks_PageState
    extends State<addWork_Save_or_NoThanks_Page> {
  AddWorkModel? addworkMmdel;
  var  any="";
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
                            Navigator.pop(context,[
                              false,
                               widget.dayDetailsList.first.day

                            ]);
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
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
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
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "4",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff111111),
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
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff111111),
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 10,
              ),

              ListView.separated(
                shrinkWrap: true,
                itemCount: widget.dayDetailsList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  // return SaveThanksCommoncheckbox(
                  //     context, "Monday", "9:00 - 17:00", () {
                  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //         return add_Your_Work_Hours(secondflow: false,);
                  //
                  //       },));
                  // });
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${widget.dayDetailsList[index].day}",
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(

                                  children: [
                                    Text(
                                      "${widget.dayDetailsList[index].startTime}",
                                      style: const TextStyle(
                                          color: Color(0xff292929),
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "spartan",
                                          fontSize: 12),
                                    ),
                                    Text(
                                      widget.dayDetailsList[index].isOpen!
                                          ? " to "
                                          : "Closed",
                                      style: const TextStyle(
                                          color: Color(0xff292929),
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "spartan",
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "${widget.dayDetailsList[index].endTime}",
                                      style: const TextStyle(
                                          color: Color(0xff292929),
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "spartan",
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                              widget.dayDetailsList[index].breakStartTime != ""?"break":"",
                                      style: const TextStyle(
                                          color: Color(0xff292D32),
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "spartan",
                                          fontSize: 10),
                                    ),
                                    Text(
                                      " ${widget.dayDetailsList[index].breakStartTime}",
                                      style: const TextStyle(
                                          color: Color(0xff292D32),
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "spartan",
                                          fontSize: 10),
                                    ),
                                    Text(
                                      widget.dayDetailsList[index].breakStartTime != ""?" - ":"",
                                      style: const TextStyle(
                                          color: Color(0xff292D32),
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "spartan",
                                          fontSize: 10),
                                    ),
                                    Text(
                                      "${widget.dayDetailsList[index].breakEndTime}",
                                      style: const TextStyle(
                                          color: Color(0xff292D32),
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "spartan",
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {


                                Navigator.pop(context,[
                                  false,
                                  widget.dayDetailsList[index].day,
                                  widget.dayDetailsList[index].startTime,
                                  widget.dayDetailsList[index].endTime,
                                  widget.dayDetailsList[index].breakStartTime,
                                  widget.dayDetailsList[index].breakEndTime,

                                ]);
                                print("navistartoop=${widget.dayDetailsList[index].startTime}");
                                // Navigator.push(context,MaterialPageRoute(builder: (context) {
                                //   return add_Your_Work_Hours(secondflow: false,);
                                // },));
                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                height: 15,
                                width: 15,
                                child: Image.asset(
                                    "assets/images/righticon.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),

              // SizedBox(height: height*0.18,),
              const Spacer(),
              InkWell(
                onTap: () {
                  addWorkHours(context,widget.dayDetailsList);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const conGraTuLation();
                    },
                  ),(route) => false,);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text("CONTINUE",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addWorkHours(
    BuildContext context,
    // String selectedValue,
    // String startTime,
    // String endTime,
    // String breakstartTime,
    // String breakendTime,
    // String Onoff
    List<DayDetails> dayDetailsList,
  ) async {
    try {
      var prefs = await SharedPreferences.getInstance();

      Userdetail.userToken = prefs.getString(UserPrefs.keyutoken) ?? "";
      // ignore: use_build_context_synchronously
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator:
              const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
          // ignore: use_build_context_synchronously
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      Map reqBody = {};

      List dayDetailsList = [];
      for (var item in widget.dayDetailsList) {
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
      print("loginApi url : ${ApiUrlList.addWorkHours}");
      print("passing reqBody  : $reqBody");
      var response = await http.post(
        Uri.parse(ApiUrlList.addWorkHours),
        body: jsonEncode(reqBody),
        headers: ApiHeader.headers,
      );
      var map = jsonDecode(response.body.toString());
      print("statuscode : ${response.statusCode}");
      print("res  body :: ${response.body}");
      if (response.statusCode == 201) {


        addworkMmdel = AddWorkModel.fromJson(map);
         print(addworkMmdel);
        print('account sucessfully');

        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const conGraTuLation();
          },
        ));
        setState(() {
          Helper.prefs!.setInt(
              UserPrefs.screenStatus,7);
          Userdetail.screenStatus =
              Helper.prefs!.getInt(UserPrefs.screenStatus) ?? 7;
        });
      }
      else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
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

// ignore: non_constant_identifier_names
Widget SaveThanksCommoncheckbox(
    BuildContext context, weekdaystring, String timestring, onTap) {
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: width * 0.45,
                  child: Text(
                    weekdaystring,
                    style: const TextStyle(
                        color: Color(0xfff29292),
                        fontWeight: FontWeight.w300,
                        fontFamily: "spartan",
                        fontSize: 12),
                  ),
                ),
                Text(
                  timestring,
                  style: const TextStyle(
                      color: Color(0xff292D32),
                      fontWeight: FontWeight.w300,
                      fontFamily: "spartan",
                      fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: onTap,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/images/righticon.png"),
                  ),
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}
