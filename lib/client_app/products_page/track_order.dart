// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class track_order extends StatefulWidget {
  const track_order({Key? key}) : super(key: key);

  @override
  State<track_order> createState() => _track_orderState();
}

class _track_orderState extends State<track_order> {
  int stapper = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.08),
              Row(
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
                          child: const Image(image: AssetImage("assets/images/back.png"),color: Colors.black,)),
                    ),
                  ),
                  SizedBox(width: width*0.10),
                  const Text("track_order",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                ],
              ),
              SizedBox(height: height*0.04,),
              const Text("20 Nov, 2022",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "spartan",
                      color: Colors.black)),
              SizedBox(height: height*0.005,),
              const Text("Order ID: 5t33-76ky",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "spartan",
                      color: Colors.black,fontWeight: FontWeight.w500)),
              SizedBox(height: height*0.03,),
              const Text("ETA: 12hrs 30mins",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                      color: Colors.black,fontWeight: FontWeight.bold)),
              Theme(
                data: ThemeData(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: const Color(0xFF219653),
                  )
                ),
                child: Stepper(
                  controlsBuilder: (context, details) {
                    return Row(
                      children: <Widget>[
                        Container(),
                        Container(),
                      ],
                    );
                  },
                    currentStep: stapper,
                    steps: [
                      Step(
                          state: StepState.complete,
                        isActive: stapper >= 0,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Order delivered",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "spartan",
                                      color: Colors.black)),
                              Text("Order delivered successfully",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "spartan",
                                      color: Colors.black54)),
                            ],
                          ),
                          content: const Text("")
                      ),
                      Step(
                          state: StepState.complete,
                        isActive: stapper >= 1,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text("Order is on the way",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "spartan",
                                        color: Colors.black)),
                                Spacer(),
                                Text("07:10 - 21 Nov, 2022",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "spartan",
                                        color: Colors.black)),
                              ],
                            ),
                            const Text("Your order has been processed",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                    color: Colors.black54)),
                          ],
                        ),
                        content: const Text("")
                      ),
                      Step(
                        isActive: stapper >= 2,
                          state: StepState.complete,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text("Order is on the way",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                  Spacer(),
                                  Text("15:24 - 20 Nov, 2022",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                ],
                              ),
                              const Text("Your order has been processed",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                      color: Colors.black54)),
                            ],
                          ),
                          content: const Text("")
                      ),
                      Step(
                        isActive: stapper >= 3,
                          state: StepState.complete,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text("Order accepted",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                  Spacer(),
                                  Text("12:05 - 20 Nov, 2022",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "spartan",
                                          color: Colors.black)),
                                ],
                              ),
                              const Text("We have recieved your order",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                      color: Colors.black54)),
                            ],
                          ),
                          content: const Text("")
                      ),
                    ],
                  onStepTapped: (int newIndex) {
                    setState(() {
                      stapper = newIndex;
                    });
                  },

                ),
              ),
              SizedBox(height: height*0.04,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: width*0.40,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffDD6A03)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: const AssetImage("assets/images/Vector 1.png"),height: height*0.02,),
                        SizedBox(width: width*0.03,),
                        const Text("call_rider",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "spartan",
                                color: Colors.white)).tr(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.04,),
              Container(
                width: width,
                height: height*0.25,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Image(image: const AssetImage("assets/images/home-2.png"),height: height*0.025,),
                          SizedBox(width: width*0.03,),
                          const Text("Delivery Address",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                          SizedBox(width: width*0.02,),
                          const Text("(Home)",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black54)),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      const Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: Text("Ester Britney\n825 Dawson Island\nApt 30\nToronto, DE 63324\nCanada",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.black54)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.04,)
            ],
          ),
        ),
      ),
    );
  }
}
