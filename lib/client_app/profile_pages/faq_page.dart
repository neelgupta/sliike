// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class faq_page extends StatefulWidget {
  const faq_page({Key? key}) : super(key: key);

  @override
  State<faq_page> createState() => _faq_pageState();
}

class _faq_pageState extends State<faq_page> {
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
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("FAQ",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
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
              const TextField(
                style: TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Describe your issue"
                ),
              ),
              SizedBox(height: height*0.02,),
              SizedBox(
                height: height*0.80,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: const [
                          Text("How can I upload my busness on Sliike?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black)),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_down_rounded,size: 30,)
                        ],),
                      const Divider(color: Colors.black54,)
                    ],
                  );
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
