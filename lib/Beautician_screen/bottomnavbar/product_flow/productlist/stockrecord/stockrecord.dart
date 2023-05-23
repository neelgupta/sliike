

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

Widget stackRecord(BuildContext context){
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: Column(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Container(
            alignment: Alignment.topLeft,
            child: textComoon(
                "Stock Record", 14, Color(0xff292929), FontWeight.w700)),
        SizedBox(
          height: height * 0.03,
        ),

        Row(
          children: [
            Expanded(child: textComoon("Name", 10, Color(0xff707070), FontWeight.w500)),
            Expanded(child: textComoon("Category", 10, Color(0xff707070), FontWeight.w500)),
            Expanded(child: textComoon("Expt stock", 10, Color(0xff707070), FontWeight.w500)),
            Expanded(child: textComoon("Current stock", 10, Color(0xff707070), FontWeight.w500)),

          ],
        ),
        Divider(thickness: 1,color: Color(0xffCFCFCF),),
        Expanded(
          child: Container(
           // height: height*0.57,
            child: ListView.builder(physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 17,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10,),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text(maxLines: 2,"Subaru Hairg",style: TextStyle(
                          fontSize: 10, color:Color(0xff111111),fontWeight: FontWeight.w500,
                        ),)
                        ),

                        Expanded(child: Text(maxLines: 2,"Skin & Facials",style: TextStyle(
                          fontSize: 10, color:Color(0xff111111),fontWeight: FontWeight.w500,
                        ),)
                        ),
                        Expanded(child: Text(maxLines: 2,"20",style: TextStyle(
                          fontSize: 10, color:Color(0xff111111),fontWeight: FontWeight.w500,
                        ),)
                        ),
                        Expanded(child: Text(maxLines: 2,"12",style: TextStyle(
                          fontSize: 10, color:Color(0xff111111),fontWeight: FontWeight.w500,
                        ),)
                        ),                    ],
                    ),
                  ),
                  Divider(thickness: 1,color: Color(0xffCFCFCF),),
                ],
              );
            },),
          ),
        )
      ],
    ),
  );
}