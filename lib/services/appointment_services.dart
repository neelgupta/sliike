import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getStaffDataModel.dart';
import 'package:new_sliikeapps_apps/models/serviceDetailModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AppointmentService {

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

}