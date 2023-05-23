import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/gist/my_gist_beauticin.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/gist/user_profile_beauty.dart';
import 'package:permission_handler/permission_handler.dart';

class sliiikeGist extends StatefulWidget {
  const sliiikeGist({Key? key}) : super(key: key);

  @override
  State<sliiikeGist> createState() => _sliiikeGistState();
}

class _sliiikeGistState extends State<sliiikeGist> {

  TextEditingController search=TextEditingController();
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
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF2994A),
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
                    Spacer(),
                    Text("Gist",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "spartan",
                            color: Colors.black,
                          fontWeight: FontWeight.bold
                        )
                    ),
                    Spacer(),
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
                  InkWell(onTap: (){
                    setState(() {
                      serachhide=true;
                    });
                  },
                      child: Image.asset("assets/images/search.png",height: height*0.03)),
                  SizedBox(width: 10,),
                  Expanded(
                    child: serachhide==true?Container(

                            child: TextField(
                              controller: search,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,

                              ),
                            ),
                          ):SizedBox(),
                  ),
                 //  Spacer(), 
                  Image.asset("assets/images/notification.png",height: height*0.04),
                  SizedBox(width: width*0.04,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return beauti_my_gist();
                      },));
                    },
                    child: Container(alignment: Alignment.center,
                      height: height*0.07,
                      width: width*0.35,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFF2994A)),
                          color:Color(0xFFF2994A) ,
                          borderRadius: BorderRadius.all(Radius.circular(20)
                          )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("assets/images/messages.png"),height: height*0.03,),
                          SizedBox(width: width*0.02,),
                          Text("MY GISTS",
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
                  Text("Beauty",
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
                        return user_profile_beauty();
                      },));
                    },
                    child: Row(
                      children: [
                        Stack(alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/images/Ellipse 168.png"),
                            ),

                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                                border: Border.all(color: Color(0xffFFFFFF),width: 3),
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
                              color: Color(0xFFF3F3F3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sed lacus id metus semper dictum",
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
                      SizedBox(width: width*0.35,),
                      Text("4:30pm",
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
                  Text("Men’s Style",
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
                            color: Color(0xFFF3F3F3),
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
                      SizedBox(width: width*0.36,),
                      Text("3:12pm",
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
                  Text("Beauty Help",
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
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: width*0.70,
                        height: height*0.12,
                        decoration: BoxDecoration(
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
                                  activeColor: Color(0xFFF2994A),
                                  inactiveColor: Color(0xFFCFCFCF),
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
                      )
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      Spacer(),
                      Image.asset("assets/images/Group 12760.png",height: height*0.05),
                      SizedBox(width: width*0.40,),
                      Text("2/4/2022",
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
                      Text("Haircare",
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
                            return beauti_my_gist();
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
                                  color: Color(0xFFF3F3F3),
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
