import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/setting.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/setup_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

import '../../../../../viewscrren/second_beautyservice_or_product/service_add/service_add_model.dart';

class Profile_Images extends StatefulWidget {
  String id;
  final String email;
  bool isStripeSetUp;
  bool isFromProfile;
  ServiceAddModel? singleServiceData;
  // String? serviceCategory;
  // String? serviceType;
  // String? dutration;
  // String? price;
  Profile_Images(this.id,
      {Key? key,
      required this.email,
      required this.isStripeSetUp,
      this.isFromProfile = false,
      this.singleServiceData
      // this.serviceCategory,
      // this.serviceType,
      // this.dutration,
      // this.price
      })
      : super(key: key);

  @override
  State<Profile_Images> createState() => _Profile_ImagesState();
}

class _Profile_ImagesState extends State<Profile_Images> {
  TextEditingController servicetype = TextEditingController();
  TextEditingController servicecategory = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  bool servicetypestatus = false;
  bool servicecategorystatus = false;
  bool descriptionstatus = false;
  String status = "";
  File? file;

  bool isLoading = false;

  String? selectedvaluemin = "30 min";
  String? selectedvalueminnewformat = "00:30";

  convertIntoTimeFormat(selectedValue) {
    selectedvaluemin = selectedValue;
    if ("30 min" == selectedValue) {
      selectedvalueminnewformat = "00:30";
    } else if ("60 min" == selectedValue) {
      selectedvalueminnewformat = "01:00";
    } else if ("90 min" == selectedValue) {
      selectedvalueminnewformat = "01:30";
    } else if ("120 min" == selectedValue) {
      selectedvalueminnewformat = "02:00";
    } else if ("150 min" == selectedValue) {
      selectedvalueminnewformat = "02:30";
    } else if ("180 min" == selectedValue) {
      selectedvalueminnewformat = "03:00";
    } else if ("210 min" == selectedValue) {
      selectedvalueminnewformat = "03:30";
    } else if ("240 min" == selectedValue) {
      selectedvalueminnewformat = "04:00";
    } else if ("270 min" == selectedValue) {
      selectedvalueminnewformat = "04:30";
    } else if ("300 min" == selectedValue) {
      selectedvalueminnewformat = "05:00";
    } else if ("330 min" == selectedValue) {
      selectedvalueminnewformat = "05:30";
    } else if ("360 min" == selectedValue) {
      selectedvalueminnewformat = "06:00";
    } else if ("390 min" == selectedValue) {
      selectedvalueminnewformat = "06:30";
    }

    setState(() {});
  }

  convertIntoTimeFormatForPriceDuration(selectedValue) {
    setState(() {
      selectedvalueminnewformat = selectedValue;
      if (selectedValue == "00:30") {
        selectedvaluemin = "30 min";
      } else if (selectedValue == "01:00") {
        selectedvaluemin = "60 min";
      } else if (selectedValue == "01:30") {
        selectedvaluemin = "90 min";
      } else if (selectedValue == "02:00") {
        selectedvaluemin = "120 min";
      } else if (selectedValue == "02:30") {
        selectedvaluemin = "150 min";
      } else if (selectedValue == "03:00") {
        selectedvaluemin = "180 min";
      } else if (selectedValue == "03:30") {
        selectedvaluemin = "210 min";
      } else if (selectedValue == "04:00") {
        selectedvaluemin = "240 min";
      } else if (selectedValue == "04:30") {
        selectedvaluemin = "270 min";
      } else if (selectedValue == "05:00") {
        selectedvaluemin = "300 min";
      } else if (selectedValue == "05:30") {
        selectedvaluemin = "330 min";
      } else if (selectedValue == "06:00") {
        selectedvaluemin = "360 min";
      } else if (selectedValue == "06:30") {
        selectedvaluemin = "390 min";
      }
    });
  }

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

  List<String> pricelist = <String>["Fixed", "Seasonal"];
  String? selectedprice = "";
  String? selectedpriceStatus = "Fixed";
  final ImagePicker _picker = ImagePicker();
  bool imagestatus = false;
  String imagepath = "";
  GetSingleServiceDetailsData? getSingleServiceDetailsData;

  ServiceCategories? serviceCategories;

