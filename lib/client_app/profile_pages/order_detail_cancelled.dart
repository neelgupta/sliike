// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class order_detail_cancelled extends StatefulWidget {
  const order_detail_cancelled({Key? key}) : super(key: key);

  @override
  State<order_detail_cancelled> createState() => _order_detail_cancelledState();
}

class _order_detail_cancelledState extends State<order_detail_cancelled> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFCF0E6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_sharp,size: 30,)),
                    SizedBox(width: width*0.15),
                    const Text("order_details",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "spartan",
                            color: Colors.black,
                          fontWeight: FontWeight.bold
                        )).tr(),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.04,),
              Row(
                children: const [
                  Text("Subaru Hair Dye Blond",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black
                      )
                  ),
                  Spacer(),
                  Text("x1",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black
                      )
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  const Text("status",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black54
                      )
                  ).tr(),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD90000)
                    ),
                    width: width*0.30,
                    height: height*0.05,
                    child: const Text("cancelled",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "spartan",
                            color: Colors.white
                        )
                    ).tr(),
                  )
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.01,),
              Row(
                children: [
                  const Text("subtotal",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black54
                      )
                  ).tr(),
                  const Spacer(),
                  const Text("\$900",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black
                      )
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  const Text("shipping",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black54
                      )
                  ).tr(),
                  const Spacer(),
                  const Text("Free",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black
                      )
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  const Text("gst/hst",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black54
                      )
                  ).tr(),
                  const Spacer(),
                  const Text("\$5.00",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black
                      )
                  ),
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.01,),
              Row(
                children: [
                  const Text("qst/pst",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black54
                      )
                  ).tr(),
                  const Spacer(),
                  const Text("\$5.00",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black
                      )
                  ),
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.01,),
              Row(
                children: [
                  const Text("total",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black54
                      )
                  ).tr(),
                  const Spacer(),
                  const Text("\$1,009",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black
                      )
                  ),
                ],
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.04,),
              const Text("delivery_address",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "spartan",
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ).tr(),
              SizedBox(height: height*0.02,),
              const Text("Alex Roderic",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("825 Dawson Island",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("Apt 30",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("Toronto. DE 63324",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("Canada",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  )
              ),
              SizedBox(height: height*0.01,),
              const Divider(color: Colors.black54,),
              SizedBox(height: height*0.01,),
              const Text("buyer_detail",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "spartan",
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ).tr(),
              SizedBox(height: height*0.02,),
              const Text("Nino Simmones",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  )
              ),
              SizedBox(height: height*0.02,),
              const Text("(817)877-1977",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "spartan",
                    color: Colors.black54,
                  )
              ),
              SizedBox(height: height*0.04,),
              GestureDetector(
                onTap: () {
                  setState(() {

                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffDD6A03)),
                    child: const Text("rebook_order",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.white)).tr()
                ),
              ),
              SizedBox(height: height*0.04,),
            ],
          ),
        ),
      ),
    );
  }
}
