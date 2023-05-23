import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

// ignore: camel_case_types
class brands_DeScription extends StatefulWidget {
  const brands_DeScription({Key? key}) : super(key: key);

  @override
  State<brands_DeScription> createState() => _brands_DeScriptionState();
}

// ignore: camel_case_types
class _brands_DeScriptionState extends State<brands_DeScription> {
  bool moredescription = false;
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
          color: const Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: height * 0.06,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                image:
                                AssetImage("assets/images/Group 55.png"),

                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.2,),
                    const Text("Rose Lip Gloss",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w700)),
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
                  height: height*0.45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/lipstick.png"),fit: BoxFit.fill),
                  ),
                  // child: Image.asset("assets/images/client_home_bg.png"),
                ),

                Padding(
                  padding:  EdgeInsets.only(top:height*0.42),
                  child: Container(


                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0)),
                      color: Colors.white,
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: textComoon("Desription", 16,Colors.black87, FontWeight.w700),
                        ),

                        moredescription==true?Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              child: textComoon("Specifications", 16,Colors.black87, FontWeight.w700),
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

                          ],
                        )
                        :Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                              child: textComoonfade("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt massa tortor, vel finibus  orci varius in. Mauris a magna sed mauris ultrices facilisis.",
                                  13, const Color(0xff414141), FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.02,),

                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                            child:InkWell(
                          onTap: (){
                            setState(() {
                              moredescription = true;
                            });
                          },
                          child: moredescription == true?InkWell(
                            onTap: (){
                              setState(() {
                                moredescription=false;
                              });
                            },
                            child:Container(
                              width: width,
                              height: height * 0.06,

                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: const Color(0xff01635D)),
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 textComoon("View Less", 12, const Color(0xff01635D),FontWeight.w600),

                                  const SizedBox(width: 10,),
                                  Container(
                                    height: 10,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:AssetImage("assets/images/bottom_grren.png",),fit: BoxFit.fill,

                                  )
                                  ),
                                  ),

                                ],
                              ),
                            ),
                          ):Container(
                            width: width,
                            height: height * 0.06,

                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: const Color(0xff01635D)),
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                textComoon("More Description", 12, const Color(0xff01635D),FontWeight.w600),

                                const SizedBox(width: 10,),
                                Container(
                                  height: 10,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:AssetImage("assets/images/bottom_grren.png",),fit: BoxFit.fill,

                                      )
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),),



                        SizedBox(height: height*0.01,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                        ),
                        SizedBox(height: height*0.01,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: textComoon("Terms and Conditions",16,Colors.black,FontWeight.w700),
                        ),
                        SizedBox(height: height*0.01,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                        ),

                        SizedBox(height: height*0.01,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: textComoon("Shipping policy",12,const Color(0xff1571ED),FontWeight.w500),
                        ),
                        SizedBox(height: height*0.01,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                        ),
                        SizedBox(height: height*0.01,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: textComoon("Return policy",12,const Color(0xff1571ED),FontWeight.w500),
                        ),
                        SizedBox(height: height*0.01,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                        ),
                        SizedBox(height: height*0.015,),
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
                                  const Text("Shine Ultra",style: TextStyle(color: Colors.black,fontSize: 10,fontFamily: "spartan",fontWeight: FontWeight.w600)),


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
                                    border: Border.all(width: 1, color: const Color(0xff01635D)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset("assets/images/shregreen.png"),
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
                                            color: const Color(0xff01635D)),
                                        child: const Text(
                                          "BUY NOW",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "spartan",
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        )),
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
