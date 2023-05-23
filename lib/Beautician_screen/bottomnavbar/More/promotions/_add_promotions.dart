import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/promotions/promotion_publish.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class add_promotion extends StatefulWidget {
  const add_promotion({Key? key}) : super(key: key);

  @override
  State<add_promotion> createState() => _add_promotionState();
}

class _add_promotionState extends State<add_promotion> {

  ///service
    int? _radioSelected=1;
  TextEditingController svpromotiontitle = TextEditingController();
  TextEditingController ServiceName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController Startdate= TextEditingController();
  TextEditingController Enddate= TextEditingController();
  TextEditingController Productprice= TextEditingController();
  bool ServiceNamestatus = false;
  bool svpromotiontitleststatus = false;
  bool descriptionstatus = false;
    bool productNamestatus = false;

    String status = "";
  /// product
    int? _radioSelected2=1;
  TextEditingController prpromotiontitle = TextEditingController();
  TextEditingController productName2 = TextEditingController();
    TextEditingController description2 = TextEditingController();
    TextEditingController Startdate2= TextEditingController();
    TextEditingController Enddate2= TextEditingController();
    TextEditingController Productprice2= TextEditingController();

    bool prpromotiontitleststatus = false;
  bool descriptionstatus2 = false;
    String? selectedvaluemin2;
    bool productNamestatus2 = false;


  String status2 = "";
  bool Product = false;
  bool Service = true;
  String? selectedvaluemin;

  List<String> mindropdownlist = <String>[
    "Barber",
    "Alberta",
    "British Columbia",
  ];

