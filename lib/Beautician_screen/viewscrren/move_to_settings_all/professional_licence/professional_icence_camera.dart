import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/move_to_settings_all/professional_licence/professional_icence_camera.dart';
import '../../../../commonClass.dart';
import '../../../../utils/apiurllist.dart';
import '../../../../utils/preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class professional_Licence_Camera extends StatefulWidget {
  const professional_Licence_Camera({Key? key}) : super(key: key);

  @override
  State<professional_Licence_Camera> createState() =>
      _professional_LicenceState();
}

// ignore: camel_case_types
class _professional_LicenceState extends State<professional_Licence_Camera> {
  bool isLoading = false;
  String selected = 'yes';
  final ImagePicker _picker = ImagePicker();
  File? images;
  String imagePath = "";
  bool imageStatus = false;
  int? isLicensed;
  getLicenseDetailsC ? data;

  _pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        images = File(image.path);
        imagePath = image.path;
        imageStatus = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLicenseDetails();
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
            toolbarHeight: height * 0.18, // Set this height
            flexibleSpace: Container(
                color: const Color(0xff01635D),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Professional Licence",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xffFFFFFF),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Indicate your professional licence status",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "spartan",
                                    color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  )
                ]))),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff01635D),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xffE7E7E7), width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset("assets/images/licence.png"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Are you a licenced beautician?",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                    color: Color(0xff01635D),
                                    fontWeight: FontWeight.bold)),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                            value: "yes",
                                            activeColor:
                                                const Color(0xff01635D),
                                            groupValue: selected,
                                            onChanged: (value) {
                                              setState(() {
                                                selected = value as String;
                                                isLicensed = 1;
                                                print(isLicensed);
                                              });
                                            }),
                                        const Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'spartan',
                                              color: Color(0xff414141)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: "No",
                                            activeColor:
                                                const Color(0xff01635D),
                                            groupValue: selected,
                                            onChanged: (value) {
                                              setState(() {
                                                selected = value as String;
                                                isLicensed = 0;
                                                print(isLicensed);
                                              });
                                            }),
                                        const Text(
                                          "No",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'spartan',
                                              color: Color(0xff414141)),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            selected == "yes"
                                ? Column(children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Divider(
                                          color: Color(0xffCFCFCF),
                                          thickness: 1),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    ///Camera Condditon
                                    // Container(
                                    //
                                    //   height: height*0.16,
                                    //
                                    //   child: Center(
                                    //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    //       children: [
                                    //
                                    //         InkWell(
                                    //           onTap: (){
                                    //
                                    //           },
                                    //           child: Container(
                                    //             width: 70,
                                    //             height: 70,
                                    //             decoration: BoxDecoration(
                                    //                 image: DecorationImage(
                                    //                   image: AssetImage("assets/images/camera.png"),
                                    //                 )
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         SizedBox(height: 10,),
                                    //         Center(child: Text("Upload proof of professional licence",style: TextStyle(fontSize: 10,fontFamily: 'spartan',color: Color(0xff414141)),textAlign: TextAlign.center,)),
                                    //
                                    //       ],
                                    //     ),
                                    //   ),
                                    // )
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        imageStatus
                                            ? SizedBox(
                                                width: width * 0.5,
                                                height: height * 0.16,
                                                child: Image.file(
                                                    File(images!.path),
                                                    fit: BoxFit.fill),
                                              )
                                            : SizedBox(
                                                width: width * 0.5,
                                                height: height * 0.16,
                                                child: data?.data?.licenseImagePath==null?Image.asset(
                                                    "assets/images/Rectangle 217.png",
                                                    fit: BoxFit.fill):
                                                Image.network(
                                                    data!.data!.licenseImagePath!,
                                                    fit: BoxFit.fill)
                                              ),
                                        InkWell(
                                          onTap: () {
                                            _pickImage();
                                            print(data?.data?.licenseImagePath);
                                          },
                                          child: SizedBox(
                                            width: 35,
                                            height: 35,
                                            child: Image.asset(
                                                "assets/images/cameracircal.png",
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      ],
                                    )
                                  ])
                                : Column(
                                    children: const [],
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                       if(isLicensed == 1 && imagePath == ""){
                         Fluttertoast.showToast(msg: "Please upload licence photo");
                       }
                       else{
                         addBusinessLicense();
                       }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff01635D)),
                      child: const Text("CONTINUE",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
              ));
  }

  addBusinessLicense() async {
    try {
      setState(() {
        isLoading = true;
      });
      var postUri = Uri.parse(ApiUrlList.addBusinessLicense);
      var request = http.MultipartRequest("POST", postUri);
      request.fields["isLicensed"] = isLicensed.toString();
      request.headers['Authorization'] = "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
      log("Fileds :: ${request.fields}");
      if(imagePath != "" && isLicensed == 1){
        http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('licenseImage', images!.path);
        request.files.add(multipartFile);
      }
      http.StreamedResponse response = await request.send();
      print('code: ${response.statusCode}');
      final res = await http.Response.fromStream(response);
      print('body: ${res.body}');
      Map map = jsonDecode(res.body);
      if (res.statusCode == 200) {
        Navigator.pop(context);
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        setState(() {
          isLoading = false;
        });
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

  getLicenseDetails() async {
      setState(() {
        isLoading = true;
      });
      var gettUri = Uri.parse(ApiUrlList.getLicenseDetails);
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "Authorization": "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var response = await http.get(gettUri,headers: headers);
      log("getLicenseDetails Body ==> ${response.body}");
      log("getLicenseDetails Code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
        data = getLicenseDetailsC.fromJson(map);
        if(data!.data!.licenseImagePath!=null){
          isLicensed = 1;
          setState(() {});
        }
        setState(() {
          data!.data!.isLicensed==0?selected="No":"Yes";
          print(isLicensed);
        });
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
      setState(() {
        isLoading = false;
      });
  }

}
class getLicenseDetailsC {
  int? status;
  bool? success;
  String? message;
  Data? data;

  getLicenseDetailsC({
    this.status,
    this.success,
    this.message,
    this.data,
  });

  factory getLicenseDetailsC.fromJson(Map<dynamic, dynamic> json) => getLicenseDetailsC(
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
  int? isLicensed;
  String? licenseImagePath;

  Data({
    this.id,
    this.isLicensed,
    this.licenseImagePath,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    id: json["_id"],
    isLicensed: json["isLicensed"],
    licenseImagePath: json["licenseImagePath"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "isLicensed": isLicensed,
    "licenseImagePath": licenseImagePath,
  };
}