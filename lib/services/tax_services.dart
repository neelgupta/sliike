import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/tax_service_models/getProvinceListModel.dart';
import 'package:new_sliikeapps_apps/models/tax_service_models/getTaxProvinceDetailsModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class TaxServices {

  getProvinceList(BuildContext context) async {
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
    var getUri = Uri.parse(ApiUrlList.getProvinceList);
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      // "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.get(getUri, headers: Headers);
    log("getProvinceList Body ==> ${response.body}");
    log("getProvinceList Code ==> ${response.statusCode}");
    log("token ==> ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Loader.hide();
      return GetProvinceListModel.fromMap(jsonDecode(response.body));
    } else {
      Loader.hide();
      showToast(
            message: "${map['message']}",);
    }
    Loader.hide();
    return GetProvinceListModel.fromMap(jsonDecode(response.body));
  }


  updateTax(BuildContext context,Map<String,dynamic> Body) async {
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
    var getUri = Uri.parse(ApiUrlList.updateTax);
    var Headers = {
      // 'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(
        getUri,
       headers: Headers,
       body: Body
       );
    log("updateTax Body ==> ${response.body}");
    log("updateTax Code ==> ${response.statusCode}");
    log("updateTax Token ==> ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
    log("updateTax PayLoad ==> ${Body}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      showToast(
            message: "${map['message']}",);
      Loader.hide();
      // return GetProvinceListModel.fromMap(jsonDecode(response.body));
    } else {
      Loader.hide();
      showToast(
            message: "${map['message']}",);
    }
    Loader.hide();
    // return GetProvinceListModel.fromMap(jsonDecode(response.body));
  }


    getTaxProvinceDetails(BuildContext context) async {
    // Loader.show(
    //   context,
    //   isSafeAreaOverlay: false,
    //   overlayColor: Colors.black26,
    //   progressIndicator:
    //       const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
    //   themeData: Theme.of(context).copyWith(
    //     colorScheme: ColorScheme.fromSwatch().copyWith(
    //       secondary: const Color(0xff01635D),
    //     ),
    //   ),
    // );
    var getUri = Uri.parse(ApiUrlList.getTaxProvinceDetails);
    var Headers = {
      // 'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.get(getUri, headers: Headers);
    log("getTaxProvinceDetails Body ==> ${response.body}");
    log("getTaxProvinceDetails Code ==> ${response.statusCode}");
    log("token ==> ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Loader.hide();
      return GetTaxProvinceDetailsModel.fromMap(jsonDecode(response.body));
    } else {
      Loader.hide();
      showToast(
            message: "${map['message']}",);
    }
    Loader.hide();
    return GetTaxProvinceDetailsModel.fromMap(jsonDecode(response.body));
  }

}
