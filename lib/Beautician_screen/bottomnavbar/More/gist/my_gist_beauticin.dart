import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/gist/my_gist_comment_gist_beauticin.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

import 'package:permission_handler/permission_handler.dart';

class beauti_my_gist extends StatefulWidget {
  const beauti_my_gist({Key? key}) : super(key: key);

  @override
  State<beauti_my_gist> createState() => _beauti_my_gistState();
}

class _beauti_my_gistState extends State<beauti_my_gist> {
  String? user = "everyone";
  double play = 5;
  bool serachhide=false;

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if(status != PermissionStatus.granted){
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
  }
  final recorder = FlutterSoundRecorder();
  Future record() async{
    await recorder.startRecorder(toFile: 'audiobeautician');
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
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: height * 0.06,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Image(
                                image:
                                AssetImage("assets/images/Group 55.png"),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.25,),
                    Text("My Gist",
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
      body: Column(
        children: [
          Expanded(
            child: SizedBox(

              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.04,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return beauti_my_gist_comment();
                          },));
                        },
                        child:     Row(
                          children: [
                            Stack(alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/images/Ellipse 168.png"),
                                ),

                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    border: Border.all(color: Color(0xffFFFFFF),width: 2),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                //alignment: Alignment.center,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                  color: Color(0xFFFCE8CA),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum...",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "spartan",
                                        color: Colors.black,
                                      )
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Spacer(),
                          Image.asset("assets/images/Group 12754.png",height: height*0.04),
                          SizedBox(width: width*0.30,),
                          Text("8/4/2022",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Divider(color: Colors.black54,),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Stack(alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("assets/images/Ellipse 168.png"),
                              ),

                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(color: Color(0xffFFFFFF),width: 2),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              //alignment: Alignment.center,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                color: Color(0xFFFCE8CA),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum...",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "spartan",
                                      color: Colors.black,
                                    )
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Spacer(),
                          Image.asset("assets/images/Group 12754.png",height: height*0.04),
                          SizedBox(width: width*0.30,),
                          Text("8/4/2022",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Divider(color: Colors.black54,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Divider(color: Colors.black54,),
          Material(
            elevation: 10,
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: height*0.015,),
                  Text("Post Gist",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                 // SizedBox(height: height*0.01,),
                  Divider(color: Colors.black54,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Radio(
                            activeColor: Color(0xff01635D),
                            value: "everyone",
                            groupValue: user,
                            onChanged: (value) {
                              setState(() {
                                user =  value.toString();
                              });
                            },),
                          textComoon("For Everyone", 13,Colors.black, FontWeight.w500),

                       //   Spacer(),
                          Radio(
                            activeColor: Color(0xFF01635D),
                            value: "only",
                            groupValue: user,
                            onChanged: (value) {
                              setState(() {
                                user = value.toString();
                              });
                            },),
                          textComoon("For Beauticians Only", 13,Colors.black, FontWeight.w500),

                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.black54,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
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
                      style: TextStyle(fontFamily: "spartan",fontSize: 12),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
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
                            alignment: Alignment.center,
                            height: height*0.07,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF3F3F3)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(width: 10,),
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
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF2994A)
                            ),
                            child: Icon(color: Colors.black,
                                recorder.isRecording ? Icons.stop:Icons.mic
                            ),
                          ),
                        ),
                        // Image.asset("assets/images/Group 12782.png",height: height*0.07),
                      ],
                    ),
                  ),
                   SizedBox(height: height*0.03,),
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
