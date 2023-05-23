// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/business_photos/businessphoto/workplace_photos/workplace_photostwo.dart';
// import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
// import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
//
// class workplace_Photos extends StatefulWidget {
//   const workplace_Photos({Key? key}) : super(key: key);
//
//   @override
//   State<workplace_Photos> createState() => _workplace_PhotosState();
// }
//
// class _workplace_PhotosState extends State<workplace_Photos> {
//   final ImagePicker _picker = ImagePicker();
//   final ImagePicker imagePicker = ImagePicker();
//   String imagepath = "";
//   bool imagestatus = false;
//   List<XFile> imageFileList = [];
//   List<String> imagelistofstring = [];
//
//   String str = "";
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height -
//         MediaQuery.of(context).padding.top -
//         MediaQuery.of(context).padding.bottom;
//     double width = MediaQuery.of(context).size.width -
//         MediaQuery.of(context).padding.right -
//         MediaQuery.of(context).padding.left;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: height * 0.13, //
//
//         flexibleSpace: Container(
//           color: Color(0xffFFFFFF),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
//                 child: Container(
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(8),
//                           height: height * 0.06,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(color: Colors.black)),
//                           child: Center(
//                             child: Container(
//                                 padding: EdgeInsets.all(5),
//                                 child: Image(
//                                   image:
//                                       AssetImage("assets/images/Group 55.png"),
//                                 )),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: width * 0.15,
//                       ),
//                       Container(
//                         child: Text("Workplace Photos",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 overflow: TextOverflow.ellipsis,
//                                 color: Colors.black,
//                                 fontFamily: "spartan",
//                                 fontWeight: FontWeight.w700)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           height: height * 0.8,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: height * 0.02,
//                 ),
//                 textComoonfade(
//                     "Show clients what your space looks like before they show up at your door.",
//                     12,
//                     Color(0xff414141),
//                     FontWeight.w500),
//                 SizedBox(
//                   height: height * 0.04,
//                 ),
//                 Container(
//                   height: height * 0.6,
//                   child: ListView.separated(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     itemCount: imageFileList.length,
//                     separatorBuilder: (context, index) {
//                       return SizedBox();
//                     },
//                     itemBuilder: (context, index) {
//                       return singleImageCard(
//                         firstImage: true,
//                         imagePath: imageFileList[index].path,
//                         context: context,
//                         height: height,
//                         width: width,
//                       );
//                     },
//                   ),
//                 ),
//                 Spacer(),
//                 CommonButton(context, "OK", 12, FontWeight.w600, Colors.white,
//                     () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) {
//                       return worlplace_PhotosTwo();
//                     },
//                   ));
//                 })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
