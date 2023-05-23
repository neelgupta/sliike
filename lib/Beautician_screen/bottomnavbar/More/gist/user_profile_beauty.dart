import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class user_profile_beauty extends StatefulWidget {
  const user_profile_beauty({Key? key}) : super(key: key);

  @override
  State<user_profile_beauty> createState() => _user_profile_beautyState();
}

class _user_profile_beautyState extends State<user_profile_beauty> {
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
                    Stack(alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 40,
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
                      Row(
                        children: [
                          Text("Beauty",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          Spacer(),
                          Text("4:30pm",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20) ,
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFF3F3F3)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
                          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum. In hac habitasse platea dictumst. Nullam hendrerit dictum magna, vitae aliquet turpis rutrum commodo.",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Divider(color: Colors.black54,),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Text("Response",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "spartan",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          Spacer(),
                          Text("3 Responses",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "spartan",
                                color: Colors.black54,
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      Column(
                        children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //     child: Image.asset("assets/images/Group 12788.png",height: height*0.08)),
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
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                      border: Border.all(color: Colors.black54)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "spartan",
                                          color: Colors.black,
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),

                              Container(alignment: Alignment.centerRight,
                                  child: Image.asset("assets/images/Group 12774.png",height: height*0.06)),
                            ],
                          ),

                          Padding(
                            padding:  EdgeInsets.only(top: 10,right: width*0.15 ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("4:40pm",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "spartan",
                                      color: Colors.black,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.01,),
                      Divider(color: Colors.black54,),
                      SizedBox(height: height*0.02,),
                      Column(
                        children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
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
                              // Spacer(),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                      border: Border.all(color: Colors.black54)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "spartan",
                                          color: Colors.black,
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),

                              Container(alignment: Alignment.centerRight,
                                  child: Image.asset("assets/images/Group 12774.png",height: height*0.06)),
                            ],
                          ),

                          Padding(
                            padding:  EdgeInsets.only(top: 10,right: width*0.15 ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("4:40pm",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "spartan",
                                      color: Colors.black,
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        //  Divider(color: Colors.black54,),

          Material(
            elevation: 10,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: height*0.01,),
                  Text("Reply Post",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(height: height*0.01,),
                  Divider(color: Colors.black54,),
                  SizedBox(height: height*0.01,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text("Title: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "spartan",
                              color: Colors.black54,
                            )
                        ),
                        Text("Beauty",
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,

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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
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
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
