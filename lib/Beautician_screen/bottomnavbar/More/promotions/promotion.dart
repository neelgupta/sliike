import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/promotions/_add_promotions.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class promotion extends StatefulWidget {
  const promotion({Key? key}) : super(key: key);

  @override
  State<promotion> createState() => _promotionState();
}

class _promotionState extends State<promotion> {
  bool Product = false;
  bool Service = true;
  String type = "1";
  int myproductcnt=0;
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
                        child: Text("Promotions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        child: Text("(1)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff707070),
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
            SizedBox(
              height: height * 0.02,
            ),

            ///promotions 0 ?ADD to No Page
            myproductcnt==1?Column(
              children: [
                SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height*0.1,),
                      Container(alignment: Alignment.center,
                          height: 120, child:Image.asset("assets/images/promotionadd.png",fit: BoxFit.fill,)),
                      SizedBox(height: height*0.02,),
                      textComooncenter("You currently have no running promotions", 14, Color(0xff292929),FontWeight.w700),
                      SizedBox(height: height*0.025,),
                      InkWell(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return add_promotion();
                          },));

                        },
                        child: Container(alignment: Alignment.center,
                          height: 50,
                          width: width*0.5,
                          decoration: BoxDecoration(
                            color: Color(0xff01635D),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: textComooncenter("ADD POMOTION", 12, Colors.white, FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ):Column(
              children: [
                ///1 service
                Service == true
                    ? SingleChildScrollView(
                  child: Container(
                    height: height*0.7,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: height*0.18,
                          width: width,
                          decoration: BoxDecoration(color: Color(0xffD4F2FB),

                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffD4F2FB),width: 1),
                          ),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: height*0.18,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Color(0xff78D6F5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),),),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textComoonfade("50 %", 18, Color(0xff292929), FontWeight.w700),
                                    textComoonfade("OFF", 18, Color(0xff292929), FontWeight.w700),

                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textComoon("Save Big on Beard Trim",14, Color(0xff292929), FontWeight.w700),
                                      SizedBox(height: 5,),
                                      textComoonfade("Beard Trim", 12, Color(0xff414141), FontWeight.w500),
                                      SizedBox(height: 5,),
                                      textComoonfade("17 April - 22 April,2022", 12, Color(0xff414141), FontWeight.w500),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ),
                        Spacer(),
                        CommonButton(context, "ADD NEW PROMOTION",12, FontWeight.w600, Colors.white, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return add_promotion();
                          },));
                        }),
                      ],
                    ),
                  ),
                )
                    : SizedBox(),

                ///2 Product
                Product== true
                    ? SingleChildScrollView(
                  child: Container(
                    height: height*0.7,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: height*0.18,
                          width: width,
                          decoration: BoxDecoration(color: Color(0xffD4F2FB),

                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffD4F2FB),width: 1),
                          ),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: height*0.18,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Color(0xff78D6F5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),),),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textComoonfade("50 %", 18, Color(0xff292929), FontWeight.w700),
                                    textComoonfade("OFF", 18, Color(0xff292929), FontWeight.w700),

                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      textComoon("Save Big on Beard Trim",14, Color(0xff292929), FontWeight.w700),
                                      SizedBox(height: 5,),
                                      textComoonfade("Beard Trim", 12, Color(0xff414141), FontWeight.w500),
                                      SizedBox(height: 5,),
                                      textComoonfade("17 April - 22 April,2022", 12, Color(0xff414141), FontWeight.w500),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ),
                        Spacer(),
                        CommonButton(context, "ADD NEW PROMOTION",12, FontWeight.w600, Colors.white, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return add_promotion();
                          },));
                        }),
                      ],
                    ),
                  ),
                )
                    : SizedBox(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
