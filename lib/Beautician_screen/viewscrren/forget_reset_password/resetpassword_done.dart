import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/forget_reset_password/creatnewpassword.dart';
// ignore: camel_case_types
class resetPassWordDone extends StatefulWidget {
  const resetPassWordDone({Key? key}) : super(key: key);

  @override
  State<resetPassWordDone> createState() => _resetPassWordDoneState();
}

// ignore: camel_case_types
class _resetPassWordDoneState extends State<resetPassWordDone> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    // double width = MediaQuery.of(context).size.width -
    //     MediaQuery.of(context).padding.right -
    //     MediaQuery.of(context).padding.left;
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
                      const Text("Reset Password",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                    ],
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
            const SizedBox(height: 20,),
                Container(
                  width: 40,
                height: 40,
                decoration: BoxDecoration(
                 shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff219653),width: 2)
                ),child: const Icon(Icons.done,color: Color(0xff219653)),
                ),
            const SizedBox(height: 20,),
            const Text("Email sent",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "spartan"),),
            const SizedBox(height: 10,),
            const Text("Check your email and open the link we sent to continue",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w500,fontFamily: "spartan"),),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn’t get the code?",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 12)),
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return const usePhoneNumber();
                     },));
                   },
                     child: const Text(" Use phone number",style: TextStyle(color: Color(0xFF2F80ED),fontFamily: "spartan",fontSize: 12,))),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
