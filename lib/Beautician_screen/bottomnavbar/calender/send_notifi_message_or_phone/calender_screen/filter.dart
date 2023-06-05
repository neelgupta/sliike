import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../services/calender_service.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../b_model/employee_get_list.dart';

// ignore: camel_case_types
class filter extends StatefulWidget {
  const filter({Key? key}) : super(key: key);

  @override
  State<filter> createState() => _filterState();
}

// ignore: camel_case_types
class _filterState extends State<filter> {
  String selected = 'onlyme';
  bool checkboxvalue = false;
  bool box = false;
  bool isLoading = false;

  TextEditingController search = TextEditingController();

  List<EmployeeData> employeeDataList = [];

  CalenderService calenderService = CalenderService();

  getBeauticianAllEmployees() async {
    setState(() {
      isLoading = true;
    });

    employeeDataList.clear();

    employeeDataList = await calenderService.getBeauticianAllEmployeesList();

    log("employeesGetList len ${employeeDataList.length}");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getBeauticianAllEmployees();
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
        toolbarHeight: height * 0.14, //
        elevation: 1,
        flexibleSpace: Container(
          color: const Color(0xffF5F7F7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, []);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: const Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image:
                                        AssetImage("assets/images/cancel.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: const Text("Filter",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: height * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context, []);
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.42,
                height: height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xff01635D),
                  ),
                ),
                child: const Text(
                  "Default",
                  style: TextStyle(
                    fontFamily: 'spartan',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff01635D),
                  ),
                ),
              ),
            ),
            SizedBox(width: width * 0.05),
            GestureDetector(
              onTap: () {
                List<EmployeeData> empListSend = [];
                for (var item in employeeDataList) {
                  if (item.isSelected) {
                    empListSend.add(item);
                  }
                }
                Navigator.pop(context, empListSend);
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.42,
                height: height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xff01635D)),
                child: const Text(
                  "APPLY",
                  style: TextStyle(
                    fontFamily: 'spartan',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    TextField(
                      controller: search,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Search staff member",
                        hintStyle: const TextStyle(color: Color(0xff707070)),
                        suffixIcon: Container(
                          width: width * 0.2,
                          color: const Color(0xff01635D),
                          height: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/search-whitenormal.png"),
                          ),
                        ),
                        labelStyle: const TextStyle(
                            fontFamily: 'spartan', color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = "onlyme";
                          if (employeeDataList.isNotEmpty) {
                            for (var item in employeeDataList) {
                              item.isSelected = false;
                            }
                            employeeDataList.first.isSelected = true;
                          }
                        });
                      },
                      child: Card(
                        elevation: 0,
                        margin: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Radio(
                              value: "onlyme",
                              activeColor: const Color(0xff01635D),
                              groupValue: selected,
                              onChanged: (value) {
                                // setState(() {
                                //   selected = value as String;
                                // });
                              },
                            ),
                            const Image(
                              image:
                                  AssetImage("assets/images/Group 12524.png"),
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            const Text(
                              "Only me",
                              style: TextStyle(
                                fontFamily: 'spartan',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = "select all";
                          for (var item in employeeDataList) {
                            item.isSelected = true;
                          }
                        });
                      },
                      child: Card(
                        elevation: 0,
                        margin: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Radio(
                                value: "select all",
                                activeColor: const Color(0xff01635D),
                                groupValue: selected,
                                onChanged: (value) {
                                  // setState(() {
                                  //   selected = value as String;
                                  // });
                                }),
                            const Image(
                              image: AssetImage("assets/images/Group.png"),
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            const Text(
                              "Select All",
                              style: TextStyle(
                                fontFamily: 'spartan',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Divider(color: Colors.black54),
                    SizedBox(height: height * 0.01),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 0),
                      itemCount: employeeDataList.length,
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.black54);
                      },
                      itemBuilder: (context, index) {
                        var singleEmp = employeeDataList[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              singleEmp.isSelected = !singleEmp.isSelected;
                            });
                          },
                          child: Card(
                            elevation: 0,
                            margin: const EdgeInsets.all(0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                      onChanged: (val) {
                                        // setState(() {
                                        //   singleEmp.isSelected = !singleEmp.isSelected;
                                        // });
                                      },
                                      activeColor: AppColors.primaryColor,
                                      checkColor: AppColors.whiteColor,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      side: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                      value: singleEmp.isSelected,
                                      visualDensity: const VisualDensity(
                                          horizontal: -4.0, vertical: -4.0),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff01635D)
                                          .withOpacity(0.15),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        singleEmp.firstName
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: const TextStyle(
                                          color: Color(0xff01635D),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${singleEmp.firstName} ${singleEmp.lastName}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      RichText(
                                        text: const TextSpan(
                                          text: "Active. ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF219653),
                                            fontSize: 13,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "8:00AM - 5:00PM",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF707070),
                                                fontSize: 13,
                                              ),
                                              children: [],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // Row(
                    //   children: [
                    //     Custom_Checkbox(
                    //       isChecked: checkboxvalue,
                    //       onChange: (value) {
                    //         setState(() {
                    //           checkboxvalue = value;
                    //         });
                    //       },
                    //       backgroundColor: const Color(0xff01635D),
                    //       borderColor: const Color(0xff01635D),
                    //       icon: Icons.check,
                    //       iconColor: Colors.white,
                    //       size: 24,
                    //       iconSize: 20,
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     const Image(
                    //       image: AssetImage("assets/images/T.png"),
                    //       height: 50,
                    //       width: 50,
                    //     ),
                    //     SizedBox(
                    //       width: width * 0.04,
                    //     ),
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text("Tolu Williams",
                    //             style: TextStyle(
                    //                 fontFamily: 'spartan',
                    //                 fontWeight: FontWeight.bold)),
                    //         RichText(
                    //             text: const TextSpan(
                    //                 text: 'Active.',
                    //                 style: TextStyle(
                    //                     fontFamily: 'spartan',
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.green),
                    //                 children: [
                    //               TextSpan(
                    //                   text: '8:00AM - 5:00PM',
                    //                   style: TextStyle(
                    //                       fontFamily: 'spartan',
                    //                       fontWeight: FontWeight.bold,
                    //                       color: Colors.black54,
                    //                       fontSize: 12))
                    //             ]))
                    //       ],
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: height * 0.01,
                    // ),
                    // const Divider(color: Colors.black54),
                    // SizedBox(
                    //   height: height * 0.03,
                    // ),
                    // Row(
                    //   children: [
                    //     Custom_Checkbox(
                    //       isChecked: checkboxvalue,
                    //       onChange: (value) {
                    //         setState(() {
                    //           checkboxvalue = value;
                    //         });
                    //       },
                    //       backgroundColor: const Color(0xff01635D),
                    //       borderColor: const Color(0xff01635D),
                    //       icon: Icons.check,
                    //       iconColor: Colors.white,
                    //       size: 24,
                    //       iconSize: 20,
                    //     ),
                    //     const SizedBox(
                    //       width: 20,
                    //     ),
                    //     const Image(
                    //       image: AssetImage("assets/images/R.png"),
                    //       height: 50,
                    //       width: 50,
                    //     ),
                    //     SizedBox(
                    //       width: width * 0.04,
                    //     ),
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text("Rita Powel",
                    //             style: TextStyle(
                    //                 fontFamily: 'spartan',
                    //                 fontWeight: FontWeight.bold)),
                    //         RichText(
                    //             text: const TextSpan(
                    //                 text: 'Active.',
                    //                 style: TextStyle(
                    //                     fontFamily: 'spartan',
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Colors.green),
                    //                 children: [
                    //               TextSpan(
                    //                   text: '8:00AM - 5:00PM',
                    //                   style: TextStyle(
                    //                       fontFamily: 'spartan',
                    //                       fontWeight: FontWeight.bold,
                    //                       color: Colors.black54,
                    //                       fontSize: 12))
                    //             ]))
                    //       ],
                    //     )
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: height * 0.05,
                    // ),
                    // SizedBox(
                    //   height: height * 0.05,
                    // ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //         alignment: Alignment.center,
                    //         width: width * 0.42,
                    //         height: height * 0.07,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(6),
                    //             border: Border.all(
                    //               color: const Color(0xff01635D),
                    //             )),
                    //         child: const Text(
                    //           "Default",
                    //           style: TextStyle(
                    //               fontFamily: 'spartan',
                    //               fontWeight: FontWeight.bold,
                    //               color: Color(0xff01635D)),
                    //         )),
                    //     SizedBox(
                    //       width: width * 0.05,
                    //     ),
                    //     Container(
                    //         alignment: Alignment.center,
                    //         width: width * 0.42,
                    //         height: height * 0.07,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(6),
                    //             color: const Color(0xff01635D)),
                    //         child: const Text(
                    //           "APPLY",
                    //           style: TextStyle(
                    //               fontFamily: 'spartan',
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.white),
                    //         )),
                    //     SizedBox(
                    //       height: height * 0.03,
                    //     )
                    //   ],
                    // ),
                    // SizedBox(height: height * 0.04),
                  ],
                ),
              ),
            ),
    );
  }
}
