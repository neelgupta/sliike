import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/employees/add_emplayee/add_manually/add_manually.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/employees/add_emplayee/email_invite/via_email.dart';

class add_Emplayee extends StatefulWidget {
  const add_Emplayee({Key? key}) : super(key: key);

  @override
  State<add_Emplayee> createState() => _add_EmplayeeState();
}

class _add_EmplayeeState extends State<add_Emplayee> {
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

                              child: Text("Add Employee",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: height*0.06,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return add_Manually();
                },));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1,color: Color(0xffA0A0A0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 17,bottom: 17,left: 12,right: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffEBEFEE),
                            child: Image.asset("assets/images/profile-add.png",height: 25,
                                fit: BoxFit.fill),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "Add manually",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff292929),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return();
                              // },));
                            },
                            child: Container(
                              height: 15,
                              width: 30,
                              child: Image.asset("assets/images/righticon.png"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.03,),
            InkWell(

                onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return via_Email();
        },));
      },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1,color: Color(0xffA0A0A0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 17,bottom: 17,left: 12,right: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffEBEFEE),
                            child: Image.asset("assets/images/sms.png",height: 25,
                                fit: BoxFit.fill),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            "Invite via email",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff292929),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return();
                              // },));
                            },
                            child: Container(
                              height: 15,
                              width: 30,
                              child: Image.asset("assets/images/righticon.png"),
                            ),
                          ),



                        ],
                      ),



                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
