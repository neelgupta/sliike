import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/services/business_setup_services.dart';

class cancellation_Policy extends StatefulWidget {
  const cancellation_Policy({Key? key}) : super(key: key);

  @override
  State<cancellation_Policy> createState() => cancellation_PolicyState();
}

class cancellation_PolicyState extends State<cancellation_Policy> {
  int cancellationStatus=1;
  bool isLoad = true;
  BusinessSetupService businessSetupService = BusinessSetupService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStatus();
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
                  child: Row(

                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Image(
                                  image:
                                  AssetImage("assets/images/Group 55.png"),

                                )),
                          ),
                        ),
                      ),
                      SizedBox(width: width*0.12,),
                      Container(
                        child: Text("Cancellation Policy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoad?Center(
        child: CircularProgressIndicator(),
      ):SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(height: height*0.01,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textComoonfade("Protect your business by setting rules against last minute appointment cancellation.",12,Color(0xff414141), FontWeight.w500),
                  ],
                ),
              ),
              SizedBox(height: height*0.015,),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: 12,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textComoon("Set-Up Cancellation policy",14,Color(0xff111111), FontWeight.w700),
                          SizedBox(height: height*0.01,),
                          textComoonfade("Choose when appointments can be cancelled by clients.",12,Color(0xff414141), FontWeight.w500),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: 12,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(//mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Radio(
                          value: 1,
                          groupValue: cancellationStatus,

                          activeColor: Color(0xff01635D),
                          fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xff01635D)),
                          onChanged: (value) {
                            setState(() {
                              cancellationStatus = value as int;
                              print(cancellationStatus);

                            });
                          },
                        ),
                        textComoon("Free",14,Color(0xff111111), FontWeight.w700),
                      ],
                    ),
                    // SizedBox(height: height*0.01,),
                    textComoonfade("Cancellation allowed at any time. Full refund. ",12,Color(0xff414141), FontWeight.w500),
                  ],
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: 12,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(//mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Radio(
                          value: 2,
                          groupValue: cancellationStatus,

                          activeColor: Color(0xff01635D),
                          fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xff01635D)),
                          onChanged: (value) {
                            setState(() {
                              cancellationStatus = value as int;
                              print(cancellationStatus);

                            });
                          },
                        ),
                        textComoon("Flexible",14,Color(0xff111111), FontWeight.w700),
                      ],
                    ),
                    // SizedBox(height: height*0.01,),
                    textComoonfade("Cancellation allowed between 7 to 24 hours before the appointment. Full refund. ",12,Color(0xff414141), FontWeight.w500),
                  ],
                ),
              ),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: 12,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(//mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Radio(
                          value: 3,
                          groupValue: cancellationStatus,

                          activeColor: Color(0xff01635D),
                          fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xff01635D)),
                          onChanged: (value) {
                            setState(() {
                              cancellationStatus = value as int;
                              print(cancellationStatus);

                            });
                          },
                        ),
                        textComoon("Strict",14,Color(0xff111111), FontWeight.w700),
                      ],
                    ),
                    // SizedBox(height: height*0.01,),
                    textComoonfade("50% charge on cancellation between 24 and 10 hours before the appointment. 50% refund. ",12,Color(0xff414141), FontWeight.w500),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: width,
                padding: EdgeInsets.symmetric(vertical: 12,),
                decoration: BoxDecoration(

                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Radio(
                          value: 4,
                          groupValue: cancellationStatus,

                          activeColor: Color(0xff01635D),
                          fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0xff01635D)),
                          onChanged: (value) {
                            setState(() {
                              cancellationStatus = value as int;
                              print(cancellationStatus);

                            });
                          },
                        ),
                        textComoon("Very Strict",14,Color(0xff111111), FontWeight.w700),
                      ],
                    ),

                    textComoonfade("Full charge on cancellation less than 10 hours before the appointment. No refund. ",12,Color(0xff414141), FontWeight.w500),
                  ],
                ),
              ),
              SizedBox(height: height*0.03,),
              CommonButton(context,"SAVE",12, FontWeight.w600, Colors.white, () {
                saveStatus();
              }),
              SizedBox(height: height*0.03,),
            ],
          ),
        ),
      ),
    );
  }

  getStatus() async {
    Response response = await businessSetupService.getCancellationProtectionStatus();
    if(response.statusCode==200) {
      cancellationStatus = jsonDecode(response.body)['data']['cancelProtection'] ?? 1;
    } else {
      cancellationStatus = 1;
    }
    isLoad = false;
    setState(() {});
  }

  saveStatus() async {
    Loader.show(context,
        isSafeAreaOverlay: false,
        overlayColor: Colors.black26,
        progressIndicator: const CircularProgressIndicator(
            backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff01635D))));
    Response response = await businessSetupService.updateCancellationProtectionStatus(cancellationStatus, isCancellation: true);
    Fluttertoast.showToast(
        msg: "${jsonDecode(response.body)['message']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    Loader.hide();
  }
}
