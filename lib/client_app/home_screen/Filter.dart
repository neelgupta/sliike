// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/advanced_search.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/near_you_screen.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/search_screen.dart';
import 'package:http/http.dart' as http;
import '../../utils/apiurllist.dart';

class filterpage extends StatefulWidget {
  const filterpage({Key? key}) : super(key: key);

  @override
  State<filterpage> createState() => _filterpageState();
}

class _filterpageState extends State<filterpage> {
  double _startValue = 0.0;
  double _endValue = 200.0;
  String? character = "forYou";
  String? gender = "Male";
  ServiceCategories? s;
  Demography? d;
  bool isLoading = false;
  String beuauticianPlace = "";
  String latitude = "";
  String longitude = "";
  String address = "";
  String myPlace = "";
  String dontMind = "";
  bool price = false;
  bool price1 = false;
  bool price2 = false;
  bool price3 = false;
  int priceValue = 0;
  List<String> selectedService = [];
  List<String> selectedDemography = [];
  List<PrferenceNameModel> preferenceName = [
    PrferenceNameModel(
      prefenceName: "At beautician  place",
      isSelected: false,
      place: 0,
    ),
    PrferenceNameModel(
      prefenceName: "At my place",
      isSelected: false,
      place: 1,
    ),
    PrferenceNameModel(
      prefenceName: "I don't mind",
      isSelected: false,
      place: 2,
    )
  ];
  List<ServiceCategorieData> serviceName = [];
  List<DemographyData> demographyName = [];
  bool Change = false;

  @override

