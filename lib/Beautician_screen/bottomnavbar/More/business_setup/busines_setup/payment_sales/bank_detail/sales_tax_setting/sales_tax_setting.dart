import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/models/tax_service_models/getProvinceListModel.dart';
import 'package:new_sliikeapps_apps/models/tax_service_models/getTaxProvinceDetailsModel.dart';
import 'package:new_sliikeapps_apps/services/tax_services.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class sales_Tax_Setting extends StatefulWidget {
  const sales_Tax_Setting({Key? key}) : super(key: key);

  @override
  State<sales_Tax_Setting> createState() => _sales_Tax_SettingState();
}

class _sales_Tax_SettingState extends State<sales_Tax_Setting> {
  String? selectedvaluemin = "";
  List<String> mindropdownlist = <String>[];
  String status = "";

  TextEditingController gstnumber = TextEditingController();
  TextEditingController qstnumber = TextEditingController();
  TextEditingController pstNumber = TextEditingController();
  TextEditingController hstNumber = TextEditingController();

  bool gstnumberstatus = false;
  bool qstnumberstatus = false;
  bool pstStatus = false;
  bool hstStatus = false;
  int? _radioSelected = 1;
  String? _radioVal;
  bool radio = false;
  String provinceID = "";
  String GSTNumber = "";
  String QSTNumber = "";
  String PSTNumber = "";
  String HSTNumber = "";
  String number1 = "";
  String number2 = "";

  List<String> taxValue = [];

  TaxServices _taxServices = TaxServices();

