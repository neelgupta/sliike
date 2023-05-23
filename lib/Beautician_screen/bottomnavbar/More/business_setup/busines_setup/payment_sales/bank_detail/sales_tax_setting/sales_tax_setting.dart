import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/payment_tax/payment_tax.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class sales_Tax_Setting extends StatefulWidget {
  const sales_Tax_Setting({Key? key}) : super(key: key);

  @override
  State<sales_Tax_Setting> createState() => _sales_Tax_SettingState();
}

class _sales_Tax_SettingState extends State<sales_Tax_Setting> {
  String? selectedvaluemin = "Quebec";
  List<String> mindropdownlist = <String>[
    "Quebec",
    "Alberta",
    "British Columbia",
  ];
  String status = "";

  TextEditingController gstnumber = TextEditingController();
  TextEditingController qstnumber = TextEditingController();

  bool gstnumberstatus = false;
  bool qstnumberstatus = false;
  int? _radioSelected=1;
  String? _radioVal;
  bool radio = false;

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
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.15
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Sales Tax Settings",
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

          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                textComoon(
                    "Update Tax Settings", 14, Color(0xff292929), FontWeight.w700),
                SizedBox(
                  height: height * 0.02,
                ),
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text:
                            'Provide the necessary tax information based on your province. if have them tap on ',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'spartan',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff414141)),
                        children: [
                          TextSpan(
                              text: '" Yes "',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xff292929))),
                          TextSpan(
                              text: ' to fill form, or ',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff414141))),
                          TextSpan(
                              text: '" No "',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xff292929))),
                          TextSpan(
                              text: ' if you don’t.',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff414141))),
                        ])),
                SizedBox(
                  height: height * 0.03,
                ),
                DropdownButtonFormField(

                  enableFeedback: true,
                  isDense: true,
                  isExpanded: true,
                  alignment: Alignment.center,
                  elevation: 2,
                  value: selectedvaluemin,
                  items: mindropdownlist.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(fontSize: 14,color: Color(0xff292929)),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedvaluemin = newValue!;
                    });
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down,color: Color(0xff414141),
                      size: 30,
                    ),
                  ),

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Service Category",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'spartan',
                        color: Color(0xff292929),
                        fontWeight: FontWeight.w500),
                    labelText: "Service Category",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xff292929)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xff292929)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: 'Do you have ',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'spartan',
                            fontWeight: FontWeight.w500,
                            color: Color(0xff414141)),
                        children: [
                          TextSpan(
                              text: 'GST',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xff292929))),
                          TextSpan(
                              text: ' & ',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff414141))),
                          TextSpan(
                              text: 'QST ',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xff292929))),
                          TextSpan(
                              text: 'number?',
                              style: TextStyle(
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff414141))),
                        ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _radioSelected,
                      activeColor: Color(0xff01635D),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff01635D)),
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value as int;
                          print(_radioSelected);
                          _radioVal = 'No';
                        });
                      },
                    ),
                    Text('No'),
                    Radio(
                      value: 2,
                      groupValue: _radioSelected,
                      activeColor: Color(0xff01635D),
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff01635D)),
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value as int;
                          print(_radioSelected);
                          _radioVal = 'Yes';
                        });
                      },
                    ),
                    Text('Yes'),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),


                _radioSelected==2?Column(
                  children: [
                    Container(
                      child: TextField(
                        controller: gstnumber,
                        onChanged: (value) {
                          setState(() {
                            gstnumberstatus = false;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "GST Number",
                          // labelText: "GST Number",
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
                    gstnumberstatus
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
                      height: 20,
                    ),
                    Container(
                      child: TextField(
                        controller: qstnumber,
                        onChanged: (value) {
                          setState(() {
                            qstnumberstatus = false;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "QST Number",
                          // labelText: "GST Number",
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
                    qstnumberstatus
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
                      height: 20,
                    ),
                  ],
                ):SizedBox(),

                Spacer(),
                CommonButton(
                    context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return payment_Tax();
                  },));
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
