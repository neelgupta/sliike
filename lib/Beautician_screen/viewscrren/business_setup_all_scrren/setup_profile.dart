// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/business_setup_all_scrren/bussiness_info.dart';

class setup_profile extends StatefulWidget {
  const setup_profile({Key? key}) : super(key: key);

  @override
  State<setup_profile> createState() => _setup_profileState();
}

class _setup_profileState extends State<setup_profile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.4,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Group 12006.jpg"),
                    fit: BoxFit.fill)),
            child: Center(
              child: SizedBox(
                  height: height * 0.2,
                  width: width * 0.2,
                  child: Image.asset("assets/images/setupprofile.png")),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Text("Set up and start doing business in\n4 simple steps.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff292929),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Text(
                  "Your profile allows clients to search, find,\nbook and pay for your services and\nproducts.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff414141),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.normal)),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return const BussIneSSInfo();
                  },
                ),(route) => false,);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff01635D)),
                child: const Text("START SETUP",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
