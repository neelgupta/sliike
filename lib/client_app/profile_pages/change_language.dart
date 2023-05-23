// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class change_language extends StatefulWidget {
  const change_language({Key? key}) : super(key: key);

  @override
  State<change_language> createState() => _change_languageState();
}

class _change_languageState extends State<change_language> {
  String? language = "";
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
                    SizedBox(width: width*0.15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("change_language",
                            style: TextStyle(
                                fontSize: 20,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: height*0.04,),
              const Text("language",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontFamily: "spartan",
                  )
              ).tr(),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  Radio(
                    activeColor: const Color(0xFFDD6A03),
                    value: "English",
                    groupValue: language,
                    onChanged: (value) {
                    setState(() {
                      language = value.toString();
                    });
                    context.locale = const Locale('en','US');
                  },),
                  const Text("english",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "spartan",
                      )
                  ).tr(),
                ],
              ),
              Row(
                children: [
                  Radio(
                    activeColor: const Color(0xFFDD6A03),
                    value: "French",
                    groupValue: language,
                    onChanged: (value) {
                    setState(() {
                      language = value.toString();
                    });
                    context.locale = const Locale('fr','EU');
                  },),
                  const Text("french",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "spartan",
                      )
                  ).tr(),
                ],
              ),
              SizedBox(height: height*0.52,),
              GestureDetector(
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
                    child: const Text("save",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.white
                        )
                    ).tr()
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}
