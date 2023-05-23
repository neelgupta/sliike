// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../products_page/new_card.dart';

class payments extends StatefulWidget {
  const payments({Key? key}) : super(key: key);

  @override
  State<payments> createState() => _paymentsState();
}

class _paymentsState extends State<payments> {
  bool card = false;
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
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.22,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("payments",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)).tr(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.04,),
              const Text("payments_info",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "spartan"
                  )
              ).tr(),
              SizedBox(height: height*0.02,),
              Image(image: const AssetImage("assets/images/Frame 427320901.png"),height: height*0.24,width: width,fit: BoxFit.fill,),
              SizedBox(height: height*0.02,),
              TextField(
                style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "card_name".tr(),
                ),
              ),
              SizedBox(height: height*0.02,),
              TextField(
                style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "card_number".tr(),
                ),
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  SizedBox(
                    width: width*0.42,
                    child: TextField(
                      style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "expire_date".tr(),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width*0.42,
                    child: TextField(
                      style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "cvv".tr(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.01,),
              Row(
                children: [
                  SizedBox(
                    height: height*0.05,
                    width: width*0.05,
                    child: Checkbox(
                      activeColor: const Color(0xFFDD6A03),
                      value: card,
                      onChanged: (bool? value) {
                      setState(() {
                        card = value!;
                      });
                    },),
                  ),
                  SizedBox(width: width*0.04,),
                  const Text("use_this_card",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.02,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const new_card();
                  },));
                },
                child: Row(
                  children: [
                    Image(image: const AssetImage("assets/images/Group 12095.png"),height: height*0.04,width: width*0.06,),
                    SizedBox(width: width*0.02,),
                    const Text("add_new_card",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Color(0xffDD6A03))).tr(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
