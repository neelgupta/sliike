import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class worlplace_PhotosTwo extends StatefulWidget {
  worlplace_PhotosTwo({Key? key}) : super(key: key);

  @override
  State<worlplace_PhotosTwo> createState() => _worlplace_PhotosTwoState();
}

class _worlplace_PhotosTwoState extends State<worlplace_PhotosTwo> {
  bool isLoading = false;
  String imagepath = "";
  bool fristimagestatus = false;
  File? fristimage;
  String firstimagestring = "";
  bool secoundimagestatus = false;
  File? secoundimage;
  String secoundimagestring = "";
  bool threeimagestatus = false;
  File? threeimage;
  String threeimagestring = "";
  bool fourimagestatus = false;
  File? fourimage;
  String fourimagestring = "";
  List<String> imagelistofstring = [];
  List<Datum> getimage = [];
  Workplacephotos? p;
  String firstNetworkImage = "";
  String secondNetworkImage = "";
  String thirdNetworkImage = "";
  String fourthNetworkImage = "";
  List<File> files=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getimages();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    final ImagePicker _picker = ImagePicker();
    final ImagePicker imagePicker = ImagePicker();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
                  child: Row(
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
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/Group 55.png"),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.15,
                      ),
                      Container(
                        child: Text("Workplace Photos",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.03,
                    ),
                    textComoonfade(
                        "Show clients what your space looks like before they show up at your door.",
                        12,
                        Color(0xff414141),
                        FontWeight.w500),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffCFCFCF),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: textComoon(
                            "Drag and drop to change photo order.",
                            12,
                            Color(0xff292929),
                            FontWeight.w500)),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  alignment: Alignment.bottomCenter,
                                  insetPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                  shape: RoundedRectangleBorder(
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
                                                source: ImageSource.camera);
                                        if (photo != null) {
                                          fristimage = File(photo.path);
                                          firstimagestring = photo.path;
                                          fristimagestatus = true;
                                          setState(() {});
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
                                        XFile? selectedImages =
                                            await _picker.pickImage(
                                                source: ImageSource.gallery);
                                        if (selectedImages != null) {
                                          setState(() {
                                            fristimage =
                                                File(selectedImages.path);
                                            firstimagestring =
                                                selectedImages.path;
                                            fristimagestatus = true;
                                            print(fristimagestatus);
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
                                          Color(0xff01635D), () {
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
                                  image: fristimagestatus
                                      ? DecorationImage(
                                          image:
                                              FileImage(File(firstimagestring)))
                                      : firstNetworkImage!=null?DecorationImage(image: NetworkImage(fourthNetworkImage)):DecorationImage(
                                          image: AssetImage(
                                              "assets/images/Rectangle_greyline.png"),
                                          fit: BoxFit.fill)),
                              child: fristimagestatus
                                  ? Stack(
                                      children: [
                                        Positioned(
                                          right: 50,
                                          child: GestureDetector(
                                            onTap: () async {
                                              XFile? selectedImages =
                                                  await _picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (selectedImages != null) {
                                                setState(() {
                                                  fristimage =
                                                      File(selectedImages.path);
                                                  firstimagestring =
                                                      selectedImages.path;
                                                  fristimagestatus = true;
                                                  print(fristimagestatus);
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xffE7E7E7),
                                                    width: 1),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                    "assets/images/edit_grey.png"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 10,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                firstimagestring = "";
                                                fristimagestatus = false;
                                              });
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xffE7E7E7),
                                                    width: 1),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                    "assets/images/delete.png"),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Image(
                                            height: 40,
                                            image: AssetImage(
                                                "assets/images/camera_grey.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        textComoon("Add Logo", 12,
                                            Color(0xff414141), FontWeight.w500),
                                      ],
                                    )),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            fristimagestatus
                                ? Container(
                                    width: width * 0.43,
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              alignment: Alignment.bottomCenter,
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 30),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                                                    if (photo != null) {
                                                      secoundimage =
                                                          File(photo.path);
                                                      secoundimagestring =
                                                          photo.path;
                                                      secoundimagestatus = true;
                                                      setState(() {});
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
                                                    XFile? selectedImages = await _picker.pickImage(source: ImageSource.gallery);
                                                    if (selectedImages != null) {
                                                      setState(() {
                                                        secoundimage = File(selectedImages.path);
                                                        secoundimagestring = selectedImages.path;
                                                        secoundimagestatus = true;
                                                        print(fristimagestatus);
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
                                                      Color(0xff01635D), () {
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
                                          height: 180,
                                          decoration: BoxDecoration(
                                              image: secoundimagestatus
                                                  ? DecorationImage(
                                                      image: FileImage(File(
                                                          secoundimagestring)))
                                                  : secondNetworkImage!=null?DecorationImage(image: NetworkImage(secondNetworkImage)):DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/Rectangle_greyline.png"),
                                                      fit: BoxFit.fill)),
                                          child: secoundimagestatus
                                              ? Stack(
                                                  children: [
                                                    Positioned(
                                                      right: 50,
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          XFile?
                                                              selectedImages =
                                                              await _picker.pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                          if (selectedImages !=
                                                              null) {
                                                            setState(() {
                                                              secoundimage = File(
                                                                  selectedImages
                                                                      .path);
                                                              secoundimagestring =
                                                                  selectedImages
                                                                      .path;
                                                              secoundimagestatus =
                                                                  true;
                                                              print(
                                                                  fristimagestatus);
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffE7E7E7),
                                                                width: 1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/images/edit_grey.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            secoundimagestring =
                                                                "";
                                                            secoundimagestatus =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffE7E7E7),
                                                                width: 1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/images/delete.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Image(
                                                        height: 40,
                                                        image: AssetImage(
                                                            "assets/images/camera_grey.png"),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textComoon(
                                                        "Add Logo",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                )),
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            secoundimagestatus
                                ? Container(
                                    width: width * 0.43,
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              alignment: Alignment.bottomCenter,
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 30),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      threeimage =
                                                          File(photo.path);
                                                      threeimagestring =
                                                          photo.path;
                                                      threeimagestatus = true;
                                                      setState(() {});
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
                                                    XFile? selectedImages =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    if (selectedImages !=
                                                        null) {
                                                      setState(() {
                                                        threeimage = File(
                                                            selectedImages
                                                                .path);
                                                        threeimagestring =
                                                            selectedImages.path;
                                                        threeimagestatus = true;
                                                        print(fristimagestatus);
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
                                                      Color(0xff01635D), () {
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
                                          height: 180,
                                          decoration: BoxDecoration(
                                              image: threeimagestatus
                                                  ? DecorationImage(
                                                      image: FileImage(File(
                                                          threeimagestring)))
                                                  :thirdNetworkImage!=null?DecorationImage(image: NetworkImage(thirdNetworkImage)): DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/Rectangle_greyline.png"),
                                                      fit: BoxFit.fill)),
                                          child: threeimagestatus
                                              ? Stack(
                                                  children: [
                                                    Positioned(
                                                      right: 50,
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          XFile?
                                                              selectedImages =
                                                              await _picker.pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                          if (selectedImages !=
                                                              null) {
                                                            setState(() {
                                                              threeimage = File(
                                                                  selectedImages
                                                                      .path);
                                                              threeimagestring =
                                                                  selectedImages
                                                                      .path;
                                                              threeimagestatus =
                                                                  true;
                                                              print(
                                                                  fristimagestatus);
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffE7E7E7),
                                                                width: 1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/images/edit_grey.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            secoundimagestring =
                                                                "";
                                                            secoundimagestatus =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffE7E7E7),
                                                                width: 1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/images/delete.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Image(
                                                        height: 40,
                                                        image: AssetImage(
                                                            "assets/images/camera_grey.png"),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textComoon(
                                                        "Add Logo",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                )),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            threeimagestatus
                                ? Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              alignment: Alignment.bottomCenter,
                                              insetPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 30),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      fourimage =
                                                          File(photo.path);
                                                      fourimagestring =
                                                          photo.path;
                                                      fourimagestatus = true;
                                                      setState(() {});
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
                                                    XFile? selectedImages =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    if (selectedImages !=
                                                        null) {
                                                      setState(() {
                                                        fourimage = File(
                                                            selectedImages
                                                                .path);
                                                        fourimagestring =
                                                            selectedImages.path;
                                                        fourimagestatus = true;
                                                        print(fristimagestatus);
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
                                                      Color(0xff01635D), () {
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
                                              image: fourimagestatus
                                                  ? DecorationImage(
                                                      image: FileImage(File(
                                                          fourimagestring)))
                                                  :fourthNetworkImage!=null?DecorationImage(image: NetworkImage(fourthNetworkImage)): DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/Rectangle_greyline.png"),
                                                      fit: BoxFit.fill)),
                                          child: fourimagestatus
                                              ? Stack(
                                                  children: [
                                                    Positioned(
                                                      right: 50,
                                                      child: GestureDetector(
                                                        onTap: () async {
                                                          XFile? selectedImages = await _picker.pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                          if (selectedImages !=
                                                              null) {
                                                            setState(() {
                                                              fourimage = File(
                                                                  selectedImages
                                                                      .path);
                                                              fourimagestring =
                                                                  selectedImages
                                                                      .path;
                                                              fourimagestatus =
                                                                  true;
                                                              print(
                                                                  fristimagestatus);
                                                            });
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffE7E7E7),
                                                                width: 1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/images/edit_grey.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            fourimagestring =
                                                                "";
                                                            fourimagestatus =
                                                                false;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xffE7E7E7),
                                                                width: 1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                                "assets/images/delete.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Image(
                                                        height: 40,
                                                        image: AssetImage(
                                                            "assets/images/camera_grey.png"),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    textComoon(
                                                        "Add Logo",
                                                        12,
                                                        Color(0xff414141),
                                                        FontWeight.w500),
                                                  ],
                                                )),
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(child: Container())
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffF3F3F3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 15, right: 15),
                          child: textComoonfade(
                              "You can add up to four(4) (Optional) photos of your place of work, in order to help clients understand and see more of your work space.",
                              10,
                              Color(0xff414141),
                              FontWeight.w500),
                        )),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    CommonButton(
                        context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                      postimage();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return allProduct_select();
                      // },));
                    }),
                    SizedBox(
                      height: height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  postimage() async {
    try {
      imagelistofstring.clear();
      setState(() {
        isLoading = true;
      });
      var postUri = Uri.parse(ApiUrlList.addWorkSpaceImg);
      var request = http.MultipartRequest("POST", postUri);
      request.headers['Authorization'] =
          "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
      if (fristimagestatus) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('workspace', fristimage!.path);
        request.files.add(multipartFile);
      }
      if (secoundimagestatus) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('workspace', secoundimage!.path);
        request.files.add(multipartFile);
      }
      if (threeimagestatus) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('workspace', threeimage!.path);
        request.files.add(multipartFile);
      }
      if (fourimagestatus) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('workspace', fourimage!.path);
        request.files.add(multipartFile);
      }
      // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      //     'workspace', );
      // request.fields["workspace"] = imagelistofstring.toString();
      http.StreamedResponse response = await request.send();
      print('code: ${response.statusCode}');
      final res = await http.Response.fromStream(response);
      print('body: ${res.body}');
      Map map = jsonDecode(res.body);
      if (res.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // pickFiles() async {
  //   try {
  //
  //     // FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,allowedExtensions: ['jpg', 'png'],);
  //
  //     if (result != null) {
  //       setState(() {
  //         files = result.paths.map((path) => File(path!)).toList();
  //       });
  //     } else {
  //       // User canceled the picker
  //     }
  //   } on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   }
  //   if (!mounted) return;
  // }

  getimages() async {
    try {
      setState(() {
        isLoading = true;
      });
      var geturi = Uri.parse(
          "https://hungry-duck-zipper.cyclic.app/api/v1/beautician/getWorkSpaceImg");
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $geturi");
      log("res headers  : $headers");
      var response = await http.get(geturi, headers: headers);
      log("getApi response.body ==> ${response.body}");
      log("getAPi status code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
        p = Workplacephotos.fromJson(map);
        if (p != null) {
          if (p!.data!.first.workSpaceImgs.isNotEmpty) {
            firstNetworkImage = p!.data!.first.workSpaceImgs[0];
          }

          if (p!.data!.first.workSpaceImgs.length > 1) {
            secondNetworkImage = p!.data!.first.workSpaceImgs[1];
          }

          if (p!.data!.first.workSpaceImgs.length > 2) {
            thirdNetworkImage = p!.data!.first.workSpaceImgs[2];
          }

          if (p!.data!.first.workSpaceImgs.length > 3) {
            fourthNetworkImage = p!.data!.first.workSpaceImgs[3];
          }
        }
        log("p!.data!.first.workSpaceImgs.length :: ${p!.data!.first.workSpaceImgs.length}");
        log("firstNetworkImage :: $firstNetworkImage");
        log("secondNetworkImage :: $secondNetworkImage");
        log("thirdNetworkImage :: $thirdNetworkImage");
        log("fourthNetworkImage :: $fourthNetworkImage");

        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
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

class Workplacephotos {
  int? status;
  bool? success;
  String? message;
  List<Datum>? data;

  Workplacephotos({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory Workplacephotos.fromJson(Map<dynamic, dynamic> json) =>
      Workplacephotos(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? id;
  String? uid;
  List<String> workSpaceImgs;

  Datum({
    this.id,
    this.uid,
    required this.workSpaceImgs,
  });

  factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        id: json["_id"],
        uid: json["uid"],
        workSpaceImgs: json["workSpaceImgs"] == null
            ? []
            : List<String>.from(json["workSpaceImgs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "workSpaceImgs": workSpaceImgs == null
            ? []
            : List<dynamic>.from(workSpaceImgs.map((x) => x)),
      };
}
