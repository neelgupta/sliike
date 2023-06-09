// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/cancel_appoinment.dart';

class manage_appoinment extends StatefulWidget {
  const manage_appoinment({Key? key}) : super(key: key);

  @override
  State<manage_appoinment> createState() => _manage_appoinmentState();
}

class _manage_appoinmentState extends State<manage_appoinment> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height*0.08,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: const Image(image: AssetImage("assets/images/Vector.png"),height: 20,width: 25,)),
                SizedBox(width: width*0.15,),
                const Text("Manage Appointment",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "spartan",
                        color: Colors.black)),

              ],
            ),
          ),
          SizedBox(height: height*0.04,),
          Container(
            width: width,
            height: height*0.15,
            color: const Color(0xFFF3F3F3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                      height: height*0.12,
                      width: width*0.25,
                      child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
                  SizedBox(width: width*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Tuesday, 20 Sep 2022 | 9:00 - 9:30",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                      Text("Freshman Cutz",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black)),
                      Text("Hair Dye",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "spartan",
                              color: Colors.black54)),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: height*0.04,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return book_appoinment();
                // },));
              },
              child: Row(
                children: [
                  Image(image: const AssetImage("assets/images/rotate-left.png"),fit: BoxFit.fill,height: height*0.05,width: width*0.10,),
                  SizedBox(width: width*0.03,),
                  const Text("Change Appointment",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_sharp,size: 20,)
                ],
              ),
            ),
          ),
          SizedBox(height: height*0.03,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const cancel_appoinment();
                },));
              },
              child: Row(
                children: [
                  Image(image: const AssetImage("assets/images/close-circle.png"),fit: BoxFit.fill,height: height*0.05,width: width*0.10,),
                  SizedBox(width: width*0.03,),
                  const Text("Cancel Appointment",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_sharp,size: 20,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
