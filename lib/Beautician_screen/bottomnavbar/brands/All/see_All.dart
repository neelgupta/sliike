import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/brands/brand_productList/brand_list.dart';

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  bool seeAll = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
        body: seeAll
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 5, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "My Favorites",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  seeAll = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text("See All",
                                      style: TextStyle(
                                        color: Color(0xff01635D),
                                        fontSize: 14,
                                        fontFamily: "spartan",
                                      )),
                                  Container(
                                      alignment: Alignment.topRight,
                                      child: const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xff01635D),
                                        size: 25,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const brand_List();
                            },
                          ));
                        },
                        child: SizedBox(
                          height: height * 0.36,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xff969696))),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: height * 0.25,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/brandsrose.png"),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        margin: const EdgeInsets.all(5),
                                      ),
                                      SizedBox(
                                        width: width * 0.8,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: const Text("Rose",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                "spartan",
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                  const Text("Makeup kit",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "spartan")),
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.topRight,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffCFCFCF),
                                                        width: 1)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Image.asset(
                                                      "assets/images/fav.png",
                                                      fit: BoxFit.fill,
                                                      height: 25),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 5, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Cosmetics",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("See All",
                                        style: TextStyle(
                                          color: Color(0xff01635D),
                                          fontSize: 14,
                                          fontFamily: "spartan",
                                        )),
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0xff01635D),
                                          size: 25,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: SizedBox(
                        height: height * 0.36,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xff969696))),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: height * 0.25,
                                      width: width * 0.8,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/brandsrose.png"),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      margin: const EdgeInsets.all(5),
                                    ),
                                    SizedBox(
                                      width: width * 0.8,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text("Rose",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily: "spartan",
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                const Text("Makeup kit",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "spartan")),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffCFCFCF),
                                                      width: 1)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Image.asset(
                                                    "assets/images/fav.png",
                                                    fit: BoxFit.fill,
                                                    height: 25),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 5, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Fashion",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("See All",
                                        style: TextStyle(
                                          color: Color(0xff01635D),
                                          fontSize: 14,
                                          fontFamily: "spartan",
                                        )),
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0xff01635D),
                                          size: 25,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: SizedBox(
                        height: height * 0.36,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xff969696))),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: height * 0.25,
                                      width: width * 0.8,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/brandsrose.png"),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      margin: const EdgeInsets.all(5),
                                    ),
                                    SizedBox(
                                      width: width * 0.8,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text("Rose",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily: "spartan",
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                const Text("Makeup kit",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "spartan")),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffCFCFCF),
                                                      width: 1)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Image.asset(
                                                    "assets/images/fav.png",
                                                    fit: BoxFit.fill,
                                                    height: 25),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    ///Home Care
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 5, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Home Care",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("See All",
                                        style: TextStyle(
                                          color: Color(0xff01635D),
                                          fontSize: 14,
                                          fontFamily: "spartan",
                                        )),
                                    Container(
                                        alignment: Alignment.topRight,
                                        child: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Color(0xff01635D),
                                          size: 25,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: SizedBox(
                        height: height * 0.36,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xff969696))),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: height * 0.25,
                                      width: width * 0.8,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/brandsrose.png"),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      margin: const EdgeInsets.all(5),
                                    ),
                                    SizedBox(
                                      width: width * 0.8,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text("Rose",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily: "spartan",
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                const Text("Makeup kit",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "spartan")),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffCFCFCF),
                                                      width: 1)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Image.asset(
                                                    "assets/images/fav.png",
                                                    fit: BoxFit.fill,
                                                    height: 25),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 5, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("My Favorites",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w600)),
                          InkWell(
                            onTap: () {
                              setState(() {
                                seeAll = true;
                              });
                              print("....$seeAll");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("See Less",
                                    style: TextStyle(
                                      color: Color(0xff01635D),
                                      fontSize: 14,
                                      fontFamily: "spartan",
                                    )),
                                Container(
                                    alignment: Alignment.topRight,
                                    child: const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color(0xff01635D),
                                      size: 25,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xff969696))),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const brand_List();
                                          },
                                        ));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: height * 0.25,
                                        width: width,
                                        decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/brandsrose.png"),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        margin: const EdgeInsets.all(5),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: const Text("Rose",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily: "spartan",
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                                const Text("Makeup kit",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "spartan")),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffCFCFCF),
                                                      width: 1)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Image.asset(
                                                    "assets/images/fav.png",
                                                    fit: BoxFit.fill,
                                                    height: 25),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
