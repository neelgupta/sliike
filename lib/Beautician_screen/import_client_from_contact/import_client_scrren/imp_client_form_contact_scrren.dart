import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/bottomnavbar.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/import_client_from_contact/Contactlist/contactlist_select.dart';

// ignore: camel_case_types
class importClientScreen extends StatefulWidget {
  const importClientScreen({Key? key}) : super(key: key);

  @override
  State<importClientScreen> createState() => _importClientScreenState();
}

// ignore: camel_case_types
class _importClientScreenState extends State<importClientScreen> {
  bool permissionDenied = false;
  List<Contact>? contacts;
  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => permissionDenied = true);
    } else {
      contacts = await FlutterContacts.getContacts();
      setState(() => contacts = contacts);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;

    return WillPopScope(
      onWillPop: () async {
        return await false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    SizedBox(
                      height: height * 0.4,
                      width: width,
                      child: Image.asset("assets/images/importclientimg.png",
                          fit: BoxFit.fill),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },`
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 20, top: 60),
                    //     child: Container(
                    //       padding: const EdgeInsets.all(8),
                    //       height: height * 0.06,
                    //       decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           border: Border.all(color: Colors.white)),
                    //       child: Container(
                    //           padding: const EdgeInsets.all(5),
                    //           child: const Image(
                    //             image:
                    //                 AssetImage("assets/images/backwhite.png"),
                    //             color: Colors.white,
                    //           )),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text("Boost Your Clients quickly",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                      "Start growing your client base by importing\nyour phone contacts to your client list.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/images/lock.png",
                            fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Client information is private to only you.",
                          style: TextStyle(
                              fontSize: 11,
                              fontFamily: "spartan",
                              color: Color(0xff414141),
                              fontWeight: FontWeight.normal)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                    onTap: () async {
                      // showDialog(
                      //
                      //   context: context, builder: (context) {
                      //   return AlertDialog(alignment: Alignment.center,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     actions: [
                      //       SizedBox(height: height*0.03,),
                      //       Center(
                      //         child: Container(
                      //           height: 20,
                      //           width: 20,
                      //           alignment: Alignment.center,
                      //           child: Image.asset("assets/images/contacticon.png"),
                      //         ),
                      //       ),
                      //       SizedBox(height: height*0.03,),
                      //       Center(
                      //         child: RichText(textAlign: TextAlign.center,
                      //           text: const TextSpan(
                      //             text: 'Allow ',
                      //             style: TextStyle(
                      //               fontSize: 14,
                      //               fontFamily: 'spartan',
                      //               color: Color(0xff292929),
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //             children: [
                      //               TextSpan(
                      //                 text: 'Sliike ',
                      //                 style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontFamily: 'spartan',
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //               TextSpan(
                      //
                      //                 text: 'to access your\ncontacts?',
                      //                 style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontFamily: 'spartan',
                      //                   color: Color(0xff292929),
                      //                   fontWeight: FontWeight.w400,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(height: height*0.01,),
                      //       Divider(thickness: 1,color: Color(0xffCFCFCF),),
                      //       SizedBox(height: height*0.01),
                      //       Center(child: InkWell(
                      //           onTap: (){
                      //             Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //               return contactLIst_Select();
                      //             },));
                      //           },
                      //           child: Text("ALLOW",style: TextStyle(fontSize: 12, fontFamily: 'spartan',fontWeight: FontWeight.w600,color: Color(0xff2F80ED)),))),
                      //       SizedBox(height: height*0.01),
                      //       Divider(thickness: 1,color: Color(0xffCFCFCF),),
                      //       SizedBox(height: height*0.01),
                      //       Center(child: InkWell(
                      //           onTap: (){
                      //             Navigator.pop(context);
                      //           },
                      //           child: Text("DON\'T ALLOW",style: TextStyle(fontSize: 12, fontFamily: 'spartan',fontWeight: FontWeight.w600,color: Color(0xff2F80ED)),))),
                      //       SizedBox(height: height*0.04,)
                      //
                      //     ],
                      //   );
                      //
                      //
                      // },);
                      if (!await FlutterContacts.requestPermission(
                          readonly: true)) {
                        setState(() => permissionDenied = true);
                        // ignore: use_build_context_synchronously
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return contactLIst_Select(contacts!, true);
                          },
                        ));
                      } else {
                        contacts = await FlutterContacts.getContacts(
                            withProperties: true);
                        setState(() => contacts = contacts);
                        // ignore: use_build_context_synchronously
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return contactLIst_Select(contacts!, true);
                          },
                        ));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff01635D)),
                      child: const Text("IMPORT CONTACTS",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "spartan",
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const BottomNavigation();
                        },
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: const Color(0xff01635D), width: 1),
                      ),
                      child: const Text("SKIP FOR NOW",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "spartan",
                              color: Color(0xff01635D),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                        "By choosing \"Import Contacts\" we will add your\ncontact names and phone numbers to your client base. You’ll have the option to choose which contacts you'd like to invite.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: "spartan",
                            color: Color(0xff414141),
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
