import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:permission_handler/permission_handler.dart';

class beauti_my_gist_comment extends StatefulWidget {
  const beauti_my_gist_comment({Key? key}) : super(key: key);

  @override
  State<beauti_my_gist_comment> createState() => _beauti_my_gist_commentState();
}

class _beauti_my_gist_commentState extends State<beauti_my_gist_comment> {
  String? user = "everyone";

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
  }

  final recorder = FlutterSoundRecorder();

  Future record() async {
    await recorder.startRecorder(toFile: 'audiobeautician');
  }

  Future stop() async {
    await recorder.stopRecorder();
  }

  @override
  void initState() {
    super.initState();

    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();

    super.dispose();
  }

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
        toolbarHeight: height * 0.15, // Set this height
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 30,
                        )),
                    SizedBox(
                      width: width * 0.30,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/Ellipse 168.png"),
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border:
                                Border.all(color: Color(0xffFFFFFF), width: 2),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        children: [
                          Text("My Gist",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("4:30pm",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFFCE8CA)),
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum. In hac habitasse platea dictumst. Nullam hendrerit dictum magna, vitae aliquet turpis rutrum commodo.",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Colors.black54,
                            )),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Divider(
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Text("Response",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("3 Responses",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //     child: Image.asset("assets/images/Group 12788.png",height: height*0.08)),
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        "assets/images/Ellipse 168.png"),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                      border: Border.all(
                                          color: Color(0xffFFFFFF), width: 2),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      border:
                                          Border.all(color: Colors.black54)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "spartan",
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                      "assets/images/Group 12774.png",
                                      height: height * 0.06)),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, right: width * 0.15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("4:40pm",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "spartan",
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Divider(
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      // Row(
                      //   children: [
                      //     Image.asset("assets/images/Group 12788.png",height: height*0.08),
                      //     Spacer(),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Container(
                      //           alignment: Alignment.center,
                      //           width: width*0.55,
                      //           height: height*0.10,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      //               border: Border.all(color: Colors.black54)
                      //           ),
                      //           child: Padding(
                      //             padding: const EdgeInsets.symmetric(horizontal: 15),
                      //             child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                      //                 style: TextStyle(
                      //                   fontSize: 12,
                      //                   fontFamily: "spartan",
                      //                   color: Colors.black,
                      //                 )
                      //             ),
                      //           ),
                      //         ),
                      //         SizedBox(height: height*0.01,),
                      //         Text("4:40pm",
                      //             style: TextStyle(
                      //               fontSize: 12,
                      //               fontFamily: "spartan",
                      //               color: Colors.black,
                      //             )
                      //         )
                      //       ],
                      //     ),
                      //     Spacer(),
                      //     Image.asset("assets/images/Group 12774.png",height: height*0.06),
                      //   ],
                      // ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        "assets/images/Ellipse 168.png"),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                      border: Border.all(
                                          color: Color(0xffFFFFFF), width: 2),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      border:
                                          Border.all(color: Colors.black54)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "spartan",
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              Container(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                      "assets/images/Group 12774.png",
                                      height: height * 0.06)),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, right: width * 0.15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("4:40pm",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "spartan",
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Material(elevation: 10,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("Post Gist",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Divider(
                    color: Colors.black54,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            activeColor: Color(0xff01635D),
                            value: "everyone",
                            groupValue: user,
                            onChanged: (value) {
                              setState(() {
                                user = value.toString();
                              });
                            },
                          ),
                          textComoon("For Everyone", 13, Colors.black, FontWeight.w500),


                          Radio(
                            activeColor: Color(0xFF01635D),
                            value: "only",
                            groupValue: user,
                            onChanged: (value) {
                              setState(() {
                                user = value.toString();
                              });
                            },
                          ),
                          textComoon("For Beauticians Only", 13, Colors.black, FontWeight.w500),

                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black54,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text("Title",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(fontFamily: "spartan", fontSize: 12),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF3F3F3)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                style: TextStyle(
                                    fontFamily: "spartan", fontSize: 12),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Message"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (recorder.isRecording) {
                              await stop();
                            } else {
                              await record();
                            }
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.08,
                            width: width * 0.12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Color(0xFFF2994A)),
                            child: Icon(
                                color: Colors.black,
                                recorder.isRecording ? Icons.stop : Icons.mic),
                          ),
                        ),
                        //Image.asset("assets/images/Group 12782.png",height: height*0.07),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
