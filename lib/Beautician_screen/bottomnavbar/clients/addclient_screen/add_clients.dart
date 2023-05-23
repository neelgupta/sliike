import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class add_Clients extends StatefulWidget {


  const add_Clients({Key? key}) : super(key: key);

  @override
  State<add_Clients> createState() => _add_ClientsState();
}

class _add_ClientsState extends State<add_Clients> {
  TextEditingController name = TextEditingController();
  TextEditingController emailAdress = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool namestatus = false;
  bool emailAdressstatus = false;
  bool phonestatus = false;

  bool Onemail = false;
  bool Onsms = false;

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
          color: Color(0xff01635D),
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
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Vector.png"),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(width: width/5,),
                        Container(
                          child: Text("Add Clients",
                              style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.03,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width*0.55,
                    height: height*0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffEBEFEE),
                    ),




                    child: Center(child: textComoon("IMPORT FROM CONTACT", 10, Color(0xff01635D), FontWeight.w700)),
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              Divider(thickness: 1,color: Color(0xffCFCFCF),),
              SizedBox(height: height*0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  child: TextField(
                    controller: name,
                    onChanged: (value) {
                      setState(() {
                        namestatus=false;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Name",
                      labelText: "Name",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),

                    ),
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  child: TextField(
                    controller: emailAdress,
                    onChanged: (value) {
                      emailAdressstatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Email Address",
                      labelText: "Email Address",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  child: TextField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      phonestatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Phone number",
                      labelText: "Phone number",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*0.02,),
              Divider(thickness: 1,color: Color(0xffCFCFCF),),
              SizedBox(height: height*0.02,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: textComoon("Notifications", 16, Color(0xff292929), FontWeight.w700),
              ),
              SizedBox(height: height*0.01,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: textComoonfade("Choose how you want your clients to get important notifications on appointments, products, memberships, etc.", 12, Color(0xff414141), FontWeight.w500),
              ),
              SizedBox(height: height*0.04,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: Onemail,
                      onToggle: (value) {
                        setState(() {
                          Onemail = value;
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    Expanded(child: textComoon("Client accepts email notifications", 12, Color(0xff414141),FontWeight.w500))
                  ],
                ),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    FlutterSwitch(
                      width: 55.0,
                      height: 25.0,
                      valueFontSize: 12.0,
                      toggleSize: 18.0,
                      activeColor: Color(0xff01635D),
                      value: Onsms,
                      onToggle: (value) {
                        setState(() {
                          Onsms = value;
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    Expanded(child: textComoon("Client accepts email notifications", 12, Color(0xff414141),FontWeight.w500)),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: CommonButton(context,"SEND INVITE", 12, FontWeight.w600, Colors.white, () {

                }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
