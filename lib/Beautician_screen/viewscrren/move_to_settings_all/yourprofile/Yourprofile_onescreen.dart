// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import '../../../custom_widget/checkbox.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class yourProfile_One extends StatefulWidget {
  const yourProfile_One({Key? key}) : super(key: key);

  @override
  State<yourProfile_One> createState() => _yourProfile_OneState();
}

class _yourProfile_OneState extends State<yourProfile_One> {
  String _selected = '';
  String IsServeAtClient = '';
  String IsServeAtOwnPlace = '';
  bool Salon = false;
  bool Independent = false;
  bool atMySalon = false;
  bool clientsLocation = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.18, //
        flexibleSpace: Container(
          color: const Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/backwhite.png"),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Your Profile?",
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 60,
                        ),
                        Expanded(
                          child: Text(
                              "Are you an Independent Beautician or a Salon\nOwner?",
                              style: TextStyle(
                                  fontSize: 10,
                                  // you can change it accordingly
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoading ?
          Center(child: CircularProgressIndicator(color: Color(0xff01635D)),):
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 60,),
            InkWell(
              onTap: () {
                if(_selected == "1"){
                  Salon = !Salon;
                  atMySalon = true;
                  IsServeAtOwnPlace = "1";
                  setState(() {});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffCFCFCF),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              activeColor: const Color(0xff01635D),
                              groupValue: _selected,
                              onChanged: (value) {
                                setState(() {
                                  print(value);
                                  _selected = value as String;
                                });
                              }),
                          const Text(
                            "I own a salon",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'spartan',
                                color: Color(0xff414141)),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Salon = !Salon;
                              setState(() {});
                            },
                            child: Salon
                                ? const Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 30,
                                    color: Color(0xff707070),
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: Color(0xff707070),
                                  ),
                          )
                        ],
                      ),
                      Salon
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 05,
                                  ),
                                  const Divider(
                                    thickness: 02,
                                  ),
                                  const SizedBox(
                                    height: 05,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'How do you work :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontFamily: "spartan"),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: ' client\'s come to your ',
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: Colors.black54,
                                                fontFamily: "spartan")),
                                        // TextSpan(text: ' world!'),
                                      ],
                                    ),
                                  ),
                                  Text(
                                      "salon. Do you go to client\'s's location?",
                                      style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Colors.black54,
                                          fontFamily: "spartan")),
                                  const SizedBox(height: 25),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 05),
                                        child: Custom_Checkbox(
                                          isChecked: atMySalon,
                                          onChange: (value){

                                          },
                                          backgroundColor: Color(0xff01635D),
                                          borderColor: Color(0xff01635D),
                                          icon: Icons.check,
                                          iconColor: Colors.white,
                                          size: 22,
                                          iconSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("At my salon",
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17,
                                                    color: Colors.black54,
                                                    fontFamily: "spartan")),
                                            Text(
                                              "Clients come to me. I work in a salon/beauty"
                                              " shop alongside other beauticians",
                                              maxLines: null,
                                              style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,

                                                color: Colors.black54,
                                                fontFamily: "spartan",
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 05),
                                        child: Custom_Checkbox(
                                          isChecked: clientsLocation,
                                          onChange: (value) {
                                            setState(() {
                                              clientsLocation = value;
                                              if(value == true){
                                                IsServeAtClient = "1";
                                              }else{
                                                IsServeAtClient = "0";
                                              }
                                              print(IsServeAtClient);
                                            });
                                          },
                                          backgroundColor: Color(0xff01635D),
                                          borderColor: Color(0xff01635D),
                                          icon: Icons.check,
                                          iconColor: Colors.white,
                                          size: 22,
                                          iconSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Yes, I go to client's location",
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17,
                                                    color: clientsLocation? Colors.black54 : Colors.black,
                                                    fontFamily: "spartan")),
                                            Text(
                                              "I go to client's location to perform my services",
                                              maxLines: null,
                                              style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,

                                                color: Colors.black54,
                                                fontFamily: "spartan",
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if(_selected == "0"){
                  Independent = !Independent;
                  atMySalon = true;
                  IsServeAtClient = "1";
                  setState(() {});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xffCFCFCF),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: "0",
                              activeColor: const Color(0xff01635D),
                              groupValue: _selected,
                              onChanged: (value) {
                                setState(() {
                                  _selected = value as String;
                                });
                              }),
                          const Text(
                            "I am independent",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'spartan',
                                color: Color(0xff414141)),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Independent = !Independent;
                              setState(() {});
                            },
                            child: Independent
                                ? const Icon(
                              Icons.keyboard_arrow_up,
                              size: 30,
                              color: Color(0xff707070),
                            )
                                : const Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: Color(0xff707070),
                            ),
                          )
                        ],
                      ),
                      Independent
                          ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 05,
                            ),
                            const Divider(
                              thickness: 02,
                            ),
                            const SizedBox(
                              height: 05,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'How do you work :',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: "spartan"),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: ' you go to client\'s',
                                      style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontFamily: "spartan")),
                                  // TextSpan(text: ' world!'),
                                ],
                              ),
                            ),
                            Text(
                                "location. Do client\'s also come to your place?",
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontFamily: "spartan")),
                            const SizedBox(height: 25),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 05),
                                  child: Custom_Checkbox(
                                    isChecked: atMySalon,
                                    onChange: (value) {
                                      setState(() {
                                        // atMySalon = value;
                                      });
                                    },
                                    backgroundColor: Color(0xff01635D),
                                    borderColor: Color(0xff01635D),
                                    icon: Icons.check,
                                    iconColor: Colors.white,
                                    size: 22,
                                    iconSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("At client\'s location",
                                          style: TextStyle(
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black54,
                                              fontFamily: "spartan")),
                                      Text(
                                        "I go to the client’s location to perform my services",
                                        maxLines: null,
                                        style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,

                                          color: Colors.black54,
                                          fontFamily: "spartan",
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 05),
                                  child: Custom_Checkbox(
                                    isChecked: clientsLocation,
                                    onChange: (value) {
                                      setState(() {
                                        clientsLocation = value;
                                         if(value == true){
                                           IsServeAtOwnPlace = "1";
                                         }else{
                                           IsServeAtOwnPlace = "0";
                                         }
                                         print(IsServeAtOwnPlace);
                                      });
                                    },
                                    backgroundColor: Color(0xff01635D),
                                    borderColor: Color(0xff01635D),
                                    icon: Icons.check,
                                    iconColor: Colors.white,
                                    size: 22,
                                    iconSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Yes, Clients come to my place",
                                          style: TextStyle(
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: clientsLocation? Colors.black54 : Colors.black,
                                              fontFamily: "spartan")),
                                      Text(
                                        "Clients come to me. I work in a salon/beauty shop alongside other beauticians",
                                        maxLines: null,
                                        style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,

                                          color: Colors.black54,
                                          fontFamily: "spartan",
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                addBeauticianServiceMethod();

              },
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff01635D)),
                child: const Text("SAVE",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  addBeauticianServiceMethod() async {
    var getUri = Uri.parse(ApiUrlList.addBeauticianServiceMethod);
    try {
      setState(() {
        isLoading = true;
      });
      var Headers = {
        'Content-Type': "application/json",
        "Authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var Body = {
        "hasShop":int.parse(_selected),
        "IsServeAtClient":int.parse(IsServeAtClient),
        "IsServeAtOwnPlace":int.parse(IsServeAtOwnPlace),
      };
      // var Body = {
      //   "hasShop": 0,
      //   "IsServeAtClient":1,
      //   "IsServeAtOwnPlace": 1,
      // };
      // log("addBeauticianServiceMethod PayLoad ====> $Headers");
      log("addBeauticianServiceMethod PayLoad ====> $Body");
      var response = await http.post(
        getUri,
        body: jsonEncode(Body),
        headers: Headers,
      );
      log("addBeauticianServiceMethod Code ====> ${response.statusCode}");
      log("addBeauticianServiceMethod Body ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: map['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pop(context);
        }else{
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(
              msg: map['message'],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pop(context);
        }
      }
    } catch (e) {
      rethrow;
    } finally {
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

}
