import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/setting.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/setup_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class profile_Images extends StatefulWidget {
  const profile_Images({Key? key}) : super(key: key);

  @override
  State<profile_Images> createState() => _profile_ImagesState();
}

class _profile_ImagesState extends State<profile_Images> {
  TextEditingController servicetype = TextEditingController();
  TextEditingController servicecategory = TextEditingController();
  TextEditingController description = TextEditingController();
  bool servicetypestatus = false;
  bool servicecategorystatus = false;
  bool descriptionstatus = false;
  String status = "";
  List<String> mindropdownlist = <String>[
    "30 min",
    "25 min",
    "20 min",
    "15 min",
    "10 min"
  ];

  List<String> pricelist = <String>[
    "Fixed",
    "25 min",
    "20 min",
    "15 min",
    "10 min"
  ];
  String? selectedprice = "Fixed";
  String? selectedvaluemin = "30 min";
  final ImagePicker _picker = ImagePicker();
  bool imagestatus = false;
  String imagepath = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height -
        MediaQuery
            .of(context)
            .padding
            .top -
        MediaQuery
            .of(context)
            .padding
            .bottom;
    double width = MediaQuery
        .of(context)
        .size
        .width -
        MediaQuery
            .of(context)
            .padding
            .right -
        MediaQuery
            .of(context)
            .padding
            .left;
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
                                border: Border.all(color: const Color(0xff414141))),
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
                              child: const Text("Men’s Cut",
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
      body: SingleChildScrollView(
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
                  textComoon("Add image of this service ", 12,
                      const Color(0xff292929), FontWeight.w700),
                  textComoon(
                      "(optional)", 12, const Color(0xff707070), FontWeight.w700)
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
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        title: Column(
                          children: <Widget>[
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CommonButton(context, "TAKE A PHOTO", 12,
                                FontWeight.w600, Colors.white, () async {
                                  Navigator.pop(context);
                                  final XFile? photo = await _picker
                                      .pickImage(
                                      source: ImageSource.camera);
                                  if (photo != null) {
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
                              final XFile? image = await _picker
                                  .pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                imagestatus = true;
                                imagepath = image.path;
                              }
                            }),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            commonButtonborder(context, "CANCEL", 12,
                                FontWeight.w600, const Color(0xff01635D), () {
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
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      width: width,
                      height: 150,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(File(imagepath)),
                              fit: BoxFit.fill)),
                    );
                  },

                ),
              ) : InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        alignment: Alignment.bottomCenter,
                        insetPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        title: Column(
                          children: <Widget>[
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CommonButton(context, "TAKE A PHOTO", 12,
                                FontWeight.w600, Colors.white, () async {
                                  Navigator.pop(context);

                                  final XFile? photo = await _picker
                                      .pickImage(source: ImageSource.camera);
                                  if (photo != null) {
                                    setState(() {
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
                              final XFile? image = await _picker
                                  .pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                setState(() {
                                  imagestatus = true;
                                  imagepath = image.path;
                                });
                              }
                            }),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            commonButtonborder(context, "CANCEL", 12,
                                FontWeight.w600, const Color(0xff01635D), () {
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
                    decoration: const BoxDecoration(
                        color: Color(0xffF3F3F3),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/Rectangle_greyline.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Image(
                            height: 40,
                            image: AssetImage("assets/images/camera_grey.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        textComoon(
                            "Take a photo or Upload from gallery", 12,
                            const Color(0xff414141), FontWeight.w500),
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
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
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
                  labelStyle:
                  const TextStyle(fontFamily: 'spartan', color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xff292929)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xff292929)),
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
                    labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff292929)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xff292929)),
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
              child: textComoon(
                  "Pricing & Duration", 14, const Color(0xff292929), FontWeight.w600),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                      style: const TextStyle(fontSize: 14, color: Color(0xff292929)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedvaluemin = newValue!;
                  });
                },
                icon: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 30, color: Color(0xff969696)
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "Service Category",
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'spartan',
                      color: Color(0xff292929),
                      fontWeight: FontWeight.w500),
                  labelText: "Service Category",
                  labelStyle:
                  const TextStyle(fontFamily: 'spartan', color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xff292929)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xff292929)),
                  ),
                ),
              ),
            ),
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
                      value: selectedprice,
                      items: pricelist.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xff292929)),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedprice = newValue!;
                        });
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30, color: Color(0xff969696)
                        ),
                      ),
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
                          borderSide: const BorderSide(color: Color(0xff292929)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Color(0xff292929)),
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
                          hintText: "Service Price",
                          hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'spartan',
                              color: Color(0xff292929),
                              fontWeight: FontWeight.w500),
                          labelText: "Service Price",
                          labelStyle: const TextStyle(
                              fontFamily: 'spartan', color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color(0xff292929)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Color(0xff292929)),
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
              child: textComoon("Service Description", 14, const Color(0xff292929),
                  FontWeight.w700),
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
                    labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Colors.black54),
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
                padding: const EdgeInsets.only(top: 12, bottom: 12, left: 20),
                child: textComoon(
                    "More Options", 14, const Color(0xff292929), FontWeight.w600),
              ),
            ),
            SizedBox(height: height * 0.015,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const setting();
                  },));
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
                        child: Image.asset("assets/images/righticon.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 17,
                ),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textComoon("For Client", 14,
                          const Color(0xff414141), FontWeight.w500),
                      Container(
                        height: 15,
                        width: 30,
                        child: Image.asset("assets/images/righticon.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: height * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.07,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF3232),
                      borderRadius: BorderRadius.circular(5),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                          "assets/images/delete.png", color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) {
                          return const service_Setup_Main();
                        },));
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
            SizedBox(height: height * 0.04,),

          ],
        ),
      ),
    );
  }
}
