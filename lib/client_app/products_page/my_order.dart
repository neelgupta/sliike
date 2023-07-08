// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/track_order.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/order_detail.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/order_detail_cancelled.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/order_detail_delivered.dart';

class my_order extends StatefulWidget {
  const   my_order({Key? key}) : super(key: key);

  @override
  State<my_order> createState() => _my_orderState();
}

class _my_orderState extends State<my_order> {
  bool current = true;
  bool delivered = false;
  bool cancelled = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/bgappbar.png"),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Vector.png"),color: Colors.black45,height: 20,width: 20,)),
                      ),
                    ),
                    SizedBox(width: width*0.20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("my_orders",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)).tr(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        current = true;
                        delivered = false;
                        cancelled = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 06),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: current?const Color(0xFFDD5103):Colors.black),
                          color: current?const Color(0xFFDD5103):Colors.white
                      ),
                      child: Text("current",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: current?Colors.white:Colors.black)).tr(),
                    ),
                  ),
                  SizedBox(width: width*0.02,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        current = false;
                        delivered = true;
                        cancelled = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 06),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: delivered?const Color(0xFFDD5103):Colors.black),
                          color: delivered?const Color(0xFFDD5103):Colors.white
                      ),
                      child: Text("delivered",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: delivered?Colors.white:Colors.black)).tr(),
                    ),
                  ),
                  SizedBox(width: width*0.02,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        current = false;
                        delivered = false;
                        cancelled = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 06),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: cancelled?const Color(0xFFDD5103):Colors.black),
                          color: cancelled?const Color(0xFFDD5103):Colors.white
                      ),
                      child: Text("cancelled",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: cancelled?Colors.white:Colors.black)).tr(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.03,),
              current? Column  (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("20 Nov, 2022",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: height*0.02,),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return const order_detail();
                            // },));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: const Image(image: AssetImage("assets/images/Rectangle 146.png"),fit: BoxFit.fill,)),
                              SizedBox(width: width*0.04,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Subaru Hair Dye",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                  const SizedBox(height: 05),
                                  const Text("\$1,000",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black54)),
                                  const SizedBox(height: 05),
                                  const Text("Vendor: Star salon",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black54)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.015,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const track_order();
                            },));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: const Color(0xffDD6A03)),),
                            child: const Text("track_order",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                    color: Color(0xffDD6A03))).tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ) :
              delivered ?
              Column  (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("20 Nov, 2022",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: height*0.02,),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return const order_detail();
                            // },));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: const Image(image: AssetImage("assets/images/Rectangle 146.png"),fit: BoxFit.fill,)),
                              SizedBox(width: width*0.04,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Subaru Hair Dye",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                  const SizedBox(height: 05),
                                  const Text("\$1,000",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black54)),
                                  const SizedBox(height: 05),
                                  const Text("Vendor: Star salon",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black54)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.015,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const track_order();
                            },));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: const Color(0xffDD6A03)),),
                            child: const Text("track_order",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                    color: Color(0xffDD6A03))).tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ):
              Column  (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("20 Nov, 2022",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: height*0.02,),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return const order_detail();
                            // },));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: const Image(image: AssetImage("assets/images/Rectangle 146.png"),fit: BoxFit.fill,)),
                              SizedBox(width: width*0.04,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Subaru Hair Dye",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                  const SizedBox(height: 05),
                                  const Text("\$1,000",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black54)),
                                  const SizedBox(height: 05),
                                  const Text("Vendor: Star salon",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "spartan",
                                          color: Colors.black54)),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.015,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const track_order();
                            },));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: const Color(0xffDD6A03)),),
                            child: const Text("track_order",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                    color: Color(0xffDD6A03))).tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
