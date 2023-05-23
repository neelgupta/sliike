// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/brands_page/brands_search.dart';
import 'package:new_sliikeapps_apps/client_app/brands_page/product_info.dart';

class brands extends StatefulWidget {
  const brands({Key? key}) : super(key: key);

  @override
  State<brands> createState() => _brandsState();
}

class _brandsState extends State<brands> {
  bool view = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return view == false?Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/bgappbar.png"),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("brands",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold)).tr(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: height*0.04,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const brands_search();
                  },));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.03),
                  width: width,
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
                      const Text("search_categories",style: TextStyle(fontSize: 12,fontFamily: "spartan"),).tr()
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.04,),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: const Text("my_favorites",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            view = true;
                          });
                        },
                        child: Container(
                          child: const Text("see_all",style: TextStyle(color: Color(0xFFDD5103),fontSize: 14,fontFamily: "spartan",)).tr(),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Color(0xFFDD5103))
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return product_detail();
                  // },));
                },
                child: SizedBox(
                  height: height*0.35,
                  child: ListView.builder(
                    itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)
                        ),
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
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text("Rose",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",)),
                                    ),
                                    const SizedBox(height: 5,),
                                    const Text("Makeup kit",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan")),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),
              SizedBox(height: height*0.02,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text("mack_up",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                      ),
                      const Spacer(),
                      Container(
                        child: const Text("see_all",style: TextStyle(color: Color(0xFFDD5103),fontSize: 14,fontFamily: "spartan",)).tr(),
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Color(0xFFDD5103))
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return product_detail();
                  // },));
                },
                child: SizedBox(
                  height: height*0.35,
                  child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)
                        ),
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
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text("Rose",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",)),
                                    ),
                                    const SizedBox(height: 5,),
                                    const Text("Makeup kit",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan")),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),
              SizedBox(height: height*0.02,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text("fashion",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                      ),
                      const Spacer(),
                      Container(
                        child: const Text("see_all",style: TextStyle(color: Color(0xFFDD5103),fontSize: 14,fontFamily: "spartan",)).tr(),
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Color(0xFFDD5103))
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return product_detail();
                  // },));
                },
                child: SizedBox(
                  height: height*0.35,
                  child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)
                        ),
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
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text("Rose",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",)),
                                    ),
                                    const SizedBox(height: 5,),
                                    const Text("Makeup kit",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan")),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),
              SizedBox(height: height*0.02,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: const Text("home",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                      ),
                      const Spacer(),
                      Container(
                        child: const Text("see_all",style: TextStyle(color: Color(0xFFDD5103),fontSize: 14,fontFamily: "spartan",)).tr(),
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Color(0xFFDD5103))
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return product_detail();
                  // },));
                },
                child: SizedBox(
                  height: height*0.35,
                  child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)
                        ),
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
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text("Rose",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",)),
                                    ),
                                    const SizedBox(height: 5,),
                                    const Text("Makeup kit",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan")),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  },),
                ),
              ),
              SizedBox(height: height*0.02,),
            ],
          ),
        ),
      ),
    ):viewall();
  }

  Widget viewall(){
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
                        setState(() {
                          view = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("brands",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)).tr(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: height*0.04,),
            InkWell(
              onTap: () {
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width*0.03),
                width: width,
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
                    const Text("search_categories",style: TextStyle(fontSize: 12,fontFamily: "spartan"),).tr()
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            const Divider(color: Colors.black54,),
            SizedBox(height: height*0.02,),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: const Text("my_favorites",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)).tr(),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          view = false;
                        });
                      },
                      child: Container(
                        child: const Text("see_less",style: TextStyle(color: Color(0xFFDD5103),fontSize: 14,fontFamily: "spartan",)).tr(),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Color(0xFFDD5103))
                  ],
                ),
              ],
            ),
            SizedBox(height: height*0.02,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const product_info();
                },));
              },
              child: SizedBox(
                height: height*0.56,
                child: ListView.builder(
                  itemCount: 5,scrollDirection: Axis.vertical,itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      height: height*0.35,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: height*0.25,
                            width: width,
                            decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage("assets/images/Rectangle 964.png"),fit: BoxFit.fill),
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            margin: const EdgeInsets.all(5),
                          ),
                          Padding(padding: const EdgeInsets.only(left: 15,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: const Text("Rose",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "spartan",)),
                                  ),
                                  const SizedBox(height: 5,),
                                  const Text("Makeup kit",style: TextStyle(color: Colors.black54,fontSize: 14,fontFamily: "spartan")),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  );
                },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
