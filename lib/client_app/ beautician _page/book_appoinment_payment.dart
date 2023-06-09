// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/payment_success.dart';

class book_appoinment_payment extends StatefulWidget {
  const book_appoinment_payment({Key? key}) : super(key: key);

  @override
  State<book_appoinment_payment> createState() => _book_appoinment_paymentState();
}

class _book_appoinment_paymentState extends State<book_appoinment_payment> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
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
                    SizedBox(width: width*0.20,),
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
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image(image: const AssetImage("assets/images/Frame 427320901.png"),height: height*0.22,width: width,fit: BoxFit.fill,),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "card_name".tr(),
                  hintText: '',
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "card_number".tr(),
                  hintText: '',
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: width*0.42,
                    child: TextField(
                      style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "expiration".tr(),
                        hintText: '',
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
                        hintText: '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Checkbox(value: isChecked, onChanged: (value) {},),
                  SizedBox(width: width*0.02,),
                  const Text("use_this_card",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black)).tr(),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            SizedBox(height: height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFDF8F2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("important_info",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("info",
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "spartan",
                              color: Colors.black)).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("late_cancel",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03))).tr(),
                    ),
                    SizedBox(height: height*0.02,),
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.06,),
            Container(
              color: const Color(0xFFFCF0E6),
              child: Column(
                children: [
                  SizedBox(height: height*0.02,),
                  Padding (
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("services",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black)).tr(),
                        const Spacer(),
                        const Text("2",
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("subtotal",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                color: Colors.black)).tr(),
                        const Spacer(),
                        const Text("\$65.00",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("gst/hst",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                color: Colors.black)).tr(),
                        const Spacer(),
                        const Text("\$5.00",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.black54,),
                  ),
                  SizedBox(height: height*0.02,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("total",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                color: Colors.black)).tr(),
                        const Spacer(),
                        const Text("\$70.00",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "spartan",
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.05,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const payment_success();
                        },));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffDD6A03)),
                        child: const Text("confirm",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.white)).tr(),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.05,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
