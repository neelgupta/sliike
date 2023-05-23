import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class Amenities extends StatefulWidget {
  const Amenities({Key? key}) : super(key: key);

  @override
  State<Amenities> createState() => _AmenitiesState();
}

class _AmenitiesState extends State<Amenities> {
  bool checkboxvalue = false;

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
                      SizedBox(width: width*0.25,),
                      Container(
                        child: Text("Amenities",
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.02,),
            textComoonfade("Build trust and comfort by informing your customers about the amenities that make your business stand out.", 12, Color(0xff414141), FontWeight.w500),
            SizedBox(height: height*0.01,),
            Divider(thickness: 1,color: Color(0xffCFCFCF),),
            SizedBox(height: height*0.025,),
            textComoon("Choose from the list", 14, Color(0xff292929),FontWeight.w700),
            SizedBox(height: height*0.025,),
            Row(
              children: [

                Custom_Checkbox(
                  isChecked: checkboxvalue,
                  onChange: (value) {
                    setState(() {
                      checkboxvalue = value;
                    });
                  },
                  backgroundColor: Color(0xff01635D),
                  borderColor: Color(0xff01635D),
                  icon: Icons.check,
                  iconColor: Colors.white,
                  size: 24,
                  iconSize: 20,
                ),
                SizedBox(width: 10,),
                textComoon("Parking Space",14,Color(0xff292929), FontWeight.w500),

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.01),
              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
            ),
            SizedBox(height: height*0.01,),
            Row(
              children: [

                Custom_Checkbox(
                  isChecked: checkboxvalue,
                  onChange: (value) {
                    setState(() {
                      checkboxvalue = value;
                    });
                  },
                  backgroundColor: Color(0xff01635D),
                  borderColor: Color(0xff01635D),
                  icon: Icons.check,
                  iconColor: Colors.white,
                  size: 24,
                  iconSize: 20,
                ),
                SizedBox(width: 10,),
                textComoon("Accessible for disabled people",14,Color(0xff292929), FontWeight.w500),

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.01),
              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
            ),
            SizedBox(height: height*0.01,),
            Row(
              children: [

                Custom_Checkbox(
                  isChecked: checkboxvalue,
                  onChange: (value) {
                    setState(() {
                      checkboxvalue = value;
                    });
                  },
                  backgroundColor: Color(0xff01635D),
                  borderColor: Color(0xff01635D),
                  icon: Icons.check,
                  iconColor: Colors.white,
                  size: 24,
                  iconSize: 20,
                ),
                SizedBox(width: 10,),
                textComoon("Wi-Fi",14,Color(0xff292929), FontWeight.w500),

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.01),
              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
            ),
            SizedBox(height: height*0.01,),
            Row(
              children: [

                Custom_Checkbox(
                  isChecked: checkboxvalue,
                  onChange: (value) {
                    setState(() {
                      checkboxvalue = value;
                    });
                  },
                  backgroundColor: Color(0xff01635D),
                  borderColor: Color(0xff01635D),
                  icon: Icons.check,
                  iconColor: Colors.white,
                  size: 24,
                  iconSize: 20,
                ),
                SizedBox(width: 10,),
                textComoon("Credit cards accepted",14,Color(0xff292929), FontWeight.w500),

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.01),
              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
            ),
            SizedBox(height: height*0.01,),
            Row(
              children: [

                Custom_Checkbox(
                  isChecked: checkboxvalue,
                  onChange: (value) {
                    setState(() {
                      checkboxvalue = value;
                    });
                  },
                  backgroundColor: Color(0xff01635D),
                  borderColor: Color(0xff01635D),
                  icon: Icons.check,
                  iconColor: Colors.white,
                  size: 24,
                  iconSize: 20,
                ),
                SizedBox(width: 10,),
                textComoon("Child-friendly",14,Color(0xff292929), FontWeight.w500),

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.01),
              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
            ),
            SizedBox(height: height*0.01,),
            Row(
              children: [

                Custom_Checkbox(
                  isChecked: checkboxvalue,
                  onChange: (value) {
                    setState(() {
                      checkboxvalue = value;
                    });
                  },
                  backgroundColor: Color(0xff01635D),
                  borderColor: Color(0xff01635D),
                  icon: Icons.check,
                  iconColor: Colors.white,
                  size: 24,
                  iconSize: 20,
                ),
                SizedBox(width: 10,),
                textComoon("Pets allowed",14,Color(0xff292929), FontWeight.w500),

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.01),
              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
            ),
            SizedBox(height: height*0.01,),
            Row(
              children: [

                Custom_Checkbox(
                  isChecked: checkboxvalue,
                  onChange: (value) {
                    setState(() {
                      checkboxvalue = value;
                    });
                  },
                  backgroundColor: Color(0xff01635D),
                  borderColor: Color(0xff01635D),
                  icon: Icons.check,
                  iconColor: Colors.white,
                  size: 24,
                  iconSize: 20,
                ),
                SizedBox(width: 10,),
                textComoon("Loyalty program",14,Color(0xff292929), FontWeight.w500),

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(top: height*0.01),
              child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
            ),

            Spacer(),
            CommonButton(context,"SAVE",12, FontWeight.w600, Colors.white, () { }),
            SizedBox(height: height*0.03,),
          ],
        ),
      ),

    );
  }
}
