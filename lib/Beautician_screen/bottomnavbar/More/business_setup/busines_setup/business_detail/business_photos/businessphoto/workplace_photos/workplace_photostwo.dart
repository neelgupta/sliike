import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class worlplace_PhotosTwo extends StatefulWidget {
  worlplace_PhotosTwo({Key? key}) : super(key: key);

  @override
  State<worlplace_PhotosTwo> createState() => _worlplace_PhotosTwoState();
}

class _worlplace_PhotosTwoState extends State<worlplace_PhotosTwo> {
  File? firstImage;
  bool firstImageStatus = false;
  String firstImagePath = "";

  File? secondImage;
  bool secondImageStatus = false;
  String secondImagePath = "";

  File? thirdImage;
  bool thirdImageStatus = false;
  String thirdImagePath = "";

  File? fourthImage;
  bool fourthImageStatus = false;
  String fourthImagePath = "";

  ///
  bool isLoading = false;
  Workplacephotos? p;
  List<File> files = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
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
          ? Center(
              child: CircularProgressIndicator(color: Color(0xff01635D)),
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
                    const SizedBox(height: 10),
                    Divider(
                      thickness: 1,
                      color: Color(0xffCFCFCF),
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

                    /// Photo Widget ///
                    firstImageStatus
                        ? Container(
                            width: width,
                            height: 180,
                            decoration: BoxDecoration(
                                image: firstImagePath.isNotEmpty
                                    ? DecorationImage(
                                        image: NetworkImage(firstImagePath),
                                        fit: BoxFit.fill)
                                    : DecorationImage(
                                        image:
                                            FileImage(File(firstImage!.path)),
                                        fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _sheet();
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _sheet();
                                          });
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset(
                                              "assets/images/edit-2.png",
                                              height: 30,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (firstImagePath.isNotEmpty)
                                            deleteWorkSpaceImg(firstImagePath);
                                          firstImageStatus = false;
                                          firstImagePath = "";
                                          firstImage = null;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset(
                                              "assets/images/delete.png",
                                              height: 30),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                        : Container(
                            width: width,
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Rectangle_greyline.png"),
                                    fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _sheet();
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  textComoon("Add Photos", 12,
                                      Color(0xff414141), FontWeight.w500),
                                ],
                              ),
                            )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        firstImage != null ||
                                firstImagePath.isNotEmpty ||
                                secondImage != null ||
                                secondImagePath.isNotEmpty
                            ? secondImageStatus
                                ? Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: secondImagePath.isNotEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    secondImagePath),
                                                fit: BoxFit.fill)
                                            : DecorationImage(
                                                image: FileImage(
                                                    File(secondImage!.path)),
                                                fit: BoxFit.fill)),
                                    child: InkWell(
                                      onTap: () {
                                        _sheet2();
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _sheet2();
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                      "assets/images/edit-2.png",
                                                      height: 20,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (secondImagePath
                                                      .isNotEmpty)
                                                    deleteWorkSpaceImg(
                                                        secondImagePath);
                                                  secondImageStatus = false;
                                                  secondImage = null;
                                                  secondImagePath = "";
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                      "assets/images/delete.png",
                                                      height: 20),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                                : Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Rectangle_greyline.png"),
                                            fit: BoxFit.fill)),
                                    child: InkWell(
                                      onTap: () {
                                        _sheet2();
                                      },
                                      child: Column(
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
                                          Text(
                                            "Add another photo",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xff414141),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ))
                            : SizedBox(),
                        SizedBox(
                          width: 05,
                        ),
                        secondImage != null ||
                                secondImagePath.isNotEmpty ||
                                thirdImage != null ||
                                thirdImagePath.isNotEmpty
                            ? thirdImageStatus
                                ? Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: thirdImagePath.isNotEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    thirdImagePath),
                                                fit: BoxFit.fill)
                                            : DecorationImage(
                                                image: FileImage(
                                                    File(thirdImage!.path)),
                                                fit: BoxFit.fill)),
                                    child: InkWell(
                                      onTap: () {
                                        _sheet3();
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _sheet3();
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                      "assets/images/edit-2.png",
                                                      height: 20,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (thirdImagePath.isNotEmpty)
                                                    deleteWorkSpaceImg(
                                                        thirdImagePath);
                                                  thirdImageStatus = false;
                                                  thirdImage = null;
                                                  thirdImagePath = "";
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                      "assets/images/delete.png",
                                                      height: 20),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                                : Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Rectangle_greyline.png"),
                                            fit: BoxFit.fill)),
                                    child: InkWell(
                                      onTap: () {
                                        _sheet3();
                                      },
                                      child: Column(
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
                                          Text(
                                            "Add another photo",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xff414141),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ))
                            : SizedBox(),
                        SizedBox(
                          width: 05,
                        ),
                        thirdImage != null ||
                                thirdImagePath.isNotEmpty ||
                                fourthImage != null ||
                                fourthImagePath.isNotEmpty
                            ? fourthImageStatus
                                ? Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: fourthImagePath.isNotEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    fourthImagePath),
                                                fit: BoxFit.fill)
                                            : DecorationImage(
                                                image: FileImage(
                                                    File(fourthImage!.path)),
                                                fit: BoxFit.fill)),
                                    child: InkWell(
                                      onTap: () {
                                        _sheet4();
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  _sheet4();
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                      "assets/images/edit-2.png",
                                                      height: 20,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (fourthImagePath
                                                      .isNotEmpty)
                                                    deleteWorkSpaceImg(
                                                        fourthImagePath);
                                                  fourthImageStatus = false;
                                                  fourthImagePath = "";
                                                  fourthImage = null;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                      "assets/images/delete.png",
                                                      height: 20),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                                : Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Rectangle_greyline.png"),
                                            fit: BoxFit.fill)),
                                    child: InkWell(
                                      onTap: () {
                                        _sheet4();
                                      },
                                      child: Column(
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
                                          Text(
                                            "Add another photo",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xff414141),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ))
                            : SizedBox(),
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
                    SizedBox(height: height * 0.05),
                    CommonButton(
                        context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                      postImage();
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

  postImage() async {
    setState(() {
      isLoading = true;
    });
    var postUri = Uri.parse(ApiUrlList.addWorkSpaceImg);
    var request = http.MultipartRequest("POST", postUri);
    request.headers['Authorization'] =
        "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
    if (firstImage != null) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('workspace', firstImage!.path);
      request.files.add(multipartFile);
    }
    if (secondImage != null) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('workspace', secondImage!.path);
      request.files.add(multipartFile);
    }
    if (thirdImage != null) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('workspace', thirdImage!.path);
      request.files.add(multipartFile);
    }
    if (fourthImage != null) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('workspace', fourthImage!.path);
      request.files.add(multipartFile);
    }
    http.StreamedResponse response = await request.send();
    print('code: ${response.statusCode}');
    final res = await http.Response.fromStream(response);
    print('body: ${res.body}');
    Map map = jsonDecode(res.body);
    if (res.statusCode == 200) {
      showToast(message: "${map['message']}");
    } else {
      showToast(message: "${map['message']}");
    }
    setState(() {
      isLoading = false;
    });
  }

  getImages() async {
    setState(() {
      isLoading = true;
    });
    var getUri = Uri.parse(ApiUrlList.getBeauticianWorkSpaceImage);
    var headers = {
      'Content-Type': "application/json; charset=utf-8",
      "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    log("get profile url is  : $getUri");
    log("res headers  : $headers");
    var response = await http.get(getUri, headers: headers);
    log("getApi response.body ==> ${response.body}");
    log("getAPi status code ==> ${response.statusCode}");
    Map map = jsonDecode(response.body);
    if (map['status'] == 200) {
      p = Workplacephotos.fromJson(map);
      if (p!.data!.first.workSpaceImgs.isNotEmpty) {
        if (p!.data!.first.workSpaceImgs.length == 0) {
          firstImage = null;
          firstImagePath = "";
          firstImageStatus = false;
        } else if (p!.data!.first.workSpaceImgs.length == 1) {
          firstImagePath = p!.data!.first.workSpaceImgs[0];
          firstImageStatus = true;
        } else if (p!.data!.first.workSpaceImgs.length == 2) {
          firstImagePath = p!.data!.first.workSpaceImgs[0];
          firstImageStatus = true;
          secondImagePath = p!.data!.first.workSpaceImgs[1];
          secondImageStatus = true;
        } else if (p!.data!.first.workSpaceImgs.length == 3) {
          firstImagePath = p!.data!.first.workSpaceImgs[0];
          firstImageStatus = true;
          secondImagePath = p!.data!.first.workSpaceImgs[1];
          secondImageStatus = true;
          thirdImagePath = p!.data!.first.workSpaceImgs[2];
          thirdImageStatus = true;
        } else if (p!.data!.first.workSpaceImgs.length == 4) {
          firstImagePath = p!.data!.first.workSpaceImgs[0];
          firstImageStatus = true;
          secondImagePath = p!.data!.first.workSpaceImgs[1];
          secondImageStatus = true;
          thirdImagePath = p!.data!.first.workSpaceImgs[2];
          thirdImageStatus = true;
          fourthImagePath = p!.data!.first.workSpaceImgs[3];
          fourthImageStatus = true;
        }
        setState(() {});
      }
    } else {
      p = null;
    }
    setState(() {
      isLoading = false;
    });
  }

  deleteWorkSpaceImg(String imgPath) async {
    try {
      setState(() {
        isLoading = true;
      });
      var getUri = Uri.parse("${ApiUrlList.deleteWorkSpaceImg}");
      var Headers = {
        // 'Content-Type': "application/json; charset=utf-8",
        "Authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var Body = {"imgPath": imgPath};
      var response = await http.delete(
        body: Body,
        getUri,
        headers: Headers,
      );
      log("deleteWorkSpaceImg Body ==> ${response.body}");
      log("deleteWorkSpaceImg Code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        isLoading = false;
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

  updateImage(String workspace, String oldPath) async {
    setState(() {
      isLoading = true;
    });
    var postUri = Uri.parse(ApiUrlList.updateWorkSpaceImg);
    var request = http.MultipartRequest("PUT", postUri);
    request.headers['Authorization'] =
        "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('workspace', workspace);
    request.files.add(multipartFile);

    request.fields["oldImgPath"] = oldPath;

    http.StreamedResponse response = await request.send();
    print('updateImage Code: ${response.statusCode}');
    final res = await http.Response.fromStream(response);
    print('updateImage Body: ${res.body}');
    Map map = jsonDecode(res.body);
    if (res.statusCode == 200) {
      showToast(message: "${map['message']}");
    } else {
      showToast(message: "${map['message']}");
    }
    setState(() {
      isLoading = false;
    });
  }

  Future _sheet() => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(
                    context, "TAKE A PHOTO", 12, FontWeight.w600, Colors.white,
                    () async {
                  Navigator.pop(context);
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    firstImage = File(photo.path);
                    firstImageStatus = true;
                    updateImage(firstImage!.path, firstImagePath);
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(context, "CHOOSE FROM GALLERY", 12,
                    FontWeight.w600, Colors.white, () async {
                  Navigator.pop(context);
                  XFile? selectedImages =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (selectedImages != null) {
                    setState(() {
                      firstImage = File(selectedImages.path);
                      firstImageStatus = true;
                      updateImage(firstImage!.path, firstImagePath);
                    });
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                commonButtonborder(
                    context, "CANCEL", 12, FontWeight.w600, Color(0xff01635D),
                    () {
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          );
        },
      );

  Future _sheet2() => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(
                    context, "TAKE A PHOTO", 12, FontWeight.w600, Colors.white,
                    () async {
                  Navigator.pop(context);
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    secondImage = File(photo.path);
                    secondImageStatus = true;
                    updateImage(secondImage!.path, secondImagePath);
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(context, "CHOOSE FROM GALLERY", 12,
                    FontWeight.w600, Colors.white, () async {
                  Navigator.pop(context);
                  XFile? selectedImages =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (selectedImages != null) {
                    setState(() {
                      secondImage = File(selectedImages.path);
                      secondImageStatus = true;
                      updateImage(secondImage!.path, secondImagePath);
                    });
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                commonButtonborder(
                    context, "CANCEL", 12, FontWeight.w600, Color(0xff01635D),
                    () {
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          );
        },
      );

  Future _sheet3() => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(
                    context, "TAKE A PHOTO", 12, FontWeight.w600, Colors.white,
                    () async {
                  Navigator.pop(context);
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    thirdImage = File(photo.path);
                    thirdImageStatus = true;
                    updateImage(thirdImage!.path, thirdImagePath);
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(context, "CHOOSE FROM GALLERY", 12,
                    FontWeight.w600, Colors.white, () async {
                  Navigator.pop(context);
                  XFile? selectedImages =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (selectedImages != null) {
                    setState(() {
                      thirdImage = File(selectedImages.path);
                      thirdImageStatus = true;
                      updateImage(thirdImage!.path, thirdImagePath);
                    });
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                commonButtonborder(
                    context, "CANCEL", 12, FontWeight.w600, Color(0xff01635D),
                    () {
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          );
        },
      );

  Future _sheet4() => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(
                    context, "TAKE A PHOTO", 12, FontWeight.w600, Colors.white,
                    () async {
                  Navigator.pop(context);
                  final XFile? photo =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (photo != null) {
                    fourthImage = File(photo.path);
                    fourthImageStatus = true;
                    updateImage(fourthImage!.path, fourthImagePath);
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CommonButton(context, "CHOOSE FROM GALLERY", 12,
                    FontWeight.w600, Colors.white, () async {
                  Navigator.pop(context);
                  XFile? selectedImages =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (selectedImages != null) {
                    setState(() {
                      fourthImage = File(selectedImages.path);
                      fourthImageStatus = true;
                      updateImage(fourthImage!.path, fourthImagePath);
                    });
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                commonButtonborder(
                    context, "CANCEL", 12, FontWeight.w600, Color(0xff01635D),
                    () {
                  Navigator.pop(context);
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          );
        },
      );
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
