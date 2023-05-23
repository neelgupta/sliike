// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class cancel_appoinment extends StatefulWidget {
  const cancel_appoinment({Key? key}) : super(key: key);

  @override
  State<cancel_appoinment> createState() => _cancel_appoinmentState();
}

class _cancel_appoinmentState extends State<cancel_appoinment> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start  ,
        children: [
          SizedBox(height: height*0.08,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
                child: const Image(image: AssetImage("assets/images/Vector.png"),height: 20,width: 25,)),
          ),
          SizedBox(height: height*0.02,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Are you sure you want to cancel\nappointment?",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "spartan",
                    color: Colors.black)),
          ),
          SizedBox(height: height*0.02,),
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
          SizedBox(height: height*0.05,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("If you want to reschedule this appointment,",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.black)),
                Row(
                  children: [
                    const Text("you can",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black)),
                    SizedBox(width: width*0.01,),
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return book_appoinment();
                        // },));
                      },
                      child: const Text("change",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.blue)),
                    ),
                    SizedBox(width: width*0.01,),
                    const Text("your appointment",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(alignment: Alignment.center,
                    height: height*0.07,
                    width: width*0.45,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: const BorderRadius.all(Radius.circular(5))),
                    child: const Text("CLOSE",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.black)),),
                ),
                const Spacer(),
                Container(alignment: Alignment.center,
                  height: height*0.07,
                  width: width*0.45,
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD90000) ),color:const Color(0xFFD90000) ,borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: const Text("YES, CANCEL",style: TextStyle(color: Colors.white,fontSize: 14,
                    fontFamily: "spartan",),),),
              ],
            ),
          ),
          SizedBox(height: height*0.03,)
        ],
      ),
    );
  }
}
