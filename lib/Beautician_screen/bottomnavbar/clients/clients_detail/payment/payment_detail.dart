import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class payMentDetail extends StatefulWidget {
  const payMentDetail({Key? key}) : super(key: key);

  @override
  State<payMentDetail> createState() => _payMentDetailState();
}

class _payMentDetailState extends State<payMentDetail> {
  TextEditingController search=TextEditingController();
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      //  SizedBox(width: width/5,),
                      Container(
                        child: Text("Invoice",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: InkWell(
                          onTap: (){

                          },
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.more_horiz,
                                size: 30, color: Color(0xff707070)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body:


      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.035,),
                        Container(alignment: Alignment.center,
                            child: textComoon("Invoice: 01",14,Color(0xff292929), FontWeight.w700)),
                        SizedBox(height: height*0.02,),
                        Container(alignment: Alignment.center,
                            child: textComoon("Tuesday, 15 Mar 2022",12,Color(0xff292929), FontWeight.w500)),
                        SizedBox(height: height*0.01,),
                        Container(alignment: Alignment.center,
                            child: textComoon("Billed to Joe Cambell",12,Color(0xff707070), FontWeight.w500)),
                        SizedBox(height: height*0.02,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: width*0.5,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffD7E0DD),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(child: textComoon("PAID", 12,Color(0xff219653), FontWeight.w600)),
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        Divider(thickness: 1,color: Color(0xffCFCFCF),),
                        SizedBox(height: height*0.03,),
                        Container(alignment: Alignment.center,
                            child: textComoon("Tolu Beauty Place",14,Color(0xff292929), FontWeight.w700)),
                        SizedBox(height: height*0.01,),
                        Container(alignment: Alignment.center,
                            child: textComoon("2543 Tolmie Street, Vancouver, Canada.",12,Color(0xff292929), FontWeight.w500)),
                        SizedBox(height: height*0.01,),





              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textComoon("Items", 12, Color(0xff292929), FontWeight.w600),
                  textComoon(
                      "Amount", 12, Color(0xff292929), FontWeight.w600),
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

                                  textComoon("Beard Trim", 14,
                                      Color(0xff292929), FontWeight.w700),
                                  textComoon("(20min)", 12, Color(0xff292929),
                                      FontWeight.w700),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                    child: textComoon(
                                        "Tue, 15 Mar, 2022 - 9:30 PM",
                                        12,
                                        Color(0xff707070),
                                        FontWeight.w600)),
                              ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(alignment: Alignment.topLeft,
                              child: textComoon(
                                  "with Tolu.",
                                  12,
                                  Color(0xff707070),
                                  FontWeight.w600)),
                ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Row(children: [
                            textComoon("1x", 12,Color(0xff707070), FontWeight.w500),
                            SizedBox(width: 10,),
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
                        "\$5.00", 12, Color(0xff292929), FontWeight.w500),
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
                        "\$35.00", 12, Color(0xff292929), FontWeight.w500),
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
                    width: 40,
                  ),
                  textComoon(
                      "\$30.00", 12, Color(0xff292929), FontWeight.w500),
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

                  textComoon("Payment Method", 12,
                      Color(0xff707070), FontWeight.w500),
                  SizedBox(
                    width: 50,
                  ),
                  textComoon(
                      "Stripe", 12, Color(0xff292929), FontWeight.w500),
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
                  textComoon("Total Paid", 12, Color(0xff707070),
                      FontWeight.w500),
                  SizedBox(
                    width: 40,
                  ),
                  textComoon(
                      "\$30.00", 12, Color(0xff292929), FontWeight.w500),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(height: height*0.03,),
              textComoon("Share invoice with", 14, Color(0xff292929), FontWeight.w700),
              SizedBox(height: height*0.03,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: search,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          hintText: "",
                          hintStyle:
                          TextStyle(color: Color(0xff707070)),

                          labelStyle: TextStyle(
                              fontFamily: 'spartan',
                              color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                            BorderSide(color: Colors.black38),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                            BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(

                    decoration: BoxDecoration(
                    color: Color(0xff01635D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(left: 20,top: 12,bottom: 12,right: 20),
                      child: textComoon("SHARE", 12, Colors.white, FontWeight.w600),
                    )
                  )
                ],
              ),
              SizedBox(height: height*0.05,),
            ],
          ),
        ),
      ),

    );
  }
}
