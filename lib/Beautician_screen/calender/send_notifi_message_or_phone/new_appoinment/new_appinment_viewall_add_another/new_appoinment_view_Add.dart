
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';


// ignore: camel_case_types
class newAppoinment_Viwe_Add extends StatefulWidget {
  const newAppoinment_Viwe_Add({Key? key}) : super(key: key);

  @override
  State<newAppoinment_Viwe_Add> createState() => _newAppoinment_Viwe_AddState();
}

// ignore: camel_case_types
class _newAppoinment_Viwe_AddState extends State<newAppoinment_Viwe_Add> {
  // ignore: non_constant_identifier_names
  bool Onoff = false;
  bool notesstatus = false;
  bool depositStatus = false;

  TextEditingController notes = TextEditingController();
  TextEditingController deposit = TextEditingController();

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
          color: const Color(0xffF5F7F7),
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
                                border: Border.all(color: const Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image:
                                        AssetImage("assets/images/cancel.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Create Appointment",
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
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
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Client : ",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff414141),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Joe Cambel",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff01635D),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w600)),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        alignment: Alignment.bottomCenter,
                        titlePadding: const EdgeInsets.only(top: 12, left: 24, right: 12),
                        contentPadding: const EdgeInsets.only(top: 12, left: 24, bottom: 20),
                        insetPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        title: StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
                              children: <Widget>[
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "View client profile",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff292929),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Color(0xffCFCFCF),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Remove from appointment",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffEB5757),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                commonButtonborder(context,"CLOSE",12,FontWeight.w600,const Color(0xff01635D),(){
                                    Navigator.pop(context);
                                }),
                                SizedBox(
                                  height: height * 0.03,
                                ),

                              ],
                            );
                          },
                        ),
                      );
                    },);
                    },
                    child: const Icon(Icons.more_vert, color: Color(0xff414141)),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const Text("Service",
                              style: TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff414141),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xffEBEFEE),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Text("1",
                                  style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff01635D),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                              color: Color(0xffEBEFEE),
                            )),
                        child: Container(
                          height: height * 0.22,
                          width: width,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                            // border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                decoration: const BoxDecoration(
                                  color: Color(0xff01635D),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  // border: Border.all(width: 1, color: Colors.black),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text("Mar  16",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Color(0xffFFFFFF),
                                                  fontFamily: "spartan",
                                                  fontWeight: FontWeight.w600)),
                                          Text("9:00 AM",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Color(0xffFFFFFF),
                                                  fontFamily: "spartan",
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text("Service",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color(0xff707070),
                                                    fontFamily: "spartan",
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            SizedBox(height: 5),
                                            Text("Men’s Cut",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.black,
                                                    fontFamily: "spartan",
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      indent: 10,
                                      color: Color(0xffEBEFEE),
                                      thickness: 1,
                                    ),
                                    // Container(width: width,
                                    //   height: 1,color: Color(0xffEBEFEE),),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("Price & duration",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Color(0xff707070),
                                                    fontFamily: "spartan",
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: const [
                                                Text("\$20 for 30min",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.black,
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("with Tolu",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color:
                                                            Color(0xff707070),
                                                        fontFamily: "spartan",
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Add another service",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff2F80ED),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Color(0xff2F80ED),
                      ))
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text("Request deposit",
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: const [
                            Text(
                                "Request a percentage of your\nservice charge from clients.",
                                style: TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      FlutterSwitch(
                        width: 55.0,
                        height: 25.0,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        activeColor: const Color(0xff01635D),
                        value: Onoff,
                        onToggle: (value) {
                          setState(() {
                            Onoff = value;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Onoff ? TextField(
                    controller: deposit,
                    style: const TextStyle(color: Color(0xff292929)),
                    onChanged: (value) {
                      setState(() {
                        depositStatus = false;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        width: 80,
                        child: IntrinsicHeight(
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20),
                                child: Text("%",
                                    style: TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xff707070),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5),
                                child: VerticalDivider(
                                  color: Color(0xff707070),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      suffixIcon: SizedBox(
                        width: 80,
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5),
                                child: VerticalDivider(
                                  color: Color(0xff707070),
                                  thickness: 1,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Deposit",
                                      style: TextStyle(
                                          fontSize: 10,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff707070),
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.w500)),
                                  Text("\$11.00",
                                      style: TextStyle(
                                          fontSize: 12,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff292929),
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
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
                  )
                  : Container(),
              SizedBox(
                height: height * 0.01,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffCFCFCF),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: const [
                  Text("Notes ",
                      style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  Text("(Optional)",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.normal)),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              TextField(
                controller: notes,
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    notesstatus = false;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
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
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Requested  deposit ",
                      style: TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff707070),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                  Text("\$11.00",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CommonButton(
                  context, "SAVE", 12, FontWeight.w600, Colors.white, () {}),
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
