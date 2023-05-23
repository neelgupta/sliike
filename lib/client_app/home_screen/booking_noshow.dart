// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../ beautician _page/booking_receipt.dart';

class booking_noshow extends StatefulWidget {
  const booking_noshow({Key? key}) : super(key: key);

  @override
  State<booking_noshow> createState() => _booking_noshowState();
}

class _booking_noshowState extends State<booking_noshow> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.08,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(onTap: () {
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back_sharp,size: 35,)),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: width*0.35,
                    height: height*0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red
                    ),
                    child: Text("no_show",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Colors.black)).tr(),
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("appointment_details",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "spartan",
                      color: Colors.black)).tr(),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                      height: height*0.12,
                      width: width*0.25,
                      child: Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                  SizedBox(width: width*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Freshman Cutz",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Text("Route Du 3e-rang,Collingwood,\nqc, Canada",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "spartan",
                              color: Colors.blue)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: height*0.03,),
                  Row(
                    children: const [
                      Text("20 Sep, 2022 | 9:00 - 9:30",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: height*0.03,),
                  Row(
                    children: const [
                      Text("Hair Dye",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Spacer(),
                      Text("\$45.00",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: [
                      Container(
                        height: height*0.03,
                        width: width*0.06,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: width*0.02,),
                      Text("Black",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                      Spacer(),
                      Text("for 30 min",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(height: height*0.01,),
                  Text("stylist",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(width: width*0.02,),
                  Image(image: AssetImage("assets/images/Ellipse 150.png"),height: height*0.04,width: width*0.06,),
                  SizedBox(width: width*0.02,),
                  Text("No Preference",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("preferred_place",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(width: width*0.01,),
                  Text("Beautician’s place",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return book_appoinment();
                    // },));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffDD6A03)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("assets/images/note.png"),height: height*0.03,color: Colors.white,),
                        SizedBox(width: width*0.02),
                        Text("rebook_appointment",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.white)).tr(),
                      ],
                    ),
                  )
              ),
            ),

            SizedBox(height: height*0.04,),
            Container(
              alignment: Alignment.center,
              height: height*0.06,
              color: Color(0xFFF3F3F3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("total",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "spartan",
                            color: Colors.black)).tr(),
                    Spacer(),
                    Text("\$70.00",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "spartan",
                            color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("booking_id",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(width: width*0.02,),
                  Text("#12DA481",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                ],
              ),
            ),
            SizedBox(height: height*0.05,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return booking_receipt();
                },));
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage("assets/images/message-text.png"),height: height*0.04,width: width*0.08,color: Color(0xffDD6A03),),
                      SizedBox(width: width*0.02,),
                      Text("view_receipt",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp,size: 25,color: Color(0xffDD6A03),)
                    ],
                  )
              ),
            ),
            SizedBox(height: height*0.04,),
          ],
        ),
      ),
    );
  }
}
