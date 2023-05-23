import 'package:flutter/material.dart';

import '../../../../custom_widget/ButtonCommon/Button.dart';
import '../../../../custom_widget/textcommon/textcommon.dart';

class paymentConfirmed extends StatefulWidget {
  const paymentConfirmed({Key? key}) : super(key: key);

  @override
  State<paymentConfirmed> createState() => _paymentConfirmedState();
}

class _paymentConfirmedState extends State<paymentConfirmed> {

  TextEditingController emailAdress = TextEditingController();
  bool emailAdressstatus = false;

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
                          width: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Payments Details",
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
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  children: [
                    textComoon(
                        "Receipt ID: ", 12, Color(0xff707070), FontWeight.w500),
                    textComoon(
                        " 2200115D#", 12, Color(0xff292929), FontWeight.w600),
                    Spacer(),
                    textComoon("Mar 17 . 11:AM", 12, Color(0xff292929),
                        FontWeight.w500),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Items", 12, Color(0xff707070), FontWeight.w500),
                    textComoon(
                        "Amount", 12, Color(0xff707070), FontWeight.w500),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Color(0xffD9DEDE),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 2,
                                            bottom: 2),
                                        child: textComoon("1", 12,
                                            Color(0xff01635D), FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    textComoon("Men\'s Cut ", 12,
                                        Color(0xff292929), FontWeight.w700),
                                    textComoon("(30min)", 12, Color(0xff707070),
                                        FontWeight.w700),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                          child: textComoon(
                                              "Wed, Mar 16, 2022. ",
                                              10,
                                              Color(0xff707070),
                                              FontWeight.w600)),
                                      Container(
                                          child: textComoon(
                                              "8 AM",
                                              10,
                                              Color(0xff292929),
                                              FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            child: Row(children: [
                              Container(
                                  child: textComoon("\$26.00", 12,
                                      Color(0xff292929), FontWeight.w700)),
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: textComoon(
                          "Discount", 12, Color(0xff707070), FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: width * 0.2,
                      alignment: Alignment.topRight,
                      child: textComoon(
                          "\$0.00", 12, Color(0xff292929), FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: textComoon(
                          "Subtotal", 12, Color(0xff707070), FontWeight.w500),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: width * 0.2,
                      alignment: Alignment.topRight,
                      child: textComoon(
                          "\$20.00", 12, Color(0xff292929), FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textComoon(
                        "GST/HST", 12, Color(0xff707070), FontWeight.w500),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: width * 0.2,
                      alignment: Alignment.topRight,
                      child: textComoon(
                          "\$1:00", 12, Color(0xff292929), FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textComoon(
                        "QST/PST", 12, Color(0xff707070), FontWeight.w500),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: width * 0.2,
                      alignment: Alignment.topRight,
                      child: textComoon(
                          "\$2.60", 12, Color(0xff292929), FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textComoon("Total", 12, Color(0xff707070), FontWeight.w500),
                    SizedBox(
                      width: 30,
                    ),
                    textComoon(
                        "\$25.60", 12, Color(0xff292929), FontWeight.w500),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    textComoon("Paid ", 12, Color(0xff219653), FontWeight.w500),
                    textComoon("- Credit Card - Mar 17 - 11AM", 12,
                        Color(0xff707070), FontWeight.w500),
                    Spacer(),
                    textComoon(
                        "\$25.60", 12, Color(0xff292929), FontWeight.bold),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textComoon("Final Total Paid", 12, Color(0xff707070),
                        FontWeight.w500),
                    SizedBox(
                      width: 30,
                    ),
                    textComoon(
                        "\$25.60", 12, Color(0xff292929), FontWeight.w500),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                Spacer(),
                commonButtonoricon(context, "SHARE", 12,
                    FontWeight.w600, Colors.white, () {
                  setState(() {
                    shareshowdailod();
                  });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

   shareshowdailod() {
     double height = MediaQuery.of(context).size.height -
         MediaQuery.of(context).padding.top -
         MediaQuery.of(context).padding.bottom;
     double width = MediaQuery.of(context).size.width -
         MediaQuery.of(context).padding.right -
         MediaQuery.of(context).padding.left;
     return showDialog(context: context, builder: (context) {
       return AlertDialog(
         alignment: Alignment.bottomCenter,

         insetPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.all(Radius.circular(10))),
         title: StatefulBuilder(
           builder: (context, setState) {
             return Column(
               children: <Widget>[

                 Container(alignment: Alignment.topLeft,
                   child: textComoon(
                       "Share Receipt with Client", 14, Color(0xff292929), FontWeight.bold),
                 ),
                 SizedBox(
                   height: height * 0.04,
                 ),
                 Container(
                   child: TextField(
                     controller: emailAdress,
                     onChanged: (value) {
                       emailAdressstatus=false;
                     },
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.only(left: 20),
                       hintText: "Email Address",
                      // labelText: "Email Address",
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
                 SizedBox(
                   height: height * 0.04,
                 ),
                 CommonButton(context,"SEND", 12, FontWeight.w600, Colors.white, () { }),
                 SizedBox(height: height*0.02,),
                 commonButtonborder(context,"CLOSE",12,FontWeight.w600,Color(0xff01635D),(){
                   Navigator.pop(context);
                 }),
                 SizedBox(
                   height: height * 0.03,
                 ),

               ],
             );
           },
         ),
       );
     },);
  }
}
