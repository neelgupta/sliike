import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_Flow_start/addproduct/all_addproduct/add_color_variations/Add_color_variations.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_Flow_start/addproduct/all_addproduct/sale_add_product/All_add_product_sale.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class allProduct_select extends StatefulWidget {
  const allProduct_select({Key? key}) : super(key: key);

  @override
  State<allProduct_select> createState() => _allProduct_selectState();
}

class _allProduct_selectState extends State<allProduct_select> {
  List colorlist = ['Black','Gold','Red','Blue','Brown','Silver'];
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController productdescription = TextEditingController();

  ///pricing
  TextEditingController Productprice= TextEditingController();
  TextEditingController Currentprice= TextEditingController();
  TextEditingController Discount= TextEditingController();
  TextEditingController Startdate= TextEditingController();
  TextEditingController Enddate= TextEditingController();


  TextEditingController sku= TextEditingController();
  TextEditingController filedstockquantity= TextEditingController();

  ///Switch
  bool Promotianaloffer=false;
  bool Stockquantity=false;


  String status = "";
  bool prodescriptionstatus=false;
  List productcategoryradioList = [
    'Barber',
    'Hair Care',
    'Make-up',
    'Nails',
    'SPA',
    'Massage',
    'Facial/Skin Care',
    'Tattoo Art',
    'Photography',
    'Beauty Consultant'
  ];
  List weightmlList = [
    'Milliliters (ml)',
    'Liters (l)',
    'Fluid ounces (Fl. oz.)',
    'Grams (g)',
    'Kilograms (kg)',
    'Gallons (gal)',
    'Gallons (gal)',
    'Pounds (lb)',
    'Centimeters (cm)',
    'Feet (ft)',
    'Inches (in)',
    'A whole product',
  ];
  List heightcmList = [
    'Centimeter (cm)',
    'Feet (ft)',
    'Inches (Inch)',
  ];
  List lenghtinchList = [
    'Centimeter (cm)',
    'Feet (ft)',
    'Inches (Inch)',
  ];
  List weidthicmList = [
    'Centimeter (cm)',
    'Feet (ft)',
    'Inches (Inch)',
  ];
  String? productselectdradioValue = "";

