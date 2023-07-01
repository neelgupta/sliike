import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/paymentDeatailsModel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class PaymentService {
  Future<PaymentDetail?> getPaymentDetail({body}) async {
    var geturi = Uri.parse(ApiUrlList.paymentDetail);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(geturi, headers: headers, body: body);
    log("getPaymentDetail response.body ==> ${response.body}");
    log("getPaymentDetail status code ==> ${response.statusCode}");
    if (response.statusCode == 200) {
      return PaymentDetail.fromJson(jsonDecode(response.body));
    } else {
      Fluttertoast.showToast(msg: "${jsonDecode(response.body)['message']}");
      return null;
    }
  }

  Future<String?> addPayment({body}) async {
    var geturi = Uri.parse(ApiUrlList.makePayment);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var response = await http.post(geturi, headers: headers, body: body);
    log("addPayment response.body ==> ${response.body}");
    log("addPayment status code ==> ${response.statusCode}");
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['data']['BookingId']);
      return jsonDecode(response.body)['data']['BookingId'];
    } else {
      Fluttertoast.showToast(msg: "${jsonDecode(response.body)['message']}");
      return null;
    }
  }
}
