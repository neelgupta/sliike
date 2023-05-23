import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/plans_billing/sliike_pro_upgrade.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class plans_Bulling_Main extends StatefulWidget {
  const plans_Bulling_Main({Key? key}) : super(key: key);

  @override
  State<plans_Bulling_Main> createState() => _plans_Bulling_MainState();
}

class _plans_Bulling_MainState extends State<plans_Bulling_Main> {
  bool moredescription = false;

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
                                  border: Border.all(color: Color(0xff414141))),
                              child: Center(
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/Group 55.png"),
                                      color: Color(0xff414141),
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
                                child: Text("Plans & Billings",
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
        body: DefaultTabController(
          length: 3,
          child: Container(
            // height: height,
            color: Color(0xffFAFAFA),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: textComoonfade(
                      "Manage your Sliike subscription plan, upgrade plans to best suit your interest. Get more exposure to what each plan has to offer.",
                      12,
                      Color(0xff414141),
                      FontWeight.w500),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(
                          top:
                              BorderSide(color: Color(0xffCFCFCF), width: 1)),
                                ),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Color(0xff01635D),
                      unselectedLabelColor: Color(0xff414141),
                      tabs: [
                        Tab(
                          text: 'Sliike Basic',
                        ),
                        Tab(
                          text: 'Sliike Pro',
                        ),
                        Tab(
                          text: 'Sliike Premium',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                // Padding(

                Expanded(
                  child: Container(

                    child: TabBarView(
                      children: <Widget>[
                        ///Sliike Basic
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),

                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  textComoon("Sliike Basic", 16, Colors.black,
                                      FontWeight.w700),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: commonButtonblack(
                                        context,
                                        "CURRENT PLAN",
                                        12,
                                        FontWeight.w600,
                                        Colors.white,
                                        () {}),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.01),
                                    child: dividerCommon(),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  moredescription == true
                                      ? Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFAFAFA)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  children: [
                                                    textComoon(
                                                        "Service Package",
                                                        16,
                                                        Colors.black,
                                                        FontWeight.w700),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    textComoon(
                                                        "17.99% on each service transaction",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.025,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Manage calendar",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Appointment booking by/for clients",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "30 SMS notification per month",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Unlimited email notification",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Deposit request",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Secured client online payment",
                                                      11,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Service referral link",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: dividerCommon(),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFAFAFA)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  children: [
                                                    textComoon(
                                                        "Product Sales Package",
                                                        16,
                                                        Colors.black,
                                                        FontWeight.w700),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    textComoon(
                                                        "18.99% on each service transaction",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.025,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "List products free",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Product Listing",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Order SMS notification",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Product shipping",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),

                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFAFAFA)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  children: [
                                                    textComoon(
                                                        "Service Package",
                                                        16,
                                                        Colors.black,
                                                        FontWeight.w700),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    textComoon(
                                                        "17.99% on each service transaction",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.025,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Manage calendar",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Appointment booking by/for clients",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "30 SMS notification per month",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Unlimited email notification",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Deposit request",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Secured client online payment",
                                                      11,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Service referral link",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          moredescription = true;
                                        });
                                      },
                                      child: moredescription == true
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  moredescription = false;
                                                });
                                              },
                                              child: Container(
                                                width: width,
                                                height: height * 0.06,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff707070)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    textComoon(
                                                        "SEE LESS PACKAGE",
                                                        12,
                                                        Color(0xff111111),
                                                        FontWeight.w600),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                      Icons.keyboard_arrow_up,
                                                      size: 30,
                                                      color: Color(0xff111111),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: width,
                                              height: height * 0.06,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Color(0xff707070)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  textComoon(
                                                      "SEE ALL PACKAGE",
                                                      12,
                                                      Color(0xff111111),
                                                      FontWeight.w600),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    size: 30,
                                                    color: Color(0xff111111),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// 2 Sliike Pro
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  textComoon("Sliike Pro", 16, Colors.black,
                                      FontWeight.w700),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  textComoon("1 month free trial", 12,
                                      Color(0xff414141), FontWeight.w600),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: commonButtonblue(
                                        context,
                                        "UPGRADE NOW",
                                        12,
                                        FontWeight.w600,
                                        Colors.white, () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return sliike_Upgrade();
                                        },
                                      ));
                                    }),
                                  ),
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      textComoon("Start Free Trial", 10,
                                          Color(0xff111111), FontWeight.w600),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(Icons.arrow_right_alt),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.015),
                                    child: dividerCommon(),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  moredescription == true
                                      ? Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFAFAFA)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  children: [
                                                    textComoon(
                                                        "Service Package",
                                                        16,
                                                        Colors.black,
                                                        FontWeight.w700),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    textComoon(
                                                        "5.99% on each service transaction",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.025,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Manage calendar",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Appointment booking by/for clients",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "50 SMS notification per month",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Unlimited email notification",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Deposit request",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Secured client online payment",
                                                      11,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Service referral link",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Social media integration",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Cancellation policy",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Client satisfaction rating",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Cancellation watch",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Add up to 5 stylists",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Email marketing blast",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "4 Promo campaign push/year",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: dividerCommon(),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFAFAFA)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  children: [
                                                    textComoon(
                                                        "Product Sales Package",
                                                        16,
                                                        Colors.black,
                                                        FontWeight.w700),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    textComoon(
                                                        "5.99% on each service transaction",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.025,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "List products free",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Product Listing",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Order SMS notification",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Product shipping",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Order email notification",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Order fulfillment data",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffFAFAFA)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Column(
                                                  children: [
                                                    textComoon(
                                                        "Service Package",
                                                        16,
                                                        Colors.black,
                                                        FontWeight.w700),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    textComoon(
                                                        "5.99% on each service transaction",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.025,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Manage calendar",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Appointment booking by/for clients",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "30 SMS notification per month",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Unlimited email notification",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoonfade(
                                                      "Deposit request",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Secured client online payment",
                                                      11,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Service referral link",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Social media integration",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Cancellation policy",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Client satisfaction rating",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Cancellation watch",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Add up to 5 stylists",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "Email marketing blast",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.07,
                                                  bottom: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: Colors.black,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  textComoon(
                                                      "4 Promo campaign push/year",
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w500),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          moredescription = true;
                                        });
                                      },
                                      child: moredescription == true
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  moredescription = false;
                                                });
                                              },
                                              child: Container(
                                                width: width,
                                                height: height * 0.06,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Color(0xff707070)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    textComoon(
                                                        "SEE LESS PACKAGE",
                                                        12,
                                                        Color(0xff111111),
                                                        FontWeight.w600),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                      Icons.keyboard_arrow_up,
                                                      size: 30,
                                                      color: Color(0xff111111),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: width,
                                              height: height * 0.06,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Color(0xff707070)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  textComoon(
                                                      "SEE ALL PACKAGE",
                                                      12,
                                                      Color(0xff111111),
                                                      FontWeight.w600),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    size: 30,
                                                    color: Color(0xff111111),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text("brands 2"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height*0.03),
              ],
            ),
          ),
        ));
  }
}

