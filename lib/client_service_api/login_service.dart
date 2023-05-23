import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/network_api/network.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';

import '../client_model/login_model.dart';

class LoginService {
  NetworkHandler networkHandler = NetworkHandler();

  Future<SigninModel?>? emailSign(email, password,
      {client}) async {
    client ??= http.Client();

    var result = await networkHandler.postwithoutToken(
        ApiUrlList.signInApiUrl, client, model: {
      "email": email,
      "password": password,
    });
    print("emailsignin $result");

    if (result != null) {
      return SigninModel.fromJson(jsonDecode(result));
    } else {
      return null;
      throw Exception('Failed to load album');
    }
  }

}
