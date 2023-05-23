import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/import_client_from_contact/client_list/client_list.dart';
// ignore: camel_case_types, must_be_immutable
class contactLIst_Select extends StatefulWidget {
  List<Contact>? contacts;

  contactLIst_Select(this.contacts, {Key? key}) : super(key: key);

  @override
  State<contactLIst_Select> createState() => _contactLIst_SelectState();
}
// ignore: camel_case_types, must_be_immutable
class _contactLIst_SelectState extends State<contactLIst_Select> {
  bool checkboxvalue = false;
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
        toolbarHeight: height * 0.18, //
        flexibleSpace: Container(
          color: const Color(0xff01635D),
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
                            padding: const EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/backwhite.png"),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Contact List",
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 60,
                        ),
                        Expanded(
                          child: Text("Select contacts and send invite.",
                              style: TextStyle(
                                  fontSize: 12,
                                  // you can change it accordingly
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              TextField(
                controller: search,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "Search service",
                  hintStyle: const TextStyle(color: Color(0xff707070)),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 12, right: 12, bottom: 10),
                    child: SizedBox(
                      height: 5,
                      child: Image.asset("assets/images/search-normal.png"),
                    ),
                  ),
                  labelStyle:
                      const TextStyle(fontFamily: 'spartan', color: Colors.black54),
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
              SizedBox(
                height: height * 0.02,
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
                    backgroundColor: const Color(0xff01635D),
                    borderColor: const Color(0xff01635D),
                    icon: Icons.check,
                    iconColor: Colors.white,
                    size: 24,
                    iconSize: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Select All (${widget.contacts!.length})",
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: "spartan",
                          color: Color(0xff292929),
                          fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Divider(
                thickness: 1,
                color: (Color(0xffCFCFCF)),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.contacts!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Custom_Checkbox(
                                isChecked: checkboxvalue,
                                onChange: (value) {
                                  setState(() {
                                    checkboxvalue = value;
                                  });
                                },
                                backgroundColor: const Color(0xff01635D),
                                borderColor: const Color(0xff01635D),
                                icon: Icons.check,
                                iconColor: Colors.white,
                                size: 24,
                                iconSize: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: Color(0xffCFCFCF),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                    "assets/images/profile.png",
                                    fit: BoxFit.fill),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  widget.contacts![index].displayName,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff414141),
                                    fontFamily: "spartan",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: (Color(0xffCFCFCF)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              //Spacer(),

              SizedBox(
                width: width,
                height: 100,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // checkboxvalue == true
                          //     ? showDialog(
                          //         context: context,
                          //         builder: (context) {
                          //           return Center(
                          //             child: Material(
                          //               type: MaterialType.transparency,
                          //               child: Stack(
                          //                 alignment: Alignment.topCenter,
                          //                 children: [
                          //                   Container(
                          //                     margin: const EdgeInsets.only(
                          //                         left: 20,
                          //                         right: 20,
                          //                         top: 25,
                          //                         bottom: 25),
                          //                     decoration: BoxDecoration(
                          //                       borderRadius:
                          //                           BorderRadius.circular(10),
                          //                       color: Colors.white,
                          //                       // gradient: boxGradient,
                          //                     ),
                          //                     padding: const EdgeInsets.only(
                          //                         top: 5, bottom: 5),
                          //                     width: width,
                          //                     height: 220,
                          //                     child: Center(
                          //                       child: Padding(
                          //                         padding:
                          //                             const EdgeInsets.only(
                          //                                 left: 10, right: 10),
                          //                         child: Column(
                          //                           children: [
                          //                             SizedBox(
                          //                               height: height * 0.07,
                          //                             ),
                          //                             Text("Clients",
                          //                                 textAlign:
                          //                                     TextAlign.center,
                          //                                 style: TextStyle(
                          //                                   fontSize: 15,
                          //                                   fontFamily:
                          //                                       "spartan",
                          //                                   fontWeight:
                          //                                       FontWeight.w600,
                          //                                   color: Color(
                          //                                       0xff292929),
                          //                                 )),
                          //                             SizedBox(
                          //                               height: height * 0.02,
                          //                             ),
                          //                             Text(
                          //                                 "Successfully Invited",
                          //                                 textAlign:
                          //                                     TextAlign.center,
                          //                                 style: TextStyle(
                          //                                   fontSize: 12,
                          //                                   fontFamily:
                          //                                       "spartan",
                          //                                   fontWeight:
                          //                                       FontWeight.w500,
                          //                                   color: Color(
                          //                                       0xff414141),
                          //                                 )),
                          //                             SizedBox(
                          //                               height: height * 0.03,
                          //                             ),
                          //                             InkWell(
                          //                               onTap: () {
                          //                                 Navigator.push(
                          //                                     context,
                          //                                     MaterialPageRoute(
                          //                                   builder: (context) {
                          //                                     return clientListContact(
                          //                                         widget
                          //                                             .contacts);
                          //                                   },
                          //                                 ));
                          //                                 // Navigator.pop(context);
                          //                               },
                          //                               child: Container(
                          //                                 width: width,
                          //                                 height: 50,
                          //                                 decoration:
                          //                                     BoxDecoration(
                          //                                   borderRadius:
                          //                                       BorderRadius
                          //                                           .circular(
                          //                                               5),
                          //                                   color: Color(
                          //                                       0xff219653),
                          //                                 ),
                          //                                 child: Center(
                          //                                   child: Text("DONE",
                          //                                       textAlign:
                          //                                           TextAlign
                          //                                               .center,
                          //                                       style: TextStyle(
                          //                                           fontSize:
                          //                                               15,
                          //                                           fontFamily:
                          //                                               "spartan",
                          //                                           color: Color(
                          //                                               0xffffffff),
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .w500)),
                          //                                 ),
                          //                               ),
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                     height: 90,
                          //                     width: 90,
                          //                     child: Image.asset(
                          //                         "assets/images/stackright.png"),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       ) :
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return clientListContact(widget.contacts);
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
                          child: const Text("SEND INVITE",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "spartan",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // body: _body(),
    );
  }


}