  bool Clients = false;
  bool homeService = false;
  String parallelClients = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isFromProfile) {
      getSingleServiceDetails(widget.id);
    } else {
      print(widget.singleServiceData?.serviceImagePath);
      setState(() {
        convertIntoTimeFormatForPriceDuration(
            widget.singleServiceData?.serviceDurationMin ?? "");
        servicetype.text = widget.singleServiceData?.serviceName ?? "";
        servicecategory.text = widget.singleServiceData?.serviceCatName ?? "";
        txtPrice.text = widget.singleServiceData?.servicePrice ?? "";
        description.text = widget.singleServiceData?.description ?? "";
        // if (widget.singleServiceData?.imgName != null) {
        //   imagestatus = true;
        //   setState(() {
        //     imagepath = widget.singleServiceData!.imgName;
        //   });
        // }

      });
    }
    print(widget.id);
    print(Helper.prefs!.getString(UserPrefs.keyutoken));
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
                            Navigator.pop(context);
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
                              child: Text("${selectedprice ?? ""}",
                                  style: TextStyle(
                                      fontSize: 16,
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xff01635D)),
            )
          : !widget.isFromProfile
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            textComoon("Add image of this service", 12,
                                const Color(0xff292929), FontWeight.w700),
                            textComoon("(optional)", 12,
                                const Color(0xff707070), FontWeight.w700)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: imagestatus
                            ? InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        alignment: Alignment.bottomCenter,
                                        insetPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 30),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        title: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            CommonButton(
                                                context,
                                                "TAKE A PHOTO",
                                                12,
                                                FontWeight.w600,
                                                Colors.white, () async {
                                              Navigator.pop(context);
                                              final XFile? photo =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (photo != null) {
                                                file = File(photo.path);
                                                imagestatus = true;
                                                imagepath = photo.path;
                                              }
                                            }),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            CommonButton(
                                                context,
                                                "CHOOSE FROM GALLERY",
                                                12,
                                                FontWeight.w600,
                                                Colors.white, () async {
                                              Navigator.pop(context);
                                              final XFile? image =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (image != null) {
                                                file = File(image.path);
                                                imagestatus = true;
                                                imagepath = image.path;
                                              }
                                            }),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            commonButtonborder(
                                                context,
                                                "CANCEL",
                                                12,
                                                FontWeight.w600,
                                                const Color(0xff01635D), () {
                                              Navigator.pop(context);
                                            }),
                                            SizedBox(height: height * 0.03),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Container(
                                      width: width,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        // shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(File(imagepath)),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        alignment: Alignment.bottomCenter,
                                        insetPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 30),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        title: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            CommonButton(
                                                context,
                                                "TAKE A PHOTO",
                                                12,
                                                FontWeight.w600,
                                                Colors.white, () async {
                                              Navigator.pop(context);

                                              final XFile? photo =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (photo != null) {
                                                setState(() {
                                                  file = File(photo.path);
                                                  imagestatus = true;
                                                  imagepath = photo.path;
                                                });
                                              }
                                            }),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            CommonButton(
                                                context,
                                                "CHOOSE FROM GALLERY",
                                                12,
                                                FontWeight.w600,
                                                Colors.white, () async {
                                              Navigator.pop(context);
                                              final XFile? image =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (image != null) {
                                                setState(() {
                                                  file = File(image.path);
                                                  imagestatus = true;
                                                  imagepath = image.path;
                                                });
                                              }
                                            }),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            commonButtonborder(
                                                context,
                                                "CANCEL",
                                                12,
                                                FontWeight.w600,
                                                const Color(0xff01635D), () {
                                              Navigator.pop(context);
                                            }),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    width: width,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF3F3F3),
                                      image: getSingleServiceDetailsData
                                                  ?.data?.imageUrl !=
                                              null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                  getSingleServiceDetailsData!
                                                      .data!.imageUrl!),
                                              fit: BoxFit.fill)
                                          : DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/Rectangle_greyline.png"),
                                              fit: BoxFit.fill),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Center(
                                          child: Image(
                                            height: 40,
                                            image: AssetImage(
                                                "assets/images/camera_grey.png"),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        textComoon(
                                            "Take a photo or Upload from gallery",
                                            12,
                                            const Color(0xff414141),
                                            FontWeight.w500),
                                      ],
                                    )),
                              ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Color(0xffCFCFCF),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          readOnly: true,
                          controller: servicetype,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff292929),
                              fontWeight: FontWeight.w500,
                              fontFamily: "spartan"),
                          onChanged: (value) {
                            setState(() {
                              servicetypestatus = false;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 20),
                            hintText: "Service Type",
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'spartan',
                                color: Color(0xff292929),
                                fontWeight: FontWeight.w500),
                            labelText: "Service Type",
                            labelStyle: const TextStyle(
                                fontFamily: 'spartan', color: Colors.black54),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Color(0xff292929)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Color(0xff292929)),
                            ),
                          ),
                        ),
                      ),
                      servicetypestatus
                          ? Container(
                              height: 30,
                              child: Text(
                                "$status",
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 25,
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          child: TextField(
                            readOnly: true,
                            controller: servicecategory,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff292929),
                                fontWeight: FontWeight.w500,
                                fontFamily: "spartan"),
                            onChanged: (value) {
                              setState(() {
                                servicecategorystatus = false;
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: "Service Category",
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'spartan',
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w500),
                              labelText: "Service Category",
                              labelStyle: const TextStyle(
                                  fontFamily: 'spartan', color: Colors.black54),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Color(0xff292929)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Color(0xff292929)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      servicecategorystatus
                          ? Container(
                              height: 30,
                              child: Text(
                                "$status",
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Colors.red),
                              ),
                            )
                          : Container(
                              height: 10,
                            ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Color(0xffCFCFCF),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: textComoon("Pricing & Duration", 14,
                            const Color(0xff292929), FontWeight.w600),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButtonFormField(
                          enableFeedback: true,
                          isDense: true,
                          isExpanded: true,
                          alignment: Alignment.center,
                          elevation: 2,
                          value: selectedvaluemin,
                          items: mindropdownlist.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(fontSize: 12),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? selectedvalue) {
                            setState(() {
                              convertIntoTimeFormat(selectedvalue);
                              print("selectedvalue==${selectedvalue}");
                              print("selectedvaluemin==${selectedvaluemin}");
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                          decoration: InputDecoration(
                            //labelText: "Duration",
                            label: const Text("Duration",
                                style: TextStyle(color: Color(0xff292929))),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.black38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20, right: 20),
                      //   child: DropdownButtonFormField(
                      //     enableFeedback: true,
                      //     isDense: true,
                      //     isExpanded: true,
                      //     alignment: Alignment.center,
                      //     elevation: 2,
                      //     value: selectedvaluemin,
                      //     items: mindropdownlist.map((String items) {
                      //       return DropdownMenuItem(
                      //         value: items,
                      //         child: Text(
                      //           items,
                      //           style: const TextStyle(fontSize: 14, color: Color(0xff292929)),
                      //         ),
                      //       );
                      //     }).toList(),
                      //     onChanged: (String? newValue) {
                      //       setState(() {
                      //         selectedvaluemin = newValue!;
                      //       });
                      //     },
                      //     icon: const Padding(
                      //       padding: EdgeInsets.only(right: 10),
                      //       child: Icon(
                      //           Icons.keyboard_arrow_down,
                      //           size: 30, color: Color(0xff969696)
                      //       ),
                      //     ),
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.only(left: 20),
                      //       hintText: "Service Category",
                      //       hintStyle: const TextStyle(
                      //           fontSize: 14,
                      //           fontFamily: 'spartan',
                      //           color: Color(0xff292929),
                      //           fontWeight: FontWeight.w500),
                      //       labelText: "Service Category",
                      //       labelStyle:
                      //       const TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(5),
                      //         borderSide: const BorderSide(color: Color(0xff292929)),
                      //       ),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(5),
                      //         borderSide: const BorderSide(color: Color(0xff292929)),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                enableFeedback: true,
                                isDense: true,
                                isExpanded: true,
                                alignment: Alignment.center,
                                elevation: 2,
                                value: selectedpriceStatus,
                                items: pricelist.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff292929)),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedpriceStatus = newValue!;
                                    print(selectedpriceStatus);
                                  });
                                },
                                icon: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.keyboard_arrow_down,
                                      size: 30, color: Color(0xff969696)),
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: "Price Status",
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'spartan',
                                      color: Color(0xff292929),
                                      fontWeight: FontWeight.w500),
                                  labelText: "Price Status",
                                  labelStyle: const TextStyle(
                                      fontFamily: 'spartan',
                                      color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff292929)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff292929)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                child: TextField(
                                  controller: txtPrice,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff292929),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "spartan"),
                                  onChanged: (value) {
                                    setState(() {
                                      servicecategorystatus = false;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 20),
                                    hintText: "Service Price",
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929),
                                        fontWeight: FontWeight.w500),
                                    labelText: "Service Price",
                                    labelStyle: const TextStyle(
                                        fontFamily: 'spartan',
                                        color: Colors.black54),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Color(0xff292929)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Color(0xff292929)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Color(0xffCFCFCF),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: textComoon("Service Description", 14,
                            const Color(0xff292929), FontWeight.w700),
                      ),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          child: TextField(
                            controller: description,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color(
                                  0xff414141,
                                )),
                            onChanged: (value) {
                              descriptionstatus = false;
                            },
                            decoration: InputDecoration(
                              //contentPadding: EdgeInsets.only(left: 20, top: 5, bottom: 12),
                              hintText: "Description",
                              labelText: "Description",
                              labelStyle: const TextStyle(
                                  fontFamily: 'spartan', color: Colors.black54),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                              ),
                            ),
                          ),
                        ),
                      ),
                      descriptionstatus
                          ? Container(
                              height: 30,
                              child: Text(
                                "$status",
                                style: const TextStyle(
                                    fontFamily: 'spartan',
                                    fontSize: 12,
                                    color: Color(0xff2F80ED)),
                              ),
                            )
                          : Container(
                              height: 20,
                            ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Color(0xffCFCFCF),
                        ),
                      ),
                      Container(
                        width: width,
                        color: const Color(0xffF3F3F3),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 20),
                          child: textComoon("More Options", 14,
                              const Color(0xff292929), FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return setting(
                                    // isBookOnline: getSingleServiceDetailsData!
                                    //     .data!.isBookOnline ?? false,
                                    // isHomeService: getSingleServiceDetailsData!
                                    //     .data!.isHomeService,
                                    // intervalTime: getSingleServiceDetailsData!
                                    //     .data!.inBetweenInterval,
                                    // noOfParallelClient:
                                    //     getSingleServiceDetailsData!
                                    //         .data!.noOfParallelClient,
                                    );
                              },
                            )).then((value) {
                              print(value);
                              setState(() {
                                parallelClients = value[0];
                                homeService = value[1];
                                Clients = value[2];
                                print(parallelClients);
                              });
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 17,
                            ),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black12))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textComoon("Settings", 14,
                                    const Color(0xff414141), FontWeight.w500),
                                Container(
                                  height: 15,
                                  width: 30,
                                  child: Image.asset(
                                      "assets/images/righticon.png"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20, right: 20),
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //       vertical: 17,
                      //     ),
                      //     decoration: const BoxDecoration(
                      //         border: Border(bottom: BorderSide(color: Colors.black12))),
                      //     child: GestureDetector(
                      //       onTap: () {},
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           textComoon("For Client", 14,
                      //               const Color(0xff414141), FontWeight.w500),
                      //           Container(
                      //             height: 15,
                      //             width: 30,
                      //             child: Image.asset("assets/images/righticon.png"),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: height * 0.04),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                deleteServiceDetails(widget.id);
                              },
                              child: Container(
                                height: height * 0.07,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFF3232),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset("assets/images/delete.png",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, [
                                    selectedvalueminnewformat,
                                    selectedpriceStatus,
                                    txtPrice.text,
                                    description.text,
                                    parallelClients,
                                    homeService,
                                    Clients,
                                    imagepath.split("/").last,
                                    file == null ? "" : file!.path
                                  ]);
                                  txtPrice.clear();
                                  // updateServiceDetails(widget.id);
                                },
                                child: Container(
                                    height: height * 0.07,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xff01635D)),
                                    child: const Text(
                                      "SAVE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "spartan",
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                    ],
                  ),
                )
              : getSingleServiceDetailsData != null
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                textComoon("Add image of this service", 12,
                                    const Color(0xff292929), FontWeight.w700),
                                textComoon("(optional)", 12,
                                    const Color(0xff707070), FontWeight.w700)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: imagestatus
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            alignment: Alignment.bottomCenter,
                                            insetPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 30),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            title: Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                CommonButton(
                                                    context,
                                                    "TAKE A PHOTO",
                                                    12,
                                                    FontWeight.w600,
                                                    Colors.white, () async {
                                                  Navigator.pop(context);
                                                  final XFile? photo =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  if (photo != null) {
                                                    file = File(photo.path);
                                                    imagestatus = true;
                                                    imagepath = photo.path;
                                                  }
                                                }),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                CommonButton(
                                                    context,
                                                    "CHOOSE FROM GALLERY",
                                                    12,
                                                    FontWeight.w600,
                                                    Colors.white, () async {
                                                  Navigator.pop(context);
                                                  final XFile? image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  if (image != null) {
                                                    file = File(image.path);
                                                    imagestatus = true;
                                                    imagepath = image.path;
                                                  }
                                                }),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                commonButtonborder(
                                                    context,
                                                    "CANCEL",
                                                    12,
                                                    FontWeight.w600,
                                                    const Color(0xff01635D),
                                                    () {
                                                  Navigator.pop(context);
                                                }),
                                                SizedBox(height: height * 0.03),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Container(
                                          width: width,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            // shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: FileImage(File(imagepath)),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            alignment: Alignment.bottomCenter,
                                            insetPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 30),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            title: Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                CommonButton(
                                                    context,
                                                    "TAKE A PHOTO",
                                                    12,
                                                    FontWeight.w600,
                                                    Colors.white, () async {
                                                  Navigator.pop(context);

                                                  final XFile? photo =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  if (photo != null) {
                                                    setState(() {
                                                      file = File(photo.path);
                                                      imagestatus = true;
                                                      imagepath = photo.path;
                                                    });
                                                  }
                                                }),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                CommonButton(
                                                    context,
                                                    "CHOOSE FROM GALLERY",
                                                    12,
                                                    FontWeight.w600,
                                                    Colors.white, () async {
                                                  Navigator.pop(context);
                                                  final XFile? image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  if (image != null) {
                                                    setState(() {
                                                      file = File(image.path);
                                                      imagestatus = true;
                                                      imagepath = image.path;
                                                    });
                                                  }
                                                }),
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                commonButtonborder(
                                                    context,
                                                    "CANCEL",
                                                    12,
                                                    FontWeight.w600,
                                                    const Color(0xff01635D),
                                                    () {
                                                  Navigator.pop(context);
                                                }),
                                                SizedBox(
                                                  height: height * 0.03,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                        width: width,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F3F3),
                                          image: getSingleServiceDetailsData
                                                      ?.data?.imageUrl !=
                                                  null
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      getSingleServiceDetailsData!
                                                          .data!.imageUrl!),
                                                  fit: BoxFit.fill)
                                              : DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/Rectangle_greyline.png"),
                                                  fit: BoxFit.fill),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Center(
                                              child: Image(
                                                height: 40,
                                                image: AssetImage(
                                                    "assets/images/camera_grey.png"),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            textComoon(
                                                "Take a photo or Upload from gallery",
                                                12,
                                                const Color(0xff414141),
                                                FontWeight.w500),
                                          ],
                                        )),
                                  ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffCFCFCF),
                            ),
                          ),
                          SizedBox(height: height * 0.04),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              readOnly: true,
                              controller: servicetype,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "spartan"),
                              onChanged: (value) {
                                setState(() {
                                  servicetypestatus = false;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "Service Type",
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'spartan',
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w500),
                                labelText: "Service Type",
                                labelStyle: const TextStyle(
                                    fontFamily: 'spartan',
                                    color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff292929)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff292929)),
                                ),
                              ),
                            ),
                          ),
                          servicetypestatus
                              ? Container(
                                  height: 30,
                                  child: Text(
                                    "$status",
                                    style: const TextStyle(
                                        fontFamily: 'spartan',
                                        fontSize: 12,
                                        color: Colors.red),
                                  ),
                                )
                              : Container(
                                  height: 25,
                                ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              child: TextField(
                                readOnly: true,
                                controller: servicecategory,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "spartan"),
                                onChanged: (value) {
                                  setState(() {
                                    servicecategorystatus = false;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: "Service Category",
                                  hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'spartan',
                                      color: Color(0xff292929),
                                      fontWeight: FontWeight.w500),
                                  labelText: "Service Category",
                                  labelStyle: const TextStyle(
                                      fontFamily: 'spartan',
                                      color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff292929)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Color(0xff292929)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          servicecategorystatus
                              ? Container(
                                  height: 30,
                                  child: Text(
                                    "$status",
                                    style: const TextStyle(
                                        fontFamily: 'spartan',
                                        fontSize: 12,
                                        color: Colors.red),
                                  ),
                                )
                              : Container(
                                  height: 10,
                                ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffCFCFCF),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: textComoon("Pricing & Duration", 14,
                                const Color(0xff292929), FontWeight.w600),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButtonFormField(
                              enableFeedback: true,
                              isDense: true,
                              isExpanded: true,
                              alignment: Alignment.center,
                              elevation: 2,
                              value: selectedvaluemin,
                              items: mindropdownlist.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? selectedvalue) {
                                setState(() {
                                  convertIntoTimeFormat(selectedvalue);
                                  print("selectedvalue==${selectedvalue}");
                                  print(
                                      "selectedvaluemin==${selectedvaluemin}");
                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 30,
                              ),
                              decoration: InputDecoration(
                                //labelText: "Duration",
                                label: const Text("Duration",
                                    style: TextStyle(color: Color(0xff292929))),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20, right: 20),
                          //   child: DropdownButtonFormField(
                          //     enableFeedback: true,
                          //     isDense: true,
                          //     isExpanded: true,
                          //     alignment: Alignment.center,
                          //     elevation: 2,
                          //     value: selectedvaluemin,
                          //     items: mindropdownlist.map((String items) {
                          //       return DropdownMenuItem(
                          //         value: items,
                          //         child: Text(
                          //           items,
                          //           style: const TextStyle(fontSize: 14, color: Color(0xff292929)),
                          //         ),
                          //       );
                          //     }).toList(),
                          //     onChanged: (String? newValue) {
                          //       setState(() {
                          //         selectedvaluemin = newValue!;
                          //       });
                          //     },
                          //     icon: const Padding(
                          //       padding: EdgeInsets.only(right: 10),
                          //       child: Icon(
                          //           Icons.keyboard_arrow_down,
                          //           size: 30, color: Color(0xff969696)
                          //       ),
                          //     ),
                          //     decoration: InputDecoration(
                          //       contentPadding: const EdgeInsets.only(left: 20),
                          //       hintText: "Service Category",
                          //       hintStyle: const TextStyle(
                          //           fontSize: 14,
                          //           fontFamily: 'spartan',
                          //           color: Color(0xff292929),
                          //           fontWeight: FontWeight.w500),
                          //       labelText: "Service Category",
                          //       labelStyle:
                          //       const TextStyle(fontFamily: 'spartan', color: Colors.black54),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(5),
                          //         borderSide: const BorderSide(color: Color(0xff292929)),
                          //       ),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(5),
                          //         borderSide: const BorderSide(color: Color(0xff292929)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: DropdownButtonFormField(
                                    enableFeedback: true,
                                    isDense: true,
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    elevation: 2,
                                    value: selectedpriceStatus,
                                    items: pricelist.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff292929)),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedpriceStatus = newValue!;
                                        print(selectedpriceStatus);
                                      });
                                    },
                                    icon: const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.keyboard_arrow_down,
                                          size: 30, color: Color(0xff969696)),
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      hintText: "Price Status",
                                      hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'spartan',
                                          color: Color(0xff292929),
                                          fontWeight: FontWeight.w500),
                                      labelText: "Price Status",
                                      labelStyle: const TextStyle(
                                          fontFamily: 'spartan',
                                          color: Colors.black54),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Color(0xff292929)),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Color(0xff292929)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      controller: txtPrice,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff292929),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "spartan"),
                                      onChanged: (value) {
                                        setState(() {
                                          servicecategorystatus = false;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 20),
                                        hintText: "Service Price",
                                        hintStyle: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'spartan',
                                            color: Color(0xff292929),
                                            fontWeight: FontWeight.w500),
                                        labelText: "Service Price",
                                        labelStyle: const TextStyle(
                                            fontFamily: 'spartan',
                                            color: Colors.black54),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xff292929)),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xff292929)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffCFCFCF),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.06,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: textComoon("Service Description", 14,
                                const Color(0xff292929), FontWeight.w700),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              child: TextField(
                                controller: description,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(
                                      0xff414141,
                                    )),
                                onChanged: (value) {
                                  descriptionstatus = false;
                                },
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.only(left: 20, top: 5, bottom: 12),
                                  hintText: "Description",
                                  labelText: "Description",
                                  labelStyle: const TextStyle(
                                      fontFamily: 'spartan',
                                      color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          descriptionstatus
                              ? Container(
                                  height: 30,
                                  child: Text(
                                    "$status",
                                    style: const TextStyle(
                                        fontFamily: 'spartan',
                                        fontSize: 12,
                                        color: Color(0xff2F80ED)),
                                  ),
                                )
                              : Container(
                                  height: 20,
                                ),
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffCFCFCF),
                            ),
                          ),
                          Container(
                            width: width,
                            color: const Color(0xffF3F3F3),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 20),
                              child: textComoon("More Options", 14,
                                  const Color(0xff292929), FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return setting(
                                        // isBookOnline: getSingleServiceDetailsData!
                                        //     .data!.isBookOnline ?? false,
                                        // isHomeService: getSingleServiceDetailsData!
                                        //     .data!.isHomeService,
                                        // intervalTime: getSingleServiceDetailsData!
                                        //     .data!.inBetweenInterval,
                                        // noOfParallelClient:
                                        //     getSingleServiceDetailsData!
                                        //         .data!.noOfParallelClient,
                                        );
                                  },
                                )).then((value) {
                                  print(value);
                                  setState(() {
                                    parallelClients = value[0];
                                    homeService = value[1];
                                    Clients = value[2];
                                    print(parallelClients);
                                  });
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 17,
                                ),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black12))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textComoon(
                                        "Settings",
                                        14,
                                        const Color(0xff414141),
                                        FontWeight.w500),
                                    Container(
                                      height: 15,
                                      width: 30,
                                      child: Image.asset(
                                          "assets/images/righticon.png"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20, right: 20),
                          //   child: Container(
                          //     padding: const EdgeInsets.symmetric(
                          //       vertical: 17,
                          //     ),
                          //     decoration: const BoxDecoration(
                          //         border: Border(bottom: BorderSide(color: Colors.black12))),
                          //     child: GestureDetector(
                          //       onTap: () {},
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           textComoon("For Client", 14,
                          //               const Color(0xff414141), FontWeight.w500),
                          //           Container(
                          //             height: 15,
                          //             width: 30,
                          //             child: Image.asset("assets/images/righticon.png"),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: height * 0.04),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    deleteServiceDetails(widget.id);
                                  },
                                  child: Container(
                                    height: height * 0.07,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFF3232),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Image.asset(
                                          "assets/images/delete.png",
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (widget.isFromProfile) {
                                        updateServiceDetails(widget.id);
                                      } else {
                                        Navigator.pop(context, [
                                          selectedvalueminnewformat,
                                          selectedpriceStatus,
                                          txtPrice.text,
                                          description.text,
                                          parallelClients,
                                          homeService,
                                          Clients,
                                          imagepath.split("/").last,
                                          file == null ? "" : file!.path
                                        ]);
                                        txtPrice.clear();
                                      }
                                      //
                                    },
                                    child: Container(
                                        height: height * 0.07,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color(0xff01635D)),
                                        child: const Text(
                                          "SAVE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "spartan",
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Text(
                        "No Data Found !!!",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
    );
  }

  getSingleServiceDetails(String Id) async {
    try {
      setState(() {
        isLoading = true;
      });
      var getUri = Uri.parse("${ApiUrlList.getSingleServiceDetails}$Id");
      var Headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(
        getUri,
        headers: Headers,
      );
      log("getSingleServiceDetails Body ==> ${response.body}");
      log("getSingleServiceDetails Code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        fetchServiceCategories();
        getSingleServiceDetailsData =
            GetSingleServiceDetailsData.fromJson(jsonDecode(response.body));
        // mindropdownlist.add("${getSingleServiceDetailsData!.data!.duration}");
        var time = await convertIntoTimeFormatForPriceDuration(
            getSingleServiceDetailsData!.data!.duration);
        servicetype.text =
            getSingleServiceDetailsData!.data!.serviceType!.serviceTypeName ??
                "";
        servicecategory.text = getSingleServiceDetailsData!
                .data!.serviceCategory!.serviceCategoryName ??
            "";
        description.text = getSingleServiceDetailsData!.data!.description ?? "";
        selectedprice = getSingleServiceDetailsData!
                .data!.serviceCategory!.serviceCategoryName ??
            "";
        txtPrice.text =
            "\$ ${getSingleServiceDetailsData!.data!.price!.toString()}";
        selectedpriceStatus = getSingleServiceDetailsData!.data!.priceStatus;
        print("converted Time : ${selectedvaluemin}");
        print(getSingleServiceDetailsData!.data!.duration);
        setState(() {});
      } else if (response.statusCode == 401) {
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
        // isLoading = false;
      });
    }
  }

  updateServiceDetails(String Id) async {
    try {
      setState(() {
        isLoading = true;
      });
      var postUri = Uri.parse("${ApiUrlList.updateServiceDetails + Id}");
      var request = http.MultipartRequest("PUT", postUri);
      request.headers['Authorization'] =
          "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
      request.headers['Content-Type'] = 'application/json';
      request.headers['Content-Type'] = "multipart/form-data";
      request.fields['duration'] = selectedvalueminnewformat!;
      request.fields['price'] = txtPrice.text.split("\$").last;
      request.fields['description'] = description.text;
      request.fields['isBookOnline'] = Clients.toString();
      request.fields['isHomeService'] = homeService.toString();
      request.fields['noOfParallelClient'] = parallelClients;
      request.fields['showCancelPolicy'] = "false";
      request.fields['priceStatus'] = selectedpriceStatus ?? "";
      if (imagestatus) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('serviceImg', file!.path);
        request.files.add(multipartFile);
      }
      log("request.fields :: ${request.fields}");
      log("request.headers :: ${request.headers}");
      log("request.files :: ${request.files}");
      http.StreamedResponse response = await request.send();
      log('updateServiceDetails code: ${response.statusCode}');
      final res = await http.Response.fromStream(response);
      log('updateServiceDetails body: ${res.body}');
      Map map = jsonDecode(res.body);
      if (res.statusCode == 200) {
        isLoading = false;
        Navigator.pop(context);
        setState(() {});
        showToast(message: "${map['message']}");
      } else {
        Navigator.pop(context);
        showToast(
          message: "${map['message']}",
        );
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  fetchServiceCategories() async {
    try {
      setState(() {
        isLoading = true;
        // pricelist.clear();
      });
      var getUri = Uri.parse(ApiUrlList.fetchServiceCategories);
      var response = await http.get(getUri);
      log("fetchServiceCategories Code ==> ${response.statusCode}");
      log("fetchServiceCategories Body :  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          serviceCategories = ServiceCategories.fromjson(map);
          // for(var i in serviceCategories!.data!){
          //   pricelist.add(i.serviceCategoryName!);
          //   print(pricelist);
          // }
          setState(() {});
        }
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  deleteServiceDetails(String Id) async {
    try {
      setState(() {
        isLoading = true;
      });
      var getUri = Uri.parse("${ApiUrlList.deleteServiceDetails}$Id");
      var Headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.delete(
        getUri,
        headers: Headers,
      );
      log("deleteServiceDetails Body ==> ${response.body}");
      log("deleteServiceDetails Code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map["status"] == 202) {
        isLoading = false;
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return service_Setup_Main(
              email: widget.email,
              isStripeSetUp: widget.isStripeSetUp,
            );
          },
        ));
        setState(() {});
      } else if (response.statusCode == 401) {
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
        // isLoading = false;
      });
    }
  }
}

