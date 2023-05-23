// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../Beautician_screen/custom_widget/textcommon/textcommon.dart';


class product_description extends StatefulWidget {
  const product_description({Key? key}) : super(key: key);

  @override
  State<product_description> createState() => _product_descriptionState();
}

class _product_descriptionState extends State<product_description> {
  bool moredescription = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/Rectangle 28.png"),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Rose Lip Gloss",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
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
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height*0.55,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/Rectangle 908.png"),fit: BoxFit.fill),
                  ),
                  // child: Image.asset("assets/images/client_home_bg.png"),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:height*0.52),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height*0.02,),
                        Align(alignment: Alignment.center,
                          child: Container(
                            height: 6,width: width*0.35,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.black87,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: textComoon("Rose",10,Colors.white, FontWeight.w600)),
                              ),
                              const SizedBox(width: 20,),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textComoon("Rose Lip Gloss",14,const Color(0xff414141), FontWeight.w600),
                                  const SizedBox(height: 5,),
                                  textComoon("\$12.06",14,const Color(0xff414141), FontWeight.w700),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        const Divider(thickness: 1,color: Color(0xffCFCFCF),),
                        ///Desription
                        moredescription == true ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: textComoon("desription", 16,Colors.black87, FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                              child: textComoonfade("Subaru Unisex hair colorant is a high quality Hair Dye that has conditioning properties and Leaves a long lasting colour on your hair. It makes hair Fuller, Shiny and glossier, Whether at home or Salon it guarantees a best results.This bright Gold/wine red/black/blonde Hair Colorant is a good quality colorant for your hair. It is a wonderful colorant that will give you the value of your money. It will turn the color of your hair to gold and with a soft texture. It has Superior Quality, it is Affordable and easy to Use.Subaru Unisex hair colorant is a high quality Hair Dye that has conditioning properties and Leaves a long lasting colour on your hair. It makes hair Fuller, Shiny and glossier, Whether at home or Salon it guarantees a best results.This bright Gold/wine red/black/blonde Hair Colorant is a good quality colorant for your hair. It is a wonderful colorant that will give you the value of your money. It will turn the color of your hair to gold and with a soft texture. It has Superior Quality, it is Affordable and easy to Use.",
                                  13, const Color(0xff414141), FontWeight.w500),
                            ),
                            SizedBox(height: height*0.01,),
                            const Padding(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: textComoon("specification", 16,Colors.black87, FontWeight.w700),
                            ),
                            SizedBox(height: height*0.01,),
                            const Padding(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: textComoon("KEY FEATURES", 12,Colors.black87, FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  const Center(
                                    child: CircleAvatar(

                                      radius: 4,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),const SizedBox(width: 5,),
                                  textComoon("Leaves a long lasting Colour on hair.", 12,const Color(0xff414141), FontWeight.w500),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  const Center(
                                    child: CircleAvatar(

                                      radius: 4,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),const SizedBox(width: 5,),
                                  textComoon("Conditions the hair.", 12,const Color(0xff414141), FontWeight.w500),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  const Center(
                                    child: CircleAvatar(

                                      radius: 4,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),const SizedBox(width: 5,),
                                  textComoon("Makes hair Shiny and glossier", 12,const Color(0xff414141), FontWeight.w500),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  const Center(
                                    child: CircleAvatar(

                                      radius: 4,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),const SizedBox(width: 5,),
                                  textComoon("Gives good and nice results.", 12,const Color(0xff414141), FontWeight.w500),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  const Center(
                                    child: CircleAvatar(

                                      radius: 4,
                                      backgroundColor: Colors.black,
                                    ),
                                  ),const SizedBox(width: 5,),
                                  textComoon("Good quality and Affordable.", 12,const Color(0xff414141), FontWeight.w500),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                            ),
                            SizedBox(height: height*0.01,),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: textComoon("specifications",18,Colors.black,FontWeight.w700),
                            ),
                            SizedBox(height: height*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: textComoon("SKU: SU430ST0734HBNAFAMZ",15,Colors.black,FontWeight.w500),
                            ),
                            SizedBox(height: height*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: textComoon("Weight (kg): 1",15,Colors.black54,FontWeight.w500),
                            ),
                            SizedBox(height: height*0.03,),
                          ],
                        ): Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: textComoon("desription", 16,Colors.black87, FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                              child: textComoonfade("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt massa tortor, vel finibus orci varius in. Mauris a magna sed mauris ultrices facilisis.",
                                  13, const Color(0xff414141), FontWeight.w500),
                            ),
                            SizedBox(height: height*0.01,),
                            const Padding(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                moredescription = true;
                              });
                            },
                            child: moredescription == true? InkWell(
                              onTap: () {
                                setState(() {
                                  moredescription = false;
                                });
                              },
                              child: Container(
                                width: width,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: const Color(0xffDD6A03)),
                                ),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textComoon("view_less", 12, const Color(0xffDD6A03),FontWeight.w600),
                                    const SizedBox(width: 10,),
                                    const Icon(Icons.keyboard_arrow_up,size: 30,color: Color(0xffDD6A03),)
                                  ],
                                ),
                              ),):
                            Container(
                              width: width,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: const Color(0xffDD6A03)),
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  textComoon("more_description", 12, const Color(0xffDD6A03),FontWeight.w600),
                                  const SizedBox(width: 10,),
                                  const Icon(Icons.keyboard_arrow_down_rounded,size: 30,color: Color(0xffDD6A03),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                        ),
                        SizedBox(height: height*0.01,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: textComoon("You May Like",14,Colors.black,FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: height*0.25,
                            child: ListView.builder(
                              itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: height*0.13,
                                    width: width*0.27,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(image: AssetImage("assets/images/lipstick.png"),fit: BoxFit.fill),
                                        border: Border.all(width: 1,color: const Color(0xffCFCFCF)),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    margin: const EdgeInsets.only(right: 10,bottom: 5,top: 20),
                                  ),
                                  Container(
                                    child: const Text("Shine Ultra",style: TextStyle(color: Colors.black,fontSize: 10,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              );
                            },),
                          ),
                        ),
                        Container(height: height * 0.15,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: const Color(0xffE7E7E7)),
                            // border: Border(
                            //   top: BorderSide(width: 1, color: Color(0xffE7E7E7)),
                            // ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.07,
                                  width: width*0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 1, color: const Color(0xffDD6A03)),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.share,color: Color(0xffDD6A03),size: 20,)
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                    },
                                    child: Container(
                                        height: height * 0.07,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: const Color(0xffDD6A03)),
                                        child: const Text(
                                          "buy_now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "spartan",
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ).tr()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
