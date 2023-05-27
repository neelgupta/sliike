import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/bottomnavbar.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/help.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/business_setup_all_scrren/setup_profile.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/emailverification/emailverification.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/add_your_work_hours.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/forget_reset_password/resetpassword.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/second_beautyservice_or_product/service_add/categorytype_service.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/type_first_second_bussines/bussinessinfo_type.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_screen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/main.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/userdetail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../client_service_api/login_service.dart';
import '../signup/signup.dart';

// ignore: camel_case_types
class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

// ignore: camel_case_types
class _signInScreenState extends State<signInScreen> {
  SigninModel? signinmodel;
  // getScreenStatusmodel? getscreenstatusmodel;

  TextEditingController temail = TextEditingController();

  bool isCheckedl = false;
  TextEditingController tpassword = TextEditingController();
  final LoginService l = LoginService();
  SendOtpModel? sendotpmodel;
  bool emailstatus = false;
  bool rememberMe = false;
  bool? check1 = false;
  bool passwordstatus = false;
  bool isLoading = false;
  String status = "";
  bool showstatus = false;
  String email = "";
  String firebaseToken = "";
  String deviceToken = "";
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  getFirebaseToken() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission().then((value) async {
        firebaseToken = (await _firebaseMessaging.getToken())!;
      });
    } else {
      firebaseToken = (await _firebaseMessaging.getToken())!;
    }
    print(firebaseToken);
  }

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceToken = androidInfo.id;
      print('Device id is ${androidInfo.id}'); // e.g. "Moto G (4)"
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceToken = iosInfo.identifierForVendor!;
      print('Device id is ${iosInfo.identifierForVendor!}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotification();
    getFirebaseToken();
    getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.55,
              width: width,
              padding: EdgeInsets.only(top: height * 0.05),
              color: const Color(0xFFDD6A03),
              child: Image.asset("assets/images/loginscreen_image.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.35),
              padding: EdgeInsets.only(
                  top: height * 0.03, left: width * 0.05, right: width * 0.05),
              width: width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    child: const Text("welcome_back",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold))
                        .tr(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: const Text("login_to_your_account",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "spartan",
                        )).tr(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: temail,
                    onChanged: (value) {
                      emailstatus = false;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintText: "Enter your email",
                      labelText: "Enter your email",
                      labelStyle: const TextStyle(
                          fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                  emailstatus
                      ? Container(
                          alignment: Alignment.topLeft,
                          height: 30,
                          child: Text(
                            status,
                            style: const TextStyle(
                                fontFamily: 'spartan',
                                fontSize: 12,
                                color: Colors.red),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: tpassword,
                    obscuringCharacter: "*",
                    onChanged: (value) {
                      passwordstatus = false;
                    },
                    obscureText: showstatus,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintText: "Password",
                      labelText: "Password",
                      suffixIcon: showstatus
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  showstatus = !showstatus;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_outlined,
                                color: Colors.black38,
                              ))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  showstatus = !showstatus;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.black38,
                              )),
                      labelStyle: const TextStyle(
                          fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                  passwordstatus
                      ? Container(
                          alignment: Alignment.topLeft,
                          height: 30,
                          child: Text(
                            status,
                            style: const TextStyle(
                                fontFamily: 'spartan',
                                fontSize: 12,
                                color: Colors.red),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                       Checkbox(
                           value: rememberMe,
                          activeColor: Color(0xFFDD6A03),
                          onChanged:(newValue){
                            setState(() {
                              rememberMe = newValue!;
                              if(rememberMe){
                                if(Helper.prefs!.getString(UserPrefs.keyemail) != null){
                                  temail.text = Helper.prefs!.getString(UserPrefs.keyemail)!;
                                  print(Helper.prefs!.getString(UserPrefs.keyemail));
                                  print(temail.text);
                                }
                              }else{
                                temail.text = "";
                              }
                            });
                          }),
                      Container(child: Text('Remember me',style: TextStyle( fontFamily: "spartan",color: Colors.black,fontSize: 12),))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return resetPassWord(temail.text);
                            },
                          ));
                        },
                        child: const Text("forgot_password",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff2F80ED),
                                    fontFamily: "spartan",
                                    letterSpacing: 1.1,
                                    fontWeight: FontWeight.w400))
                            .tr()),
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  InkWell(
                    onTap: () {
                      email = temail.text;
                      String password = tpassword.text;
                      setState(() {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email);
                        if (email.isEmpty) {
                          emailstatus = true;
                          status = "Please Enter Email ID";
                        } else if (!emailValid) {
                          emailstatus = true;
                          status = "Please Enter Correct Email ID";
                        } else if (password.isEmpty) {
                          passwordstatus = true;
                          status = "Please Enter Password";
                        } else {
                          loginApi(email, password);
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,

                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFDD6A03)),
                      child: const Text("LOGIN",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.white))
                          .tr(),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                  Row(children: [
                    const Expanded(
                      child: Divider(
                        color: Color(0xff707070),
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: const Text("or_coutinue_with",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "spartan",
                                  letterSpacing: 1.1))
                          .tr(),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Color(0xff707070),
                        height: 50,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image(
                            image:
                                AssetImage("assets/images/facebookicon.png")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image(
                            image: AssetImage("assets/images/googleicon.png")),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image(
                            image: AssetImage("assets/images/iponeicon.png")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('an_account',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  letterSpacing: 1.1))
                          .tr(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return signUp(
                                isverify: false,
                              );
                            },
                          ));
                        },
                        child: const Text('sign_up',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "spartan",
                                    color: Color(0xFFDD6A03),
                                    letterSpacing: 1.1))
                            .tr(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.020,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> getNotification() async {
    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title// description
      importance: Importance.high,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var androiInit =
        const AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo
    var iosInit = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    flutterLocalNotificationsPlugin.initialize(initSetting);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('Flutter Notificaction message from main');
        print('Get Initial Message');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      print('Get Message');
      print(notification!.title);
      print(notification.body);
      if (notification.title != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            iOS: const DarwinNotificationDetails(),
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: '@mipmap/ic_launcher',
            ),
          ),
          payload: "${notification.title}",
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message.notification!.title);
    });
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> loginApi(String email, String password) async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodyDat = {
        'email': email,
        'password': password,
        "deviceToken": deviceToken,
        "firebaseToken": firebaseToken
      };

      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };
      var response = await http.post(
        Uri.parse(ApiUrlList.signInApiUrl),
        body: jsonEncode(bodyDat),
        headers: headers,
      );
      var map = jsonDecode(response.body.toString());
      print("login status : ${response.statusCode}");
      print("login response :: ${response.body}");
      if (response.statusCode == 200) {
        signinmodel = SigninModel.fromJson(map);
        Helper.prefs!
            .setString(UserPrefs.keyusertype, signinmodel!.success!.type!);
        Helper.prefs!
            .setString(UserPrefs.keyutoken, signinmodel!.success!.token ?? "");
        if(signinmodel!.success!.type == "user") {
          if((signinmodel!.success!.screenStatus ?? 0) == 2) {
            SendOtp(email);
          }
          else {
            Loader.hide();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return homescreen(selectedIndex: 0,);
                  },
                ),
                (route) => false,
              );
              Helper.prefs!.setBool(UserPrefs.keyuserlogin, true);
          }
        }
        else {
          if((signinmodel!.success!.screenStatus ?? 0) == 2) {
            SendOtp(email);
          }
          else if((signinmodel!.success!.screenStatus ?? 0) == 3) {
            Loader.hide();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return setup_profile();
              },
            ),);
          }
          else if((signinmodel!.success!.screenStatus ?? 0) == 4) {
            Loader.hide();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const bussinessInfoCATEGORY();
              },
            ));
          }
          else if ((signinmodel!.success!.screenStatus ?? 0) == 5) {
            Loader.hide();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return addServicetype(secondflow: true);
              },
            ));
          }
          else if ((signinmodel!.success!.screenStatus ?? 0) == 6) {
            Loader.hide();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return add_Your_Work_Hours(secondflow: true);
              },
            ),(route) => false,);
          }
          else if((signinmodel!.success!.screenStatus ?? 0) == 7) {
            Loader.hide();
            Fluttertoast.showToast(
                msg: "${map['message']}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
            Helper.prefs!.setBool(UserPrefs.keyisserviceprovide,true);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BottomNavigation();
                    },
                  ),
                  (route) => false,
                );
            Helper.prefs!.setBool(UserPrefs.keyuserlogin, true);
          }
        }
        } else {
        Loader.hide();
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  SendOtp(String vemail) async {
    try {
      var bodydatamy = {
        'email': vemail,

      };
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
      };

      var responce = await http.post(Uri.parse(ApiUrlList.sendOtp),
          body: jsonEncode(bodydatamy), headers: headers);
      print('sendOtp status : ${responce.statusCode}');
      print('sendOtp body :${responce.body}');
      var map = jsonDecode(responce.body);
      if (responce.statusCode == 200) {
        sendotpmodel = SendOtpModel.fromJson(map);
        String userid = (sendotpmodel!.id ?? "");
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return emailVeriFication(vemail, userid);
          },
        ),);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
    } finally {
      Loader.hide();
    }
  }
}



// class SigninModel{
//   int? statusCode;
//   Success? success;
//   String? message;
//   SigninModel(this.statusCode, this.success, this.message);
//   factory SigninModel.fromjson(Map<dynamic, dynamic> map) {
//     Map map1 = map['data'] ?? {};
//     Data data = Data.fromjson(map1);
//     return SigninModel(map['status'], data, map['message']);
//   }
// }

class SigninModel {
  int? statusCode;
  Success? success;
  String? message;

  SigninModel({this.statusCode, this.success, this.message});

  SigninModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    success =
        json['success'] != null ? Success.fromJson(json['success']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    if (success != null) {
      data['success'] = success!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Success {
  String? type;
  String? token;
  int? screenStatus;

  Success({this.type, this.token, this.screenStatus});

  Success.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    token = json['token'];
    screenStatus = json['screenStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['token'] = token;
    data['screenStatus'] = screenStatus;
    return data;
  }
}

logoutdata() async {
  Helper.prefs!.setBool(UserPrefs.keyuserlogin, false);
  Helper.prefs!.setString(UserPrefs.keyusertype, "");
  Helper.prefs!.setString(UserPrefs.keyutoken, "");
}
