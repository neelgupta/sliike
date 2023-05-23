import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class demograPhic extends StatefulWidget { 
  const demograPhic({Key? key}) : super(key: key);

  @override
  State<demograPhic> createState() => _demograPhicState();
}

class _demograPhicState extends State<demograPhic> {
  bool checkboxvalue = false;
  int valuecheck=1;
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
        toolbarHeight: height * 0.14, //
        flexibleSpace: Container(
          color: Color(0xffF5F7F7),
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
                            padding: EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image:
                                    AssetImage("assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Demographics",
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              textComoonfade(
                  "Update your demographics so clientscan find you using their chosen demographics.",
                  12,
                  Color(0xff414141),
                  FontWeight.w500),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  height: height * 0.065,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffF3F3F3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: textComoon("Update demographic :", 12, Color(0xff292929),
                        FontWeight.w700),
                  )),
              SizedBox(
                height: height * 0.025,
              ),
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
                  SizedBox(
                    width: 10,
                  ),
                  textComoon(
                      "Black", 12, Color(0xff292929), FontWeight.w500),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
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
                  SizedBox(
                    width: 10,
                  ),
                  textComoon("Hispanic/Latino", 12,
                      Color(0xff292929), FontWeight.w500),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
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
                  SizedBox(
                    width: 10,
                  ),
                  textComoon("Asian", 12, Color(0xff292929), FontWeight.w500),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
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
                  SizedBox(
                    width: 10,
                  ),
                  textComoon("Indigenous (North America)", 12, Color(0xff292929),
                      FontWeight.w500),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
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
                  SizedBox(
                    width: 10,
                  ),
                  textComoon(
                      "White or Caucasian ", 12, Color(0xff292929), FontWeight.w500),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
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
                  SizedBox(
                    width: 10,
                  ),
                  textComoon(
                      "Mixed Race", 12, Color(0xff292929), FontWeight.w500),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
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
                  SizedBox(
                    width: 10,
                  ),
                  textComoon(
                      "Others", 12, Color(0xff292929), FontWeight.w500),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),

              SizedBox(
                height: height * 0.01,
              ),

              CommonButton(
                  context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return ();
                // },));
              }),
              SizedBox(height: height*0.02,),
              commonButtonborderreadius(context,"PREFER NOT TO SHARE", 12, FontWeight.w600, Color(0xff01635D), () { }),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
