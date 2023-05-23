// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/my_gist.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/user_profile.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class gist extends StatefulWidget {
  const gist({Key? key}) : super(key: key);

  @override
  State<gist> createState() => _gistState();
}

class _gistState extends State<gist> {
  double play = 5;

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
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF2994A),
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
                    const Spacer(),
                    const Text("Gist",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "spartan",
                            color: Colors.black,
                          fontWeight: FontWeight.bold
                        )
                    ),
                    const Spacer(),
                    Image.asset("assets/images/Group 12256.png",height: height*0.03,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.04,),
              Row(
                children: [
                  Image.asset("assets/images/search.png",height: height*0.03),
                  const Spacer(),
                  Image.asset("assets/images/notification.png",height: height*0.04),
                  SizedBox(width: width*0.04,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const my_gist();
                      },));
                    },
                    child: Container(alignment: Alignment.center,
                      height: height*0.07,
                      width: width*0.35,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFF2994A)),
                          color:const Color(0xFFF2994A) ,
                          borderRadius: const BorderRadius.all(Radius.circular(20)
                          )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: const AssetImage("assets/images/messages.png"),height: height*0.03,),
                          SizedBox(width: width*0.02,),
                          const Text("MY GISTS",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "spartan",
                                  color: Colors.black
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Beauty",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(height: height*0.02,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const user_profile();
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
                            color: Color(0xFFF3F3F3),
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
                      SizedBox(width: width*0.35,),
                      const Text("4:30pm",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black54,
                          )
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: height*0.04,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Men’s Style",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
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
                          color: Color(0xFFF3F3F3),
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
                      SizedBox(width: width*0.36,),
                      const Text("3:12pm",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black54,
                          )
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: height*0.04,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Beauty Help",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      Image.asset("assets/images/Group 12788.png",height: height*0.08),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: width*0.70,
                        height: height*0.12,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          color: Color(0xFFF3F3F3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Image.asset("assets/images/Polygon 10.png",height: height*0.03),
                              SizedBox(
                                width: width*0.40,
                                child: Slider(
                                  activeColor: const Color(0xFFF2994A),
                                  inactiveColor: const Color(0xFFCFCFCF),
                                  min: 1,
                                  max: 5,
                                  value: play,
                                  onChanged: (value) {
                                    setState(() {
                                      play = value;
                                    });
                                },
                                ),
                              ),
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
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
                                      // StreamBuilder<RecordingDisposition>(
                                      //   stream: recorder.onProgress,
                                      //   builder: (context, snapshot) {
                                      //   final duration = snapshot.hasData? snapshot.data!.duration:Duration.zero;
                                      //   String two(int n) => n.toString().padLeft(0);
                                      //   final twominuites = two(duration.inMinutes.remainder(60));
                                      //   final twoseconds = two(duration.inSeconds.remainder(60));
                                      //   return Text('${twominuites}:${twoseconds}',
                                      //   style: TextStyle(
                                      //     fontSize: 10,
                                      //     fontFamily: "spartan",
                                      //     color: Colors.black,
                                      //   ),
                                      //   );
                                      // },)
                                    ],
                                  )
                              ),
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      const Spacer(),
                      Image.asset("assets/images/Group 12760.png",height: height*0.05),
                      SizedBox(width: width*0.40,),
                      const Text("2/4/2022",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.black54,
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Best Haircare Tips",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "spartan",
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      SizedBox(height: height*0.02,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const my_gist();
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
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: height*0.04,)
            ]
          ),
        ),
      )
    );
  }
}
