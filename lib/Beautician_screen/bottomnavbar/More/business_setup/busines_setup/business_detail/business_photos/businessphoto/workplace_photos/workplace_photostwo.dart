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
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class worlplace_PhotosTwo extends StatefulWidget {
  worlplace_PhotosTwo({Key? key}) : super(key: key);

  @override
  State<worlplace_PhotosTwo> createState() => _worlplace_PhotosTwoState();
}

class _worlplace_PhotosTwoState extends State<worlplace_PhotosTwo> {

  File? firstImage;
  bool firstImageStatus = false;
  bool one = false;
  String firstImagePath = "";

  File? secondImage;
  bool secondImageStatus = false;
  bool two = false;
  String secondImagePath = "";

  File? thirdImage;
  bool thirdImageStatus = false;
  bool three = false;
  String thirdImagePath = "";

  File? fourthImage;
  bool fourthImageStatus = false;
  bool four = false;
  String fourthImagePath = "";


  ///
  bool isLoading = false;
  Workplacephotos? p;
  List<File> files=[];
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
      body: isLoading?
          Center(child: CircularProgressIndicator(color: Color(0xff01635D)),):
          SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //
                    //   },
                    //   child: Container(
                    //       width: width,
                    //       height: 150,
                    //       decoration: BoxDecoration(
                    //           image: fristimagestatus
                    //               ? DecorationImage(
                    //               image:
                    //               FileImage(File(firstimagestring)))
                    //               : firstNetworkImage!=null?DecorationImage(image: NetworkImage(fourthNetworkImage)):
                    //           DecorationImage(
                    //               image: AssetImage(
                    //                   "assets/images/Rectangle_greyline.png"),
                    //               fit: BoxFit.fill)),
                    //       child: fristimagestatus
                    //           ? Stack(
                    //         children: [
                    //           Positioned(
                    //             right: 50,
                    //             child: GestureDetector(
                    //               onTap: () async {
                    //                 XFile? selectedImages =
                    //                 await _picker.pickImage(
                    //                     source:
                    //                     ImageSource.gallery);
                    //                 if (selectedImages != null) {
                    //                   setState(() {
                    //                     fristimage =
                    //                         File(selectedImages.path);
                    //                     firstimagestring =
                    //                         selectedImages.path;
                    //                     fristimagestatus = true;
                    //                     print(fristimagestatus);
                    //                   });
                    //                 }
                    //               },
                    //               child: Container(
                    //                 width: 30,
                    //                 height: 30,
                    //                 decoration: BoxDecoration(
                    //                   color: Color(0xffFFFFFF),
                    //                   borderRadius:
                    //                   BorderRadius.circular(5),
                    //                   border: Border.all(
                    //                       color: Color(0xffE7E7E7),
                    //                       width: 1),
                    //                 ),
                    //                 child: Padding(
                    //                   padding:
                    //                   const EdgeInsets.all(8.0),
                    //                   child: Image.asset(
                    //                       "assets/images/edit_grey.png"),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           Positioned(
                    //             right: 10,
                    //             child: GestureDetector(
                    //               onTap: () {
                    //                 setState(() {
                    //                   firstimagestring = "";
                    //                   fristimagestatus = false;
                    //                 });
                    //               },
                    //               child: Container(
                    //                 width: 30,
                    //                 height: 30,
                    //                 decoration: BoxDecoration(
                    //                   color: Color(0xffFFFFFF),
                    //                   borderRadius:
                    //                   BorderRadius.circular(5),
                    //                   border: Border.all(
                    //                       color: Color(0xffE7E7E7),
                    //                       width: 1),
                    //                 ),
                    //                 child: Padding(
                    //                   padding:
                    //                   const EdgeInsets.all(8.0),
                    //                   child: Image.asset(
                    //                       "assets/images/delete.png"),
                    //                 ),
                    //               ),
                    //             ),
                    //           )
                    //         ],
                    //       )
                    //           : Column(
                    //         crossAxisAlignment:
                    //         CrossAxisAlignment.center,
                    //         mainAxisAlignment:
                    //         MainAxisAlignment.center,
                    //         children: [
                    //           Center(
                    //             child: Image(
                    //               height: 40,
                    //               image: AssetImage(
                    //                   "assets/images/camera_grey.png"),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 5,
                    //           ),
                    //           textComoon("Add Logo", 12,
                    //               Color(0xff414141), FontWeight.w500),
                    //         ],
                    //       )),
                    // ),
                    SizedBox(height: height * 0.03,),
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
                    firstImageStatus?
                    Container(
                        width: width,
                        height: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: FileImage(File(firstImagePath)), fit: BoxFit.contain)),
                        child: InkWell(
                          onTap: (){
                            _sheet();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height:  10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      _sheet();
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      child: Image.asset("assets/images/edit-2.png",height: 30,color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(width:  10,),
                                  InkWell(
                                    onTap: (){
                                      // deleteWorkSpaceImg(p!.data!.first.workSpaceImgs[0]);
                                      firstImageStatus = false;
                                      // one = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      child: Image.asset("assets/images/delete.png",height: 30),
                                    ),
                                  ),
                                  const SizedBox(width:  10,),
                                ],
                              ),
                            ],
                          ),
                        )
                    ):
                    Container(
                        width: width,
                        height: 180,
                        decoration: BoxDecoration(
                            image: p!.data!.first.workSpaceImgs.isNotEmpty?
                            DecorationImage(image: NetworkImage( p!.data!.first.workSpaceImgs[0]), fit: BoxFit.fill):
                            DecorationImage(image: AssetImage("assets/images/Rectangle_greyline.png"), fit: BoxFit.fill)),
                        child: InkWell(
                          onTap: (){
                            _sheet();
                          },
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              p!.data!.first.workSpaceImgs.isNotEmpty?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      _sheet();
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      child: Image.asset("assets/images/edit-2.png",height: 30,color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(width:  10,),
                                  InkWell(
                                    onTap: (){
                                      deleteWorkSpaceImg(p!.data!.first.workSpaceImgs[0]);
                                      firstImageStatus = false;
                                      // one = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      child: Image.asset("assets/images/delete.png",height: 30),
                                    ),
                                  ),
                                  const SizedBox(width:  10,),
                                ],
                              ):
                                  SizedBox(),
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
                                  "Add Photos",
                                  12,
                                  Color(0xff414141),
                                  FontWeight.w500),
                            ],
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        one?Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image:  p!.data!.first.workSpaceImgs.isNotEmpty?
                                DecorationImage(image: NetworkImage(p!.data!.first.workSpaceImgs[1]), fit: BoxFit.fill):
                                DecorationImage(image: AssetImage("assets/images/Rectangle_greyline.png"), fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: (){
                                _sheet2();
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  p!.data!.first.workSpaceImgs.isNotEmpty?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _sheet2();
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/edit-2.png",height: 20,color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                      InkWell(
                                        onTap: (){
                                          deleteWorkSpaceImg(p!.data!.first.workSpaceImgs[1]);
                                          secondImageStatus = false;
                                          one = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/delete.png",height: 20),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                    ],
                                  ):
                                      SizedBox(),
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
                                  Text("Add another photo",style: TextStyle(fontSize: 10,color: Color(0xff414141),fontWeight:FontWeight.w500),)
                                ],
                              ),
                            )
                        ):secondImageStatus?Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: FileImage(File(secondImagePath)), fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: (){
                                _sheet2();
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height:  10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _sheet2();
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/edit-2.png",height: 20,color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                      InkWell(
                                        onTap: (){
                                          secondImageStatus = false;
                                          one = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/delete.png",height: 20),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ):SizedBox(),
                        SizedBox(width: 05,),
                        two?Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: p!.data!.first.workSpaceImgs.isNotEmpty?
                                DecorationImage(image: NetworkImage(p!.data!.first.workSpaceImgs[2]), fit: BoxFit.fill):
                                DecorationImage(image: AssetImage("assets/images/Rectangle_greyline.png"), fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: (){
                                _sheet3();
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  p!.data!.first.workSpaceImgs.isNotEmpty?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _sheet3();
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/edit-2.png",height: 20,color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                      InkWell(
                                        onTap: (){
                                          deleteWorkSpaceImg(p!.data!.first.workSpaceImgs[2]);
                                          thirdImageStatus = false;
                                          two = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/delete.png",height: 20),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                    ],
                                  ):
                                      SizedBox(),
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
                                  Text("Add another photo",style: TextStyle(fontSize: 10,color: Color(0xff414141),fontWeight:FontWeight.w500),)
                                ],
                              ),
                            )
                        ):thirdImageStatus?Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: FileImage(File(thirdImagePath)), fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: (){
                                _sheet3();
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height:  10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _sheet3();
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/edit-2.png",height: 20,color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                      InkWell(
                                        onTap: (){
                                          thirdImageStatus = false;
                                          two = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/delete.png",height: 20),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ):SizedBox(),
                        SizedBox(width: 05,),
                        three?Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: p!.data!.first.workSpaceImgs.isNotEmpty?
                                DecorationImage(image: NetworkImage(p!.data!.first.workSpaceImgs[3]), fit: BoxFit.fill):
                                DecorationImage(image: AssetImage("assets/images/Rectangle_greyline.png"), fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: (){
                                _sheet4();
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  p!.data!.first.workSpaceImgs.isNotEmpty?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _sheet4();
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/edit-2.png",height: 20,color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                      InkWell(
                                        onTap: (){
                                          deleteWorkSpaceImg(p!.data!.first.workSpaceImgs[3]);
                                          fourthImageStatus = false;
                                          three = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/delete.png",height: 20),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                    ],
                                  ):
                                      SizedBox(),
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
                                  Text("Add another photo",style: TextStyle(fontSize: 10,color: Color(0xff414141),fontWeight:FontWeight.w500),)
                                ],
                              ),
                            )
                        ):fourthImageStatus?Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: FileImage(File(fourthImagePath)), fit: BoxFit.fill)),
                            child: InkWell(
                              onTap: (){
                                _sheet4();
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height:  10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _sheet4();
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/edit-2.png",height: 20,color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                      InkWell(
                                        onTap: (){
                                          fourthImageStatus = false;
                                          three = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          color: Colors.white,
                                          child: Image.asset("assets/images/delete.png",height: 20),
                                        ),
                                      ),
                                      const SizedBox(width:  10,),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ):SizedBox(),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     SizedBox(
                    //       height: height * 0.02,
                    //     ),
                    //     Row(
                    //       children: [
                    //         fristimagestatus
                    //             ? Container(
                    //                 width: width * 0.43,
                    //                 child: GestureDetector(
                    //                   onTap: () {
                    //                     showDialog(
                    //                       context: context,
                    //                       builder: (context) {
                    //                         return AlertDialog(
                    //                           alignment: Alignment.bottomCenter,
                    //                           insetPadding:
                    //                               EdgeInsets.symmetric(
                    //                                   horizontal: 20,
                    //                                   vertical: 30),
                    //                           shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.all(
                    //                                       Radius.circular(10))),
                    //                           title: Column(
                    //                             children: <Widget>[
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               CommonButton(
                    //                                   context,
                    //                                   "TAKE A PHOTO",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Colors.white, () async {
                    //                                 Navigator.pop(context);
                    //                                 final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    //                                 if (photo != null) {
                    //                                   fristimage =
                    //                                       File(photo.path);
                    //                                   firstimagestring =
                    //                                       photo.path;
                    //                                   fristimagestatus = true;
                    //                                   setState(() {});
                    //                                 }
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               CommonButton(
                    //                                   context,
                    //                                   "CHOOSE FROM GALLERY",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Colors.white, () async {
                    //                                 Navigator.pop(context);
                    //                                 XFile? selectedImages = await _picker.pickImage(source: ImageSource.gallery);
                    //                                 if (selectedImages != null) {
                    //                                   setState(() {
                    //                                     fristimage = File(selectedImages.path);
                    //                                     firstimagestring = selectedImages.path;
                    //                                     fristimagestatus = true;
                    //                                     print(fristimagestatus);
                    //                                   });
                    //                                 }
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               commonButtonborder(
                    //                                   context,
                    //                                   "CANCEL",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Color(0xff01635D), () {
                    //                                 Navigator.pop(context);
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.03,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         );
                    //                       },
                    //                     );
                    //                   },
                    //                   child: Container(
                    //                       width: width,
                    //                       height: 180,
                    //                       decoration: BoxDecoration(
                    //                           image: fristimagestatus
                    //                               ? DecorationImage(
                    //                                   image: FileImage(File(
                    //                                       firstimagestring)))
                    //                               : firstNetworkImage.isNotEmpty?DecorationImage(image: NetworkImage(firstNetworkImage)):
                    //                           DecorationImage(
                    //                                   image: AssetImage("assets/images/Rectangle_greyline.png"), fit: BoxFit.fill)),
                    //                       child: fristimagestatus
                    //                           ? Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   right: 50,
                    //                                   child: GestureDetector(
                    //                                     onTap: () async {
                    //                                       XFile?
                    //                                           selectedImages =
                    //                                           await _picker.pickImage(
                    //                                               source: ImageSource
                    //                                                   .gallery);
                    //                                       if (selectedImages !=
                    //                                           null) {
                    //                                         setState(() {
                    //                                           fristimage = File(
                    //                                               selectedImages
                    //                                                   .path);
                    //                                           firstimagestring =
                    //                                               selectedImages
                    //                                                   .path;
                    //                                           fristimagestatus =
                    //                                               true;
                    //                                           print(
                    //                                               fristimagestatus);
                    //                                         });
                    //                                       }
                    //                                     },
                    //                                     child: Container(
                    //                                       width: 30,
                    //                                       height: 30,
                    //                                       decoration:
                    //                                           BoxDecoration(
                    //                                         color: Color(
                    //                                             0xffFFFFFF),
                    //                                         borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                     5),
                    //                                         border: Border.all(
                    //                                             color: Color(
                    //                                                 0xffE7E7E7),
                    //                                             width: 1),
                    //                                       ),
                    //                                       child: Padding(
                    //                                         padding:
                    //                                             const EdgeInsets
                    //                                                 .all(8.0),
                    //                                         child: Image.asset(
                    //                                             "assets/images/edit_grey.png"),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   right: 10,
                    //                                   child: GestureDetector(
                    //                                     onTap: () {
                    //                                       setState(() {
                    //                                         firstimagestring =
                    //                                             "";
                    //                                         fristimagestatus =
                    //                                             false;
                    //                                       });
                    //                                     },
                    //                                     child: Container(
                    //                                       width: 30,
                    //                                       height: 30,
                    //                                       decoration:
                    //                                           BoxDecoration(
                    //                                         color: Color(
                    //                                             0xffFFFFFF),
                    //                                         borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                     5),
                    //                                         border: Border.all(
                    //                                             color: Color(
                    //                                                 0xffE7E7E7),
                    //                                             width: 1),
                    //                                       ),
                    //                                       child: Padding(
                    //                                         padding:
                    //                                             const EdgeInsets
                    //                                                 .all(8.0),
                    //                                         child: Image.asset(
                    //                                             "assets/images/delete.png"),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 )
                    //                               ],
                    //                             )
                    //                           : Column(
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.center,
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.center,
                    //                               children: [
                    //                                 Center(
                    //                                   child: Image(
                    //                                     height: 40,
                    //                                     image: AssetImage(
                    //                                         "assets/images/camera_grey.png"),
                    //                                   ),
                    //                                 ),
                    //                                 SizedBox(
                    //                                   height: 5,
                    //                                 ),
                    //                                 textComoon(
                    //                                     "Add Logo",
                    //                                     12,
                    //                                     Color(0xff414141),
                    //                                     FontWeight.w500),
                    //                               ],
                    //                             )),
                    //                 ),
                    //               )
                    //             : SizedBox(),
                    //         SizedBox(
                    //           width: width * 0.02,
                    //         ),
                    //         secoundimagestatus
                    //             ? Container(
                    //                 width: width * 0.43,
                    //                 child: GestureDetector(
                    //                   onTap: () {
                    //                     showDialog(
                    //                       context: context,
                    //                       builder: (context) {
                    //                         return AlertDialog(
                    //                           alignment: Alignment.bottomCenter,
                    //                           insetPadding:
                    //                               EdgeInsets.symmetric(
                    //                                   horizontal: 20,
                    //                                   vertical: 30),
                    //                           shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.all(
                    //                                       Radius.circular(10))),
                    //                           title: Column(
                    //                             children: <Widget>[
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               CommonButton(
                    //                                   context,
                    //                                   "TAKE A PHOTO",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Colors.white, () async {
                    //                                 Navigator.pop(context);
                    //                                 final XFile? photo =
                    //                                     await _picker.pickImage(
                    //                                         source: ImageSource
                    //                                             .camera);
                    //                                 if (photo != null) {
                    //                                   secoundimage =
                    //                                       File(photo.path);
                    //                                   secoundimagestring =
                    //                                       photo.path;
                    //                                   secoundimagestatus = true;
                    //                                   setState(() {});
                    //                                 }
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               CommonButton(
                    //                                   context,
                    //                                   "CHOOSE FROM GALLERY",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Colors.white, () async {
                    //                                 Navigator.pop(context);
                    //                                 XFile? selectedImages =
                    //                                     await _picker.pickImage(
                    //                                         source: ImageSource
                    //                                             .gallery);
                    //                                 if (selectedImages !=
                    //                                     null) {
                    //                                   setState(() {
                    //                                     secoundimage = File(
                    //                                         selectedImages
                    //                                             .path);
                    //                                     secoundimagestring =
                    //                                         selectedImages.path;
                    //                                     secoundimagestatus = true;
                    //                                     print(fristimagestatus);
                    //                                   });
                    //                                 }
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               commonButtonborder(
                    //                                   context,
                    //                                   "CANCEL",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Color(0xff01635D), () {
                    //                                 Navigator.pop(context);
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.03,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         );
                    //                       },
                    //                     );
                    //                   },
                    //                   child: Container(
                    //                       width: width,
                    //                       height: 180,
                    //                       decoration: BoxDecoration(
                    //                           image: secoundimagestatus
                    //                               ? DecorationImage(
                    //                                   image: FileImage(File(secoundimagestring)))
                    //                               :secondNetworkImage.isNotEmpty?
                    //                           DecorationImage(image: NetworkImage(secondNetworkImage)):
                    //                           DecorationImage(image: AssetImage("assets/images/Rectangle_greyline.png"), fit: BoxFit.fill)),
                    //                       child: secoundimagestatus
                    //                           ? Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   right: 50,
                    //                                   child: GestureDetector(
                    //                                     onTap: () async {
                    //                                       XFile?
                    //                                           selectedImages =
                    //                                           await _picker.pickImage(
                    //                                               source: ImageSource
                    //                                                   .gallery);
                    //                                       if (selectedImages !=
                    //                                           null) {
                    //                                         setState(() {
                    //                                           secoundimage = File(
                    //                                               selectedImages
                    //                                                   .path);
                    //                                           secoundimagestring =
                    //                                               selectedImages
                    //                                                   .path;
                    //                                           secoundimagestatus =
                    //                                               true;
                    //                                         });
                    //                                       }
                    //                                     },
                    //                                     child: Container(
                    //                                       width: 30,
                    //                                       height: 30,
                    //                                       decoration:
                    //                                           BoxDecoration(
                    //                                         color: Color(
                    //                                             0xffFFFFFF),
                    //                                         borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                     5),
                    //                                         border: Border.all(
                    //                                             color: Color(
                    //                                                 0xffE7E7E7),
                    //                                             width: 1),
                    //                                       ),
                    //                                       child: Padding(
                    //                                         padding:
                    //                                             const EdgeInsets
                    //                                                 .all(8.0),
                    //                                         child: Image.asset(
                    //                                             "assets/images/edit_grey.png"),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   right: 10,
                    //                                   child: GestureDetector(
                    //                                     onTap: () {
                    //                                       setState(() {
                    //                                         secoundimagestring =
                    //                                             "";
                    //                                         secoundimagestatus =
                    //                                             false;
                    //                                       });
                    //                                     },
                    //                                     child: Container(
                    //                                       width: 30,
                    //                                       height: 30,
                    //                                       decoration:
                    //                                           BoxDecoration(
                    //                                         color: Color(
                    //                                             0xffFFFFFF),
                    //                                         borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                     5),
                    //                                         border: Border.all(
                    //                                             color: Color(
                    //                                                 0xffE7E7E7),
                    //                                             width: 1),
                    //                                       ),
                    //                                       child: Padding(
                    //                                         padding:
                    //                                             const EdgeInsets
                    //                                                 .all(8.0),
                    //                                         child: Image.asset(
                    //                                             "assets/images/delete.png"),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 )
                    //                               ],
                    //                             )
                    //                           : Column(
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.center,
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.center,
                    //                               children: [
                    //                                 Center(
                    //                                   child: Image(
                    //                                     height: 40,
                    //                                     image: AssetImage(
                    //                                         "assets/images/camera_grey.png"),
                    //                                   ),
                    //                                 ),
                    //                                 SizedBox(
                    //                                   height: 5,
                    //                                 ),
                    //                                 textComoon(
                    //                                     "Add Logo",
                    //                                     12,
                    //                                     Color(0xff414141),
                    //                                     FontWeight.w500),
                    //                               ],
                    //                             )),
                    //                 ),
                    //               )
                    //             : SizedBox()
                    //       ],
                    //     ),
                    //     SizedBox(
                    //       height: height * 0.02,
                    //     ),
                    //     Row(
                    //       children: [
                    //         threeimagestatus
                    //             ? Expanded(
                    //                 child: GestureDetector(
                    //                   onTap: () {
                    //                     showDialog(
                    //                       context: context,
                    //                       builder: (context) {
                    //                         return AlertDialog(
                    //                           alignment: Alignment.bottomCenter,
                    //                           insetPadding:
                    //                               EdgeInsets.symmetric(
                    //                                   horizontal: 20,
                    //                                   vertical: 30),
                    //                           shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.all(
                    //                                       Radius.circular(10))),
                    //                           title: Column(
                    //                             children: <Widget>[
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               CommonButton(
                    //                                   context,
                    //                                   "TAKE A PHOTO",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Colors.white, () async {
                    //                                 Navigator.pop(context);
                    //                                 final XFile? photo =
                    //                                     await _picker.pickImage(
                    //                                         source: ImageSource
                    //                                             .camera);
                    //                                 if (photo != null) {
                    //                                   threeimage =
                    //                                       File(photo.path);
                    //                                   threeimagestring =
                    //                                       photo.path;
                    //                                   threeimagestatus = true;
                    //                                   setState(() {});
                    //                                 }
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               CommonButton(
                    //                                   context,
                    //                                   "CHOOSE FROM GALLERY",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Colors.white, () async {
                    //                                 Navigator.pop(context);
                    //                                 XFile? selectedImages =
                    //                                     await _picker.pickImage(
                    //                                         source: ImageSource
                    //                                             .gallery);
                    //                                 if (selectedImages !=
                    //                                     null) {
                    //                                   setState(() {
                    //                                     threeimage = File(
                    //                                         selectedImages
                    //                                             .path);
                    //                                     threeimagestring =
                    //                                         selectedImages.path;
                    //                                     threeimagestatus = true;
                    //                                     print(fristimagestatus);
                    //                                   });
                    //                                 }
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.02,
                    //                               ),
                    //                               commonButtonborder(
                    //                                   context,
                    //                                   "CANCEL",
                    //                                   12,
                    //                                   FontWeight.w600,
                    //                                   Color(0xff01635D), () {
                    //                                 Navigator.pop(context);
                    //                               }),
                    //                               SizedBox(
                    //                                 height: height * 0.03,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         );
                    //                       },
                    //                     );
                    //                   },
                    //                   child: Container(
                    //                       width: width,
                    //                       height: 150,
                    //                       decoration: BoxDecoration(
                    //                           image: fourimagestatus
                    //                               ? DecorationImage(
                    //                                   image: FileImage(File(
                    //                                       threeimagestring)))
                    //                               :thirdNetworkImage.isNotEmpty?DecorationImage(image: NetworkImage(thirdNetworkImage)): DecorationImage(
                    //                                   image: AssetImage(
                    //                                       "assets/images/Rectangle_greyline.png"),
                    //                                   fit: BoxFit.fill)),
                    //                       child: threeimagestatus
                    //                           ? Stack(
                    //                               children: [
                    //                                 Positioned(
                    //                                   right: 50,
                    //                                   child: GestureDetector(
                    //                                     onTap: () async {
                    //                                       XFile? selectedImages = await _picker.pickImage(
                    //                                               source: ImageSource
                    //                                                   .gallery);
                    //                                       if (selectedImages !=
                    //                                           null) {
                    //                                         setState(() {
                    //                                           threeimage = File(
                    //                                               selectedImages
                    //                                                   .path);
                    //                                           threeimagestring =
                    //                                               selectedImages
                    //                                                   .path;
                    //                                           threeimagestatus =
                    //                                               true;
                    //                                           print(
                    //                                               fristimagestatus);
                    //                                         });
                    //                                       }
                    //                                     },
                    //                                     child: Container(
                    //                                       width: 30,
                    //                                       height: 30,
                    //                                       decoration:
                    //                                           BoxDecoration(
                    //                                         color: Color(
                    //                                             0xffFFFFFF),
                    //                                         borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                     5),
                    //                                         border: Border.all(
                    //                                             color: Color(
                    //                                                 0xffE7E7E7),
                    //                                             width: 1),
                    //                                       ),
                    //                                       child: Padding(
                    //                                         padding:
                    //                                             const EdgeInsets
                    //                                                 .all(8.0),
                    //                                         child: Image.asset(
                    //                                             "assets/images/edit_grey.png"),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Positioned(
                    //                                   right: 10,
                    //                                   child: GestureDetector(
                    //                                     onTap: () {
                    //                                       setState(() {
                    //                                         threeimagestring =
                    //                                             "";
                    //                                         threeimagestatus =
                    //                                             false;
                    //                                       });
                    //                                     },
                    //                                     child: Container(
                    //                                       width: 30,
                    //                                       height: 30,
                    //                                       decoration:
                    //                                           BoxDecoration(
                    //                                         color: Color(
                    //                                             0xffFFFFFF),
                    //                                         borderRadius:
                    //                                             BorderRadius
                    //                                                 .circular(
                    //                                                     5),
                    //                                         border: Border.all(
                    //                                             color: Color(
                    //                                                 0xffE7E7E7),
                    //                                             width: 1),
                    //                                       ),
                    //                                       child: Padding(
                    //                                         padding:
                    //                                             const EdgeInsets
                    //                                                 .all(8.0),
                    //                                         child: Image.asset(
                    //                                             "assets/images/delete.png"),
                    //                                       ),
                    //                                     ),
                    //                                   ),
                    //                                 )
                    //                               ],
                    //                             )
                    //                           : Column(
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.center,
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.center,
                    //                               children: [
                    //                                 Center(
                    //                                   child: Image(
                    //                                     height: 40,
                    //                                     image: AssetImage(
                    //                                         "assets/images/camera_grey.png"),
                    //                                   ),
                    //                                 ),
                    //                                 SizedBox(
                    //                                   height: 5,
                    //                                 ),
                    //                                 textComoon(
                    //                                     "Add Logo",
                    //                                     12,
                    //                                     Color(0xff414141),
                    //                                     FontWeight.w500),
                    //                               ],
                    //                             )),
                    //                 ),
                    //               )
                    //             : SizedBox(),
                    //         SizedBox(
                    //           width: width * 0.02,
                    //         ),
                    //         fourimagestatus
                    //             ? Container(
                    //           width: width * 0.43,
                    //           child: GestureDetector(
                    //             onTap: () {
                    //               showDialog(
                    //                 context: context,
                    //                 builder: (context) {
                    //                   return AlertDialog(
                    //                     alignment: Alignment.bottomCenter,
                    //                     insetPadding:
                    //                     EdgeInsets.symmetric(
                    //                         horizontal: 20,
                    //                         vertical: 30),
                    //                     shape: RoundedRectangleBorder(
                    //                         borderRadius:
                    //                         BorderRadius.all(
                    //                             Radius.circular(10))),
                    //                     title: Column(
                    //                       children: <Widget>[
                    //                         SizedBox(
                    //                           height: height * 0.02,
                    //                         ),
                    //                         CommonButton(
                    //                             context,
                    //                             "TAKE A PHOTO",
                    //                             12,
                    //                             FontWeight.w600,
                    //                             Colors.white, () async {
                    //                           Navigator.pop(context);
                    //                           final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    //                           if (photo != null) {
                    //                             fourimage =
                    //                                 File(photo.path);
                    //                             fourimagestring =
                    //                                 photo.path;
                    //                             fourimagestatus = true;
                    //                             setState(() {});
                    //                           }
                    //                         }),
                    //                         SizedBox(
                    //                           height: height * 0.02,
                    //                         ),
                    //                         CommonButton(
                    //                             context,
                    //                             "CHOOSE FROM GALLERY",
                    //                             12,
                    //                             FontWeight.w600,
                    //                             Colors.white, () async {
                    //                           Navigator.pop(context);
                    //                           XFile? selectedImages = await _picker.pickImage(source: ImageSource.gallery);
                    //                           if (selectedImages != null) {
                    //                             setState(() {
                    //                               fourimage = File(selectedImages.path);
                    //                               fourimagestring = selectedImages.path;
                    //                               fourimagestatus = true;
                    //                               print(fristimagestatus);
                    //                             });
                    //                           }
                    //                         }),
                    //                         SizedBox(
                    //                           height: height * 0.02,
                    //                         ),
                    //                         commonButtonborder(
                    //                             context,
                    //                             "CANCEL",
                    //                             12,
                    //                             FontWeight.w600,
                    //                             Color(0xff01635D), () {
                    //                           Navigator.pop(context);
                    //                         }),
                    //                         SizedBox(
                    //                           height: height * 0.03,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   );
                    //                 },
                    //               );
                    //             },
                    //             child: Container(
                    //                 width: width,
                    //                 height: 180,
                    //                 decoration: BoxDecoration(
                    //                     image: fourimagestatus
                    //                         ? DecorationImage(
                    //                         image: FileImage(File(
                    //                             fourimagestring)))
                    //                         : fourthNetworkImage.isNotEmpty?DecorationImage(image: NetworkImage(fourthNetworkImage)):
                    //                     DecorationImage(
                    //                         image: AssetImage("assets/images/Rectangle_greyline.png"), fit: BoxFit.fill)),
                    //                 child: fourimagestatus
                    //                     ? Stack(
                    //                   children: [
                    //                     Positioned(
                    //                       right: 50,
                    //                       child: GestureDetector(
                    //                         onTap: () async {
                    //                           XFile?
                    //                           selectedImages =
                    //                           await _picker.pickImage(
                    //                               source: ImageSource
                    //                                   .gallery);
                    //                           if (selectedImages !=
                    //                               null) {
                    //                             setState(() {
                    //                               fourimage = File(
                    //                                   selectedImages
                    //                                       .path);
                    //                               fourimagestring =
                    //                                   selectedImages
                    //                                       .path;
                    //                               fourimagestatus =
                    //                               true;
                    //                               print(
                    //                                   fristimagestatus);
                    //                             });
                    //                           }
                    //                         },
                    //                         child: Container(
                    //                           width: 30,
                    //                           height: 30,
                    //                           decoration:
                    //                           BoxDecoration(
                    //                             color: Color(
                    //                                 0xffFFFFFF),
                    //                             borderRadius:
                    //                             BorderRadius
                    //                                 .circular(
                    //                                 5),
                    //                             border: Border.all(
                    //                                 color: Color(
                    //                                     0xffE7E7E7),
                    //                                 width: 1),
                    //                           ),
                    //                           child: Padding(
                    //                             padding:
                    //                             const EdgeInsets
                    //                                 .all(8.0),
                    //                             child: Image.asset(
                    //                                 "assets/images/edit_grey.png"),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     Positioned(
                    //                       right: 10,
                    //                       child: GestureDetector(
                    //                         onTap: () {
                    //                           setState(() {
                    //                             fourimagestring =
                    //                             "";
                    //                             fourimagestatus =
                    //                             false;
                    //                           });
                    //                         },
                    //                         child: Container(
                    //                           width: 30,
                    //                           height: 30,
                    //                           decoration:
                    //                           BoxDecoration(
                    //                             color: Color(
                    //                                 0xffFFFFFF),
                    //                             borderRadius:
                    //                             BorderRadius
                    //                                 .circular(
                    //                                 5),
                    //                             border: Border.all(
                    //                                 color: Color(
                    //                                     0xffE7E7E7),
                    //                                 width: 1),
                    //                           ),
                    //                           child: Padding(
                    //                             padding:
                    //                             const EdgeInsets
                    //                                 .all(8.0),
                    //                             child: Image.asset(
                    //                                 "assets/images/delete.png"),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 )
                    //                     : Column(
                    //                   crossAxisAlignment:
                    //                   CrossAxisAlignment.center,
                    //                   mainAxisAlignment:
                    //                   MainAxisAlignment.center,
                    //                   children: [
                    //                     Center(
                    //                       child: Image(
                    //                         height: 40,
                    //                         image: AssetImage(
                    //                             "assets/images/camera_grey.png"),
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 5,
                    //                     ),
                    //                     textComoon(
                    //                         "Add Logo",
                    //                         12,
                    //                         Color(0xff414141),
                    //                         FontWeight.w500),
                    //                   ],
                    //                 )),
                    //           ),
                    //         )
                    //             : SizedBox(),
                    //       ],
                    //     )
                    //   ],
                    // ),
                    SizedBox(height: height * 0.02,),
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
                    CommonButton(context, "SAVE", 12, FontWeight.w600, Colors.white, () {postImage();}),
                    SizedBox(height: height * 0.05,),
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

      for(var i in files){
          http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('workspace', i.path);
          request.files.add(multipartFile);
      }
      // if (secondImageStatus) {
      //   http.MultipartFile multipartFile =
      //       await http.MultipartFile.fromPath('workspace', secondImage!.path);
      //   request.files.add(multipartFile);
      // }
      // if (thirdImageStatus) {
      //   http.MultipartFile multipartFile =
      //       await http.MultipartFile.fromPath('workspace', thirdImage!.path);
      //   request.files.add(multipartFile);
      // }
      // if (fourthImageStatus) {
      //   http.MultipartFile multipartFile =
      //       await http.MultipartFile.fromPath('workspace', fourthImage!.path);
      //   request.files.add(multipartFile);
      // }
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
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      log("get profile url is  : $getUri");
      log("res headers  : $headers");
      var response = await http.get(getUri, headers: headers);
      log("getApi response.body ==> ${response.body}");
      log("getAPi status code ==> ${response.statusCode}");
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
        p = Workplacephotos.fromJson(map);
        if(p!.data!.first.workSpaceImgs.isNotEmpty){
           for(int i = 0; i < p!.data!.first.workSpaceImgs.length; i++){
             // i == 0 ? firstImageStatus=true:false;
             i == 1 ? one=true:false;
             i == 2 ? two=true:false;
             i == 3 ? three=true:false;
             print(one);
             print(two);
             print(three);
             print(four);
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
        "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var Body = {
        "imgPath" : imgPath
      };
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
      }else if(response.statusCode == 401){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return signInScreen();
        },), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        // isLoading = false;
      });
    }
  }


  Future _sheet() => showDialog(
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
              height: MediaQuery.of(context).size.height * 0.02,
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
                one = true;
                firstImage = File(photo.path);
                firstImagePath = photo.path;
                files.add(firstImage!);
                firstImageStatus = true;
                if(p!.data!.first.workSpaceImgs.length==1){
                  if(two || three || four){
                    one = false;
                  }else{
                    one = true;
                  }
                }
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                  one = true;
                  firstImage = File(selectedImages.path);
                  firstImagePath = selectedImages.path;
                  firstImageStatus = true;
                  files.add(firstImage!);
                  if(p!.data!.first.workSpaceImgs.length==1){
                    if(two || three || four){
                      one = false;
                    }else{
                      one = true;
                    }
                  }
                });
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
        insetPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 30),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        title: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                secondImage = File(photo.path);
                files.add(secondImage!);
                secondImagePath = photo.path;
                secondImageStatus = true;
                two = true;
                one = false;
                if(p!.data!.first.workSpaceImgs.length==2){
                  two = true;
                }
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                  one = false;
                  two = true;
                  secondImage = File(selectedImages.path);
                  files.add(secondImage!);
                  secondImagePath = selectedImages.path;
                  secondImageStatus = true;
                  if(p!.data!.first.workSpaceImgs.length==2){
                    two = true;
                  }
                });
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
        insetPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 30),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        title: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                thirdImage = File(photo.path);
                files.add(thirdImage!);
                thirdImagePath = photo.path;
                thirdImageStatus = true;
                one = false;
                two = false;
                three = true;
                if(p!.data!.first.workSpaceImgs.length==3){
                  three = true;
                }
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                  thirdImage = File(selectedImages.path);
                  thirdImagePath = selectedImages.path;
                  thirdImageStatus = true;
                  files.add(thirdImage!);
                  one = false;
                  two = false;
                  three = true;
                  if(p!.data!.first.workSpaceImgs.length==3){
                    three = true;
                  }
                });
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
        insetPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 30),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        title: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                fourthImage = File(photo.path);
                fourthImagePath = photo.path;
                fourthImageStatus = true;
                one = false;
                two = false;
                three = false;
                files.add(fourthImage!);
                if(p!.data!.first.workSpaceImgs.length==4){
                }
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                  fourthImage = File(selectedImages.path);
                  fourthImagePath = selectedImages.path;
                  files.add(fourthImage!);
                  fourthImageStatus = true;
                  one = false;
                  two = false;
                  three = false;
                  if(p!.data!.first.workSpaceImgs.length==4){
                  }
                });
              }
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
