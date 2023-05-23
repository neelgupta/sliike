import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_Flow_start/addproduct/addproduct_photos/addproduct_photos.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

Widget AddProduct(BuildContext context){
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return    Padding(
    padding: const EdgeInsets.only(left: 20,right: 20),
    child: Column(

      children: [
        SizedBox(height: height*0.1,),
        Container(height: 100, child:Image.asset("assets/images/addproduct.png",fit: BoxFit.fill,)),
        SizedBox(height: height*0.02,),
        textComoon("You currently have no product", 14, Color(0xff292929),FontWeight.w700),
        SizedBox(height: height*0.02,),
        Container(alignment: Alignment.center,
            child: textComooncenter("When you add products, they will appear here.", 12, Color(0xff414141), FontWeight.w500)),
        SizedBox(height: height*0.02,),
        InkWell(
          onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return addProduct_Photos();
              },));

          },
          child: Container(
            height: 50,
            width: width*0.5,
            decoration: BoxDecoration(
              color: Color(0xff01635D),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(child: textComooncenter("Add product", 12, Colors.white, FontWeight.w600)),
          ),
        )
      ],
    ),
  );
}