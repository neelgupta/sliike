// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/my_order.dart';

class payment_reciev extends StatefulWidget {
  const payment_reciev({Key? key}) : super(key: key);

  @override
  State<payment_reciev> createState() => _payment_recievState();
}

class _payment_recievState extends State<payment_reciev> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/Frame 427321205.png",),fit: BoxFit.fill)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height*0.12,
                    // width: tw*0.2,
                    child: const Image(image: AssetImage("assets/images/Group 13116.png")),
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              const Text("payment_recieved",style: TextStyle(fontSize: 20,fontFamily: "spartan",color: Colors.black),).tr(),
              const Text("your_order",style: TextStyle(fontSize: 12,fontFamily: "spartan",color: Colors.black54),).tr(),
              const Text("check",style: TextStyle(fontSize: 12,fontFamily: "spartan",color: Colors.black54),).tr(),
              SizedBox(height: height*0.30,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const my_order();
                  },));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffDD6A03)),
                  child: const Text("view_order",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)).tr(),
                ),
              ),
              SizedBox(height: height*0.02,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/back.png"),color: Color(0xffDD6A03),)),
                      ),
                    ),
                    SizedBox(width: width*0.02,),
                    const Text("back_to_home",
                        style: TextStyle(
                            fontSize: 16  ,
                            fontFamily: "spartan",
                            color: Color(0xffDD6A03))).tr(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
