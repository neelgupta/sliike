// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/brands/brand_productList/brand_description.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class brand_List extends StatefulWidget {
  const brand_List({Key? key}) : super(key: key);

  @override
  State<brand_List> createState() => _brand_ListState();
}

class _brand_ListState extends State<brand_List> {

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
                    const SizedBox(width: 30,),
                    const Text("Matte Liquid Lipstick",
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                width: width,
                height: height*0.5,
                child: Image.asset("assets/images/brandsrose.png",fit: BoxFit.fill,),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text("Rose",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: const Color(0xffffffff),
                          border: Border.all(color: const Color(0xffCFCFCF),width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/fav_ornage.png",fit: BoxFit.fill,height: 25),
                      ),
                    )
                  ],
                ),
              ),
            ],
            ),
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text("Rose",style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                        ),
                        const Text("Makeup kit",style: TextStyle(color: Colors.black,fontSize: 12,fontFamily: "spartan")),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(color: const Color(0xffCFCFCF),width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/fav.png",fit: BoxFit.fill,height: 25),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Divider(thickness: 1,color: Color(0xffCFCFCF),),
            Container(alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  child: textComoon("Rose Products",15,Colors.black87, FontWeight.w700),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: MasonryGridView.count(physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                itemCount:
                10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 230,
                    width: width,
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color(0xffE7E7E7,),width: 1),
                            ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return const brands_DeScription();
                            },));
                          },
                          child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(image: AssetImage("assets/images/Rectangle 863.png"),fit: BoxFit.fill),
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                        ),
                       Padding(
                         padding: const EdgeInsets.only(left: 15,top: 10),
                         child: textComoon("Rose Lip Gloss", 14, Colors.black87, FontWeight.w500),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 15,top:5,),
                         child: textComoon("\$999", 14, Colors.black87, FontWeight.w700),
                       ),
                      ],
                    ),
                  );},),
            ),
            SizedBox(height: height*0.05,),
          ],
        ),
      ),
    );
  }
}
