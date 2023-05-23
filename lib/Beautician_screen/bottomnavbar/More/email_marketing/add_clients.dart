import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class add_Clients extends StatefulWidget {
  const add_Clients({Key? key}) : super(key: key);

  @override
  State<add_Clients> createState() => _add_ClientsState();
}

class _add_ClientsState extends State<add_Clients> {

  TextEditingController title=TextEditingController();
  TextEditingController Content=TextEditingController();
  bool titlestatus=false;
  bool Contentstatus=false;
  String status = "";
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
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
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
                      SizedBox(
                        width: width * 0.15,
                      ),
                      Container(
                        child: Text("Email Marketing",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(height: height*0.03,),
                textComoonfade("Need to send marketing emails? Provide us with the content and Sliike sends out for you.", 12, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.05,),
                Container(
                  child: TextField(
                    //   enabled: false,
                    controller: title,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'spartan',
                        color: Color(0xff292929)),
                    onChanged: (value) {
                      setState(() {
                        titlestatus = false;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      // hintText: "Promotion Title",
                      labelText: "Title",
                      labelStyle: TextStyle(
                          fontSize: 13,
                          fontFamily: 'spartan',
                          color: Color(0xff111111)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                        BorderSide(color: Color(0xff707070)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                        BorderSide(color: Color(0xffCFCFCF)),
                      ),
                    ),
                  ),
                ),
                titlestatus
                    ? Container(
                  height: 30,
                  child: Text(
                    "$status",
                    style: TextStyle(
                        fontFamily: 'spartan',
                        fontSize: 12,
                        color: Colors.red),
                  ),
                )
                    : Container(
                  height: 35,
                ),
                Container(
                  child: TextField(
                    controller: Content,

                    maxLines: 4,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(
                          0xff414141,
                        )),
                    onChanged: (value) {
                      Contentstatus = false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20, top: 5, bottom: 10),
                      //hintText: "Description",
                      labelText: "Content",

                      labelStyle: TextStyle(
                          fontFamily: 'spartan',
                          color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                        BorderSide(color: Color(0xff707070)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                        BorderSide(color: Color(0xff707070)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                InkWell(onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return clients();
                  // },));
                },
                  child: Row(
                    children: [
                      Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2,color: Color(0xff2F80ED))
                          ),
                          child: Center(child: Icon(Icons.add,color: Color(0xff2F80ED),size: 20,))),
                      SizedBox(
                        width: 10,
                      ),
                      textComoon("ADD CLIENT (5 Clients Selected)", 12, Color(0xff2F80ED),
                          FontWeight.w600),

                    ],
                  ),
                ),
                Spacer(),
                CommonButton(context,"SEND",12, FontWeight.w600, Colors.white, () { })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