  List<String> mindropdownlist2 = <String>[
    "Barber",
    "Alberta",
    "British Columbia",
  ];
  String type = "1";

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
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
                  child: Row(
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
                      Container(
                        child: Text("Add Promotion",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
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
              height: height * 0.03,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: height * 0.08,
              width: width,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          Service = true;
                          Product = false;

                          type = "1";
                          print(type);
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color:
                              Service ? Color(0xff01635D) : Color(0xffEBEFEE),
                        ),
                        child: Text(
                          "Service",
                          style: TextStyle(
                              color: Service ? Colors.white : Color(0xff01635D),
                              fontFamily: 'spartan',
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Service = false;
                          Product = true;

                          type = "2";
                          print(type);
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: Product
                                ? Color(0xff01635D)
                                : Color(0xffEBEFEE)),
                        child: Text(
                          "Product",
                          style: TextStyle(
                              color: Product ? Colors.white : Color(0xff01635D),
                              fontFamily: 'spartan',
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: height * 0.02,
            // ),

            ///1 service
            Service == true
                ? Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height*0.02,),
                            Container(
                              child: TextField(
                                controller: svpromotiontitle,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'spartan',
                                    color: Color(0xff292929)),
                                onChanged: (value) {
                                  setState(() {
                                    svpromotiontitleststatus = false;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Promotion Title",
                                  labelText: "Promotion Title",
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'spartan',
                                      color: Color(0xff414141)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: Color(0xff707070)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: Color(0xffA0A0A0)),
                                  ),
                                ),
                              ),
                            ),
                            svpromotiontitleststatus
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
                                    height: 25,
                                  ),
                            DropdownButtonFormField(
                              hint: Text(
                                  textAlign: TextAlign.left,
                                  "Select your service category",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff292929))),
                              enableFeedback: true,
                              isDense: true,
                              isExpanded: true,
                              alignment: Alignment.topLeft,
                              elevation: 2,
                              value: selectedvaluemin,
                              items: mindropdownlist.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xff292929)),
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
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xff292929),
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
                                labelStyle: TextStyle(
                                    fontFamily: 'spartan',
                                    color: Color(0xff414141)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Color(0xff292929)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Color(0xff292929)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              child: TextField(
                                controller: ServiceName,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'spartan',
                                    color: Color(0xff292929)),
                                onChanged: (value) {
                                  setState(() {
                                    ServiceNamestatus = false;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Service Name",
                                  labelText: "Service Name",
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'spartan',
                                      color: Color(0xff414141)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: Color(0xff707070)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: Color(0xffA0A0A0)),
                                  ),
                                ),
                              ),
                            ),
                            ServiceNamestatus
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
                                    height: 25,
                                  ),
                            Row(
                              children: [
                                Text("Description ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff292929),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.bold)),
                                Text("(optional)",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff707070),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: height*0.02,
                            ),
                            Container(
                              child: TextField(
                                controller: description,

                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(
                                      0xff414141,
                                    )),
                                onChanged: (value) {
                                  descriptionstatus = false;
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 20, top: 12, bottom: 12),
                                  hintText: "Description",
                                  // labelText: "Description",
                                  // labelStyle: TextStyle(
                                  //     fontFamily: 'spartan',
                                  //     color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: Color(0xffA0A0A0)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        BorderSide(color: Color(0xffA0A0A0)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height*0.015,
                            ),
                            dividerCommon(),
                            SizedBox(
                              height: height*0.02,
                            ),

                            Container(child: textComoon("Set Promo Discount", 16, Color(0xff292929), FontWeight.w700)),
                            SizedBox(height: height * 0.02,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffA0A0A0),width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textComoon("Set discount by :", 14, Color(0xff292929), FontWeight.w600),
                                    SizedBox(height: height*0.02,),
                                    IntrinsicHeight(
                                      child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
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

                                                });
                                              },
                                            ),
                                            textComoonfade("Percentage (%)",14,Color(0xff292929), FontWeight.w500),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5,bottom: 5),
                                              child: VerticalDivider(thickness: 1,color: Color(0xff707070),),
                                            ),
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

                                                });
                                              },
                                            ),
                                            textComoonfade("Amount (\$)",14,Color(0xff292929), FontWeight.w500)

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: height*0.001,),
                                    dividerCommon(),
                                    SizedBox(height: height*0.015,),
                                    Container(
                                      child: TextField(
                                        controller: Productprice,
                                        onChanged: (value) {
                                          // enterYourAddressStatus = false;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 20),
                                          hintText: "50%",
                                          hintStyle: TextStyle(color: Color(0xff000000)),
                                          prefixIcon: InkWell(
                                            onTap: () {

                                            },
                                            child: Container(
                                              width: width * 0.35,
                                              height: 5,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    textComoon("Discount (%)", 12, Color(0xff707070),
                                                        FontWeight.w600),


                                                    VerticalDivider(
                                                      color: Color(0xff707070),
                                                      thickness: 1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
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
                                  ],
                                ),
                              ),
                            ),
                              SizedBox(height: height*0.01,),

                            dividerCommon(),
                            SizedBox(height: height*0.02,),
                            Container(child: textComoon("Set Promo Dates", 16, Color(0xff292929), FontWeight.w700)),
                            SizedBox(height: height*0.015,),
                            Container(
                              child: TextField(
                                controller: Startdate,
                                onChanged: (value) {

                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "17 April, 2022",
                                  hintStyle: TextStyle(color: Color(0xff000000)),
                                  prefixIcon: InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: width * 0.38,
                                      height: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            textComoon("Start date", 12, Color(0xff707070),
                                                FontWeight.w600),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 20,
                                              height: 20,
                                              child: Image.asset(
                                                  "assets/images/calenderblack.png"),
                                            ),

                                            VerticalDivider(
                                              color: Color(0xff707070),
                                              thickness: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Container(
                              child: TextField(
                                controller: Enddate,
                                onChanged: (value) {

                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "22 April, 2022",
                                  hintStyle: TextStyle(color: Color(0xff000000)),
                                  prefixIcon: InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      width: width * 0.36,
                                      height: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            textComoon("End date", 12, Color(0xff707070),
                                                FontWeight.w600),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 20,
                                              height: 20,
                                              child: Image.asset(
                                                  "assets/images/calenderblack.png"),
                                            ),

                                            VerticalDivider(
                                              color: Color(0xff707070),
                                              thickness: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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
                            SizedBox(
                              height: height * 0.04,
                            ),
                            CommonButton(context, "CONTINUE",12, FontWeight.w600, Colors.white, () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return promotion_Publish();
                              },));
                            }),
                            SizedBox(
                              height: height * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(),

            ///2 Product
            Product== true
                ? Expanded(
              child: Container(

                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextField(
                          controller: prpromotiontitle,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'spartan',
                              color: Color(0xff292929)),
                          onChanged: (value) {
                            setState(() {
                              prpromotiontitleststatus = false;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "Promotion Title",
                            labelText: "Promotion Title",
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: 'spartan',
                                color: Color(0xff414141)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Color(0xff707070)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Color(0xffA0A0A0)),
                            ),
                          ),
                        ),
                      ),
                      prpromotiontitleststatus
                          ? Container(
                        height: 30,
                        child: Text(
                          "$status2",
                          style: TextStyle(
                              fontFamily: 'spartan',
                              fontSize: 12,
                              color: Colors.red),
                        ),
                      )
                          : Container(
                        height: 25,
                      ),
                      DropdownButtonFormField(
                        hint: Text(
                            textAlign: TextAlign.left,
                            "Select product category",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff292929))),
                        enableFeedback: true,
                        isDense: true,
                        isExpanded: true,
                        alignment: Alignment.topLeft,
                        elevation: 2,
                        value: selectedvaluemin2,
                        items: mindropdownlist2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff292929)),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedvaluemin2 = newValue!;
                          });
                        },
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xff292929),
                            size: 30,
                          ),
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "Select product category",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'spartan',
                              color: Color(0xff292929),
                              fontWeight: FontWeight.w500),
                          labelText: "Product Category",
                          labelStyle: TextStyle(
                              fontFamily: 'spartan',
                              color: Color(0xff414141)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                            BorderSide(color: Color(0xff292929)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                            BorderSide(color: Color(0xff292929)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: TextField(
                          controller: productName2,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'spartan',
                              color: Color(0xff292929)),
                          onChanged: (value) {
                            setState(() {
                              productNamestatus2 = false;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "Product Name",
                            labelText: "Product Name",
                            labelStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: 'spartan',
                                color: Color(0xff414141)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Color(0xff707070)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Color(0xffA0A0A0)),
                            ),
                          ),
                        ),
                      ),
                      productNamestatus2
                          ? Container(
                        height: 30,
                        child: Text(
                          "$status2",
                          style: TextStyle(
                              fontFamily: 'spartan',
                              fontSize: 12,
                              color: Colors.red),
                        ),
                      )
                          : Container(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text("Description ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff292929),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold)),
                          Text("(optional)",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff707070),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: height*0.02,
                      ),
                      Container(
                        child: TextField(
                          controller: description2,

                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xff414141,
                              )),
                          onChanged: (value) {
                            descriptionstatus2 = false;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 20, top: 12, bottom: 12),
                            hintText: "Description",
                            // labelText: "Description",
                            // labelStyle: TextStyle(
                            //     fontFamily: 'spartan',
                            //     color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Color(0xffA0A0A0)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                              BorderSide(color: Color(0xffA0A0A0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height*0.015,
                      ),
                      dividerCommon(),
                      SizedBox(
                        height: height*0.02,
                      ),

                      Container(child: textComoon("Set Promo Discount", 16, Color(0xff292929), FontWeight.w700)),
                      SizedBox(height: height * 0.02,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffA0A0A0),width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComoon(
                                  "Set discount by :", 14, Color(0xff292929), FontWeight.w600),
                              SizedBox(height: height*0.02,),
                              IntrinsicHeight(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: _radioSelected2,

                                        activeColor: Color(0xff01635D),
                                        fillColor: MaterialStateColor.resolveWith(
                                                (states) => Color(0xff01635D)),
                                        onChanged: (value) {
                                          setState(() {
                                            _radioSelected2 = value as int;
                                            print(_radioSelected2);

                                          });
                                        },
                                      ),
                                      textComoonfade("Percentage (%)",14,Color(0xff292929), FontWeight.w500),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                                        child: VerticalDivider(thickness: 1,color: Color(0xff707070),),
                                      ),
                                      Radio(
                                        value: 2,
                                        groupValue: _radioSelected2,

                                        activeColor: Color(0xff01635D),
                                        fillColor: MaterialStateColor.resolveWith(
                                                (states) => Color(0xff01635D)),
                                        onChanged: (value) {
                                          setState(() {
                                            _radioSelected2 = value as int;
                                            print(_radioSelected2);

                                          });
                                        },
                                      ),
                                      textComoonfade("Amount (\$)",14,Color(0xff292929), FontWeight.w500)

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: height*0.001,),
                              dividerCommon(),
                              SizedBox(height: height*0.015,),
                              Container(
                                child: TextField(
                                  controller: Productprice2,
                                  onChanged: (value) {
                                    // enterYourAddressStatus = false;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "50%",
                                    hintStyle: TextStyle(color: Color(0xff000000)),
                                    prefixIcon: InkWell(
                                      onTap: () {

                                      },
                                      child: Container(
                                        width: width * 0.35,
                                        height: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              textComoon("Discount (%)", 12, Color(0xff707070),
                                                  FontWeight.w600),


                                              VerticalDivider(
                                                color: Color(0xff707070),
                                                thickness: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.01,),

                      dividerCommon(),
                      SizedBox(height: height*0.02,),
                      Container(child: textComoon("Set Promo Dates", 16, Color(0xff292929), FontWeight.w700)),
                      SizedBox(height: height*0.015,),
                      Container(
                        child: TextField(
                          controller: Startdate2,
                          onChanged: (value) {

                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "17 April, 2022",
                            hintStyle: TextStyle(color: Color(0xff000000)),
                            prefixIcon: InkWell(
                              onTap: () {

                              },
                              child: Container(
                                width: width * 0.38,
                                height: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      textComoon("Start date", 12, Color(0xff707070),
                                          FontWeight.w600),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                            "assets/images/calenderblack.png"),
                                      ),

                                      VerticalDivider(
                                        color: Color(0xff707070),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Container(
                        child: TextField(
                          controller: Enddate2,
                          onChanged: (value) {

                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            hintText: "22 April, 2022",
                            hintStyle: TextStyle(color: Color(0xff000000)),
                            prefixIcon: InkWell(
                              onTap: () {

                              },
                              child: Container(
                                width: width * 0.36,
                                height: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      textComoon("End date", 12, Color(0xff707070),
                                          FontWeight.w600),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                            "assets/images/calenderblack.png"),
                                      ),

                                      VerticalDivider(
                                        color: Color(0xff707070),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CommonButton(context, "CONTINUE",12, FontWeight.w600, Colors.white, () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return promotion_Publish();
                        },));
                      }),
                      SizedBox(
                        height: height * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
