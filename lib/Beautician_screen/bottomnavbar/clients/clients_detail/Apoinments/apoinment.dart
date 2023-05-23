import 'package:flutter/material.dart';

import '../../../../custom_widget/ButtonCommon/Button.dart';
import '../../../../custom_widget/textcommon/textcommon.dart';

class apoinment extends StatefulWidget {
  const apoinment({Key? key}) : super(key: key);

  @override
  State<apoinment> createState() => _apoinmentState();
}

class _apoinmentState extends State<apoinment> {
  var radius = Radius.circular(20);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEBEFEE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xffEBEFEE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: TabBar(
                                indicator: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: radius,
                                          topLeft: radius,
                                          bottomLeft: radius,
                                          bottomRight: radius)),
                                  color: Color(0xffFFFFFF),
                                ),
                                labelColor: Color(0xff5E8178),
                                unselectedLabelColor: Color(0xff01635D),
                                tabs: [
                                  Tab(
                                    text: 'Upcoming (1)',
                                  ),
                                  Tab(
                                    text: 'Previous (1)',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height*0.8,
                        child: TabBarView(children: <Widget>[
                          upcoming(context),
                          previous(context),
                        ],),
                      )
                    ],
                  ),

                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}








///Upcoming
Widget upcoming(BuildContext context,){
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return Container(
    child: Column(
      children: [
        SizedBox(height: height*0.03,),
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff89c6a3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: textComoon("Confirmed", 10, Color(0xff219653), FontWeight.w600)),
                  ),
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    textComoon("Beard Trim",12, Color(0xff414141), FontWeight.w600),
                    textComoon("(20min)",12, Color(0xff707070), FontWeight.w600),
                  ],
                ),
                SizedBox(height: height*0.01,),
                textComoon("Mar 15, 2022 - 9:30 AM ", 10, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.01,),
                textComoon("\$20.00",12, Color(0xff414141), FontWeight.w600),

              ],
            ),

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xff01635D),width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                child: textComoon("Edit",10,Color(0xff01635D), FontWeight.w600),
              ),
            ),

          ],
        ),
        SizedBox(height: height*0.01,),
        Divider(thickness: 1,color: Color(0xffCFCFCF),),
        SizedBox(height: height*0.03,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textComoon("Note", 14, Color(0xff292929), FontWeight.w700),
            textComoon("Edit", 10, Color(0xff2F80ED), FontWeight.w700),
          ],
        ),
        SizedBox(height: height*0.015,),
        Container(
          alignment: Alignment.bottomLeft,
          width: width,
          decoration: BoxDecoration(
            color: Color(0xffF3F3F3),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:20,right:20,top: 25,bottom: 25),
            child: Text("Hello Joe, you have a SPA session with me today.",overflow: TextOverflow.fade,style: TextStyle(
              color: Color(0xff292929),fontSize: 12,fontFamily: "spartan",fontWeight: FontWeight.w500,
            )),
          ),
        ),

        SizedBox(height: height*0.2,),
        Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: CommonButton(context,"NEW APPOINTMENT", 12, FontWeight.w600, Colors.white, () {

            })),
      ],
    ),
  );
}
/// previous All
Widget previous(BuildContext context,){
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return Container(
    child: Column(
      children: [
        SizedBox(height: height*0.03,),
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff67E1FC),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: textComoon("Delivered", 10, Color(0xff2F80ED), FontWeight.w600)),
                  ),
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    textComoon("Beard Trim",12, Color(0xff414141), FontWeight.w600),
                    textComoon("(20min)",12, Color(0xff707070), FontWeight.w600),
                  ],
                ),
                SizedBox(height: height*0.01,),
                textComoon("Mar 15, 2022 - 9:30 AM ", 10, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.01,),
                textComoon("\$20.00",12, Color(0xff414141), FontWeight.w600),

              ],
            ),

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xff01635D),width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                child: textComoon("Rebook",10,Color(0xff01635D), FontWeight.w600),
              ),
            ),

          ],
        ),
        SizedBox(height: height*0.01,),
        Divider(thickness: 1,color: Color(0xffCFCFCF),),
        ///
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff8fceaa),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: textComoon("Confirmed", 10, Color(0xff219653), FontWeight.w600)),
                  ),
                ),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    textComoon("Beard Trim",12, Color(0xff414141), FontWeight.w600),
                    textComoon("(20min)",12, Color(0xff707070), FontWeight.w600),
                  ],
                ),
                SizedBox(height: height*0.01,),
                textComoon("Mar 15, 2022 - 9:30 AM ", 10, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.01,),
                textComoon("\$20.00",12, Color(0xff414141), FontWeight.w600),

              ],
            ),

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xff01635D),width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: textComoon("Mark Delivered",10,Color(0xff01635D), FontWeight.w600),
              ),
            ),

          ],
        ),
        SizedBox(height: height*0.01,),
        Divider(thickness: 1,color: Color(0xffCFCFCF),),
        SizedBox(height: height*0.2,),
        Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: CommonButton(context,"NEW APPOINTMENT", 12, FontWeight.w600, Colors.white, () {

            })),

      ],
    ),
  );
}