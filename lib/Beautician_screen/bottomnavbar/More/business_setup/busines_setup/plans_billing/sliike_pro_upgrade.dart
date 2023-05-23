import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/plans_billing/sliike_successful.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class sliike_Upgrade extends StatefulWidget {
  const sliike_Upgrade({Key? key}) : super(key: key);

  @override
  State<sliike_Upgrade> createState() => _sliike_UpgradeState();
}

class _sliike_UpgradeState extends State<sliike_Upgrade> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController creditcardn = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cvv = TextEditingController();

  bool firstnamestatus = false;
  bool lastnamestatus = false;
  bool cvvstatus = false;
  bool creditcardnstatus = false;
  bool datestatus = false;
  String status = "";

  bool revieworder = false;

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
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffFAFAFA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCFCFCF), width: 1),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        color: Color(0xff1571ED),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: [
                              textComoon("Sliike Pro", 14, Color(0xffffffff),
                                  FontWeight.w700),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              textComoon("\$14.99 Monthly Subsription", 12,
                                  Color(0xffffffff), FontWeight.w500),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Start your ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff707070)),
                              children: [
                                TextSpan(
                                    text: '1-month free trial ',
                                    style: TextStyle(
                                        fontFamily: 'spartan',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xff111111))),
                                TextSpan(
                                    text: 'now!',
                                    style: TextStyle(
                                        fontFamily: 'spartan',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: Color(0xff707070)))
                              ])),
                      SizedBox(
                        height: height * 0.025,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xff01635D),
                      child: textComoon(
                          "1", 15, Color(0xffffffff), FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    textComoon("Confirm your billing cycle", 14,
                        Color(0xff111111), FontWeight.w600),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 130,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 1, color: Color(0xff1571ED)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        "assets/images/stackright.png",
                                        height: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textComoon("Monthly", 14,
                                            Color(0xff111111), FontWeight.w700),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        textComoon("1 month free trial", 12,
                                            Color(0xff414141), FontWeight.w500),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        textComoon("then \$17.99/month", 12,
                                            Color(0xff111111), FontWeight.w500),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 280,
                                height: 5,
                                color: Color(0xff1571ED),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: ShapeOfView(
                  shape: BubbleShape(
                      position: BubblePosition.Top,
                      arrowPositionPercent: 0.2,
                      //borderRadius: 20,
                      arrowHeight: 20,
                      arrowWidth: 10
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: Color(0xffCFCFCF), width: 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.025,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Color(0xffCFCFCF)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textComoon("Monthly after free trial", 12,
                                    Color(0xff414141), FontWeight.w500),
                                textComoon("\$14.99/month", 12, Color(0xff414141),
                                    FontWeight.w500),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Color(0xffCFCFCF)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textComoon("Today’s Total", 12, Color(0xff111111),
                                    FontWeight.w600),
                                textComoon("\$0.00", 12, Color(0xff111111),
                                    FontWeight.w600),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  text: 'Your free trial begins on ',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'spartan',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff414141)),
                                  children: [
                                    TextSpan(
                                        text: 'September 26, 2022 ',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff111111))),
                                    TextSpan(
                                        text: 'and will end on ',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff414141))),
                                    TextSpan(
                                        text: 'October 26, 2022. ',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff111111))),
                                    TextSpan(
                                        text: ' You can cancel anytime before ',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff414141))),
                                    TextSpan(
                                        text: 'October 26, 2022.',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff111111))),
                                    TextSpan(
                                        text:
                                            ' to avoid being charged and we will send an email reminder',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff414141))),
                                    TextSpan(
                                        text: ' 7 days before ',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff111111))),
                                    TextSpan(
                                        text: 'the trial ends.',
                                        style: TextStyle(
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff292929))),
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xff01635D),
                      child: textComoon(
                          "2", 15, Color(0xffffffff), FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    textComoon(
                        "Payment", 14, Color(0xff111111), FontWeight.w600),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),

              /// review order
              revieworder == false
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Color(0xffCFCFCF), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 25, bottom: 20),
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: firstname,
                                  onChanged: (value) {
                                    firstnamestatus = false;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929)),
                                    labelText: "First Name*",
                                    labelStyle: TextStyle(
                                        fontFamily: 'spartan',
                                        color: Color(0xff707070)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                  ),
                                ),
                              ),
                              firstnamestatus
                                  ? Container(
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
                              Container(
                                child: TextField(
                                  controller: lastname,
                                  onChanged: (value) {
                                    lastnamestatus = false;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929)),
                                    labelText: "Last Name*",
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff707070)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                  ),
                                ),
                              ),
                              lastnamestatus
                                  ? Container(
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
                              Container(
                                child: TextField(
                                  controller: creditcardn,
                                  onChanged: (value) {
                                    creditcardnstatus = false;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Credit or Debit Card Number",
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929)),
                                    labelText: "Credit or Debit Card Number*",
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff707070)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                  ),
                                ),
                              ),
                              creditcardnstatus
                                  ? Container(
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
                              Container(
                                child: TextField(
                                  controller: date,
                                  onChanged: (value) {
                                    datestatus = false;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "MM/YY",
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929)),
                                    labelText: "Expiration Date*",
                                    labelStyle: TextStyle(
                                        fontFamily: 'spartan',
                                        color: Color(0xff707070)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                  ),
                                ),
                              ),
                              datestatus
                                  ? Container(
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
                              Container(
                                child: TextField(
                                  controller: cvv,
                                  onChanged: (value) {
                                    cvvstatus = false;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "CVV",
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929)),
                                    labelText: "CVV*",
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        color: Color(0xff707070)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide:
                                          BorderSide(color: Color(0xff707070)),
                                    ),
                                  ),
                                ),
                              ),
                              cvvstatus
                                  ? Container(
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
                              CommonButton(context, "REVIEW ORDER", 12,
                                  FontWeight.w600, Colors.white, () {
                                setState(() {
                                  revieworder = true;
                                });
                              })
                            ],
                          ),
                        ),
                      ),
                    )
                  :
              /// Free Trail
                  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: Color(0xffCFCFCF)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    //width: 40,
                                    child: Image.asset(
                                      "assets/images/mastercard.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  textComoon("Mastercard - 5555", 12,
                                      Color(0xff000000), FontWeight.w500),
                                  Spacer(),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      "assets/images/editblue.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.07,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xff01635D),
                                child: textComoon("3", 15, Color(0xffffffff),
                                    FontWeight.w700),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              textComoon("Review your order", 14,
                                  Color(0xff111111), FontWeight.w600),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: Color(0xffCFCFCF)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 15, bottom: 15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      textComoonfade(
                                          "Your free trial begins today and ends on\nOctober 26, 2022",
                                          12,
                                          Color(0xff414141),
                                          FontWeight.w500),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      RichText(
                                          textAlign: TextAlign.start,
                                          text: TextSpan(
                                              text: 'Beginning  ',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'spartan',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff414141)),
                                              children: [
                                                TextSpan(
                                                    text: 'October 26, 2022',
                                                    style: TextStyle(
                                                        fontFamily: 'spartan',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff111111))),
                                                TextSpan(
                                                    text: ', you will\nbe ',
                                                    style: TextStyle(
                                                        fontFamily: 'spartan',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff414141))),
                                                TextSpan(
                                                    text: 'charged \$14.99 ',
                                                    style: TextStyle(
                                                        fontFamily: 'spartan',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff111111))),
                                                TextSpan(
                                                    text:
                                                        ' each month\n(including tax)',
                                                    style: TextStyle(
                                                        fontFamily: 'spartan',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff414141))),
                                              ])),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      textComoonfade(
                                          "The plan will automatically renew every\nmonth until cancelled. To avoid charges\nfor the next month, cancel before the\nrenewal date.",
                                          12,
                                          Color(0xff414141),
                                          FontWeight.w500),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: CommonButton(
                                        context,
                                        "START YOUR FREE TRAIL",
                                        12,
                                        FontWeight.w600,
                                        Colors.white,
                                        () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return sliike_Successful();
                                          },));
                                        }),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/images/lock.png"),
                                        height: 20,
                                        width: 20,
                                        color: Color(0xFF111111),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text("Secure Checkout",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff414141),
                                            fontFamily: "spartan",
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: height * 0.025,
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xffCFCFCF), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xffCFCFCF)))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: textComoon("Frequently asked questions", 15,
                              Color(0xff414141), FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(


                          child: textComoon("Will I be charged during free trial?", 15, Color(0xff111111),
                              FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: 'No, you won’t be charged during your free trial, which begins on September ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'spartan',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff414141)),
                                children: [
                                  TextSpan(
                                      text: '26, 2022 ',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff111111))),
                                  TextSpan(
                                      text: 'and ends on October',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff414141))),
                                  TextSpan(
                                      text: ' 26, 2022.',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff111111))),
                                  TextSpan(
                                      text: 'You can cancel anytime before October',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff414141))),
                                  TextSpan(
                                      text: '26, 2022',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff111111))),
                                  TextSpan(
                                      text:
                                          ' to avoid being charged.',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff414141))),

                                ])),
                      ),
                      SizedBox(height: height*0.015,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(


                          child: textComoon("How can I cancel during my free trial?", 15, Color(0xff111111),
                              FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: 'Once you\'re signed up, a link to cancel will appear on your Subscription settings page. Learn more about how to cancel on our ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'spartan',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff414141)),
                                children: [
                                  TextSpan(
                                      text: 'Help Center ',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff1571ED))),
                                  TextSpan(
                                      text: '.',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff111111))),

                                ])),
                      ),
                      SizedBox(height: height*0.015,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(


                          child: textComoon("What happens after the free trial period?", 15, Color(0xff111111),
                              FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: 'If you do not cancel before your free trial period ends on October ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'spartan',
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff414141)),
                                children: [
                                  TextSpan(
                                      text: '27, 2022,',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff111111))),
                                  TextSpan(
                                      text: 'you will be automatically charged for your subscription.',
                                      style: TextStyle(
                                          fontFamily: 'spartan',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xff111111))),

                                ])),
                      ),
                      SizedBox(height: height*0.015,),
                    ],
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
