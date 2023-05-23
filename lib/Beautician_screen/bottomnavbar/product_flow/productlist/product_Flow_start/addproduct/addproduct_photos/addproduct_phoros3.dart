import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_Flow_start/addproduct/all_addproduct/all_product.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class product_photos_Three extends StatefulWidget {
  String str;
   product_photos_Three(this.str, {Key? key}) : super(key: key);

  @override
  State<product_photos_Three> createState() => _product_photos_ThreeState();
}

class _product_photos_ThreeState extends State<product_photos_Three> {
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
                      SizedBox(width: width/5,),
                      Container(
                        child: Text("Add Product",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(
                height: height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1/",
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
                height: height*0.02,
              ),
              Container(alignment: Alignment.topLeft,
                  child: textComoon("Product photo added", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height*0.01,
              ),
              Container(alignment: Alignment.topLeft,
                  child: textComoon("Drag and drop to change photo order.", 12, Color(0xff414141), FontWeight.w500)),

              SizedBox(
                height: height*0.02,
              ),
              Stack(alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffA0A0A0),width: 1),

                    ),
                    width: width,
                    height: height*0.3,
                    child: widget.str!=null?Image.file(
                      File(widget.str,),fit: BoxFit.fill,):Container()
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,bottom: 10),
                    child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Container(

                          width: 40,height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffE7E7E7),width: 1),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/edit_grey.png"),
                          ),),
                        SizedBox(width: 10,),
                        Container(width: 40,height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffE7E7E7),width: 1),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/delete.png"),
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height*0.02,
              ),
              Container(alignment: Alignment.topLeft,
                  child: textComoonfade("You can add at least 3 photos of this product below if you choose.", 12, Color(0xff414141), FontWeight.w500)),

              SizedBox(
                height: height*0.02,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          width: 150,
                          height:130,
                          decoration: BoxDecoration(
                             // borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/camera_line.png"),fit: BoxFit.fill
                              )
                          ),
                          child: Center(
                            child: Image(height: 40,
                              image:
                              AssetImage("assets/images/cameraicon.png"),fit: BoxFit.fill,

                            ),
                          )),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(


                          children: [
                            Container(

                              width: 40,height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xffE7E7E7),width: 1),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/edit_grey.png"),
                            ),),
                            SizedBox(width: 10,),
                            Container(width: 40,height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xffE7E7E7),width: 1),

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/delete.png"),
                              ),),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          width: 150,
                          height:130,

                          decoration: BoxDecoration(

                              image: DecorationImage(
                                  image: AssetImage("assets/images/camera_line.png"),fit: BoxFit.fill
                              )
                          ),
                          child: Center(
                            child: Image(height: 40,
                              image:
                              AssetImage("assets/images/cameraicon.png"),fit: BoxFit.fill,

                            ),
                          )),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Row(
                      //
                      //
                      //     children: [
                      //       Container(
                      //
                      //         width: 40,height: 40,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           border: Border.all(color: Color(0xffE7E7E7),width: 1),
                      //
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Image.asset("assets/images/edit_grey.png"),
                      //         ),),
                      //       SizedBox(width: 10,),
                      //       Container(width: 40,height: 40,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           border: Border.all(color: Color(0xffE7E7E7),width: 1),
                      //
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Image.asset("assets/images/delete.png"),
                      //         ),),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: height*0.05,),
              CommonButton(context, "CONTINUE",12, FontWeight.w600, Colors.white, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return allProduct_select();
                },));
              }),
              SizedBox(height: height*0.05,),
            ],
          ),
        ),
      ),
    );
  }
}
