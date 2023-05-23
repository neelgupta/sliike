// import 'dart:convert';
//
// import 'package:new_sliikeapps_apps/network_api/network.dart';
// import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
// import 'package:http/http.dart' as http;
//
// class SignUpservice {
//   NetworkHandler networkHandler = NetworkHandler();
//
//   Future<signinmodel?>? Signup(email, password,
//       {client}) async {
//     client ??= http.Client();
//
//     var result = await networkHandler.postwithoutToken(
//         ApiUrlList.signUpApiUrl, client, model: {
//       "email": email,
//       "password": password,
//     });
//     print("emailsignin $result");
//
//     if (result != null) {
//       return signinmodel.fromJson(jsonDecode(result));
//     } else {
//       return null;
//       throw Exception('Failed to load album');
//     }
//   }
//
// }