// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class cancel_order extends StatefulWidget {
  const cancel_order({Key? key}) : super(key: key);

  @override
  State<cancel_order> createState() => _cancel_orderState();
}

class _cancel_orderState extends State<cancel_order> {
  bool wrong =  false;
  bool mind = false;
  bool vendor = false;
  bool added = false;
  bool product = false;
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
              SizedBox(height: height*0.08,),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Image(
                    image: AssetImage("assets/images/Vector.png"),height: 20,width: 25,
                  )
              ),
              SizedBox(height: height*0.04,),
              const Text("Tell us your reason for cancelling your order",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "spartan",
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(height: height*0.04,),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFFDD6A03),
                    value: wrong,
                    onChanged: (bool? value) {
                      setState(() {
                        wrong = value!;
                      });
                  },),
                  const Text("I ordered the wrong product",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black,
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFFDD6A03),
                    value: mind,
                    onChanged: (bool? value) {
                      setState(() {
                        mind = value!;
                      });
                  },),
                  const Text("I changed my mind",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFFDD6A03),
                    value: vendor,
                    onChanged: (bool? value) {
                      setState(() {
                        vendor = value!;
                      });
                  },),
                  const Text("The vendor delayed my order",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFFDD6A03),
                    value: added,
                    onChanged: (bool? value) {
                      setState(() {
                        added = value!;
                      });
                  },),
                  const Text("I added the wrong delivery address",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                      )
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFFDD6A03),
                    value: product,
                    onChanged: (value) {
                      setState(() {
                        product = value!;
                      });
                  },),
                  const Text("I am allergic to this product",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                      )
                  ),
                ],
              ),
              SizedBox(height: height*0.04,),
              const TextField(
                style: TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Describe your issue"
                ),
              ),
              SizedBox(height: height*0.06,),
              Container(
                height: height*0.08,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Note: All order cancel can only be accepted 24 hours before delivery.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "spartan",
                          color: Colors.blue,
                      )
                  ),
                ),
              ),
              SizedBox(height: height*0.06,),
              Row(
                children: [
                  Container(alignment: Alignment.center,
                    height: height*0.07,
                    width: width*0.45,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: const BorderRadius.all(Radius.circular(5))),
                    child: const Text("ABANDON ACTION",style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.black)),),
                  const Spacer(),
                  Container(alignment: Alignment.center,
                    height: height*0.07,
                    width: width*0.45,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFDD6A03)
                        ),color:const Color(0xFFDD6A03  ) ,
                        borderRadius: const BorderRadius.all(Radius.circular(5)
                        )
                    ),
                    child: const Text("CONTINUE",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white,
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.08,),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: height*0.07,
                    width: width*0.45,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDD6A03)),
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: const AssetImage("assets/images/message-text.png"),height: height*0.05,width: width*0.05,color: const Color(0xFFDD6A03),),
                        SizedBox(width: width*0.02,),
                        const Text("Live chat",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Color(0xFFDD6A03))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(alignment: Alignment.center,
                    height: height*0.07,
                    width: width*0.45,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFDD6A03)),
                        borderRadius: const BorderRadius.all(Radius.circular(5)
                        )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: const AssetImage("assets/images/call.png"),height: height*0.03,color: const Color(0xFFDD6A03),),
                        SizedBox(width: width*0.02,),
                        const Text("Call Us",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "spartan",
                                color: Color(0xFFDD6A03))),
                      ],
                    ),
                  ),
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
