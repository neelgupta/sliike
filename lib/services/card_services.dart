import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getCardDetailsModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

import '../client_app/profile_pages/payments.dart';

class cardServices {
  getCardDetails(BuildContext context) async {
    var getUri = Uri.parse(ApiUrlList.getCardDetails);
    try {
      Loader.show(
        context,
        isSafeAreaOverlay: false,
        overlayColor: Colors.black26,
        progressIndicator:
            const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xff01635D),
          ),
        ),
      );
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(
        getUri,
        headers: headers,
      );
      log("getCardDetails Body ==> ${response.body}");
      log("getCardDetails Code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        return GetCardDetailsData.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      Loader.hide();
    }
  }

  addCardDetails(BuildContext context, Body) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
          const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff01635D),
        ),
      ),
    );
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.addCardDetails),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("addMyDemographics Code : ${response.statusCode}");
    log("addMyDemographics Body : ${response.body}");
    log("addMyDemographics PayLoad : ${Body}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Loader.hide();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const payments(),
          ));
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Loader.hide();
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
