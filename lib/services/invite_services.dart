import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getClientListModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

class InviteServices {

  getBeauticianProfile(BuildContext context) async {
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
    var getUri = Uri.parse(ApiUrlList.getBeauticianProfile);
    try {
      var Headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(
        getUri,
        headers: Headers,
      );
      log("getBeauticianProfile Body ==> ${response.body}");
      log("getBeauticianProfile Code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        Loader.hide();
        return getName.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return null;
    }
  }

  inviteContacts(BuildContext context,String contactDetails) async {
    // Loader.show(
    //   context,
    //   isSafeAreaOverlay: false,
    //   overlayColor: Colors.black26,
    //   progressIndicator:
    //   const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
    //   themeData: Theme.of(context).copyWith(
    //     colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff01635D)),
    //   ),
    // );
    var Headers = {
      // 'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.inviteContacts),
      body: {
        "contactDetails" : contactDetails
      },
      headers: Headers,
    );
    log("addBAppointment Code : ${response.statusCode}");
    log("addBAppointment Body : ${response.body}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 201 || response.statusCode==200) {
      // return GetAddBAppointment.fromJson(jsonDecode(response.body));
    } else {
      //
    }
    // return GetAddBAppointment.fromJson(jsonDecode(response.body));
  }

  getInvitedClientList(BuildContext context) async {
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
    var response = await http.get(
      Uri.parse(ApiUrlList.getInvitedClientList),
      headers: Headers,
    );
    log("getInvitedClientList Code : ${response.statusCode}");
    log("getInvitedClientList Body : ${response.body}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 201 || response.statusCode==200) {
      Loader.hide();
      return GetClientListData.fromJson(jsonDecode(response.body));
    } else {
      Loader.hide();
      //
    }
    Loader.hide();
    return GetClientListData.fromJson(jsonDecode(response.body));
  }

}

class getName{
  int status;
  Data data;
  getName(this.status, this.data);

  factory getName.fromJson(Map<dynamic,dynamic>map){
    Map map1 = map["data"];
    Data d = Data.fromJson(map1);
    return getName(map["status"], d);
  }

}
class Data{
  String firstName;
  String lastName;
  Data(this.firstName, this.lastName);
  factory Data.fromJson(Map<dynamic,dynamic>map){
    return Data(map["firstName"],map["lastName"],);
  }
}