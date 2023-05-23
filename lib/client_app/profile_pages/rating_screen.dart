// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class rating_scareen extends StatefulWidget {
  const rating_scareen({Key? key}) : super(key: key);

  @override
  State<rating_scareen> createState() => _rating_scareenState();
}

class _rating_scareenState extends State<rating_scareen> {
  bool rat =  true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height*0.45,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.02,),
                        Row(
                          children: [
                            const Spacer(),
                            const Text("skip",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "spartan",
                                    color: Colors.black54
                                )
                            ).tr()
                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        rat == true ? Column(
                          children: [
                            const Text("Sliike",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                )
                            ).tr(),
                            SizedBox(height: height*0.02,),
                            const Text("experience",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black54,
                                )
                            ).tr(),
                            const Text("on",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black54,
                                )
                            ).tr(),
                            SizedBox(height: height*0.02,),
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                Future.delayed(const Duration(seconds: 1)).then((value) {
                                  setState(() {
                                    rat = false;
                                  });
                                });
                              },
                            )
                          ],
                        ):Column(
                          children: [
                            const Text("drop",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                )
                            ).tr(),
                            SizedBox(height: height*0.02,),
                            const Text("let",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black54,
                                )
                            ).tr(),
                            const Text("about_sliike",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.black54,
                                )
                            ).tr(),
                            SizedBox(height: height*0.02,),
                            const TextField(
                              maxLines: 3,
                              style: TextStyle(fontFamily: "spartan",fontSize: 12),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height*0.03,),
                            Container(
                              alignment: Alignment.center,
                              width: width*0.35,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffDD6A03)),
                              child: const Text("submit",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                      color: Colors.white)).tr(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
