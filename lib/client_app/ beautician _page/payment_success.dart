// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/booking_summary_paymentconfirm.dart';

class payment_success extends StatefulWidget {
  const payment_success({Key? key}) : super(key: key);

  @override
  State<payment_success> createState() => _payment_successState();
}

class _payment_successState extends State<payment_success> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //   return const booking_summary_paymentconfirm();
      // },));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Center(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/Frame 427321205.png",),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height*0.18,
                    // width: tw*0.2,
                    child: const Image(image: AssetImage("assets/images/Group 12611.png")),
                  ),
                ],
              ),
              const Text("booked",style: TextStyle(fontSize: 20,fontFamily: "spartan",color: Colors.black),).tr()
            ],
          ),
        ),
      ),
    );
  }
}
