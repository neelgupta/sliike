import 'package:flutter/material.dart';
import '../../second_beautyservice_or_product/service_add/categorytype_service.dart';

// ignore: camel_case_types
class professional_Licence_Camera extends StatefulWidget {
  const professional_Licence_Camera({Key? key}) : super(key: key);

  @override
  State<professional_Licence_Camera> createState() => _professional_LicenceState();
}

// ignore: camel_case_types
class _professional_LicenceState extends State<professional_Licence_Camera> {
  String selected= 'yes';
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
          toolbarHeight: height * 0.18, // Set this height
          flexibleSpace: Container(
              color: const Color(0xff01635D),
              child:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: const [
                          Text("Professional Licence",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xffFFFFFF),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              "Indicate your professional licence status",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "spartan",
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                )
              ]))),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(children: [
          SizedBox(height: height*0.08,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffE7E7E7),width: 1),

              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/images/licence.png"),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                        "Are you a licenced beautician?",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Color(0xff01635D),fontWeight: FontWeight.bold)),

                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: "yes", activeColor: const Color(0xff01635D), groupValue: selected, onChanged: (value) {
                                  setState(() {
                                    selected = value as String;

                                  });
                                }),
                                const Text("Yes",style: TextStyle(fontSize: 15,fontFamily: 'spartan',color: Color(0xff414141)),),

                              ],
                            ),
                            const SizedBox(width: 10,),
                            Row(
                              children: [
                                Radio(value: "No", activeColor: const Color(0xff01635D), groupValue: selected, onChanged: (value) {
                                  setState(() {
                                    selected = value as String;

                                  });
                                }),
                                const Text("No",style: TextStyle(fontSize: 15,fontFamily: 'spartan',color: Color(0xff414141)),),

                              ],
                            ),
                          ],
                        )
                      ],
                    ),



                    selected=="yes"?Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20,right: 20),
                          child: Divider(color: Color(0xffCFCFCF),thickness: 1),
                        ),
                        const SizedBox(height: 10,),
                        ///Camera Condditon
                        // Container(
                        //
                        //   height: height*0.16,
                        //
                        //   child: Center(
                        //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //
                        //         InkWell(
                        //           onTap: (){
                        //
                        //           },
                        //           child: Container(
                        //             width: 70,
                        //             height: 70,
                        //             decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                   image: AssetImage("assets/images/camera.png"),
                        //                 )
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(height: 10,),
                        //         Center(child: Text("Upload proof of professional licence",style: TextStyle(fontSize: 10,fontFamily: 'spartan',color: Color(0xff414141)),textAlign: TextAlign.center,)),
                        //
                        //       ],
                        //     ),
                        //   ),
                        // )
                        Stack(alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: width*0.5,
                              height: height*0.16,
                              child: Image.asset("assets/images/Rectangle 217.png",fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/images/cameracircal.png",fit: BoxFit.fill),
                            ),
                          ],
                        )
                      ]):Column(children: const [],)
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
                     if (selected=="No"){
                     Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
    return addServicetype(secondflow: false,);
    },
    ));}
            },
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff01635D)),
              child: const Text("CONTINUE",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                      color: Colors.white)),
            ),
          ),
          const SizedBox(height: 30,),
        ]),
      ),
    );
  }
}
