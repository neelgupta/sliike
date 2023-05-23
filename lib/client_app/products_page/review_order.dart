// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/payment_reciev.dart';

class review_order extends StatefulWidget {
  const review_order({Key? key}) : super(key: key);

  @override
  State<review_order> createState() => _review_orderState();
}

class _review_orderState extends State<review_order> {
  bool billing = false;
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
                    SizedBox(width: width*0.18,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("review_order",
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
                  const Text("review",
                      style: TextStyle(
                          fontSize: 18,
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
                  Image(image: const AssetImage("assets/images/Line 145.png"),height: height*0.01,width: width*0.06,color: const Color(0xffDD6A03)),
                  SizedBox(width: width*0.01,),
                  Image(image: const AssetImage("assets/images/Group 502.png"),height: height*0.03,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.04,),
                  const Text("order_details",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)).tr(),
                  SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: const [
                      Text("Subaru Hair Dye Blonde",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text("x1",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontFamily: "spartan")),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    children: const [
                      Text("Hair Dye (Blonde)",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontFamily: "spartan",)),
                      Spacer(),
                      Text("\$999",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      const Text("subtotal",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan")).tr(),
                      const Spacer(),
                      const Text("\$999",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan")),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      const Text("gst/hst",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan")).tr(),
                      const Spacer(),
                      const Text("\$10.00",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan")),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      const Text("shipping",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan")).tr(),
                      const Spacer(),
                      const Text("\$16.80",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan")),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  const Text("Canada Post Regular Parcel",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontFamily: "spartan")),
                  SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      const Text("total",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan")).tr(),
                      const Spacer(),
                      const Text("\$1,025.8",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: "spartan")),
                    ],
                  ),
                  SizedBox(height: height*0.06,),
                  Row(
                    children: [
                      const Text("shipping_address",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold)).tr(),
                      const Spacer(),
                      const Text("edit",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFDD5103),
                              fontFamily: "spartan")).tr(),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                  Row(
                    children: [
                      SizedBox(
                        height: height*0.05,
                        width: width*0.05,
                        child: Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          activeColor: const Color(0xFFDD6A03),
                          value: billing,
                          onChanged: (bool? value) {
                            setState(() {
                              billing = value!;
                            });
                          },),
                      ),
                      SizedBox(width: width*0.04,),
                      const Text("billing_address",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "spartan")).tr(),
                      // Text("same_as",
                      //     style: TextStyle(
                      //         fontSize: 8,
                      //         color: Colors.black,
                      //         fontFamily: "spartan")).tr(),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  const Text("Ester Britney\n825 Dawson Island\nApt 30\nToronto, DE 63324\nCanada",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "spartan")),
                  SizedBox(height: height*0.06,),
                  Row(
                    children: [
                      const Text("payment",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold)).tr(),
                      const Spacer(),
                      const Text("edit",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFDD5103),
                              fontFamily: "spartan")).tr(),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  const Divider(color: Colors.black54,),
                  SizedBox(height: height*0.02,),
                  const Text("Alex Roderic\n....  ....  ....  555\n05/23\n315",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "spartan")),
                  SizedBox(height: height*0.06,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const payment_reciev();
                      },));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffDD6A03)),
                      child: const Text("place_order",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.white)).tr(),
                    ),
                  ),
                  SizedBox(height: height*0.04,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
