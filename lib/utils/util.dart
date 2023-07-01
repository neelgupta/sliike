import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:new_sliikeapps_apps/theme/theme_configration.dart';


class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}


class Util {

  final DateFormat formatter = DateFormat('dd-mm-yyyy');
  final DateFormat eMMMdformatter = DateFormat('E, MMM d');
  final DateFormat hhmmaformatter = DateFormat('hh:mm a');
  final DateFormat MDEAformatter = DateFormat('MMM d . h:m a');
  final DateFormat eMMMdYYYYhaformatter = DateFormat('E, MMM d, yyyy. ');
  final DateFormat haformatter = DateFormat('ha');
  final DateFormat mmmDformatter = DateFormat('MMM d');

  // var box=GetStorage();

  Widget customLoader() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }


  Future<void> selectDate(BuildContext context,selectedDate,Color) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: ( context,  child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Color ?? Colors.teal,
                primaryColorDark: Color ?? Colors.teal,
                accentColor: Color ?? Colors.teal,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
    }
  }


  formatMinuteDuration({
    required String hour,
    required String min,
  }) {
    final duration = Duration(
      hours: int.parse(hour),
      minutes: int.parse(min),
    );
    var components = <String>[];

    var days = duration.inDays;
    if (days != 0) {
      components.add('${days}d');
    }
    var hours = duration.inHours % 24;
    if (hours != 0) {
      components.add('$hours hour ');
    }
    var minutes = duration.inMinutes % 60;
    if (minutes != 0) {
      components.add('$minutes minutes');
    }

    var seconds = duration.inSeconds % 60;
    var centiseconds = (duration.inMilliseconds % 1000) ~/ 10;
    if (components.isEmpty || seconds != 0 || centiseconds != 0) {
      components.add('$seconds');
      if (centiseconds != 0) {
        components.add('.');
        components.add(centiseconds.toString().padLeft(2, '0'));
      }
      components.add('s');
    }
    return components.join();
    // final hours = duration.inHours;
    // final minutes = duration.inMinutes;

    // return '$hours hour $minutes minutes';
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
        duration: const Duration(seconds: 3),
        backgroundColor: bg,
        borderRadius: ThemeConFiguration.bttonBorderRadius,
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        snackStyle: SnackStyle.FLOATING,
        padding: const EdgeInsets.only(bottom: 20),
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
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      backgroundColor: bg,
      borderRadius: ThemeConFiguration.bttonBorderRadius,
      colorText: Colors.white,
      dismissDirection: DismissDirection.horizontal,
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(
        bottom: 56,
        left: Get.width * 0.02,
        right: Get.width * 0.02,
      ),
    );
  }
}
