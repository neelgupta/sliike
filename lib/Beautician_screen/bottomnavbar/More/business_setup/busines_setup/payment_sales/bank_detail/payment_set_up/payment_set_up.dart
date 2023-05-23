import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/payment_set_up/direct_bank_transfer/bank_trans_setup.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/payment_set_up/interac_transfer/interac_transfer_set_up.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/payment_set_up/paypal/paypal_setup_payment.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class payment_set_up extends StatefulWidget {
  const payment_set_up({Key? key}) : super(key: key);

  @override
  State<payment_set_up> createState() => _payment_set_upState();
}

class _payment_set_upState extends State<payment_set_up> {
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
                          width: width * 0.15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Payment Set-Up",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              textComoon(
                  "Client Payment", 14, Color(0xff292929), FontWeight.w700),
              SizedBox(
                height: height * 0.02,
              ),
              textComoonfade(
                  "Clients can currently pay for services and products via credit card. This is the available payment methods at checkout.",
                  12,
                  Color(0xff414141),
                  FontWeight.w500),
              SizedBox(height: height*0.015,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Color(0xffCFCFCF)),
                    color: Color(0xffFAFAFA)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 12, bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          "assets/images/verifi_sucess.png",
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          "assets/images/creaditcard.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      textComoon(
                          "Credit Card", 14, Color(0xff707070), FontWeight.w600),
                      Spacer(),
                      Container(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          "assets/images/lockgrey.png",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              textComoon("Choose Payment Method", 14, Color(0xff292929),
                  FontWeight.w700),
              SizedBox(
                height: height * 0.02,
              ),
              textComoonfade(
                  "Select a payment method with which you can get paid by sliike.",
                  12,
                  Color(0xff414141),
                  FontWeight.w500),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return paypal_setupActive_Payment();
                  },));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Color(0xff707070)),
                      color: Color(0xffFAFAFA)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 12, bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            "assets/images/verifi_sucess.png",
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            "assets/images/pay.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textComoon(
                            "Paypal", 14, Color(0xff707070), FontWeight.w600),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            "assets/images/righticon.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return interac_Transfer_setup();
                  },));

                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Color(0xff707070)),
                      color: Color(0xffFAFAFA)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 12, bottom: 12),
                    child: Row(
                      children: [
                        Container(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          "assets/images/verifi_sucess.png",
                        ),
                      ),
                        SizedBox(
                          width: 15,
                        ),

                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            "assets/images/Interac-Logo 1.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textComoon("Interac Transfer", 14, Color(0xff707070),
                            FontWeight.w600),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            "assets/images/righticon.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return bank_trans_SetUp();
                  },));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Color(0xff707070)),
                      color: Color(0xffFAFAFA)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 12, bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            "assets/images/verifi_sucess.png",
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            "assets/images/bank.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        textComoon("Direct Bank Transfer", 14, Color(0xff707070),
                            FontWeight.w600),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                            "assets/images/righticon.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
