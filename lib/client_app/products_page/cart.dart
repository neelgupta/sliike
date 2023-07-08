// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/shopping_info.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int black = 0;
  int gold = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.12, // Set this height
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
                    InkWell(
                      onTap: (){
                         Navigator.pop(context);
                      },
                      child: Image.asset(height:height*0.025 ,"assets/images/back.png",color: Colors.black,),
                    ),
                    const Spacer(),
                    const Text("cart",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "spartan",
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        )
                    ).tr(),
                    const Spacer(),
                    Image.asset("assets/images/cart.png",height: height*0.06,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            SizedBox(height: height*0.01,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: height*0.05,
              alignment: Alignment.center,
              color: const Color(0xFFF3F3F3),
              child: Row(
                children: [
                  const Text("cart_summary",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "spartan")).tr(),
                  const Spacer(),
                  Image(image: const AssetImage("assets/images/Group 13106.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 13110.png"),height: height*0.03,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 13112.png"),height: height*0.03,),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.04,),
                  Row(
                    children: [
                      SizedBox(
                          height: 102,
                          width: 102,
                          child: const Image(image: AssetImage("assets/images/Rectangle 146.png"),fit: BoxFit.fill,)),
                      SizedBox(width: width*0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text("Subaru Hair Dye Blonde/Wine\nRed/Gold/Black 1 PCS",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black,fontWeight: FontWeight.w600)),
                          const SizedBox(height: 05,),
                          Text("\$999",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "spartan",
                                  color: Colors.black87)),
                          const SizedBox(height: 05,),
                          Text("Seller: Star salon",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "spartan",
                                  color: Colors.black54)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: height*0.04,),
                  const Text("black",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(black < 1){
                            return;
                          }
                          setState(() {
                            black--;
                          });
                        },
                        child: SizedBox(
                          height: height*0.10,
                          width: width*0.10,
                          child: Image.asset("assets/images/add.png"),
                        ),
                      ),
                      SizedBox(width: width*0.10,),
                      SizedBox(
                        width: width*0.06,
                        child: Text("$black",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "spartan",)),
                      ),
                      SizedBox(width: width*0.07,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            black++;
                          });
                        },
                        child: SizedBox(
                          height: height*0.10,
                          width: width*0.10,
                          child: Image.asset("assets/images/add 1.png"),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: height*0.08,
                        width: width*0.08,
                        child: Image.asset("assets/images/trash.png"),
                      ),
                      SizedBox(width: width*0.02,),
                      const Text("remove",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFF3232),
                            fontFamily: "spartan",)).tr(),

                    ],
                  ),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.02,),
                  const Text("gold",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(gold < 1){
                            return;
                          }
                          setState(() {
                            gold--;
                          });
                        },
                        child: SizedBox(
                          height: height*0.10,
                          width: width*0.10,
                          child: Image.asset("assets/images/add.png"),
                        ),
                      ),
                      SizedBox(width: width*0.10,),
                      SizedBox(
                        width: width*0.06,
                        child: Text("$gold",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "spartan",)),
                      ),
                      SizedBox(width: width*0.07,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gold++;
                          });
                        },
                        child: SizedBox(
                          height: height*0.10,
                          width: width*0.10,
                          child: Image.asset("assets/images/add 1.png"),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: height*0.08,
                        width: width*0.08,
                        child: Image.asset("assets/images/trash.png"),
                      ),
                      SizedBox(width: width*0.02,),
                      const Text("remove",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFF3232),
                            fontFamily: "spartan",)).tr(),
                    ],
                  ),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.01,),
                  const Text("delivery_fees",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black54)).tr(),
                  SizedBox(height: height*0.01),
                  Row(
                    children: [
                      const Text("sub_total",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black)).tr(),
                      const Spacer(),
                      const Text("\$999",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.03,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const shopping_info();
                      },));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffDD6A03)),
                      child: const Text("checkout",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.white)).tr(),
                    ),
                  ),
                  SizedBox(height: height*0.03),
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffDD6A03)),
                      borderRadius: BorderRadius.circular(5),),
                    child: const Text("countinue_shopping",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Color(0xffDD6A03))).tr(),
                  ),
                  SizedBox(height: height*0.03),
                  Container(
                    alignment: Alignment.center,
                    height: height*0.25,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFE7E7E7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height*0.03),
                          const Text("return_policy",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)).tr(),
                          SizedBox(height: height*0.02),
                          const Text("policy_info",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: "spartan",
                                color: Colors.black54,)).tr(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.04),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
