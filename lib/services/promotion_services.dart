import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/promotions/promotion.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getProductListModel.dart';
import 'package:new_sliikeapps_apps/models/getProductsModel.dart';
import 'package:new_sliikeapps_apps/models/getServicesListModel.dart';
import 'package:new_sliikeapps_apps/models/getServicesModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class PromotionServices {
  getServicesList(BuildContext context) async {
    var getUri = Uri.parse(ApiUrlList.getServicesList);
    try {
      // Loader.show(
      //   context,
      //   isSafeAreaOverlay: false,
      //   overlayColor: Colors.black26,
      //   progressIndicator:
      //   const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      //   themeData: Theme.of(context).copyWith(
      //     colorScheme: ColorScheme.fromSwatch().copyWith(
      //       secondary: const Color(0xff01635D),
      //     ),
      //   ),
      // );
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(
        getUri,
        headers: headers,
      );
      log("getServicesList Body ==> ${response.body}");
      log("getServicesList Code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        Loader.hide();
        return GetServicesListData.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        Loader.hide();
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

  getProductList(BuildContext context) async {
    var getUri = Uri.parse(ApiUrlList.getProductList);
    try {
      // Loader.show(
      //   context,
      //   isSafeAreaOverlay: false,
      //   overlayColor: Colors.black26,
      //   progressIndicator:
      //   const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      //   themeData: Theme.of(context).copyWith(
      //     colorScheme: ColorScheme.fromSwatch().copyWith(
      //       secondary: const Color(0xff01635D),
      //     ),
      //   ),
      // );
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(
        getUri,
        headers: headers,
      );
      log("beautician/getProductList Body ==> ${response.body}");
      log("beautician/getProductList Code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        Loader.hide();
        return GetProductListData.fromMap(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        Loader.hide();
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

  addPromotion(BuildContext context, Body) async {
    var getUri =
        "https://sliike-server.onrender.com/api/v1/beautician/addPromotion";
    try {
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
      var headers = {
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      print(Body);
      print(getUri);
      var response = await http.post(
        Uri.parse(getUri),
        headers: headers,
        body: Body,
      );
      log("beautician/addPromotion Body ==> ${response.body}");
      log("beautician/addPromotion Code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        showToast(
          message: "${map["message"]}",
        );
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => promotion(),
            ));
        Loader.hide();
      } else if (response.statusCode == 401) {
        Loader.hide();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      } else {
        showToast(
          message: "${map["message"]}",
        );
        Loader.hide();
      }
    } catch (e) {
      rethrow;
    } finally {
      Loader.hide();
    }
  }

  getServices(BuildContext context) async {
    try {
      // Loader.show(
      //   context,
      //   isSafeAreaOverlay: false,
      //   overlayColor: Colors.black26,
      //   progressIndicator:
      //   const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      //   themeData: Theme.of(context).copyWith(
      //     colorScheme: ColorScheme.fromSwatch().copyWith(
      //       secondary: const Color(0xff01635D),
      //     ),
      //   ),
      // );
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(
        Uri.parse(
            "https://sliike-server.onrender.com/api/v1/beautician/getPromotionList/service"),
        headers: headers,
      );
      log("getServices Body ==> ${response.body}");
      log("getServices Code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        Loader.hide();
        return GetServices.fromMap(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        Loader.hide();
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

  getProducts(BuildContext context) async {
    try {
      // Loader.show(
      //   context,
      //   isSafeAreaOverlay: false,
      //   overlayColor: Colors.black26,
      //   progressIndicator:
      //   const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      //   themeData: Theme.of(context).copyWith(
      //     colorScheme: ColorScheme.fromSwatch().copyWith(
      //       secondary: const Color(0xff01635D),
      //     ),
      //   ),
      // );
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(
        Uri.parse(
            "https://sliike-server.onrender.com/api/v1/beautician/getPromotionList/product"),
        headers: headers,
      );
      log("beautician/getPromotionList/product Body ==> ${response.body}");
      log("beautician/getPromotionList/product Code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        Loader.hide();
        return GetProducts.fromMap(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        Loader.hide();
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
}