  GetProvinceListModel? getProvinceListModel;
  GetTaxProvinceDetailsModel? getTaxProvinceDetailsModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getProvinceListModel = await _taxServices.getProvinceList(context);
      getTaxProvinceDetailsModel =
          await _taxServices.getTaxProvinceDetails(context);
      for (var i in getProvinceListModel!.data ?? []) {
        setState(() {
          // _radioSelected = 0;
          mindropdownlist.add(i.name);
          if (getTaxProvinceDetailsModel?.data?.isProvinceTaxInfo ?? false) {
            if (getTaxProvinceDetailsModel?.data?.provinceId == i.id) {
              selectedvaluemin = i.name;
              provinceID = i.id;
              getTaxProvinceDetailsModel?.data?.isProvinceTaxInfo ?? false
                  ? _radioSelected == 1
                  : 0;
              if (getTaxProvinceDetailsModel?.data?.gstNumber != "")
                taxValue.add("GST");
              if (getTaxProvinceDetailsModel?.data?.pstNumber != "")
                taxValue.add("PST");
              if (getTaxProvinceDetailsModel?.data?.qstNumber != "")
                taxValue.add("QST");
              if (getTaxProvinceDetailsModel?.data?.hstNumber != "")
                taxValue.add("HST");
              number1 = taxValue.first;
              number2 = taxValue.last;
              gstnumber.text =
                  getTaxProvinceDetailsModel?.data?.gstNumber ?? "";
              pstNumber.text =
                  getTaxProvinceDetailsModel?.data?.pstNumber ?? "";
              qstnumber.text =
                  getTaxProvinceDetailsModel?.data?.qstNumber ?? "";
              hstNumber.text =
                  getTaxProvinceDetailsModel?.data?.hstNumber ?? "";
            }
          } else {
            setState(() {
              selectedvaluemin = mindropdownlist[0];
              _radioSelected = 0;
            });
          }
        });
        print("mindropdownlist :: ${mindropdownlist}");
      }
      setState(() {});
    });
  }

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
                        SizedBox(width: width * 0.15),
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
          height: height * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                textComoon("Update Tax Settings", 14, Color(0xff292929),
                    FontWeight.w700),
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
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff292929)),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      taxValue.clear();
                      selectedvaluemin = newValue!;
                      for (var i in getProvinceListModel!.data ?? []) {
                        setState(() {
                          if (selectedvaluemin == i.name) {
                            provinceID = i.id;
                            for (var j in i.subType ?? []) {
                              setState(() {
                                taxValue.add(j.taxName.toString());
                                if (taxValue.isNotEmpty) {
                                  setState(() {
                                    for (var e in taxValue) {}
                                    number1 = taxValue.first;
                                    number2 = taxValue.last;
                                  });
                                }
                                print("number1 :: $number1");
                                print("number2 :: $number2");
                                print(j.taxName);
                              });
                            }
                          }
                        });
                      }
                    });
                    print("provinceID :: ${provinceID}");
                    print("taxValue :: ${taxValue}");
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff414141),
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
                taxValue.isNotEmpty && taxValue.length > 1
                    ? RichText(
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
                                  text: "$number1",
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
                                  text: "$number2 ",
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
                            ]))
                    : RichText(
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
                                  text: taxValue.contains("GST")
                                      ? 'GST '
                                      : taxValue.contains("PST")
                                          ? "PST "
                                          : taxValue.contains("QST")
                                              ? "QST "
                                              : "HST ",
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
                      value: 0,
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
                      value: 1,
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
                Column(
                  children: [
                    if (_radioSelected == 1 && taxValue.contains("GST"))
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
                            labelStyle: TextStyle(
                                fontFamily: 'spartan', color: Colors.black54),
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
                    if (_radioSelected == 1 && taxValue.contains("QST"))
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
                            labelStyle: TextStyle(
                                fontFamily: 'spartan', color: Colors.black54),
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
                    if (_radioSelected == 1 && taxValue.contains("PST"))
                      Container(
                        child: TextField(
                          controller: gstnumber,
                          onChanged: (value) {
                            setState(() {
                              pstStatus = false;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "PST Number",
                            // labelText: "GST Number",
                            labelStyle: TextStyle(
                                fontFamily: 'spartan', color: Colors.black54),
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
                    pstStatus
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
                    if (_radioSelected == 1 && taxValue.contains("HST"))
                      Container(
                        child: TextField(
                          controller: hstNumber,
                          onChanged: (value) {
                            setState(() {
                              hstStatus = false;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "HST Number",
                            // labelText: "GST Number",
                            labelStyle: TextStyle(
                                fontFamily: 'spartan', color: Colors.black54),
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
                    hstStatus
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
                ),
                Spacer(),
                CommonButton(context, "SAVE", 12, FontWeight.w600, Colors.white,
                    () {
                  if (selectedvaluemin == "") {
                    showToast(message: "Service category is missing!");
                  } else if (_radioSelected == 1 &&
                      taxValue.contains("GST") &&
                      gstnumber.text.isEmpty) {
                    showToast(message: "GST Number is missing");
                  } else if (_radioSelected == 1 &&
                      taxValue.contains("QST") &&
                      qstnumber.text.isEmpty) {
                    showToast(message: "QST Number is missing");
                  } else if (_radioSelected == 1 &&
                      taxValue.contains("PST") &&
                      qstnumber.text.isEmpty) {
                    showToast(message: "PST Number is missing");
                  } else if (_radioSelected == 1 &&
                      taxValue.contains("HST") &&
                      qstnumber.text.isEmpty) {
                    showToast(message: "HST Number is missing");
                  } else {
                    Map<String, dynamic> Body = {
                      "provinceID": provinceID,
                      "isProvinceTaxInfo": _radioSelected.toString(),
                      if (_radioSelected == 1 && taxValue.contains("GST"))
                        "GSTNumber": gstnumber.text,
                      if (_radioSelected == 1 && taxValue.contains("QST"))
                        "QSTNumber": qstnumber.text,
                      if (_radioSelected == 1 && taxValue.contains("HST"))
                        "HSTNumber": hstNumber.text,
                      if (_radioSelected == 1 && taxValue.contains("PST"))
                        "PSTNumber": pstNumber.text,
                    };
                    _taxServices.updateTax(context, Body);
                    print(Body);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
