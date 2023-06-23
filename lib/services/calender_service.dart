import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/b_model/getAppointmentDetailsModel.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../Beautician_screen/b_model/appointment_details_model.dart';
import '../Beautician_screen/b_model/appointment_payment_details.dart';
import '../Beautician_screen/b_model/employee_get_list.dart';
import '../Beautician_screen/b_model/get_appointment_details_model.dart';

class CalenderService {

  Future<List<EmployeeData>> getBeauticianAllEmployeesList() async {
    var geturi = Uri.parse(ApiUrlList.getEmployeeList);
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("getBeauticianAllEmployeesList url is  : $geturi");
      log("getBeauticianAllEmployeesList headers  : $headers");

      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getBeauticianAllEmployeesList response.body ==> ${response.body}");
      log("getBeauticianAllEmployeesList status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);
        var emp = EmployeesGetList.fromJson(jsonDecode(response.body));
        return emp.data;
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      }
    } catch (e) {
      rethrow;
      // return null;
    }
    return [];
  }

  Future<GetAppointMentDetailsModel?> getAppointmentDetailByDate(
      {required String selectedDate,String? stylishId}) async {
    var geturi = Uri.parse(ApiUrlList.getCalenderAppointmentList);
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      Map<String, dynamic> resBody = {
        "date": selectedDate,
      };
      if (stylishId != null) {
        resBody.addAll({
          "stylistId": [
            stylishId,
          ],
        });
      }
      log("res resBody  : $resBody");
      var response = await http.post(
        geturi,
        body: jsonEncode(resBody),
        headers: headers,
      );
      log("getClientPersonalInfo response.body ==> ${response.body}");
      log("getClientPersonalInfo status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);

        return GetAppointMentDetailsModel.fromJson(jsonDecode(response.body));
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      }
    } catch (e) {
      rethrow;
      // return null;
    }
    return null;
  }


  /// new ///
  Future<GetAppointmentDetailModel?> getAppointmentDetailByDate2(
      {required String selectedDate,required String selectedDay,String? stylishId}) async {
    var geturi = Uri.parse(ApiUrlList.getCalenderAppointmentList);
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      Map<String, dynamic> resBody = {
        "date": selectedDate,
        "day" : selectedDay
      };
      if (stylishId != null) {
        resBody.addAll({
          "stylistId": [
            stylishId,
          ],
        });
      }
      log("res resBody  : $resBody");
      var response = await http.post(
        geturi,
        body: jsonEncode(resBody),
        headers: headers,
      );
      log("getClientPersonalInfo response.body ==> ${response.body}");
      log("getClientPersonalInfo status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);

        return GetAppointmentDetailModel.fromJson(jsonDecode(response.body));
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      }
    } catch (e) {
      rethrow;
      // return null;
    }
    return null;
  }

  Future<AppointmentDetailsModel?> getAppointmentData(
      {required String appointmentId}) async {
    var geturi =
        Uri.parse("${ApiUrlList.getAppointmentDetails}/$appointmentId");
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("getAppointmentData url is  : $geturi");
      log("getAppointmentData  headers  : $headers");

      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getAppointmentData response.body ==> ${response.body}");
      log("getAppointmentData status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);

        return AppointmentDetailsModel.fromJson(jsonDecode(response.body));
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      }
    } catch (e) {
      rethrow;
      // return null;
    }
    return null;
  }

  Future<AppointmentPaymentDetails?> getAppointmentPaymentData(
      {required String appointmentId}) async {
    var geturi =
        Uri.parse("${ApiUrlList.getAppointmentPaymentDetails}/$appointmentId");
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("getAppointmentPaymentData url is  : $geturi");
      log("getAppointmentPaymentData  headers  : $headers");

      var response = await http.get(
        geturi,
        headers: headers,
      );
      log("getAppointmentPaymentData response.body ==> ${response.body}");
      log("getAppointmentPaymentData status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);

        return AppointmentPaymentDetails.fromJson(jsonDecode(response.body));
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      }
    } catch (e) {
      rethrow;
      // return null;
    }
    return null;
  }

  Future<bool> pastAppointmentChangeStatus({
    required String appointmentId,
    required String newStatus,
  }) async {
    var geturi = Uri.parse(ApiUrlList.handlePastAppointmentStatus);
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      // log("pastAppointmentChangeStatus url is  : $geturi");
      // log("pastAppointmentChangeStatus  headers  : $headers");
      var body = {
        "appoId": appointmentId,
        "newStatus": newStatus // accept only "no-show" or "delivered"
      };
      var response = await http.put(
        geturi,
        body: jsonEncode(body),
        headers: headers,
      );
      var map = jsonDecode(response.body);
      // log("pastAppointmentChangeStatus response.body ==> ${response.body}");
      // log("pastAppointmentChangeStatus status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return true;
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      } else {
        Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      rethrow;
      // return null;
    }
    return false;
  }

  Future<bool> cancelAppointment({required String appointmentId}) async {
    var geturi = Uri.parse("${ApiUrlList.cancelAppointment}/$appointmentId");
    try {
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      // log("cancelAppointment url is  : $geturi");
      // log("cancelAppointment  headers  : $headers");

      var response = await http.delete(
        geturi,
        headers: headers,
      );

      var map = jsonDecode(response.body);
      // log("cancelAppointment response.body ==> ${response.body}");
      // log("cancelAppointment status code ==> ${response.statusCode}");
      if (response.statusCode == 200) {
        // Map map = jsonDecode(response.body);
        Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        return true;
        // if (getProfileModel.status == 200) {
        //   profileData = getProfileModel.data;
        //   if (getProfileModel.data.address.isNotEmpty) {
        //     addressData = getProfileModel.data.address.first;
        //   }
        // }
      } else {
        Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      rethrow;
      // return null;
    }
    return false;
  }
}
