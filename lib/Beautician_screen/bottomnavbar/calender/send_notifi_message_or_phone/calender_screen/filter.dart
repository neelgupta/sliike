import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';

// ignore: camel_case_types
class filter extends StatefulWidget {
  const filter({Key? key}) : super(key: key);

  @override
  State<filter> createState() => _filterState();
}

// ignore: camel_case_types
class _filterState extends State<filter> {
  String selected= 'onlyme';
  bool checkboxvalue = false;
  bool box = false;

  TextEditingController search = TextEditingController();
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
                          width: width/4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text("Filter",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
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
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  child: TextField(
                    controller: search,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.only(left: 20),
                      hintText: "Search staff member",
                      hintStyle:
                      TextStyle(color: Color(0xff707070)),
                      suffixIcon: Container(
                        width: width * 0.2,
                        color: Color(0xff01635D),
                        height: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                              "assets/images/search-whitenormal.png"),
                        ),
                      ),
                      labelStyle: TextStyle(
                          fontFamily: 'spartan',
                          color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(5),
                        borderSide:
                        BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(5),
                        borderSide:
                        BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Radio(value: "onlyme", activeColor: Color(0xff01635D), groupValue: selected, onChanged: (value) {
                      setState(() {
                        selected = value as String;

                      });
                    }),
                    Image(image: AssetImage("assets/images/Group 12524.png"),height: 50,width: 50,),
                    SizedBox(
                      width: width*0.05,
                    ),
                    Text("Only me",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: height*0.04,
                ),
                Row(
                  children: [
                    Radio(value: "select all", activeColor: Color(0xff01635D), groupValue: selected, onChanged: (value) {
                      setState(() {
                        selected = value as String;

                      });
                    }),
                    Image(image: AssetImage("assets/images/Group.png"),height: 50,width: 50,),
                    SizedBox(
                      width: width*0.05,
                    ),
                    Text("Select All",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Divider(color: Colors.black54),
                SizedBox(
                  height: height*0.03,
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
                    SizedBox(width: 20,),
                    Image(image: AssetImage("assets/images/T.png"),height: 50,width: 50,),
                    SizedBox(
                      width: width*0.04,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tolu Williams",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold)),
                        RichText(text: TextSpan(
                            text: 'Active.',
                            style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.green),
                          children: [
                            TextSpan(
                              text: '8:00AM - 5:00PM',
                                style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 12))
                          ]
                          )
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height*0.01,
                ),
                Divider(color: Colors.black54),
                SizedBox(
                  height: height*0.03,
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
                    SizedBox(width: 20,),
                    Image(image: AssetImage("assets/images/R.png"),height: 50,width: 50,),
                    SizedBox(
                      width: width*0.04,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rita Powel",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold)),
                        RichText(text: TextSpan(
                            text: 'Active.',
                            style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.green),
                            children: [
                              TextSpan(
                                  text: '8:00AM - 5:00PM',
                                  style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 12))
                            ]
                        )
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height*0.05,
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width*0.42,
                      height: height*0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Color(0xff01635D),)
                      ),
                      child: Text("Default",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Color(0xff01635D)),
                    )
                    ),
                    SizedBox(
                      width: width*0.05,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width*0.42,
                        height: height*0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xff01635D)
                        ),
                        child: Text("APPLY",style: TextStyle(fontFamily: 'spartan',fontWeight: FontWeight.bold,color: Colors.white),
                        )
                    ),
                    SizedBox(
                      height: height*0.03,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
