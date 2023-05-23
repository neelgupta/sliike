import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class via_Email extends StatefulWidget {
  const via_Email({Key? key}) : super(key: key);

  @override
  State<via_Email> createState() => _via_EmailState();
}

class _via_EmailState extends State<via_Email> {
  TextEditingController email = TextEditingController();


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
          color: Color(0xffF5F7F7),
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
                            padding: EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image:
                                    AssetImage("assets/images/cancel.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width*0.15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(

                              child: Text("Invite Via Email",
                                  style: TextStyle(
                                      fontSize: 16, overflow: TextOverflow.ellipsis,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(height: height*0.05,),
                Container(
                  child: TextField(
                    controller: email,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Email Address",
                      labelText: "Email Address",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.01,),
                Divider(thickness: 1,color: Color(0xffCFCFCF),),
                SizedBox(height: height*0.01,),
                Row(
                  children: [
                    Container(
                        width: 22,
                        height: 22,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1,color: Color(0xff1571ED))
                        ),
                        child: Center(child: Icon(Icons.add,color: Color(0xff1571ED),size: 20,))),
                    SizedBox(
                      width: 10,
                    ),
                    textComoon("ADD NEXT", 12, Color(0xff1571ED),
                        FontWeight.w500),

                  ],
                ),
                Spacer(),
                CommonButton(context,"SEND INVITE", 12, FontWeight.w600, Colors.white, () { })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
