import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

import '../all_addproduct/all_product.dart';
import 'addproduct_phoros3.dart';

class addProduct_Photos extends StatefulWidget {
  const addProduct_Photos({Key? key}) : super(key: key);

  @override
  State<addProduct_Photos> createState() => _addProduct_PhotosState();
}

class _addProduct_PhotosState extends State<addProduct_Photos> {
  final ImagePicker _picker = ImagePicker();
  String str="";
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
                        SizedBox(width: width/5,),
                      Container(
                        child: Text("Add Product",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: height*0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1/",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffA0A0A0),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Container(
                    child: textComoon("Add product photos", 14, Color(0xff292929), FontWeight.w700)),

                SizedBox(
                  height: height*0.02,
                ),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        alignment: Alignment.bottomCenter,
                        insetPadding: EdgeInsets.symmetric(horizontal: 0,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),topRight: Radius.circular(20)
                            )),
                        title: StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              width: width,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () async {

                                      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                      setState(() {
                                        str=image!.path;
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return product_photos_Three(str);
                                      },));

                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,

                                          child: Image.asset("assets/images/gallery.png"),
                                        ),
                                        SizedBox(width: 20,),
                                        textComoon("Choose from gallery", 14, Color(0xff111111),
                                            FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: height*0.04,),
                                  InkWell(
                                    onTap: () async {
                                     // Navigator.pop(context);
                                      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

                                      setState(() {
                                        str=image!.path;
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return product_photos_Three(str);
                                      },));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,

                                          child: Image.asset("assets/images/camera_tack.png"),
                                        ),
                                        SizedBox(width: 20,),
                                        textComoon("take photo", 14, Color(0xff111111),
                                            FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),



                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },);

                  },
                  child: Container(
                   width: width,
                      height:150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/camera_line.png"),fit: BoxFit.fill
                        )
                      ),
                      child: Center(
                        child: Image(height: 50,
                          image:
                          AssetImage("assets/images/cameraicon.png"),

                        ),
                      )),
                ),
                Spacer(),
                CommonButton(context, "Continue", 12, FontWeight.w600, Colors.white, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return allProduct_select();
                  },));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
