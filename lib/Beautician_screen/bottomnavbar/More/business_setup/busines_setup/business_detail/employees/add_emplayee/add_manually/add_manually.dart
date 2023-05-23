import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class add_Manually extends StatefulWidget {
  const add_Manually({Key? key}) : super(key: key);

  @override
  State<add_Manually> createState() => _add_ManuallyState();
}

class _add_ManuallyState extends State<add_Manually> {
  bool Promotianaloffer = false;
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonernumber = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  String? membervalue="Staffer";
  var membertitems = [
    "Staffer"
  ];
  List colorlist = [
    Color(0xffFF84C7),
    Color(0xffF68EFF),
    Color(0xffAB83FF),
    Color(0xff005874),
    Color(0xff0064C0),
    Color(0xff00815A),
    Color(0xff75D000),
    Color(0xffFBBC04),
    Color(0xffDD6A03),
    Color(0xffFF1D1D)
  ];

  TextEditingController currentpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController conpassword = TextEditingController();
  TextEditingController day = TextEditingController();
  TextEditingController year = TextEditingController();
  bool namestatus = false;
  bool lastnamestatus = false;
  bool emailAdressstatus = false;
  bool phonestatus = false;
  bool titlestatus = false;
  bool notestatus = false;
  bool _selectItem = false;
  String status = "";

