import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/beautician_report_model/beauticianReportModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class BeauticianReport {
  getBeauticianReports(String date, int appoLimit, int appoOffset) async {
    // Loader.show(
    //   context,
    //   isSafeAreaOverlay: false,
    //   overlayColor: Colors.black26,
    //   progressIndicator:
    //       const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
    //   themeData: Theme.of(context).copyWith(
    //     colorScheme: ColorScheme.fromSwatch()
    //         .copyWith(secondary: const Color(0xff01635D)),
    //   ),
    // );
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };

    var reqBody = {
      "date": date,
      "appoLimit": appoLimit,
      "appoOffset": appoOffset
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.getBeauticianReports),
      body: jsonEncode(reqBody),
      headers: Headers,
    );
    log("${reqBody}");
    log("getBeauticianReports Code : ${response.statusCode}");
    log("getBeauticianReports Body : ${response.body}");
    log("getBeauticianReports PayLoad : ${Headers}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      Loader.hide();
      //showToast(message: "${map['message']}",);
      return BeauticianReportModel.fromMap(jsonDecode(response.body));
    } else {
      Loader.hide();
      // showToast(message: "${map['message']}");
    }
    Loader.hide();
    return BeauticianReportModel.fromMap(jsonDecode(response.body));
  }
}
