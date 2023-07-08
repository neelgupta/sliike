import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/app_colors.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class addService extends StatefulWidget {
  const addService({Key? key}) : super(key: key);

  @override
  State<addService> createState() => _addServiceState();
}

class _addServiceState extends State<addService> {
  Types typesFromJson(String str) => Types.fromJson(json.decode(str));
  final ImagePicker _picker = ImagePicker();
  String st = "";
  bool imagestatus = false;
  String imagepath = "";

  String typesToJson(Types td) => json.encode(td.toJson());
  Category? c;
  Types? t;
  List<CategoryData> categoryDataList = [];
  List<TypesData> typesDataList = [];
  List add_data = [];
  List add_time = [];
  List add_price = [];
  List addcategory = [];
  List addtype = [];
  List Myallservicedata = [];
  addServiceDetailsModel? ServiceDetailsModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addServices();
  }

  bool dropdown = true;
  bool datachanghe = true;
  TextEditingController description = TextEditingController();
  TextEditingController servicePrice = TextEditingController();
  bool servicePriceStatus = false;
  bool serviceStatus = false;
  bool categoryStatus = false;
  bool descriptionstatus = false;
  String status = "";
  bool arrow = false;
  bool isLoading = false;
  String? selectedvaluemin = "30 min";
  String? selectedvalueminnewformat = "00:30";
  List<String> mindropdownlist = <String>[
    "30 min",
    "60 min",
    "90 min",
    "120 min",
    "150 min",
    "180 min",
    "210 min",
    "240 min",
    "270 min",
    "300 min",
    "330 min",
    "360 min",
    "390 min",
  ];
  List<String> minApilist = <String>[
    "00:30",
    "01:00",
    "01:30",
    "02:00",
    "02:30",
    "03:00",
    "03:30",
    "04:00",
    "04:30",
    "05:00",
    "05:30",
    "06:00",
    "06:30",
    // "07:00",
    // "07:30",
    // "08:00",
    // "08:30",
    // "09:00",
    // "09:30",
    // "10:00",
    // "10:30",
    // "11:00",
    // "11:30",
    // "12:00",
  ];

  mintoforamt(selectedvalue) {
    if ("30 min" == selectedvalue) {
      selectedvalueminnewformat = "00:30";
    } else if ("60 min" == selectedvalue) {
      selectedvalueminnewformat = "01:00";
    } else if ("90 min" == selectedvalue) {
      selectedvalueminnewformat = "01:30";
    } else if ("120 min" == selectedvalue) {
      selectedvalueminnewformat = "02:00";
    } else if ("150 min" == selectedvalue) {
      selectedvalueminnewformat = "02:30";
    } else if ("180 min" == selectedvalue) {
      selectedvalueminnewformat = "03:00";
    } else if ("210 min" == selectedvalue) {
      selectedvalueminnewformat = "03:30";
    } else if ("240 min" == selectedvalue) {
      selectedvalueminnewformat = "04:00";
    } else if ("270 min" == selectedvalue) {
      selectedvalueminnewformat = "04:30";
    } else if ("300 min" == selectedvalue) {
      selectedvalueminnewformat = "05:00";
    } else if ("330 min" == selectedvalue) {
      selectedvalueminnewformat = "05:30";
    } else if ("360 min" == selectedvalue) {
      selectedvalueminnewformat = "06:00";
    } else if ("390 min" == selectedvalue) {
      selectedvalueminnewformat = "06:30";
    }

    setState(() {});
  }

  String selectedServiceCategoryIdValue = "";
  String selectedServiceCategoryNameValue = "";
  TypesData? selectedService;
  String? selectedServiceIdValue = "";
  String selectedServiceNameValue = "";

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
        flexibleSpace: Container(
          color: Color(0xffF5F7F7),
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
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Add Service",
                                style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Choose service category",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff292929),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            servicePrice.clear();
                            categoryStatus = false;
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: SizedBox(
                                  height: height * 0.7,
                                  width: width - 40,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: categoryDataList.length,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      separatorBuilder: (context, index) {
                                        return Divider(
                                          color: AppColors.greyColor
                                              .withOpacity(0.35),
                                          indent: 10,
                                          endIndent: 10,
                                          height: 5,
                                          thickness: 1,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        var singleItem =
                                            categoryDataList[index];
                                        return RadioListTile<String?>(
                                          value: singleItem.id,
                                          activeColor: const Color(0xff01635D),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          groupValue: selectedServiceIdValue,
                                          title: Text(
                                            "${singleItem.serviceCategoryName}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff292929),
                                                fontFamily: "spartan",
                                                fontWeight: FontWeight.normal),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              print("000");
                                              selectedServiceCategoryIdValue =
                                                  singleItem.id!;
                                              selectedServiceCategoryNameValue =
                                                  singleItem
                                                      .serviceCategoryName!;
                                              fetchServicesType(
                                                  selectedServiceCategoryIdValue);
                                              Navigator.pop(context);
                                              print(
                                                  selectedServiceCategoryNameValue);
                                            });
                                          },
                                        );

                                        //  Container(
                                        //   decoration: BoxDecoration(
                                        //       border: Border.all(
                                        //           color: Colors.white,
                                        //           width: 1)),
                                        //   child: Column(
                                        //     children: [
                                        //       Theme(
                                        //         data: ThemeData(
                                        //           //here change to your color
                                        //           unselectedWidgetColor:
                                        //               const Color(0xff01635D),
                                        //         ),
                                        //         child: Padding(
                                        //           padding:
                                        //               const EdgeInsets.only(
                                        //                   left: 10,
                                        //                   right: 10,
                                        //                   top: 8,
                                        //                   bottom: 8),
                                        //           child: Row(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment
                                        //                     .spaceBetween,
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment
                                        //                     .center,
                                        //             children: [
                                        //               Text(
                                        //                 "${singleItem.serviceCategoryName}",
                                        //                 style: const TextStyle(
                                        //                     fontSize: 15,
                                        //                     color: Color(
                                        //                         0xff292929),
                                        //                     fontFamily:
                                        //                         "spartan",
                                        //                     fontWeight:
                                        //                         FontWeight
                                        //                             .normal),
                                        //               ),
                                        //               Radio<String?>(
                                        //                 value: singleItem.id,
                                        //                 activeColor:
                                        //                     const Color(
                                        //                         0xff01635D),
                                        //                 groupValue:
                                        //                     selectedServiceIdValue,
                                        //                 onChanged: (value) {
                                        //                   setState(() {
                                        //                     print("000");
                                        //                     selectedServiceCategoryIdValue =
                                        //                         singleItem.id!;
                                        //                     selectedServiceCategoryNameValue =
                                        //                         singleItem
                                        //                             .serviceCategoryName!;
                                        //                     fetchServicesType(
                                        //                         selectedServiceCategoryIdValue);
                                        //                     Navigator.pop(
                                        //                         context);
                                        //                     print(
                                        //                         selectedServiceCategoryNameValue);
                                        //                   });
                                        //                 },
                                        //               )
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       Container(
                                        //         height: 1,
                                        //         width: width,
                                        //         color: const Color(0xffE7E7E7),
                                        //       )
                                        //     ],
                                        //   ),
                                        // );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff707070), width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                selectedServiceCategoryNameValue == ""
                                    ? const Text(
                                        "Service category",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff707070),
                                            fontFamily: "spartan",
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text(
                                        selectedServiceCategoryNameValue,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff292929),
                                            fontFamily: "spartan",
                                            fontWeight: FontWeight.normal),
                                      ),
                                const Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Color(0xff707070),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      categoryStatus
                          ? Container(
                              height: 30,
                              margin: EdgeInsets.only(top: 7),
                              child: Text(
                                status,
                                style: TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 30,
                            ),
                      const Divider(
                        color: Color(0xffCFCFCF),
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Choose service type",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff292929),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      dropdown == true
                          ? DropdownButtonHideUnderline(
                              child: Container(
                                height: 50,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xff707070), width: 1),
                                ),
                                child: DropdownButtonFormField2<TypesData>(
                                  isExpanded: true,
                                  hint: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, bottom: 0),
                                    child: Text(
                                      'Service type',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "spartan",
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                  ),
                                  items: dropdown == true
                                      ? typesDataList
                                          .map((item) =>
                                              DropdownMenuItem<TypesData>(
                                                onTap: () {
                                                  setState(() {
                                                    serviceStatus = false;
                                                    dropdown = false;
                                                  });
                                                },
                                                value: item,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Text(
                                                        item.serviceTypeName,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: "spartan",
                                                        ),
                                                      ),
                                                    ),
                                                    //Icon(Icons.chevron_right),
                                                  ],
                                                ),
                                              ))
                                          .toList()
                                      : null,
                                  // customItemsHeights: _getCustomItemsHeights(),
                                  value: selectedService,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedService = value!;
                                      print(selectedServiceIdValue);
                                      selectedServiceIdValue = value.id;
                                      print('======>$selectedServiceIdValue');
                                      selectedServiceNameValue =
                                          value.serviceTypeName;
                                      dropdown = false;
                                      arrow = true;
                                    });
                                  },
                                  buttonHeight: 60,
                                  buttonPadding:
                                      const EdgeInsets.only(right: 10),
                                  icon: (const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: Color(0xff707070),
                                  )),
                                  dropdownMaxHeight: 200,
                                  buttonWidth: 140,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                ),
                              ),
                            )
                          : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xffE7E7E7),
                                        width: 1)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                      top: 15,
                                      bottom: arrow ? 20 : 10),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            arrow = !arrow;
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            selectedServiceNameValue == " "
                                                ? const Text(
                                                    "Select service type",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff292929),
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                            FontWeight.bold))
                                                : Text(selectedServiceNameValue,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff292929),
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            arrow
                                                ? InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        dropdown = true;
                                                      });
                                                    },
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedService =
                                                              null;
                                                          selectedServiceIdValue =
                                                              "";
                                                          selectedServiceNameValue =
                                                              "";
                                                          arrow = false;
                                                          dropdown = true;
                                                        });
                                                      },
                                                      child: const Icon(
                                                          Icons.cancel_outlined,
                                                          size: 30,
                                                          color: Color(
                                                              0xff707070)),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        arrow = true;
                                                      });
                                                    },
                                                    child: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        size: 30,
                                                        color:
                                                            Color(0xff707070)),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      arrow
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Divider(
                                                  thickness: 1,
                                                  color: Color(0xffCFCFCF),
                                                ),
                                                const SizedBox(height: 5),
                                                const Text(
                                                    "You can suggest Service Type through the Help Centre.",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xff707070),
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 5, 5, 5),
                                                  child:
                                                      DropdownButtonFormField(
                                                    enableFeedback: true,
                                                    isDense: true,
                                                    isExpanded: true,
                                                    alignment: Alignment.center,
                                                    elevation: 2,
                                                    value: selectedvaluemin,
                                                    items: mindropdownlist
                                                        .map((String items) {
                                                      return DropdownMenuItem(
                                                        value: items,
                                                        child: Text(
                                                          items,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String?
                                                        selectedvalue) {
                                                      setState(() {
                                                        mintoforamt(
                                                            selectedvalue);
                                                        print(
                                                            "selectedvalue==${selectedvalue}");
                                                        // selectedvaluemin = selectedvalue!;
                                                        // selectedvalueminnewformat = newValue!;
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 30,
                                                    ),
                                                    decoration: InputDecoration(
                                                      //labelText: "Duration",
                                                      label: const Text(
                                                          "Duration",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff292929))),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black38),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black38),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height * 0.03,
                                                ),
                                                Container(
                                                  child: TextField(
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp(r'[0-9]'))
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: servicePrice,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff292929)),
                                                    onTap: () {
                                                      setState(() {
                                                        servicePriceStatus =
                                                            false;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      hintText: "00",
                                                      hintStyle:
                                                          const TextStyle(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xff292929)),
                                                      prefixIcon: SizedBox(
                                                        width: 70,
                                                        child: IntrinsicHeight(
                                                          child: Row(
                                                            children: const [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            10),
                                                                child: Text(
                                                                    "\$",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Color(
                                                                            0xff292929))),
                                                              ),
                                                              VerticalDivider(
                                                                color: Color(
                                                                    0xff707070),
                                                                thickness: 1,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      labelText:
                                                          "Service Price",
                                                      labelStyle:
                                                          const TextStyle(
                                                              fontFamily:
                                                                  'spartan',
                                                              color: Colors
                                                                  .black54),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black38),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black38),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // servicePriceStatus
                                                //     ? SizedBox(
                                                //   height: 30,
                                                //   child: Text(
                                                //     status,
                                                //     style: TextStyle(
                                                //         fontFamily:
                                                //         'spartan',
                                                //         fontSize:
                                                //         12,
                                                //         color:
                                                //         Colors.red),
                                                //   ),
                                                // )
                                                //     : Container(
                                                //   height: 30,
                                                // ),
                                              ],
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      serviceStatus || servicePriceStatus
                          ? Container(
                              height: 30,
                              margin: EdgeInsets.only(top: 7),
                              child: Text(
                                status,
                                style: TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 30,
                            ),
                      Row(
                        children: [
                          Text(
                            "Service Description ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff292929),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "(optional)",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff707070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        child: TextField(
                          controller: description,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff414141),
                          ),
                          onChanged: (value) {
                            descriptionstatus = false;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, top: 12, bottom: 12),
                            hintText: "Description",
                            labelText: "Description",
                            labelStyle: TextStyle(
                                fontFamily: 'spartan', color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            print(status);
                            if (selectedServiceCategoryIdValue == "") {
                              status = "Please Select  Service Category";
                              datachanghe = true;
                              categoryStatus = true;
                            } else if (selectedServiceIdValue == "") {
                              status = "Please Select  Service Type";
                              datachanghe = true;
                              serviceStatus = true;
                            } else if (servicePrice.text.isEmpty) {
                              status = "Please Enter Price";
                              datachanghe = true;
                              servicePriceStatus = true;
                            } else {
                              addServiceDetails();
                              // datachanghe = false;
                              // addcategory.add(selectedServiceCategoryIdValue);
                              // addtype.add(selectedServiceCategoryNameValue);
                              // add_data.add(selectedServiceIdValue);
                              // add_price.add(servicePrice.text);
                              // add_time.add(selectedvalueminnewformat);
                              // print("addcategory==$addcategory");
                              // print("addcategory==$add_data");
                              // print("addcategory==$add_price");
                              // print("addcategory==$add_time");
                              // print("addcategory==$addtype");
                              // dropdown = true;
                              // selectedServiceNameValue = "";
                              // selectedServiceCategoryNameValue = "";
                            }
                          });
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          "These services will be added to your Sliike profile as your available services. You can add more as needed.",
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff414141),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addServices() async {
    var geturi = Uri.parse(ApiUrlList.fetchServiceCategories);

    setState(() {
      isLoading = true;
      selectedService = null;
      selectedServiceIdValue = "";
      selectedServiceNameValue = "";
    });
    var response = await http.get(
      geturi,
    );
    print("geturigeturi : $geturi");
    print(response.body);
    print("status code ==>${response.statusCode}");
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
        c = Category.fromJson(jsonDecode(response.body));
        if (c!.data!.isNotEmpty) {
          categoryDataList = c!.data ?? [];
          setState(() {});
        }
      }
    } else if (response.statusCode == 401) {
      logoutdata();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return signInScreen();
        },
      ), (route) => false);
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> addServiceDetails() async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xff01635D)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var bodyData = {
        'serviceCategory': selectedServiceCategoryIdValue,
        'serviceType': selectedServiceIdValue,
        "duration": selectedvalueminnewformat,
        "price": servicePrice.text,
        "description": description.text,
      };
      print(bodyData);
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("addServiceDetails url : ${ApiUrlList.addSingleServiceDetails}");
      var response = await http.post(
        Uri.parse(ApiUrlList.addSingleServiceDetails),
        body: jsonEncode(bodyData),
        headers: headers,
      );
      var map = jsonDecode(response.body.toString());
      print("statuscode : ${response.statusCode}");
      print("res  body :: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        Navigator.pop(context);
        showToast(message: "${map['message']}");
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    } finally {
      Loader.hide();
    }
  }

  Future<void> fetchServicesType(String serviceId) async {
    var geturi = Uri.parse("${ApiUrlList.fetchServiceTypes}/$serviceId");
    try {
      setState(() {
        isLoading = true;
        selectedService = null;
        selectedServiceIdValue = "";
        selectedServiceNameValue = "";
      });
      var response = await http.get(
        geturi,
      );
      print("geturi : $geturi");
      print(response.body);
      print("status code ==>${response.statusCode}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          t = Types.fromJson(jsonDecode(response.body));
          if (t!.td.isNotEmpty) {
            setState(() {
              typesDataList = t!.td;

              // selectedService = typesDataList.first;
              // selectedServiceIdValue = t!.td.first.id;
              selectedServiceNameValue = t!.td.first.serviceTypeName;
              print(t!.td.first.serviceTypeName);
            });
          }
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

class Category {
  int? status;
  bool? success;
  List<CategoryData>? data;
  String? message;

  Category({this.status, this.success, required this.data, this.message});

  factory Category.fromJson(Map<String, dynamic> map) {
    List list = map['data'];

    List<CategoryData> d = list.map((e) => CategoryData.fromJson(e)).toList();
    return Category(
        status: map['status'],
        success: map['success'],
        data: d,
        message: map['message']);
  }
}

class CategoryData {
  String? id;
  String? serviceCategoryName;

  CategoryData({
    required this.id,
    required this.serviceCategoryName,
  });

  factory CategoryData.fromJson(Map<String, dynamic> map) => CategoryData(
        id: map['_id'],
        serviceCategoryName: map['serviceCategoryName'],
      );
}

class Types {
  int status;
  bool success;
  List<TypesData> td;
  String message;

  Types({
    required this.status,
    required this.success,
    required this.td,
    required this.message,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        status: json["status"],
        success: json["success"],
        td: List<TypesData>.from(
            json["data"].map((x) => TypesData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "td": List<dynamic>.from(td.map((x) => x.toJson())),
        "message": message,
      };
}

class TypesData {
  String id;
  String serviceTypeName;

  TypesData({
    required this.id,
    required this.serviceTypeName,
  });

  factory TypesData.fromJson(Map<String, dynamic> json) => TypesData(
        id: json["_id"],
        serviceTypeName: json["serviceTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceTypeName": serviceTypeName,
      };
}

class addServiceDetailsModel {
  bool? success;
  int? status;
  String? message;

  addServiceDetailsModel({this.success, this.status, this.message});

  factory addServiceDetailsModel.fromJson(Map<dynamic, dynamic> map) {
    return addServiceDetailsModel(
        success: map['success'],
        status: map['status'],
        message: map['message']);
  }
}
