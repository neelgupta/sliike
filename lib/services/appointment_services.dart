import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/calender/send_notifi_message_or_phone/calender_screen/calender.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/calender/send_notifi_message_or_phone/new_appoinment/new_appinment_viewall_add_another/new_appoinment_view_Add.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/GetAddBAppointment.dart';
import 'package:new_sliikeapps_apps/models/getAppointmentPreDetailsModel.dart';
import 'package:new_sliikeapps_apps/models/getStaffDataModel.dart';
import 'package:new_sliikeapps_apps/models/serviceDetailModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../Beautician_screen/bottomnavbar/bottomnavbar.dart';

class AppointmentService {

  List appointmentIds = [];

  Future<GetServiceDetailsModel?> getServiceDetails(BuildContext context) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
      const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff01635D),
        ),
      ),
    );
    var getUri = Uri.parse(ApiUrlList.getServiceDetails);
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.get(getUri,headers: Headers);
    log("getServiceDetails Body ==> ${response.body}");
    log("getServiceDetails Code ==> ${response.statusCode}");
    log("token ==> ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Loader.hide();
      return GetServiceDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      Loader.hide();
      Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    Loader.hide();
    return GetServiceDetailsModel.fromJson(jsonDecode(response.body));
  }

  getStaffData(BuildContext context) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
      const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff01635D),
        ),
      ),
    );
    var getUri = Uri.parse(ApiUrlList.getStaffData);
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.get(getUri,headers: Headers);
    log("getStaffData Body ==> ${response.body}");
    log("getStaffData Code ==> ${response.statusCode}");
    log("token ==> ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Loader.hide();
      return GetStaffDataModel.fromJson(jsonDecode(response.body));
    } else {
      Loader.hide();
      Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    Loader.hide();
    return GetStaffDataModel.fromJson(jsonDecode(response.body));
  }

  Future addBAppointment(BuildContext context,Map<String ,dynamic> Body) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
      const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff01635D)),
      ),
    );
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.addBAppointment),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("addBAppointment Code : ${response.statusCode}");
    log("addBAppointment Body : ${response.body}");
    log("addBAppointment PayLoad : ${Body}");
    log("addBAppointment PayLoad : ${Headers}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 201) {
      Loader.hide();
      appointmentIds.add(map["data"]["appointmentId"].toString());
      log("appointmentIds : ${appointmentIds}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => newAppoinment_Viwe_Add(appointmentIds),));
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      return GetAddBAppointment.fromJson(jsonDecode(response.body));
    } else {
      Loader.hide();
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return GetAddBAppointment.fromJson(jsonDecode(response.body));
  }

  Future updateAppointment(BuildContext context,Map<String ,dynamic> Body,String appointmentId) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
      const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff01635D)),
      ),
    );
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.updateBAppointment+"$appointmentId"),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("updateAppointment Code : ${response.statusCode}");
    log("updateAppointment Body : ${response.body}");
    log("updateAppointment PayLoad : ${Body}");
    log("updateAppointment PayLoad : ${ApiUrlList.updateBAppointment+"$appointmentId"}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 201) {
      Loader.hide();
      Navigator.pop(context);
      appointmentIds.add(map["data"]["appointmentId"].toString());
      log("appointmentIds : ${appointmentIds}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => newAppoinment_Viwe_Add(appointmentIds),));
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      return GetAddBAppointment.fromJson(jsonDecode(response.body));
    } else {
      Loader.hide();
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return GetAddBAppointment.fromJson(jsonDecode(response.body));
  }

  Future<GetAppointmentPreDetailsData?> getAppointmentPreDetails(BuildContext context,data) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
      const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff01635D)),
      ),
    );
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var Body = {
      "appointmentIds" : data,
    };
    log("addBAppointment PayLoad : ${Body}");
    var response = await http.post(
      Uri.parse(ApiUrlList.getAppointmentPreDetails),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("addBAppointment Code : ${response.statusCode}");
    log("addBAppointment Body : ${response.body}");
    log("addBAppointment PayLoad : ${Body}");
    log("addBAppointment PayLoad : ${Headers}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 201 || response.statusCode == 200) {
      Loader.hide();
      // Fluttertoast.showToast(
      //     msg: map["message"],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      return GetAppointmentPreDetailsData.fromJson(jsonDecode(response.body));
    } else {
      Loader.hide();
      // Fluttertoast.showToast(
      //     msg: map["message"],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
    Loader.hide();
    return GetAppointmentPreDetailsData.fromJson(jsonDecode(response.body));
  }

  saveAppointmentDetails(BuildContext context,Map<String ,dynamic> Body,List appId) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
      const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff01635D)),
      ),
    );
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.saveAppointmentDetails),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("saveAppointmentDetails Code : ${response.statusCode}");
    log("saveAppointmentDetails Body : ${response.body}");
    log("saveAppointmentDetails PayLoad : ${Body}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 201 || response.statusCode == 200) {
      appId.clear();
      Loader.hide();
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      // return GetAddBAppointment.fromJson(jsonDecode(response.body));
    } else {
      Loader.hide();
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    // return GetAddBAppointment.fromJson(jsonDecode(response.body));
  }

}