// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class beauty_filter extends StatefulWidget {
  const beauty_filter({Key? key}) : super(key: key);

  @override
  State<beauty_filter> createState() => _beauty_filterState();
}

class _beauty_filterState extends State<beauty_filter> {
  double _startValue = 0.0;
  double _endValue = 90.0;
  String? character = "recommended";
  String? gender = "male";
  List demography = [
    "Blacks",
    "Hispanic/Latino",
    "Asian",
    "Indigenous (North America)",
    "Mixed Race",
    "Others",
    "White or Caucasian "
  ];
  List service = [
    "All Categories",
    "Barber",
    "Hair Care",
    "Make-up",
    "Facials/Skin Care",
    "Spa",
    "Tattoo Art",
    "Nails",
    "Photography",
    "Massage",
    "Beauty Consultant",
    "Beauty Product Shop"
  ];
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
                color: Color(0xFFFCF0E6),
                image: DecorationImage(
                    image: AssetImage("assets/images/bgappbar.png"),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                                image: AssetImage("assets/images/Group 55.png"),
                                color: Colors.black,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Filter",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text("Product Categories",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 10,
                      spacing: 8,
                      children: [
                        for (int i = 0; i < service.length; i++)
                          Container(
                            height: height * 0.06,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black45)),
                            child: Text(
                              service[i],
                              style: const TextStyle(
                                  fontFamily: "spartan",
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text("Demography",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 10,
                      spacing: 8,
                      children: [
                        for (int i = 0; i < demography.length; i++)
                          Container(
                            height: height * 0.06,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black45)),
                            child: Text(
                              demography[i],
                              style: const TextStyle(
                                  fontFamily: "spartan",
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text("Sort By",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              activeColor: const Color(0xFFDD5103),
                              value: "recommended",
                              groupValue: character,
                              onChanged: (value) {
                                setState(() {
                                  character = value.toString();
                                });
                              },
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text("Recommended For You",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              activeColor: const Color(0xFFDD5103),
                              value: "favorites",
                              groupValue: character,
                              onChanged: (value) {
                                setState(() {
                                  character = value.toString();
                                });
                              },
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text("My Favorites",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              activeColor: const Color(0xFFDD5103),
                              value: "top",
                              groupValue: character,
                              onChanged: (value) {
                                setState(() {
                                  character = value.toString();
                                });
                              },
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text("Top Rated",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Container(
                  height: height * 0.06,
                  color: const Color(0xffF3F3F3),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Filters",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w600)),
                        Text("Clear All",
                            style: TextStyle(
                              color: Color(0xFFDD5103),
                              fontSize: 14,
                              fontFamily: "spartan",
                            )),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text("Gender",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w600)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              value: "male",
                              groupValue: gender,
                              activeColor: const Color(0xFFDD5103),
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              },
                            ),
                            const Text("Male",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                )),
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              value: "female",
                              groupValue: gender,
                              activeColor: const Color(0xFFDD5103),
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              },
                            ),
                            const Text("Female",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                )),
                            Radio(
                              visualDensity: const VisualDensity(
                                  horizontal: 0, vertical: 0),
                              value: "other",
                              groupValue: gender,
                              activeColor: const Color(0xFFDD5103),
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              },
                            ),
                            const Text("Other",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                )),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text("Price Range",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffA0A0A0)),
                                color: const Color(0xff292929),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: textComoon(
                                      "\$", 12, Colors.white, FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                height: 1,
                                width: width * 0.15,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffA0A0A0)),
                                color: const Color(0xff292929),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: textComoon("\$\$", 10, Colors.white,
                                      FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                height: 1,
                                width: width * 0.15,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffA0A0A0)),
                                color: const Color(0xffffffff),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: textComoon(
                                      "\$\$\$",
                                      10,
                                      const Color(0xff292929),
                                      FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                height: 1,
                                width: width * 0.15,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffA0A0A0)),
                                color: const Color(0xffffffff),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: textComoon(
                                      "\$\$\$\$",
                                      10,
                                      const Color(0xff292929),
                                      FontWeight.w500)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Center(
                                child: Text("Distance",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600))),
                            Center(
                                child: Text("5.0 km",
                                    style: TextStyle(
                                        color: Color(0xff414141),
                                        fontSize: 12,
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600))),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RangeSlider(
                          min: 0.0,
                          max: 100.0,
                          inactiveColor: const Color(0xffCFCFCF),
                          activeColor: const Color(0xffDD6A03),
                          values: RangeValues(_startValue, _endValue),
                          onChanged: (values) {
                            setState(() {
                              _startValue = values.start;
                              _endValue = values.end;
                            });
                          },
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: height * 0.07,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: const Text("Clear All"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: height * 0.07,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFDD5103)),
                                  color: const Color(0xFFDD5103),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: const Text(
                                "APPLY",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