  String? weightmlradioValue = "";
  String? heightcmradioValue = "";
  String? lenghtinchradioValue = "";
  String? weidthicmradioValue = "";

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
                        width: width / 5,
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          child: Text("Add Product",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
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
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "2/",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff292929),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffA0A0A0),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                  child: textComoon(
                      "Product info", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  productshowdialog();
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff707070), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        productselectdradioValue == ""
                            ? Text(
                                "Product category",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff707070),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.normal),
                              )
                            : Text(
                                "$productselectdradioValue",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.normal),
                              ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Color(0xff707070),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff707070), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gatsby Hair Dye",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff707070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: textComoon(
                          "Color variation", 14, Color(0xff292929), FontWeight.w700)),
                  textComoon("Edit",12,Color(0xff01635D), FontWeight.w500)
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Wrap(
                runSpacing: 15,
                spacing: 10,
                children: [
                  for(int i=0;i<colorlist.length;i++)
                    Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xff707070))
                      ),
                      child: Text(colorlist[i],style: TextStyle(fontFamily: "spartan",fontSize: 12,color: Color(0xff414141)),),
                    )
                ],
              ),

              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Container(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/images/add-square.png")),
                  SizedBox(
                    width: 10,
                  ),
                  textComoon("Add color variations", 12, Color(0xff1571ED),
                      FontWeight.w500),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return add_color_variations();
                      },));
                    },
                    child: Icon(Icons.keyboard_arrow_right,
                        color: Color(0xff1571ED), size: 30),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 15, right: 20),
                  child: textComoonfade(
                      "Add variations of this product like sizes, weights, colors, etc to help customers make clearer choices.  ",
                      10,
                      Color(0xff414141),
                      FontWeight.w500),
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
                height: height * 0.02,
              ),
              Container(
                  child: textComoon(
                      "Specification", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textComoon(
                            "Weight", 12, Color(0xff414141), FontWeight.w500),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          child: TextField(
                            controller: first,
                            onChanged: (value) {
                              // enterYourAddressStatus = false;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "1.00",
                              hintStyle: TextStyle(color: Color(0xff000000)),
                              prefixIcon: InkWell(
                                onTap: () {
                                  weightMl();
                                },
                                child: Container(
                                  width: width * 0.22,
                                  height: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        textComoon("ml", 10, Color(0xff414141),
                                            FontWeight.w600),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 15,
                                          height: 10,
                                          child: Image.asset(
                                              "assets/images/bottomblack.png"),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textComoon(
                            "Height", 12, Color(0xff414141), FontWeight.w500),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          child: TextField(
                            controller: second,
                            onChanged: (value) {
                              // enterYourAddressStatus = false;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "5.5",
                              hintStyle: TextStyle(color: Color(0xff000000)),
                              prefixIcon: InkWell(
                                onTap: () {
                                  heightMl();
                                },
                                child: Container(
                                  width: width * 0.22,
                                  height: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        textComoon("cm", 10, Color(0xff414141),
                                            FontWeight.w600),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 15,
                                          height: 10,
                                          child: Image.asset(
                                              "assets/images/bottomblack.png"),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textComoon(
                            "Lenght", 12, Color(0xff414141), FontWeight.w500),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          child: TextField(
                            controller: third,
                            onChanged: (value) {
                              // enterYourAddressStatus = false;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "1.5",
                              hintStyle: TextStyle(color: Color(0xff000000)),
                              prefixIcon: InkWell(
                                onTap: () {
                                  Lenghtinch();
                                },
                                child: Container(
                                  width: width * 0.25,
                                  height: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        textComoon("inch", 10,
                                            Color(0xff414141), FontWeight.w600),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 15,
                                          height: 10,
                                          child: Image.asset(
                                              "assets/images/bottomblack.png"),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textComoon(
                            "Width", 12, Color(0xff414141), FontWeight.w500),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Container(
                          child: TextField(
                            controller: four,
                            onChanged: (value) {
                              // enterYourAddressStatus = false;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: "6.00",
                              hintStyle: TextStyle(color: Color(0xff000000)),
                              prefixIcon: InkWell(
                                onTap: () {
                                  weightcm();
                                },
                                child: Container(
                                  width: width * 0.22,
                                  height: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        textComoon("cm", 10, Color(0xff414141),
                                            FontWeight.w600),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          width: 15,
                                          height: 10,
                                          child: Image.asset(
                                              "assets/images/bottomblack.png"),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: textComoon(
                          "Product description ", 14, Color(0xff292929), FontWeight.w700)),
                  textComoon("0/150 Texts", 12, Color(0xff707070), FontWeight.w500),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: TextField(
                  controller: productdescription,
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xff414141,
                      )),
                  onChanged: (value) {
                    prodescriptionstatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(left: 15, top: 12, bottom: 12),
                    hintText: "Get the best hair coloring from the very best of hair dye producers.",hintStyle: TextStyle(
                    color: Color(0xff414141),fontSize: 12,fontWeight: FontWeight.w500,
                  ),
                    // labelText: "Description",
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
              prodescriptionstatus
                  ? Container(
                height: 30,
                child: Text(
                  "$status",
                  style: TextStyle(
                      fontFamily: 'spartan',
                      fontSize: 12,
                      color: Color(0xff2F80ED)),
                ),
              )
                  : Container(

              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              /// pricing
              Container(
                  child: textComoon(
                      "Pricing", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: TextField(
                  controller: Productprice,
                  onChanged: (value) {
                    // enterYourAddressStatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "20.00",
                    hintStyle: TextStyle(color: Color(0xff000000)),
                    prefixIcon: InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: width * 0.44,
                        height: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              textComoon("Product price (\$)", 12, Promotianaloffer==true?Color(0xff414141):Color(0xff707070),
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
              SizedBox(
                height: height * 0.02,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  textComoon("Promotianal offer", 14, Color(0xff292929),FontWeight.w500),
                  SizedBox(width: 20,),
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    valueFontSize: 12.0,
                    toggleSize: 18.0,
                    activeColor: Color(0xff01635D),
                    value: Promotianaloffer,
                    onToggle: (value) {
                      setState(() {
                        Promotianaloffer = value;
                      });
                    },
                  ),

                ],
              ),
            /// promotianal switch on ?
              Promotianaloffer==true?Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        child: textComoon(
                            "Promo details", 14, Color(0xff292929), FontWeight.w700)),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      child: TextField(
                        controller: Currentprice,
                        onChanged: (value) {

                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "20.00",
                          hintStyle: TextStyle(color: Color(0xff000000)),
                          prefixIcon: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              width: width * 0.43,
                              height: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 14, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    textComoon("Current price (\$)", 12, Color(0xff414141),
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
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      child: TextField(
                        controller: Discount,
                        onChanged: (value) {

                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "10%",
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
                                    textComoon("Discount (%)", 12, Color(0xff414141),
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
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      child: TextField(
                        controller: Startdate,
                        onChanged: (value) {

                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "17-3-2022",
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
                                    textComoon("Start date", 12, Color(0xff414141),
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
                          hintText: "22-3-2022",
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
                                    textComoon("End date", 12, Color(0xff414141),
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
                  ],
                ),
              ):Container(),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ///Inventry
              Container(
                  child: textComoon(
                      "Inventry", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: TextField(
                  controller: sku,
                  onChanged: (value) {

                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "20.00",
                    hintStyle: TextStyle(color: Color(0xff000000)),
                    prefixIcon: InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: width * 0.2,
                        height: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              textComoon("SKU", 12, Color(0xff707070),
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
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(onTap: (){

              },
                  child: textComoon("GENERATE SKU AUTOMATICALLY", 12, Color(0xff2F80ED), FontWeight.w600)),
              SizedBox(
                height: height * 0.02,
              ),
              ///Stock quantity
              Container(
                  child: textComoon(
                      "Stock quantity", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    valueFontSize: 12.0,
                    toggleSize: 18.0,
                    activeColor: Color(0xff01635D),
                    value: Stockquantity,
                    onToggle: (value) {
                      setState(() {
                        Stockquantity = value;
                      });
                    },
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: textComoon("Track stock Quantity", 14, Color(0xff292929),FontWeight.w500))
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Stockquantity==true?Column(
                children: [
                  Container(
                    child: TextField(
                      controller: filedstockquantity,
                      onChanged: (value) {

                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        hintText: "95",
                        hintStyle: TextStyle(color: Color(0xff000000)),
                        prefixIcon: InkWell(
                          onTap: () {

                          },
                          child: Container(
                            width: width * 0.66,
                            height: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  textComoon("Enter Current stock quantity", 12, Color(0xff414141),
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
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ):Container(),
              CommonButton(context,"CONTINUE", 12, FontWeight.w600, Colors.white, () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return all_product_sale();
                  },));
              }),
              SizedBox(
                height: height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Product Category
  productshowdialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: height * 0.7,
            width: width - 40,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productcategoryradioList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              productselectdradioValue =
                                  productcategoryradioList[index].toString();
                              print(productselectdradioValue);
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Column(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    //here change to your color
                                    unselectedWidgetColor: Color(0xff01635D),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${productcategoryradioList[index]}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff292929),
                                              fontFamily: "spartan",
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Radio<String>(
                                          value:
                                              productcategoryradioList[index],
                                          activeColor: Color(0xff01635D),
                                          groupValue: productselectdradioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              productselectdradioValue =
                                                  value.toString();
                                              print(productselectdradioValue);
                                              Navigator.pop(context);
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: width,
                                  color: Color(0xffE7E7E7),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ///first
  weightMl() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: height * 0.7,
            width: width - 40,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: weightmlList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              weightmlradioValue =
                                  weightmlList[index].toString();
                              print(weightmlradioValue);
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Column(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    //here change to your color
                                    unselectedWidgetColor: Color(0xff01635D),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${weightmlList[index]}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff292929),
                                              fontFamily: "spartan",
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Radio<String>(
                                          value: weightmlList[index],
                                          activeColor: Color(0xff01635D),
                                          groupValue: weightmlradioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              weightmlradioValue =
                                                  value.toString();
                                              print(weightmlradioValue);
                                              Navigator.pop(context);
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: width,
                                  color: Color(0xffE7E7E7),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ///second
  heightMl() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: height * 0.7,
            width: width - 40,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: heightcmList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              heightcmradioValue =
                                  heightcmList[index].toString();
                              print(heightcmradioValue);
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Column(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    //here change to your color
                                    unselectedWidgetColor: Color(0xff01635D),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${heightcmList[index]}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff292929),
                                              fontFamily: "spartan",
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Radio<String>(
                                          value: heightcmList[index],
                                          activeColor: Color(0xff01635D),
                                          groupValue: heightcmradioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              heightcmradioValue =
                                                  value.toString();
                                              print(heightcmradioValue);
                                              Navigator.pop(context);
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: width,
                                  color: Color(0xffE7E7E7),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// third
  Lenghtinch() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: height * 0.7,
            width: width - 40,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lenghtinchList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        lenghtinchradioValue =
                            lenghtinchList[index].toString();
                        print(lenghtinchradioValue);
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white, width: 1)),
                      child: Column(
                        children: [
                          Theme(
                            data: ThemeData(
                              //here change to your color
                              unselectedWidgetColor: Color(0xff01635D),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${lenghtinchList[index]}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff292929),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Radio<String>(
                                    value: lenghtinchList[index],
                                    activeColor: Color(0xff01635D),
                                    groupValue: lenghtinchradioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        lenghtinchradioValue =
                                            value.toString();
                                        print(lenghtinchradioValue);
                                        Navigator.pop(context);
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: width,
                            color: Color(0xffE7E7E7),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  ///four
  weightcm() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: height * 0.7,
            width: width - 40,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: weidthicmList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              weidthicmradioValue =
                                  weidthicmList[index].toString();
                              print(weidthicmradioValue);
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Column(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    //here change to your color
                                    unselectedWidgetColor: Color(0xff01635D),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${weidthicmList[index]}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff292929),
                                              fontFamily: "spartan",
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Radio<String>(
                                          value: weidthicmList[index],
                                          activeColor: Color(0xff01635D),
                                          groupValue: weidthicmradioValue,
                                          onChanged: (value) {
                                            setState(() {
                                              weidthicmradioValue =
                                                  value.toString();
                                              print(weidthicmradioValue);
                                              Navigator.pop(context);
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: width,
                                  color: Color(0xffE7E7E7),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
