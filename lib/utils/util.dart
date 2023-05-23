import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_sliikeapps_apps/theme/theme_configration.dart';

class Util {
  final DateFormat formatter = DateFormat('dd-mm-yyyy');

  // var box=GetStorage();

  Widget customLoader() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  static void toastWarning(String title, String msg) {
    _toast(title, msg, Icons.warning, Colors.orange);
  }

  static void _toast(String title, String msg, iconData, Color bg,
      {bool exit = true}) {
    if (exit) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }
    Get.snackbar(title, msg,
        icon: Icon(iconData),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: bg,
        borderRadius: ThemeConFiguration.bttonBorderRadius,
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        snackStyle: SnackStyle.FLOATING,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(
            bottom: 56, left: Get.width * 0.02, right: Get.width * 0.02));
  }

  static void toastWarningwithouticon(String title, String msg) {
    _toastnoicon(title, msg, Colors.orange);
  }

  static void _toastnoicon(String title, String msg, Color bg,
      {bool exit = true}) {
    if (exit) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }
    Get.snackbar(title, msg,

        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: bg,
        borderRadius: ThemeConFiguration.bttonBorderRadius,
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        snackStyle: SnackStyle.FLOATING,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(
            bottom: 56, left: Get.width * 0.02, right: Get.width * 0.02)
    );
  }
}







