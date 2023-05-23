import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/health_safety/health_additional_details.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class health_Safety_Rule extends StatefulWidget {
  const health_Safety_Rule({Key? key}) : super(key: key);

  @override
  State<health_Safety_Rule> createState() => _health_Safety_RuleState();
}

class _health_Safety_RuleState extends State<health_Safety_Rule> {
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
                          width: width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Health & Safety Rules",
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
        child: Container(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                textComoonfade(
                    "Select only the safety rules that apply to you and your venue. The checked items will be visible on your profile for your clients to see.",
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
                      child: textComoon("Select rules :", 12, Color(0xff292929),
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
                        "Employees wear masks", 12, Color(0xff292929), FontWeight.w500),
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
                    textComoon("Employees wear disposable gloves", 12,
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
                    textComoon("Disinfection of surface areas", 12, Color(0xff292929), FontWeight.w500),
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
                    textComoon("Masks are provided for clients", 12, Color(0xff292929),
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
                        "Place to wash hand", 12, Color(0xff292929), FontWeight.w500),
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

                Container(

                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return health_Safety_Rule();
                      },));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            textComoon("Additional Details",14,Color(0xff292929), FontWeight.w500),
                            textComoon("(optional)",14,Color(0xff707070), FontWeight.w500),

                          ],
                        ),

                        Container(
                          height: 15,
                          width: 30,
                          child: Image.asset("assets/images/righticon.png"),
                        ),
                      ],
                    ),
                  ),
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
                Spacer(),
                CommonButton(
                    context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return health_detail();
                      },));
                }),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
