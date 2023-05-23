import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class orderDetail extends StatefulWidget {
  const orderDetail({Key? key}) : super(key: key);

  @override
  State<orderDetail> createState() => _orderDetailState();
}

class _orderDetailState extends State<orderDetail> {
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
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(alignment: Alignment.topLeft,
                  child: textComoon(
                      "Oder Summary", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.02,
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Subaru Hair Dye Blond", 12,Color(0xff414141), FontWeight.w500),
                  textComoon("x1", 12,Color(0xff414141), FontWeight.w600),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Status:", 12,Color(0xff707070), FontWeight.w500),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFD059),
                      borderRadius: BorderRadius.circular(2),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        child: textComoon("Pending", 12,Color(0xff111111), FontWeight.w600),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Subtotal:", 12,Color(0xff707070), FontWeight.w500),
                  textComoon("\$999", 12,Color(0xff111111), FontWeight.w600),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Shipping:", 12,Color(0xff707070), FontWeight.w500),
                  textComoon("Free", 12,Color(0xff111111), FontWeight.w600),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Tax:", 12,Color(0xff707070), FontWeight.w500),
                  textComoon("\$10", 12,Color(0xff111111), FontWeight.w600),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Total:", 12,Color(0xff707070), FontWeight.w500),
                  textComoon("\$1,009", 12,Color(0xff111111), FontWeight.w600),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(alignment: Alignment.topLeft,
                  child: textComoon(
                      "Delivery Address", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.02,
              ),
              textComoon("Alex Roderic", 12, Color(0xff414141), FontWeight.w500),
              SizedBox(
                height: height * 0.01,
              ),
              textComoon("825 Dawson Island", 12, Color(0xff414141), FontWeight.w500),
              SizedBox(
                height: height * 0.01,
              ),
              textComoon("Apt 30", 12, Color(0xff414141), FontWeight.w500),
              SizedBox(
                height: height * 0.01,
              ),
              textComoon("Toronto. DE 63324", 12, Color(0xff414141), FontWeight.w500),
              SizedBox(
                height: height * 0.01,
              ),
              textComoon("Canada", 12, Color(0xff414141), FontWeight.w500),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(thickness: 1,color: Color(0xffCFCFCF),),
              SizedBox(
                height: height * 0.02,
              ),
              Container(alignment: Alignment.topLeft,
                  child: textComoon(
                      "Buyer Detail", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.02,
              ),
              textComoon("Nino Simmones", 12, Color(0xff414141), FontWeight.w500),
              SizedBox(
                height: height * 0.02,
              ),
              textComoon("(817)877-1977", 12, Color(0xff414141), FontWeight.w500),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
