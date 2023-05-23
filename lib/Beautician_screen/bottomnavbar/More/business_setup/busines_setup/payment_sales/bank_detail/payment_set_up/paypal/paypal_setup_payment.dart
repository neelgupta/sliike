import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/payment_set_up/payment_set_up.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';

import '../../../../../../../../custom_widget/textcommon/textcommon.dart';

class paypal_setupActive_Payment extends StatefulWidget {
  const paypal_setupActive_Payment({Key? key}) : super(key: key);

  @override
  State<paypal_setupActive_Payment> createState() => _pay_Pal_ActivieState();
}

class _pay_Pal_ActivieState extends State<paypal_setupActive_Payment> {
  TextEditingController email = TextEditingController();
  bool emailAdressstatus = false;
  String status = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.14, //
        flexibleSpace: Container(
          color: Color(0xffF5F7F7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image:
                                    AssetImage("assets/images/Group 55.png"),

                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                "assets/images/pay.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Text("Paypal",
                                  style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            textComoon(
                "Update payment info", 14, Color(0xff292929), FontWeight.w700),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              child: TextField(
                controller: email,
                onChanged: (value) {
                  emailAdressstatus = false;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: "Email Address",
                  labelText: "Email Address",
                  labelStyle:
                  TextStyle(fontFamily: 'spartan', color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                ),
              ),
            ),
            emailAdressstatus
                ? Container(
              alignment: Alignment.topLeft,
              height: 30,
              child: Text(
                "$status",
                style: TextStyle(
                    fontFamily: 'spartan',
                    fontSize: 12,
                    color: Colors.red),
              ),
            )
                : Container(
              height: 30,
            ),
            CommonButton(
                context, "SAVE", 12, FontWeight.w600, Colors.white, () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return payment_set_up();
                  },));
            }),
          ],
        ),
      ),

    );
  }
}
