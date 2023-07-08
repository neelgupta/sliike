// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/beauty_filter.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/cart.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/product_detail.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/search_page.dart';

class products extends StatefulWidget {
  const products({Key? key}) : super(key: key);

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.12, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/bgappbar.png"),fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: const Text("beauty_products",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold)).tr(),
                  ),
                  SizedBox(width: width*0.12,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const cart();
                      },));
                    },
                    child: Container(
                      height: height*0.06,
                      margin: EdgeInsets.only(right: width*0.06,top: height*0.08),
                      alignment: Alignment.centerRight,
                      child: Image.asset("assets/images/cart.png",height: width*0.13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const serach_page();
                      },));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width*0.03),
                      width: width*0.7,
                      height: height*0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black45)
                      ),
                      child: Row(
                        children: [
                          Image.asset("assets/images/search.png",height: height*0.03),
                          SizedBox(width: width*0.03),
                          const Text("search",style: TextStyle(fontSize: 12,fontFamily: "spartan"),).tr()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: width*0.04),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const beauty_filter();
                      },));
                    },
                    child:  Container(
                      padding: const EdgeInsets.all(10),
                      height: height*0.06,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black45)
                      ),
                      child: Image.asset("assets/images/setting-4.png",height: width*0.08,color: Colors.black,),
                    ),
                  ),
                  SizedBox(width: width*0.02)
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text("my_favorites",style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                        ),
                        Container(
                          child: const Text("view_all",style: TextStyle(color: Color(0xFFDD5103),fontSize: 12,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            SizedBox(height: height*0.02,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const product_detail();
                },));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  // color: Colors.white,
                  height: height*0.33,
                  child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: height*0.22,
                            width: width*0.7,
                            decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage("assets/images/Rectangle 964.png"),fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            margin: const EdgeInsets.all(5),
                          ),
                          Padding(padding: const EdgeInsets.only(left: 15,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text("Subaru Hair",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan",)),
                                      ),
                                      SizedBox(width: width*0.32,),
                                      SizedBox(height: height*0.02,
                                        child:const Image(image: AssetImage("assets/images/Star 1.png")),
                                      ),
                                      const SizedBox(width: 5,),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text("4.0",style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: "spartan")),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text("\$999",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                                ],
                              )
                          )
                        ],
                      ),
                    );
                  },),
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text("recently_viewed",style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                        ),
                        Container(
                          child: const Text("view_all",style: TextStyle(color: Color(0xFFDD5103),fontSize: 12,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            SizedBox(height: height*0.02,),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: height*0.33,
                  child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: height*0.22,
                            width: width*0.7,
                            decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage("assets/images/Rectangle 964.png"),fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            margin: const EdgeInsets.all(5),
                          ),
                          Padding(padding: const EdgeInsets.only(left: 15,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text("Dip Nail Powder",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan",)),
                                      ),
                                      SizedBox(width: width*0.26,),
                                      SizedBox(height: height*0.02,
                                        child:const Image(image: AssetImage("assets/images/Star 1.png")),
                                      ),
                                      const SizedBox(width: 5,),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text("4.0",style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: "spartan")),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text("\$999",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                                ],
                              )
                          )
                        ],
                      ),
                    );
                  },),
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text("recommended",style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                        ),
                        Container(
                          child: const Text("view_all",style: TextStyle(color: Color(0xFFDD5103),fontSize: 12,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            SizedBox(height: height*0.02,),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: height*0.35,
                  child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: height*0.22,
                            width: width*0.7,
                            decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage("assets/images/Rectangle 964.png"),fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            margin: const EdgeInsets.all(5),
                          ),
                          Padding(padding: const EdgeInsets.only(left: 15,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text("Dip Nail Powder",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan",)),
                                      ),
                                      SizedBox(width: width*0.26,),
                                      SizedBox(height: height*0.02,
                                        child:const Image(image: AssetImage("assets/images/Star 1.png")),
                                      ),
                                      const SizedBox(width: 5,),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: const Text("4.0",style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: "spartan")),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text("\$999",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                                ],
                              )
                          )
                        ],
                      ),
                    );
                  },),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
