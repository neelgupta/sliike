import 'package:flutter/material.dart';
// ignore: camel_case_types
class password_done extends StatefulWidget {
  const password_done({Key? key}) : super(key: key);

  @override
  State<password_done> createState() => _password_doneState();
}

// ignore: camel_case_types
class _password_doneState extends State<password_done> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: height*0.2,),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xffAFC0BB))),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset("assets/images/verifi_sucess.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100,left: 105),
                    child: Container(
                      decoration:const BoxDecoration(shape: BoxShape.circle,color: Color(0xFF219653)),
                      height: 10,

                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text("PASSWORD RESET SUCCESSFUL",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10,),
              const Text("You can now sign into your account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "spartan")),
              SizedBox(
                height: height * 0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text("SIGN IN NOW",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
