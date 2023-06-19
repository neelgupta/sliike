import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../../../utils/preferences.dart';
import '../../../../../../../../custom_widget/textcommon/textcommon.dart';

// ignore: camel_case_types
class logo extends StatefulWidget {
  const logo({Key? key}) : super(key: key);

  @override
  State<logo> createState() => _logoState();
}

// ignore: camel_case_types
class _logoState extends State<logo> {
  final ImagePicker _picker = ImagePicker();
  bool imagestatus = false;
  String imagepath = "";
  File? images;
  bool isLoading = false;
  Temperatures? p;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getimage();
  }

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
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: const Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Row(
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
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                image:
                                AssetImage("assets/images/Group 55.png"),

                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.25,),
                    const Text("Logo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w700)),
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
          color: Color(0xff01635D),
        ),
      )
          :SingleChildScrollView(
        child: SizedBox(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(height: height*0.02,),
                textComoonfade("Have your business logo visible on your Sliike profile.", 12, const Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.04,),
                GestureDetector(
                  onTap: () async {
                    XFile? image = await _picker.pickImage(
                        source: ImageSource.gallery);
                    if (image != null) {
                      setState(() {
                        images = File(image.path);
                        imagepath = image.path;
                        imagestatus = true;
                      });

                    }
                  },
                  child: imagepath.isNotEmpty?
                  Container(
                      width: 120,
                      height:120,
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: FileImage(File(images!.path)),fit: BoxFit.fill)
                      ),
                      child: SizedBox()):
                  p!.data!.logoPath!.isNotEmpty?
                  CachedNetworkImage(
                    imageUrl:  p!.data!.logoPath!,
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          width: 120,
                          height:120,
                          decoration:  BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              shape: BoxShape.circle,
                              image : DecorationImage(image: NetworkImage(p!.data!.logoPath!),fit: BoxFit.fill
                              )
                          ),),
                    progressIndicatorBuilder:
                        (context, url, process) => Container(
                        height: height * 0.15,
                        width: width * 0.30,
                        margin: const EdgeInsets.all(5),
                        child: const Center(
                            child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Container(
                        height: height * 0.15,
                        width: width * 0.30,
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Center(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Text("No Image")
                              ],
                            ))),
                  ):
                  Container(
                      width: 120,
                      height:120,
                      decoration:  BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        shape: BoxShape.circle,
                          // image: p?.data?.logoPath!=null?
                          // DecorationImage(image: NetworkImage(p!.data!.logoPath!),fit: BoxFit.fill):
                          image : DecorationImage(image: AssetImage("assets/images/circle_line.png"),fit: BoxFit.fill
                  )
                      ),
                      child: !imagestatus && p?.data?.logoPath==null?Column(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Image(height: 30,
                              image:
                              AssetImage("assets/images/camera_grey.png"),

                            ),
                          ),
                          const SizedBox(height: 5,),
                          textComoon("Add Logo", 12, const Color(0xff414141),FontWeight.w500),
                        ],
                      ):const SizedBox()),
                ),
                const Spacer(),
                CommonButton(context, "OK", 12, FontWeight.w600, Colors.white, () {
                  if (imagepath.isNotEmpty) {
                    postimage();
                  } else {
                    Navigator.pop(context);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  postimage() async   {
    try {
      setState(() {
        isLoading = true;
      });
      var postUri = Uri.parse(ApiUrlList.postlogoimage);
      var request = http.MultipartRequest("POST", postUri);
      request.headers['Authorization'] =
      "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
      if(imagepath != ""){
        http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
            'logo', images!.path);
        request.files.add(multipartFile);
      }
      http.StreamedResponse response = await request.send();
      print('code: ${response.statusCode}');
      final res = await http.Response.fromStream(response);
      print('body: ${res.body}');
      Map map = jsonDecode(res.body);
      if(res.statusCode == 200){
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }else {
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

  getimage() async {
      setState(() {
        isLoading = true;
      });
      var gettUri = Uri.parse(ApiUrlList.getBeauticianLogoImage);
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $gettUri");
      log("res headers  : $headers");
      var response = await http.get(gettUri,headers: headers);
      log("getApi response.body ==> ${response.body}");
      log("getAPi status code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
        p = Temperatures.fromJson(map);
      } else {
        p = null;
      }
      isLoading = false;
      setState(() {});

  }
}

class Temperatures {
  int? status;
  bool? success;
  String? message;
  Data? data;

  Temperatures({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory Temperatures.fromJson(Map<dynamic, dynamic> json) => Temperatures(
    status: json["status"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? uid;
  String? logo;
  String? logoPath;

  Data({
    this.id,
    this.uid,
    this.logo,
    this.logoPath,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    id: json["_id"],
    uid: json["uid"],
    logo: json["logo"],
    logoPath: json["logoPath"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "logo": logo,
    "logoPath": logoPath,
  };
}
