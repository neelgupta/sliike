// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class booking_receipt extends StatefulWidget {
  const booking_receipt({Key? key}) : super(key: key);

  @override
  State<booking_receipt> createState() => _booking_receiptState();
}

class _booking_receiptState extends State<booking_receipt> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.08,),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Image(image: AssetImage("assets/images/Vector.png"),height: 18,width: 18,)),
                  SizedBox(width: width*0.30,),
                  const Text("receipt",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                ],
              ),
              SizedBox(height: height*0.04,),
              Image(image: const AssetImage("assets/images/Group 13210.png"),height: height*0.22,width: width,fit: BoxFit.fill,),
              SizedBox(height: height*0.03,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("total",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  const Spacer(),
                  const Text("\$70.00",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("subtotal",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  const Spacer(),
                  const Text("\$60.00",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("discount",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  const Spacer(),
                  const Text("\$0.00",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("gst/hst",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  const Spacer(),
                  const Text("\$5.00",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("qst/pst",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  const Spacer(),
                  const Text("\$5.00",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.02,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("total",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  const Spacer(),
                  const Text("\$70.00",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.02,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("total_charged",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  const Spacer(),
                  const Text("\$70.00",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  Image(image: const AssetImage("assets/images/Frame 427320901.png"),height: height*0.05,width: width*0.15,fit: BoxFit.fill,),
                  SizedBox(width: width*0.03,),
                  const Text("Credit card",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.08,),
              const Text("service_details",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "spartan",
                      color: Colors.black)).tr(),
              const Text("Tuesday, 20 Sep 2022 | 9:00 - 9:30",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                      color: Colors.black54)),
              SizedBox(height: height*0.04,),
              Row(
                children: [
                  SizedBox(
                      height: height*0.12,
                      width: width*0.25,
                      child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                  SizedBox(width: width*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Freshman Cutz",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                          SizedBox(width: width*0.12,),
                        ],
                      ),
                      const Text("Route Du 3e-rang,Collingwood,\nqc, Canada",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(color: Colors.black54,),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: height*0.04,),
              const Text("Service 1:",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54)),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Hair dye",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black)),
                  Spacer(),
                  Text("30mins",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.02,),
              const Text("Service 2:",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black54)),
              SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Men’s cut",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black)),
                  Spacer(),
                  Text("30mins",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  Image(image: const AssetImage("assets/images/Rectangle 1007.png"),height: height*0.08,width: width*0.18,fit: BoxFit.fill,),
                  SizedBox(width: width*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("stylist",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black54)).tr(),
                      SizedBox(height: height*0.01,),
                      const Text("Rita Chase",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  )
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.03,),
              const Text("download_pdf",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Color(0xffDD6A03))).tr(),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.03,),
              Row(
                children: [
                  const Text("contact_support",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Color(0xffDD6A03))).tr(),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_sharp,color: Color(0xffDD6A03),),
                  SizedBox(height: height*0.05,)
                ],
              ),
              SizedBox(height: height*0.04,)
            ],
          ),
        ),
      ),
    );
  }
}
