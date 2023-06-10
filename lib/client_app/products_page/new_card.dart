// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class new_card extends StatefulWidget {
  const new_card({Key? key}) : super(key: key);

  @override
  State<new_card> createState() => _new_cardState();
}

class _new_cardState extends State<new_card> {
  bool save = false;
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: const Image(image: AssetImage("assets/images/Vector.png"),height: 20,width: 20,)),
              ),
              SizedBox(height: height*0.04,),
              const Text("add_new_card",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)).tr(),
              SizedBox(height: height*0.04,),
              TextField(
                style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "card_name".tr(),
                ),
              ),
              SizedBox(height: height*0.03,),
              TextField(
                style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "card_number".tr(),
                ),
              ),
              SizedBox(height: height*0.03,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("expire_date",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan",)).tr(),
                      SizedBox(height: height*0.02,),
                      SizedBox(
                        width: width*0.43,
                        child: const TextField(
                          style: TextStyle(fontFamily: "spartan",fontSize: 12),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "MM/YY",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("cvv",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "spartan",)).tr(),
                      SizedBox(height: height*0.02,),
                      SizedBox(
                        width: width*0.43,
                        child: TextField(
                          style: TextStyle(fontFamily: "spartan",fontSize: 12),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "cvv".tr(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*0.03,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: height*0.05,
                            width: width*0.05,
                            child: Checkbox(
                              activeColor: const Color(0xFFDD6A03),
                              value: save,
                              onChanged: (bool? value) {
                                setState(() {
                                  save = value!;
                                });
                              },),
                          ),
                          SizedBox(width: width*0.04,),
                          const Text("save_cradit",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: "spartan",)).tr(),
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      Row(
                        children: [
                          SizedBox(width: width*0.09),
                          const Text("save_info",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontFamily: "spartan",)).tr(),
                        ],
                      )
                  ],),
                ],
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  const Image(image: AssetImage("assets/images/lock.png"),height: 25,width: 25,color: Color(0xFFDD6A03),),
                  SizedBox(width: width*0.04,),
                  const Text("secure",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "spartan",)).tr()
                ],
              ),
              SizedBox(height: height*0.20,),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(alignment: Alignment.center,
                      height: height*0.07,
                      width: width*0.43,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: const Text("cancel",style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return appointments();
                      // },));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height*0.07,
                      width: width*0.43,
                      decoration: BoxDecoration(border: Border.all(color: const Color(0xffDD6A03) ),color:const Color(0xffDD6A03) ,borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: const Text("save",style: TextStyle(color: Colors.white,fontSize: 14,
                        fontFamily: "spartan",),).tr(),),
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