  void initState() {
    fetchServiceCategories();
    getDemography();
    setState(() {
      price = true;
    });
    super.initState();
  }

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
                      const EdgeInsets.only(left: 10, right: 20, bottom: 10),
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
                        width: width * 0.30,
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
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffDD6A03),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const AdvancedSearch();
                                },
                              ));
                            },
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    border: Border.all(
                                        color: const Color(0xFFDD5103))),
                                height: height * 0.07,
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                        image: const AssetImage(
                                          "assets/images/search.png",
                                        ),
                                        color: const Color(0xFFDD5103),
                                        height: height * 0.025),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      "Go To Advanced Search",
                                      style: TextStyle(
                                          fontFamily: "spartan",
                                          color: Color(0xFFDD5103),
                                          fontSize: 12),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Location & Time",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const NearYou();
                                      },
                                    )).then((value) {
                                      if (value != null) {
                                        latitude = value[0];
                                        longitude = value[1];
                                        address = value[2];
                                        setState(() {});
                                      }
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      height: height * 0.06,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Image(
                                                image: const AssetImage(
                                                  "assets/images/Group 71.png",
                                                ),
                                                color: const Color(0xFFDD5103),
                                                height: height * 0.03),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Text(
                                              address.isEmpty
                                                  ? "Near You"
                                                  : address,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          address.isEmpty
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      address = "";
                                                      latitude = "";
                                                      longitude = "";
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    size: 20,
                                                    color: Colors.black12,
                                                  )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(color: Colors.grey)),
                                    height: height * 0.06,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Image(
                                              image: const AssetImage(
                                                "assets/images/note.png",
                                              ),
                                              color: const Color(0xFFDD5103),
                                              height: height * 0.03),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "All Availabities",
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                                "Where do you want us to serve you?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          runSpacing: 10,
                          spacing: 8,
                          children: [
                            for (int i = 0; i < preferenceName.length; i++)
                              GestureDetector(
                                onTap: () {
                                  for (var item in preferenceName) {
                                    if (item.prefenceName ==
                                        preferenceName[i].prefenceName) {
                                      if (preferenceName[i].place == 0) {
                                        myPlace = "0";
                                      } else if (preferenceName[i].place == 1) {
                                        myPlace = "1";
                                      } else {
                                        myPlace = "2";
                                      }
                                      setState(() {
                                        preferenceName[i].isSelected =
                                            !preferenceName[i].isSelected;
                                      });
                                    } else {
                                      setState(() {
                                        item.isSelected = false;
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  height: height * 0.06,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: preferenceName[i].isSelected
                                              ? const Color(0xFFDD5103)
                                              : Colors.black45),
                                      color: preferenceName[i].isSelected
                                          ? const Color(0xFFDD5103)
                                          : Colors.transparent),
                                  child: Text(
                                    preferenceName[i].prefenceName,
                                    style: TextStyle(
                                        fontFamily: "spartan",
                                        fontSize: 16,
                                        color: preferenceName[i].isSelected
                                            ? Colors.white
                                            : Colors.black54),
                                  ),
                                ),
                              )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Services",
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
                        Wrap(
                          alignment: WrapAlignment.start,
                          runSpacing: 10,
                          spacing: 8,
                          children: [
                            for (int i = 0; i < serviceName.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    serviceName[i].isSelected =
                                        !serviceName[i].isSelected;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 25),
                                  height: height * 0.06,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: serviceName[i].isSelected
                                              ? const Color(0xFFDD5103)
                                              : Colors.black45),
                                      color: serviceName[i].isSelected
                                          ? const Color(0xFFDD5103)
                                          : Colors.transparent),
                                  child: Text(
                                    "${serviceName[i].serviceCategoryName}",
                                    style: TextStyle(
                                        fontFamily: "spartan",
                                        fontSize: 16,
                                        color: serviceName[i].isSelected
                                            ? Colors.white
                                            : Colors.black54),
                                  ),
                                ),
                              )
                          ],
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            runSpacing: 10,
                            spacing: 8,
                            children: [
                              for (int i = 0; i < demographyName.length; i++)
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      demographyName[i].isSelected =
                                          !demographyName[i].isSelected;
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.06,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: demographyName[i].isSelected
                                                ? const Color(0xFFDD5103)
                                                : Colors.black45),
                                        color: demographyName[i].isSelected
                                            ? const Color(0xFFDD5103)
                                            : Colors.transparent),
                                    child: Text(
                                      "${demographyName[i].demographyName}",
                                      style: TextStyle(
                                          fontFamily: "spartan",
                                          fontSize: 16,
                                          color: demographyName[i].isSelected
                                              ? Colors.white
                                              : Colors.black54),
                                    ),
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
                                    value: "forYou",
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
                                    value: "myfavorite",
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
                                    value: "topRated",
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
                                    value: "Male",
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
                                    value: "Female",
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
                                    value: "Other",
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        price = true;
                                        price1 = false;
                                        price2 = false;
                                        price3 = false;
                                        priceValue = 10;
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffA0A0A0)),
                                        color: price
                                            ? const Color(0xff292929)
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: textComoon(
                                              "\$20",
                                              12,
                                              price
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w500)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Container(
                                      height: 1,
                                      width: width * 0.15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        price = true;
                                        price1 = true;
                                        price2 = false;
                                        price3 = false;
                                        priceValue = 100;
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffA0A0A0)),
                                        color: price1
                                            ? const Color(0xff292929)
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: textComoon(
                                              "\$99",
                                              10,
                                              price1
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w500)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Container(
                                      height: 1,
                                      width: width * 0.15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        price = true;
                                        price1 = true;
                                        price2 = true;
                                        price3 = false;
                                        priceValue = 1000;
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffA0A0A0)),
                                        color: price2
                                            ? const Color(0xff292929)
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: textComoon(
                                              "\$100",
                                              10,
                                              price2
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w500)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Container(
                                      height: 1,
                                      width: width * 0.15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        price = true;
                                        price1 = true;
                                        price2 = true;
                                        price3 = true;
                                        priceValue = 10000;
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xffA0A0A0)),
                                        color: price3
                                            ? const Color(0xff292929)
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: textComoon(
                                              "\$1000",
                                              08,
                                              price3
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w500)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text("Distance",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "spartan",
                                              fontWeight: FontWeight.w600))),
                                  Center(
                                    child: Text(
                                      "${_startValue.toStringAsFixed(1)} - ${_endValue.toStringAsFixed(1)} km",
                                      style: TextStyle(
                                        color: Color(0xff414141),
                                        fontSize: 12,
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RangeSlider(
                                onChangeStart: (value) {
                                  _startValue = value.start;
                                },
                                onChangeEnd: (value) {
                                  _endValue = value.end;
                                },
                                min: 0.0,
                                max: 200.0,
                                inactiveColor: const Color(0xffCFCFCF),
                                activeColor: const Color(0xffDD6A03),
                                values: RangeValues(_startValue, _endValue),
                                labels: RangeLabels(_startValue.toString(),
                                    _endValue.toString()),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: height * 0.07,
                                      width: width * 0.4,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      child: const Text("Clear All"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        for (var item in serviceName) {
                                          if (item.isSelected) {
                                            selectedService.add(item.id!);
                                          }
                                        }
                                        for (var item in demographyName) {
                                          if (item.isSelected) {
                                            selectedDemography.add(item.id!);
                                          }
                                        }
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return searchScreen(
                                              myPlace: myPlace,
                                              selectedService: selectedService,
                                              selectedDemography:
                                                  selectedDemography,
                                              gender: gender,
                                              sortBy: character,
                                              priceValue: priceValue,
                                              latitude: latitude,
                                              longitude: longitude,
                                            );
                                          },
                                        ));
                                      });
                                    },
                                    child: Container(
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

  fetchServiceCategories() async {
    var geturi = Uri.parse(ApiUrlList.fetchServiceCategories);
    try {
      setState(() {
        isLoading = true;
      });
      log("fetchServiceCategories url is :: $geturi");
      var response = await http.get(geturi);
      log("fetchServiceCategories status code ==> ${response.statusCode}");
      log(" fetchServiceCategories res body is :  ${response.body}");
      selectedService.clear();
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          s = ServiceCategories.fromjson(map);
          serviceName = s!.data!;
        }
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  getDemography() async {
    var geturi = Uri.parse(ApiUrlList.getDemography);
    try {
      setState(() {
        isLoading = true;
      });
      log("getDemography url is :: $geturi");
      var response = await http.get(geturi);
      log("getDemography status code ==> ${response.statusCode}");
      log(" getDemography res body is :  ${response.body}");
      selectedDemography.clear();
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          d = Demography.fromjson(map);
          demographyName = d!.data!;
        }
      } else if (response.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

class ServiceCategories {
  int? status;
  bool? success;
  List<ServiceCategorieData>? data;
  String? message;

  ServiceCategories({this.status, this.success, this.data, this.message});

  factory ServiceCategories.fromjson(Map<dynamic, dynamic> map) {
    List list = map['data'] ?? "";
    List<ServiceCategorieData> data =
        list.map((e) => ServiceCategorieData.fromjson(e)).toList();
    return ServiceCategories(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      data: data,
      message: map['message'] ?? "",
    );
  }
}

class ServiceCategorieData {
  String? id;
  String? serviceCategoryName;
  String? imgPath;
  bool isSelected;

  ServiceCategorieData(
      {this.id,
      this.serviceCategoryName,
      this.imgPath,
      this.isSelected = false});

  factory ServiceCategorieData.fromjson(Map<dynamic, dynamic> map1) {
    return ServiceCategorieData(
        id: map1['_id'] ?? "",
        serviceCategoryName: map1['serviceCategoryName'] ?? "",
        imgPath: map1['imgPath'] ?? "");
  }
}

class Demography {
  int? status;
  bool? success;
  List<DemographyData>? data;
  String? message;

  Demography({this.status, this.success, this.data, this.message});

  factory Demography.fromjson(Map<dynamic, dynamic> map) {
    List list = map['data'] ?? "";
    List<DemographyData> data =
        list.map((e) => DemographyData.fromjson(e)).toList();
    return Demography(
        status: map['status'] ?? 0,
        success: map['success'] ?? false,
        data: data,
        message: map['message'] ?? "");
  }
}

class DemographyData {
  String? id;
  String? demographyName;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? v;
  bool isSelected;

  DemographyData(
      {this.id,
      this.demographyName,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.isSelected = false});

  factory DemographyData.fromjson(Map<dynamic, dynamic> map1) {
    return DemographyData(
      id: map1['_id'] ?? "",
      demographyName: map1['demographyName'] ?? "",
      status: map1['status'] ?? 0,
      createdAt: map1['createdAt'] ?? "",
      updatedAt: map1['updatedAt'] ?? "",
      v: map1['__v'] ?? 0,
    );
  }
}

class PrferenceNameModel {
  String prefenceName;
  bool isSelected;
  int place;

  PrferenceNameModel(
      {required this.prefenceName,
      required this.isSelected,
      required this.place});
}
