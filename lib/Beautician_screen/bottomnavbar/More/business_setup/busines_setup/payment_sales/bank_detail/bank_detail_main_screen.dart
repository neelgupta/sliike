import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/payment_set_up/payment_set_up.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/sales_tax_setting/sales_tax_setting.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/calender/send_notifi_message_or_phone/payment_detail/stripe_setup_web_view.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class bank_detail extends StatefulWidget {
  final String email;
  const bank_detail({Key? key,required this.email}) : super(key: key);

  @override
  State<bank_detail> createState() => _bank_detailState();
}

class _bank_detailState extends State<bank_detail> {
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
                          width: width * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Bank Details & Tax Profile",
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            textComoon("Bank Details & Tax Settings", 14, Color(0xff292929),
                FontWeight.w700),
            SizedBox(
              height: height * 0.02,
            ),
            textComoonfade(
                "Provide bank details for us to wire your payment and Sales Tax profile to collect sales taxes on all your services/product sales.",
                12,
                Color(0xff414141),
                FontWeight.w500),
            textComoon("1/2", 12, Color(0xff414141), FontWeight.w500),
            SizedBox(
              height: height * 0.025,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StripeWebViews(email: widget.email);
                },));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff2D9CDB)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 22, bottom: 22, left: 12, right: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Beautician Bank Account Details",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffFFFFFF),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 15,
                            width: 30,
                            child: Image.asset(
                              "assets/images/righticon.png",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return sales_Tax_Setting();
            //     },));
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xffFBF104),
            //       border: Border.all(width: 1, color: Color(0xffCFCFCF)),
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.only(
            //           top: 22, bottom: 22, left: 12, right: 12),
            //       child: Column(
            //         children: [
            //           Row(
            //             children: [
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               Text(
            //                 "Sales Tax Settings",
            //                 overflow: TextOverflow.ellipsis,
            //                 style: TextStyle(
            //                   fontSize: 12,
            //                   color: Color(0xff292929),
            //                   fontFamily: "spartan",
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //               Spacer(),
            //               InkWell(
            //                 onTap: () {
            //                   // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //                   //   return();
            //                   // },));
            //                 },
            //                 child: Container(
            //                   height: 15,
            //                   width: 30,
            //                   child: Image.asset(
            //                     "assets/images/righticon.png",
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
