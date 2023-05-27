import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/client_model/get_profile_model.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getProvinceMoel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class AddressService {
  getAddressList() async {
    var geturi = Uri.parse(ApiUrlList.getClientPersonalInfo);
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getClientPersonalInfo response.body ==> ${response.body}");
      log("getClientPersonalInfo status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);

        return GetProfileModel.fromJson(jsonDecode(response.body));
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      }
    } catch (e) {
      return null;
    }
  }

  getProvince() async {
    var geturi = Uri.parse(ApiUrlList.getProvince);
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };
      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getProvince response.body ==> ${response.body}");
      log("getProvince status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        return GetProvince.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return null;
    }
  }
}