GetSingleServiceDetailsData getSingleServiceDetailsDataFromJson(String str) =>
    GetSingleServiceDetailsData.fromJson(json.decode(str));

String getSingleServiceDetailsDataToJson(GetSingleServiceDetailsData data) =>
    json.encode(data.toJson());

class GetSingleServiceDetailsData {
  int? status;
  bool? success;
  Data? data;
  String? message;

  GetSingleServiceDetailsData({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  factory GetSingleServiceDetailsData.fromJson(Map<String, dynamic> json) =>
      GetSingleServiceDetailsData(
        status: json["status"],
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? id;
  String? beauticianId;
  ServiceCategory? serviceCategory;
  ServiceType? serviceType;
  String? duration;
  int? price;
  String? description;
  int? isDelete;
  bool? showCancelPolicy;
  String? inBetweenInterval;
  bool? isBookOnline;
  bool? isHomeService;
  String? noOfParallelClient;
  String? imgName;
  String? imageUrl;
  String? dataId;
  String? priceStatus;

  Data(
      {this.id,
      this.beauticianId,
      this.serviceCategory,
      this.serviceType,
      this.duration,
      this.price,
      this.description,
      this.isDelete,
      this.showCancelPolicy,
      this.inBetweenInterval,
      this.isBookOnline,
      this.isHomeService,
      this.noOfParallelClient,
      this.imgName,
      this.imageUrl,
      this.dataId,
      this.priceStatus});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["_id"],
      beauticianId: json["beauticianId"],
      serviceCategory: json["serviceCategory"] == null
          ? null
          : ServiceCategory.fromJson(json["serviceCategory"]),
      serviceType: json["serviceType"] == null
          ? null
          : ServiceType.fromJson(json["serviceType"]),
      duration: json["duration"],
      price: json["price"],
      description: json["description"],
      isDelete: json["isDelete"],
      showCancelPolicy: json["showCancelPolicy"],
      inBetweenInterval: json["inBetweenInterval"],
      isBookOnline: json["isBookOnline"],
      isHomeService: json["isHomeService"],
      noOfParallelClient: (json["noOfParallelClient"] ?? "1").toString(),
      imgName: json["imgName"],
      imageUrl: json["imageUrl"],
      dataId: json["id"],
      priceStatus: json["priceStatus"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "beauticianId": beauticianId,
        "serviceCategory": serviceCategory?.toJson(),
        "serviceType": serviceType?.toJson(),
        "duration": duration,
        "price": price,
        "description": description,
        "isDelete": isDelete,
        "showCancelPolicy": showCancelPolicy,
        "inBetweenInterval": inBetweenInterval,
        "isBookOnline": isBookOnline,
        "isHomeService": isHomeService,
        "imgName": imgName,
        "imageUrl": imageUrl,
        "id": dataId,
        "priceStatus": priceStatus
      };
}

class ServiceCategory {
  String? id;
  String? serviceCategoryName;

  ServiceCategory({
    this.id,
    this.serviceCategoryName,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        id: json["_id"],
        serviceCategoryName: json["serviceCategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceCategoryName": serviceCategoryName,
      };
}

class ServiceType {
  String? id;
  String? serviceTypeName;

  ServiceType({
    this.id,
    this.serviceTypeName,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["_id"],
        serviceTypeName: json["serviceTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceTypeName": serviceTypeName,
      };
}

class ServiceCategories {
  int? status;
  bool? success;
  List<ServiceCategoriesData>? data;
  String? message;

  ServiceCategories({this.status, this.success, this.data, this.message});

  factory ServiceCategories.fromjson(Map<dynamic, dynamic> map) {
    List list = map['data'] ?? "";
    List<ServiceCategoriesData> data =
        list.map((e) => ServiceCategoriesData.fromjson(e)).toList();
    return ServiceCategories(
      status: map['status'] ?? 0,
      success: map['success'] ?? false,
      data: data,
      message: map['message'] ?? "",
    );
  }
}

class ServiceCategoriesData {
  String? id;
  String? serviceCategoryName;
  String? imgPath;
  bool? isSelected;

  ServiceCategoriesData(
      {this.id,
      this.serviceCategoryName,
      this.imgPath,
      this.isSelected = false});

  factory ServiceCategoriesData.fromjson(Map<dynamic, dynamic> map1) {
    return ServiceCategoriesData(
      id: map1['_id'] ?? "",
      serviceCategoryName: map1['serviceCategoryName'] ?? "",
      imgPath: map1['imgPath'] ?? "",
    );
  }
}
