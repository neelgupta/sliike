import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/notification/my_clients_receive.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/notification/my_notification.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class main_Notification extends StatefulWidget {
  const main_Notification({Key? key}) : super(key: key);

  @override
  State<main_Notification> createState() => _main_NotificationState();
}

class _main_NotificationState extends State<main_Notification> {
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
                      SizedBox(width: width*0.15,),
                      Container(
                        child: Text("Notification",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: height*0.02,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 17,),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return my_Notification();
                  },));
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    textComoon("My Notifications",14,Color(0xff414141), FontWeight.w500),

                    Container(
                      height: 15,
                      width: 30,
                      child: Image.asset("assets/images/righticon.png"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 17,),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return my_Clients_Recive();
                  },));
                },
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    textComoon("Notifications My Clients Receive",14,Color(0xff414141), FontWeight.w500),

                    Container(
                      height: 15,
                      width: 30,
                      child: Image.asset("assets/images/righticon.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