  final ImagePicker _picker = ImagePicker();
  bool imagestatus = false;
  String imagepath = "";
  bool color=false;

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
                                    AssetImage("assets/images/cancel.png"),
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
                              child: Text("Add Employee",
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          alignment: Alignment.bottomCenter,
                          insetPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          title: Column(
                            children: <Widget>[
                              SizedBox(
                                height: height * 0.02,
                              ),
                              CommonButton(context, "TAKE A PHOTO", 12,
                                  FontWeight.w600, Colors.white, () async {
                                    Navigator.pop(context);

                                    final XFile? photo = await _picker
                                        .pickImage(source: ImageSource.camera);
                                    if (photo != null) {
                                      imagepath = photo.path;
                                      imagestatus = true;
                                      setState(() {});
                                    }
                                  }),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              CommonButton(
                                  context,
                                  "CHOOSE FROM GALLERY",
                                  12,
                                  FontWeight.w600,
                                  Colors.white, () async {
                                Navigator.pop(context);
                                final XFile? image = await _picker
                                    .pickImage(source: ImageSource.gallery);
                                if (image != null) {
                                  imagepath = image.path;
                                  imagestatus = true;
                                  setState(() {});
                                }
                              }),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              commonButtonborder(context, "CANCEL", 12,
                                  FontWeight.w600, Color(0xff01635D), () {
                                    Navigator.pop(context);
                                  }),
                              SizedBox(
                                height: height * 0.03,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: imagestatus
                      ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(File(imagepath)))),
                  )
                      : Container(
                    width: 120,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffD7E0DD),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Image.asset(
                                  "assets/images/editprofile.png",
                                  height: 40),
                            ),
                            textComoon("Photo", 10, Color(0xff01635D),
                                FontWeight.w600),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),


              Container(
                child: TextField(
                  controller: name,
                  onChanged: (value) {
                    setState(() {
                      namestatus = false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "First Name",
                    labelText: "First Name",
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
              namestatus
                  ? Container(
                height: 30,
                child: Text(
                  "$status",
                  style: TextStyle(
                      fontFamily: 'spartan',
                      fontSize: 12,
                      color: Colors.red),
                ),
              )
                  : Container(
                height: 25,
              ),
              Container(
                child: TextField(
                  controller: lastname,
                  onChanged: (value) {
                    lastnamestatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Last Name",
                    labelText: "Last Name",
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
              lastnamestatus
                  ? Container(
                height: 30,
                child: Text(
                  "$status",
                  style: TextStyle(
                      fontFamily: 'spartan',
                      fontSize: 12,
                      color: Colors.red),
                ),
              )
                  : Container(
                height: 25,
              ),

              Container(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: phonernumber,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff292929),
                      fontWeight: FontWeight.w500,
                      fontFamily: "spartan"),
                  onChanged: (value) {
                    phonestatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    prefixIcon: Container(
                      width: width * 0.33,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CountryCodePicker(
                              flagWidth: 25,
                              onChanged: print,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'IT',
                              favorite: ['+39', 'FR'],
                              textStyle: TextStyle(
                                  fontSize: 10, color: Colors.black87),
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Color(0xffCECECE),
                            )
                          ],
                        ),
                      ),
                    ),
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
              phonestatus
                  ? Container(
                alignment: Alignment.topLeft,
                height: 30,
                child: Text(
                  "$status",
                  style: TextStyle(
                      fontFamily: 'spartan',
                      fontSize: 12,
                      color: Colors.red),
                ),
              )
                  : Container(
                height: 20,
              ),
              Container(
                child: TextField(
                  controller: email,
                  onChanged: (value) {
                    emailAdressstatus = false;
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
              emailAdressstatus
                  ? Container(
                alignment: Alignment.topLeft,
                height: 30,
                child: Text(
                  "$status",
                  style: TextStyle(
                      fontFamily: 'spartan',
                      fontSize: 12,
                      color: Colors.red),
                ),
              )
                  : Container(
                height: 25,
              ),
              Container(
                child: TextField(
                  controller: title,
                  onChanged: (value) {
                    setState(() {
                      titlestatus = false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Title",
                    labelText: "Title",
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
              titlestatus
                  ? Container(
                height: 30,
                child: Text(
                  "$status",
                  style: TextStyle(
                      fontFamily: 'spartan',
                      fontSize: 12,
                      color: Colors.red),
                ),
              )
                  : Container(
                height: 25,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: textComoon(
                          "Notes ", 14, Color(0xff292929), FontWeight.w700)),
                  textComoon(
                      "(Optional)", 12, Color(0xff707070), FontWeight.w500),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: TextField(
                  controller: note,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xff414141,
                      )),
                  onChanged: (value) {
                    notestatus = false;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.only(left: 15, top: 12, bottom: 12),
                    hintText: "",

                    // labelText: "Description",
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
              Container(
                height: 20,
                child: Text(
                  "$status",
                  style: TextStyle(
                      fontFamily: 'spartan',
                      fontSize: 12,
                      color: Color(0xff2F80ED)),
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.01),
                child: textComoon(
                    "Services", 16, Color(0xff292929), FontWeight.w700),
              ),
              textComoonfade("Update services to this team member.", 12,
                  Color(0xff292929), FontWeight.w500),
              SizedBox(
                height: height * 0.02,
              ),

              InkWell(
                onTap: () {},
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(5),
                    // border: Border.all(color: Color(0xff707070), width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      children: [
                        Text(
                          "All services",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff292929),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "(3)",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff707070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Color(0xff707070),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // border: Border.all(color: Color(0xff707070), width: 1)
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Working Hours",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff292929),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Color(0xff707070),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.01),
                child: textComoon(
                    "Calendar Color", 16, Color(0xff292929), FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.03),
                child: textComoonfade(
                    "Choose a color that indicates this team members appointments in the calendar.",
                    12,
                    Color(0xff414141),
                    FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.01),
                child:
                textComoon("Color", 12, Color(0xff292929), FontWeight.w700),
              ),

              Container(
                height: height * 0.17,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: colorlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              color=true;

                            });
                            //
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                               border: Border.all(color: color==true?Color(0xff008BB7):Colors.transparent),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: colorlist[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: height * 0.03),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffCFCFCF),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.02),
                child: textComoon("Member Permision Level", 16,
                    Color(0xff292929), FontWeight.w700),
              ),
              textComoon("Choose team member level", 12, Color(0xff292929), FontWeight.w500),
              SizedBox(height: height*0.01,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38)
                ),
                child: DropdownButton(
                  hint: Text("Select Time Format"),
                  style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'spartan',fontWeight: FontWeight.w500),

                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  iconDisabledColor: Colors.black,
                  iconEnabledColor: Colors.yellow,
                  isExpanded: true,
                  icon: Icon(Icons.keyboard_arrow_down,color: Color(0xff414141)),
                  value: membervalue,
                  items: membertitems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      membervalue = newValue!;

                    });
                  },
                ),
              ),
              SizedBox(height: height*0.05,),
              Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CommonButton(
                  context, "ADD TEAM MEMBER", 12, FontWeight.w600, Colors.white, () {}),
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
