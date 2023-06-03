// ignore: duplicate_ignore
// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/bottomnavbar.dart';


class conGraTuLation extends StatefulWidget {
  const conGraTuLation({Key? key}) : super(key: key);

  @override
  State<conGraTuLation> createState() => _conGraTuLation_HoursState();
}

// ignore: camel_case_types
class _conGraTuLation_HoursState extends State<conGraTuLation> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(

                  decoration: BoxDecoration(
                    color: const Color(0xff219653),
                    borderRadius: BorderRadius.circular(15.0),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 60,bottom: 60,right: 10,left: 10),
                    child: Column(
                      children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.asset("assets/images/right.png"),
                          ),
                        SizedBox(height: height*0.02,),
                        const Text("Congratulations on a\nsuccessful business set up",textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "spartan",
                                letterSpacing: 1,
                                color: Colors.white,fontWeight: FontWeight.w900)
                        ),
                        SizedBox(height: height*0.02,),
                        const Text("You are now ready to do business on\nSliike App. We are here to assist you all\nthe way. Welcome!",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "spartan",
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,)
                        ),
                        SizedBox(height: height*0.05,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                                  return const BottomNavigation();
                                },),(route) => false, );
                              });
                            },
                            child: Container(
                              width: width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xffFFFFFF),
                              ),
                              child: const Center(
                                child: Text("CONTINUE",textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "spartan",
                                      color: Color(0xff01635D),fontWeight: FontWeight.w900)
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
