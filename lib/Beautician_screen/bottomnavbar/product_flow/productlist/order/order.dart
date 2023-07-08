import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/order/orderdetail.dart';

import '../../../../custom_widget/textcommon/textcommon.dart';

Widget order(BuildContext context){
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(alignment: Alignment.topLeft,
            child: textComoon(
                "Orders", 16, Color(0xff292929), FontWeight.bold)),
        SizedBox(
          height: height * 0.02,
        ),
        Expanded(
          child: Container(
            child: ListView.builder(itemCount: 12,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return  InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return orderDetail();
                  },));
                },
                child: Column(
                  children: [
                    SizedBox(height: height*0.015,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                textComoon("Product: ",12, Color(0xff707070), FontWeight.w500),
                                textComoon("Body Butter",12, Color(0xff292929), FontWeight.w600),
                              ],
                            ),
                            SizedBox(height: height*0.01,),
                            Row(
                              children: [
                                textComoon("Price: ",12, Color(0xff707070), FontWeight.w500),
                                textComoon("\$15",12, Color(0xff292929), FontWeight.w600),
                              ],
                            ),
                            SizedBox(height: height*0.01,),
                            Row(
                              children: [
                                textComoon("Date: ",12, Color(0xff707070), FontWeight.w500),
                                textComoon("22/08/2022",12, Color(0xff292929), FontWeight.w600),
                              ],
                            ),

                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Color(0xffFFD059),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 06),
                            child: Center(child: textComoon("Pending", 10, Color(0xff000000), FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Divider(thickness: 1,color: Color(0xff969696),)
                  ],
                ),
              );
            },),
          ),
        )

      ],
    ),
  );
}