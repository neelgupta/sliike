import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/forget_reset_password/password_done.dart';

// ignore: camel_case_types
class usePhoneNumber extends StatefulWidget {
  const usePhoneNumber({Key? key}) : super(key: key);

  @override
  State<usePhoneNumber> createState() => _usePhoneNumberState();
}

// ignore: camel_case_types
class _usePhoneNumberState extends State<usePhoneNumber> {
  TextEditingController password=TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Conformpassword=TextEditingController();

  bool passwordstatus=false;
  bool conformpasswordstatus=false;
  bool passwordshowstatushide=false;
  bool conformshowstatushide=false;
  String status="";
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
        toolbarHeight: height * 0.1, // Set this height
        flexibleSpace: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: height*0.06,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    const SizedBox(width: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Reset Password",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
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
                  const SizedBox(height: 20,),
                  Container(alignment: Alignment.topLeft,
                    child: const Text("Create new password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,
                    fontFamily: "spartan"),),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: password,
                    onChanged: (value) {
                      passwordstatus = false;
                    },
                    obscureText: passwordshowstatushide,

                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintText: "New Password",
                      labelText: "New Password",
                      suffixIcon:  passwordshowstatushide?IconButton(onPressed: (){
                        setState(() {
                          passwordshowstatushide=!passwordshowstatushide;
                        });
                      },
                        icon: const Icon(Icons.visibility_off_outlined),):IconButton(onPressed: (){
                        setState(() {
                          passwordshowstatushide=!passwordshowstatushide;
                        });
                      },
                          icon: const Icon(Icons.visibility_outlined)),
                      labelStyle: const TextStyle(
                          fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                  passwordstatus
                      ? SizedBox(
                    height: 30,
                    child: Text(
                      status,
                      style: const TextStyle(
                          fontFamily: 'spartan',
                          fontSize: 12,
                          color: Colors.red),
                    ),
                  )
                      : Container(
                    height: 20,
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: Conformpassword,
                    onChanged: (value) {
                      conformpasswordstatus = false;
                    },
                    obscureText: conformshowstatushide,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintText: "Confirm Password ",
                      labelText: "Confirm Password ",
                      suffixIcon:  conformshowstatushide?IconButton(onPressed: (){
                        setState(() {
                          conformshowstatushide=!conformshowstatushide;
                        });
                      },
                        icon: const Icon(Icons.visibility_off_outlined),):IconButton(onPressed: (){
                        setState(() {
                          conformshowstatushide=!conformshowstatushide;
                        });
                      },
                          icon: const Icon(Icons.visibility_outlined)),
                      labelStyle: const TextStyle(
                          fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                  conformpasswordstatus
                      ? SizedBox(
                    height: 30,
                    child: Text(
                      status,
                      style: const TextStyle(
                          fontFamily: 'spartan',
                          fontSize: 12,
                          color: Colors.red),
                    ),
                  )
                      : Container(
                    height: 20,
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const password_done();
                        },
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff01635D)),
                      child: const Text("RESET PASSWORD",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "spartan",
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

