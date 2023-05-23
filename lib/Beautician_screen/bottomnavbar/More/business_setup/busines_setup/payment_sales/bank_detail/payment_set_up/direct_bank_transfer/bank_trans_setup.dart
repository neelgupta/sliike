import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/payment_set_up/payment_set_up.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class bank_trans_SetUp extends StatefulWidget {
  const bank_trans_SetUp({Key? key}) : super(key: key);

  @override
  State<bank_trans_SetUp> createState() => _bank_trans_SetUpState();
}

class _bank_trans_SetUpState extends State<bank_trans_SetUp> {
  TextEditingController BankAddress = TextEditingController();
  TextEditingController bankname = TextEditingController();
  TextEditingController acnumber = TextEditingController();
  TextEditingController intiutiOnNumber = TextEditingController();
  TextEditingController transitNumber = TextEditingController();
  bool BankAddressstatus = false;
  bool bankNamestatus = false;
  bool acNumberStatus = false;
  bool intiutiOnNumberStatus = false;
  bool transitNumberStatus = false;
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
                          width: width * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                "assets/images/bank.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Text("Direct Bank Transfer",
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
                  controller: bankname,
                  style: TextStyle(fontSize: 14,color: Color(0xff292929),fontWeight: FontWeight.w500),

                  onChanged: (value) {
                    bankNamestatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Bank Name",
                    hintStyle:   TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    labelText: "Bank Name",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                  ),
                ),
              ),
              bankNamestatus
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
                height: 25,
              ),
              Container(
                child: TextField(
                  controller: BankAddress,
                  style: TextStyle(fontSize: 14,color: Color(0xff292929),fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    BankAddressstatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Bank Address",
                    hintStyle:   TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    labelText: "Bank Address",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                  ),
                ),
              ),
              BankAddressstatus
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
                height: 25,
              ),
              Container(
                child: TextField(
                  controller: acnumber,
                  style: TextStyle(fontSize: 14,color: Color(0xff292929),fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    acNumberStatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Account Number",
                    hintStyle:   TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    labelText: "Account Number",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                  ),
                ),
              ),
              acNumberStatus
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
                height: 25,
              ),
              Container(
                child: TextField(
                  controller: intiutiOnNumber,
                  style: TextStyle(fontSize: 14,color: Color(0xff292929),fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    intiutiOnNumberStatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Intitution Number",
                    hintStyle:   TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    labelText: "Intitution Number",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                  ),
                ),
              ),
              intiutiOnNumberStatus
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
                height: 25,
              ),
              Container(
                child: TextField(
                  controller: transitNumber,
                  style: TextStyle(fontSize: 14,color: Color(0xff292929),fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    transitNumberStatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Transit Number",
                    hintStyle:   TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    labelText: "Transit Number",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Color(0xff414141)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xffA0A0A0)),
                    ),
                  ),
                ),
              ),
              transitNumberStatus
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
                height: 25,
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
      ),

    );
  }
}
