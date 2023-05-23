import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/network_api/appexception.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class NetworkHandler{

  /// postApi
  Future<dynamic> postwithoutToken(String url,http.Client client,{dynamic model,bool showError =true})
  async {
    Map<String,String> headers={
      'Content-Type':'application/json; charset=UTF-8',

    };
    var responseJson;
    print(jsonEncode(model));
    print('url: '+url);
    try{
      final http.Response response=await client.post(Uri.parse(url),
          headers: headers,
          body: model !=null ? jsonEncode(model):null);
      responseJson = returnResponse(
        response,
        url,
        "POST",
        model:model,
        showError:showError,
      );

    }on Exception{
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }



 dynamic returnResponse(http.Response response,url,method,
     {bool toLogin = true,model,bool showError = true}) async {
    print(response.body);
    print(response.statusCode);
    switch (response.statusCode)
    {
      case 200:
      var responceJson =response.body;
      return responceJson;
      case 201:
        var responceJson =response.body;
        return responceJson;
      // case 400:
      //   //throw Exception(responce.body.toString());
      //   if(url.contains('fleet/gps-details')||url.contains('fleet/gps-fake-index')){
      //   }else{
      //     Util.toastWarning('',jsonDecode(response.body)['message']);
      //   }
      //   return null;
      case 401:
        Util.toastWarning('',jsonDecode(response.body)['message']);
        if(jsonDecode(response.body)['message']=='Invalid Auth Token'||
        jsonDecode(response.body)['code']=='ACCESS_DENIED'){
         // if(toLogin) _futureDelayed();
        }
        return null;
      case 403:
        if(showError){
          Util.toastWarning('',jsonDecode(response.body)['message']);
        }else{}
        var responceJson=response.body;
        return responceJson;
      case 404:
        if(url.contains('fleet/gps-details')||url.contains('fleet/gps-fake-index')){
        //   // isGPSEnabledForUser=false;
        //   // GpsTrackerController gpsTrackerController=Get.put(GpsTrackerController());
        //   gpsTrackerController.changeGPSAvailibility();
        // }
        // else if(url.contains('fleet/location-history')){
        //   GpsTrackerController gpsTrackerController=Get.put(GpsTrackerController());
        //   await gpsTrackerController.disableHistory();
        // }else{
          Util.toastWarning('',jsonDecode(response.body)['message']);
        }
        // if(toLogin) _futureDelayed();
    return null;
      default:
        if(jsonDecode(response.body)['message']=='Not valid user Token'||
            jsonDecode(response.body)['code']=='ACCESS_DENIED'){
         // if(toLogin) _futureDelayed();
        }
        if(url.contains('fleet/gps-details')||url.contains('fleet/gps-fake-index')){
        }else{
          Util.toastWarning('',jsonDecode(response.body)['message']);
          logger(method: method,response: response,url:url,model:model);
        }
        return null;
    }

  }
///only login logout
//   _futureDelayed() {
//     Future.delayed(Duration(seconds: 3),(){
//       AuthService().logout();
//       //loginsession.shared.logoutExpire
//       Get.ofAllNamed(Routes.LOGIN);
//
//     });
//    }

  Future<void> logger({required String url,
    model,required http.Response response, required String method}) async {
    Map<String,String> headers={'Content-Type':'application/json'};

    var body={
      "statusCode":response.statusCode,
      "method":method,
      "url":url,
      "payload":model !=null ? jsonEncode(model):'',
      "error":response.body,

    };
    print(jsonEncode(body));
    final http.Response res =await http.post(Uri.parse(ApiUrlList.logger),
    headers: headers,body: jsonEncode(body));

    print('500:' +res.body);
  }


 //
 // Future<dynamic> get(String url,http.Client client,token) async {
 //
 //   Map<String, String> headers ={
 //
 //     'Content-type': 'application/json; charset=UTF-8',
 //     HttpHeaders.authorizationHeader: token
 //
 //   };
 //   var responseJson;
 //   print(url);
 //   try{
 //
 //     http.Response response=await client.get(Uri.parse(url),headers: headers);
 //     print(response.body);
 //     if(response.statusCode==502)
 //       {
 //         response = await check502(url,client,token,response);
 //         responseJson = returnResponse(response,url,"GET");
 //       }else{
 //       responseJson =returnResponse(response,url,"GET");
 //     }
 //   }on SocketException{
 //     throw FetchDataException('No Internet connection');
 //   }finally {}
 //   return responseJson;
 // }
 //
 //  check502(String url, http.Client client, token, http.Response response) {
 //
 //  }


}

