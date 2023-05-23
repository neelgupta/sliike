// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class yourProfile_One extends StatefulWidget {
  const yourProfile_One({Key? key}) : super(key: key);

  @override
  State<yourProfile_One> createState() => _yourProfile_OneState();
}

class _yourProfile_OneState extends State<yourProfile_One> {
  String _selected= 'first';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.18, //
        flexibleSpace: Container(
          color: const Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 20,  bottom: 20),
                child: Column(
                  children: [
                    Row(
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
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image:
                                    AssetImage("assets/images/backwhite.png"),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Your Profile?",
                                style: TextStyle(
                                    fontSize: 14, overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),

                      ],
                    ),

                    Row(
                      children: const [
                        SizedBox(width: 60,),
                        Expanded(
                          child: Text("Are you an Independent Beautician or a Salon\nOwner?",
                              style: TextStyle(
                                  fontSize: 10,
                                   // you can change it accordingly
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),

            Container(
              decoration: BoxDecoration(

                border: Border.all(width: 1, color: const Color(0xffCFCFCF),),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10),
                child: Column(
                  children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [


                          Radio(value: "first", activeColor: const Color(0xff01635D), groupValue: _selected, onChanged: (value) {
                            setState(() {
                              _selected = value as String;

                            });
                          }),

                          const Text("I own a salon",style: TextStyle(fontSize: 15,fontFamily: 'spartan',color: Color(0xff414141)),),
                        ],
                      ),
                      InkWell(onTap: (){},
                          child: const Icon(Icons.keyboard_arrow_down,size: 30,color: Color(0xff707070),))
                    ],
                  )


                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(

                border: Border.all(width: 1, color: const Color(0xffCFCFCF),),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10),
                child: Column(
                  children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [


                          Radio(value: "second", activeColor: const Color(0xff01635D), groupValue: _selected, onChanged: (value) {
                            setState(() {
                              _selected = value as String;

                            });
                          }),

                          const Text("I am independent",style: TextStyle(fontSize: 15,fontFamily: 'spartan',color: Color(0xff414141)),),
                        ],
                      ),
                      InkWell(onTap: (){},
                          child: const Icon(Icons.keyboard_arrow_down,size: 30,color: Color(0xff707070),))
                    ],
                  )


                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {

                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return locaionAllow();
                //   },
                // ));
              },
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff01635D)),
                child: const Text("SAVE",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
