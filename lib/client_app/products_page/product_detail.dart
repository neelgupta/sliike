// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/cart.dart';

class product_detail extends StatefulWidget {
  const product_detail({Key? key}) : super(key: key);

  @override
  State<product_detail> createState() => _product_detailState();
}

class _product_detailState extends State<product_detail> {
  int black = 0;
  int gold = 0;
  int blonde = 0;
  int wine = 0;
  @override
  Widget build(BuildContext context) {
    List service= ["Black","Gold","Blonde","Wine red"];
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height*0.45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/Rectangle 146.png"),fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: 30,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height*0.12,
                      alignment: Alignment.centerLeft,
                      child: Image.asset("assets/images/Bach Arrow.png",fit: BoxFit.fill,),
                    ),
                  ),
                ),
                Positioned(
                   top: 55,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const cart();
                      },));
                    },
                    child: Container(
                      height: height*0.05,
                      alignment: Alignment.centerRight,
                      child: Image.asset("assets/images/cart.png"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/Rectangle 146.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 05),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/Rectangle 960.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 05),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/Rectangle 961.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 05),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/Rectangle 959.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 05),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/Rectangle 962.png",fit: BoxFit.fill,),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Subaru Hair Dye Blonde/Wine Red/Gold/Black 1 PCS",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset("assets/images/Star 1.png"),
                  ),
                  SizedBox(width: width*0.01,),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset("assets/images/Star 1.png"),
                  ),
                  SizedBox(width: width*0.01,),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset("assets/images/Star 1.png"),
                  ),
                  SizedBox(width: width*0.01,),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset("assets/images/Star 1.png",color: Colors.black54,),
                  ),
                  SizedBox(width: width*0.01,),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: Image.asset("assets/images/Star 1.png",color: Colors.black54,),
                  ),
                  SizedBox(width: width*0.02,),
                  const Text("(8 Ratings)",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontFamily: "spartan")),
                  const Spacer(),
                  const Icon(Icons.share,color: Color(0xFFDD6A03),size: 20,),
                  SizedBox(width: width*0.02,),
                  Image.asset('assets/images/hart.png',fit: BoxFit.fill,height: 25,width: 25,color: const Color(0xFFDD6A03),),
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("\$999",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: height*0.01,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("+shipping to anywhere within your region for affordable price.",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontFamily: "spartan",)),
            ),
            SizedBox(height: height*0.02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text("available_variation",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "spartan",
                      fontWeight: FontWeight.bold)).tr(),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Wrap(alignment: WrapAlignment.start,
                runSpacing: 13,
                spacing: 15,
                children: [
                  for(int i=0;i<service.length;i++)
                    Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45)
                      ),
                      child: Text(service[i],style: const TextStyle(fontFamily: "spartan",fontSize: 12,color: Colors.black54),),
                    )
                ],
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text("product_description",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "spartan",
                          )).tr(),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_sharp,size: 20,)
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: Colors.black54,),
            ),
            SizedBox(height: height*0.02,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("Subaru Unisex hair colorant is a high quality\nHair Dye that has conditioning properties and\nLeaves a long lasting colour on your hair.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "spartan",
                  )),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    variation();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffDD6A03)),
                  child: const Text("add_to_cart",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)).tr(),
                ),
              ),
            ),
            SizedBox(height: height*0.04,),
          ],
        ),
      ),
    );
  }
  variation() {
    double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;
    showDialog(context: context, builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.all(10),
        child: Container(
          height: height - 260 ,
          width: width - 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.02,),
                const Text("select_variation",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold)).tr(),
                SizedBox(height: height*0.01,),
                const Divider(color: Colors.black54,),
                SizedBox(height: height*0.02,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("black",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan")).tr(),
                        const Text("\$999",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if(black < 1){
                          return;
                        }
                        setState(() {
                          black--;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add.png"),
                      ),
                    ),
                    SizedBox(width: width*0.08,),
                    SizedBox(
                      width: width*0.06,
                      child: Text("$black",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "spartan",)),
                    ),
                    SizedBox(width: width*0.05,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          black++;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add 1.png"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("gold",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan")).tr(),
                        const Text("\$999",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if(gold < 1){
                          return;
                        }
                        setState(() {
                          gold--;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add.png"),
                      ),
                    ),
                    SizedBox(width: width*0.08,),
                    SizedBox(
                      width: width*0.06,
                      child: Text("$gold",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "spartan",)),
                    ),
                    SizedBox(width: width*0.05,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gold++;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add 1.png"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("blonde",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan")).tr(),
                        const Text("\$999",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if(blonde < 1){
                          return;
                        }
                        setState(() {
                          blonde--;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add.png"),
                      ),
                    ),
                    SizedBox(width: width*0.08,),
                    SizedBox(
                      width: width*0.06,
                      child: Text("$blonde",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "spartan",)),
                    ),
                    SizedBox(width: width*0.05,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          blonde++;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add 1.png"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("wine_red",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan")).tr(),
                        const Text("\$999",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if(wine < 1){
                          return;
                        }
                        setState(() {
                          wine--;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add.png"),
                      ),
                    ),
                    SizedBox(width: width*0.08,),
                    SizedBox(
                      width: width*0.06,
                      child: Text("$wine",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "spartan",)),
                    ),
                    SizedBox(width: width*0.05,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          wine++;
                        });
                      },
                      child: SizedBox(
                        height: height*0.10,
                        width: width*0.10,
                        child: Image.asset("assets/images/add 1.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.04,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffDD6A03)),
                    child: const Text("add_to_cart",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.white)).tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}
