// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/my_gist_comment.dart';
import 'package:permission_handler/permission_handler.dart';

class my_gist extends StatefulWidget {
  const my_gist({Key? key}) : super(key: key);

  @override
  State<my_gist> createState() => _my_gistState();
}

class _my_gistState extends State<my_gist> {
  String? user = "everyone";




  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if(status != PermissionStatus.granted){
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
  }
  final recorder = FlutterSoundRecorder();
  Future record() async{
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async{
    await recorder.stopRecorder();
  }

  @override
  void initState() {
    super.initState();

    initRecorder();
  }

  @override
  void dispose(){
    recorder.closeRecorder();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.15, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_sharp,size: 30,)),
                    SizedBox(width: width*0.30,),
                    const Text("My Gist",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "spartan",
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height*0.40,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.04,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const my_gist_comment();
                          },));
                        },
                        child: Row(
                          children: [
                            Image.asset("assets/images/Group 12788.png",height: height*0.08),
                            const Spacer(),
                            Container(
                              alignment: Alignment.center,
                              width: width*0.70,
                              height: height*0.15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                color: Color(0xFFFCE8CA),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum...",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "spartan",
                                      color: Colors.black,
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          const Spacer(),
                          Image.asset("assets/images/Group 12754.png",height: height*0.04),
                          SizedBox(width: width*0.30,),
                          const Text("8/4/2022",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      const Divider(color: Colors.black54,),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Image.asset("assets/images/Group 12788.png",height: height*0.08),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: width*0.70,
                            height: height*0.15,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                              color: Color(0xFFFCE8CA),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum...",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "spartan",
                                    color: Colors.black,
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          const Spacer(),
                          Image.asset("assets/images/Group 12754.png",height: height*0.04),
                          SizedBox(width: width*0.30,),
                          const Text("8/4/2022",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      const Divider(color: Colors.black54,)
                    ],
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.black54,),
            SizedBox(height: height*0.01,),
            const Text("Post Gist",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "spartan",
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: height*0.01,),
            const Divider(color: Colors.black54,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                          activeColor: const Color(0xFF01635D),
                          value: "everyone",
                          groupValue: user,
                          onChanged: (value) {
                            setState(() {
                              user = value.toString();
                            });
                          },),

                        const Text("For Everyone",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "spartan",
                              color: Colors.black,
                            )
                        ),
                      ],
                    ),
                  ),

                  // Spacer(),
                  Expanded(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Radio(
                          activeColor: const Color(0xFF01635D),
                          value: "only",
                          groupValue: user,
                          onChanged: (value) {
                            setState(() {
                              user = value.toString();
                            });
                          },),
                        const Text("For Beauticians Only",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "spartan",
                              color: Colors.black,
                            )
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
            const Divider(color: Colors.black54,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: const [
                  Text("Title",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "spartan",
                          color: Colors.black,
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: const TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                   // border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xffCFCFCF)),
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      height: height*0.07,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFF3F3F3)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: TextStyle(fontFamily: "spartan",fontSize: 12),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Message"
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                //  Image.asset("assets/images/Group 12782.png",height: height*0.07),
                  GestureDetector(
                    onTap: () async {
                      if(recorder.isRecording){
                        await stop();
                      }else{
                        await record();
                      }
                      setState(() {

                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height*0.08,
                      width: width*0.12,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF2994A)
                      ),
                      child: Icon(color: Colors.black,
                          recorder.isRecording ? Icons.stop:Icons.mic
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
