// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';

import '../../../bottomnavbar/calender/send_notifi_message_or_phone/new_appoinment/client/appoinment_clientlist.dart';
import '../../../bottomnavbar/calender/send_notifi_message_or_phone/new_appoinment/service/add_another_service/add_service.dart';


// ignore: camel_case_types
class newAppointment extends StatefulWidget {

   const newAppointment({Key? key}) : super(key: key);

  @override
  State<newAppointment> createState() => _newAppointmentState();
}

// ignore: camel_case_types
class _newAppointmentState extends State<newAppointment> {
  TextEditingController notes=TextEditingController();
  bool notesstatus = false;
  bool Onoff = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

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
                padding:
                const EdgeInsets.only(left: 20,  bottom: 20),
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
                          width: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Create Appointment",
                                style: TextStyle(
                                    fontSize: 16, overflow: TextOverflow.ellipsis,
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
      body: SingleChildScrollView(
        child: Container(
          height: height*0.8,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.03,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Client",
                      style: TextStyle(
                          fontSize: 14, overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return appoiment_clientList();
                      },));
                    },
                    child: Container(
                      width: 40,
                       height: 40,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         border: Border.all(width: 1,color: const Color(0xff01635D))
                       ),

                       child: const Icon(Icons.add,color: Color(0xff01635D)),
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.02,),
              const Divider(thickness: 1,color: Color(0xffCFCFCF),),
              SizedBox(height: height*0.02,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Service",
                      style: TextStyle(
                          fontSize: 14, overflow: TextOverflow.ellipsis,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const add_Srevice();
                      },));
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1,color: const Color(0xff01635D))
                      ),

                      child: const Icon(Icons.add,color: Color(0xff01635D)),
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.02,),
              const Divider(thickness: 1,color: Color(0xffCFCFCF),),
              SizedBox(height: height*0.02,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text("Request deposit",
                                style: TextStyle(
                                    fontSize: 14, overflow: TextOverflow.ellipsis,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),

                          ],
                        ),
                        SizedBox(height: height*0.01,),
                        Row(
                          children: const [
                            Text("Request a percentage of your\nservice charge from clients.",
                                style: TextStyle(
                                    fontSize: 12, overflow: TextOverflow.ellipsis,
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
              SizedBox(height: height*0.02,),
              const Divider(thickness: 1,color: Color(0xffCFCFCF),),
              SizedBox(height: height*0.02,),

              Row(children: const [
                Text("Notes ",
                    style: TextStyle(
                        fontSize: 12, overflow: TextOverflow.ellipsis,
                        color: Color(0xff292929),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold)),
                Text("(Optional)",
                    style: TextStyle(
                        fontSize: 14, overflow: TextOverflow.ellipsis,
                        color: Color(0xff292929),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.normal)),
              ],),
              SizedBox(height: height*0.01,),
              TextField(
                controller: notes,
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    notesstatus=false;
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
              const Spacer(),
              CommonButton(context,
                "SAVE",12,FontWeight.w600,Colors.white,(){}
              ),
              SizedBox(height: height*0.03,),
            ],
          ),
        ),
      ),
    );
  }
}
