// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class user_profile extends StatefulWidget {
  const user_profile({Key? key}) : super(key: key);

  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
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
        toolbarHeight: height * 0.15, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                        )),
                    SizedBox(
                      width: width * 0.30,
                    ),
                    Image.asset("assets/images/Group 12788.png",
                        height: height * 0.10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.60,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        children: const [
                          Text("Beauty",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("4:30pm",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        height: height * 0.20,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFFF3F3F3)),
                        child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum. In hac habitasse platea dictumst. Nullam hendrerit dictum magna, vitae aliquet turpis rutrum commodo.",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black54,
                            )),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Divider(
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: const [
                          Text("Response",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("3 Responses",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/Group 12788.png",
                              height: height * 0.08),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.55,
                                height: height * 0.10,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    border: Border.all(color: Colors.black54)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              const Text("4:40pm",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          const Spacer(),
                          Image.asset("assets/images/Group 12774.png",
                              height: height * 0.06),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Divider(
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/Group 12788.png",
                              height: height * 0.08),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.55,
                                height: height * 0.10,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    border: Border.all(color: Colors.black54)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              const Text("4:40pm",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          const Spacer(),
                          Image.asset("assets/images/Group 12774.png",
                              height: height * 0.06),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black54,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text("Reply Post",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "spartan",
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: height * 0.01,
            ),
            const Divider(
              color: Colors.black54,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: const [
                  Text("Title: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "spartan",
                        color: Colors.black54,
                      )),
                  Text("Beauty",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "spartan",
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.07,
                    width: width * 0.70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF3F3F3),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        style: TextStyle(fontFamily: "spartan", fontSize: 12),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Message"),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/Group 12782.png",
                      height: height * 0.07),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
