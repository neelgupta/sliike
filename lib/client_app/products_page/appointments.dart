// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/new_card.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/review_order.dart';

class appointments extends StatefulWidget {
  const appointments({Key? key}) : super(key: key);

  @override
  State<appointments> createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  bool card = false;
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
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("payment_info",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.01,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: height*0.05,
              alignment: Alignment.center,
              color: const Color(0xFFF3F3F3),
              child: Row(
                children: [
                  const Text("shipping_info",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "spartan")).tr(),
                  const Spacer(),
                  Image(image: const AssetImage("assets/images/Group 13106.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,color: const Color(0xffDD6A03),),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 500.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,color: const Color(0xffDD6A03),),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 501.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 13111.png"),height: height*0.03,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: height*0.04,),
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
                            labelText: "expiration_date".tr(),
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
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                  SizedBox(height: height*0.04,),
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
                          child: const Text("back",style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.black)).tr(),),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const review_order();
                          },));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height*0.07,
                          width: width*0.43,
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xffDD6A03) ),color:const Color(0xffDD6A03) ,borderRadius: const BorderRadius.all(Radius.circular(5))),
                          child: const Text("review",style: TextStyle(color: Colors.white,fontSize: 14,
                            fontFamily: "spartan",),).tr(),),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.04,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
