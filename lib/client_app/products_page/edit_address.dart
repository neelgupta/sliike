// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class edit_address extends StatefulWidget {
  const edit_address({Key? key}) : super(key: key);

  @override
  State<edit_address> createState() => _edit_addressState();
}

class _edit_addressState extends State<edit_address> {
  bool defulat = false;
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
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(
                  image: AssetImage("assets/images/bgappbar.png"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height * 0.06,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              image: AssetImage("assets/images/Vector.png"),
                              height: 18,
                              width: 18,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Shipping Info",
                            style: TextStyle(
                                fontSize: 18,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                "Edit Address",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: "spartan",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const TextField(
                style: TextStyle(fontFamily: "spartan", fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "First Name",
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const TextField(
                style: TextStyle(fontFamily: "spartan", fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Last Name",
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.08,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black12),
                    color: const Color(0xFFE7E7E7)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Canada",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "spartan",
                      )),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const TextField(
                style: TextStyle(fontFamily: "spartan", fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Province",
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const TextField(
                style: TextStyle(fontFamily: "spartan", fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone Number",
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const TextField(
                style: TextStyle(fontFamily: "spartan", fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Zip Code",
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const TextField(
                style: TextStyle(fontFamily: "spartan", fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Delivery Address",
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width * 0.50,
                child: const TextField(
                  style: TextStyle(fontFamily: "spartan", fontSize: 12),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Apartment",
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: const Color(0xFFDD6A03),
                    value: defulat,
                    onChanged: (bool? value) {
                      setState(() {
                        defulat = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Text("Set as default address",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "spartan",
                      )),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * 0.43,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: const Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.black)),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return appointments();
                      // },));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * 0.43,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffDD6A03)),
                          color: const Color(0xffDD6A03),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "spartan",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
