import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/plans_billing/plans_bulling_main/plans_bulling_main.dart';

class sliike_Successful extends StatefulWidget {
  const sliike_Successful({Key? key}) : super(key: key);

  @override
  State<sliike_Successful> createState() => _sliike_SuccessfulState();
}

class _sliike_SuccessfulState extends State<sliike_Successful> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(

                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/Group 12079.png",fit: BoxFit.fill),
                  ),
                ),
              ),

              Text("Your Sliike-pro subscription was successful",textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * 0.01,
              ),
              Container(alignment: Alignment.topLeft,
                  child: Text("An email will be sent to you on everything you need to know about you current Subscription.",textAlign: TextAlign.start,style: TextStyle(color: Color(0xff414141), fontSize: 12, fontFamily: "spartan",),)),
              SizedBox(height: height*0.03,),
              InkWell(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return plans_Bulling_Main();
                 },));


                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text("OK, GOT IT",
                      style: TextStyle(
                          fontSize: 12,
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
