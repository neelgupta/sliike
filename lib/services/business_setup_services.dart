import 'dart:convert';
import 'dart:developer';

import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

class BusinessSetupService {
  getCancellationProtectionStatus() async {
    var uri = Uri.parse(ApiUrlList.getCancellationStatus);
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

    var response = await http.get(
      uri,
      headers: headers,
    );
    log("getCancellationProtectionStatus response.body ==> ${response.body}");
    log("getCancellationProtectionStatus status code ==> ${response.statusCode}");

    return response;
  }

  updateCancellationProtectionStatus(int status, {isCancellation = false}) async {
    var uri = isCancellation?Uri.parse(ApiUrlList.updateCancellationStatus):Uri.parse(ApiUrlList.updateProtectionStatus);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization":
      "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };

    var body = {
      "select" : status
    };

    var response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(body)
    );

    log("updateCancellationProtectionStatus response.body ==> ${response.body}");
    log("updateCancellationProtectionStatus status code ==> ${response.statusCode}");

    return response;
  }

  getBookingSetting() async {
    var uri = Uri.parse(ApiUrlList.getBookingSetting);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization":
      "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    print("111");
    print(uri);

    var response = await http.get(
      uri,
      headers: headers,
    );
    log("getBookingSetting response.body ==> ${response.body}");
    log("getBookingSetting status code ==> ${response.statusCode}");

    return response;
  }

  updateBookingSetting(body) async {
    var uri = Uri.parse(ApiUrlList.saveBookingSetting);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization":
      "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
      uri,
      headers: headers,
      body: body
    );
    log("updateBookingSetting response.body ==> ${response.body}");
    log("updateBookingSetting status code ==> ${response.statusCode}");

    return response;
  }
}