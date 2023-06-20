import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/business_photos/businessphoto/logo/logo.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/business_photos/businessphoto/workplace_photos/workplace_photos.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/business_photos/businessphoto/workplace_photos/workplace_photostwo.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

import '../../../../../../../viewscrren/move_to_settings_all/professional_licence/professional_icence_camera.dart';

class business_Photo extends StatefulWidget {
  const business_Photo({Key? key}) : super(key: key);

  @override
  State<business_Photo> createState() => _business_PhotoState();
}

class _business_PhotoState extends State<business_Photo> {
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
                      SizedBox(width: width*0.15,),
                      Container(
                        child: Text("Business photos",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: height*0.02,),
            textComoonfade("Set up your business photos so clients can see your services and all that you are about.", 12, Color(0xff414141), FontWeight.w500),
            SizedBox(height: height*0.04,),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return logo();
                },));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    textComoon("Logo",14,Color(0xff414141), FontWeight.w500),

                    Container(
                      height: 15,
                      width: 30,
                      child: Image.asset("assets/images/righticon.png"),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return worlplace_PhotosTwo();
                },));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Workplace Photo",14,Color(0xff414141), FontWeight.w500),
                    Container(
                      height: 15,
                      width: 30,
                      child: Image.asset("assets/images/righticon.png"),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return professional_Licence_Camera();
                },));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17,),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Licence",14,Color(0xff414141), FontWeight.w500),
                    Container(
                      height: 15,
                      width: 30,
                      child: Image.asset("assets/images/righticon.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
