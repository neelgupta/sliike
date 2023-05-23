import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class my_Clients_Recive extends StatefulWidget {
  const my_Clients_Recive({Key? key}) : super(key: key);

  @override
  State<my_Clients_Recive> createState() => _my_Clients_ReciveState();
}

class _my_Clients_ReciveState extends State<my_Clients_Recive> {
  bool serviceS=false;
  bool productS=false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  Scaffold(
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
                      SizedBox(width: width*0.1,),
                      Container(
                        child: Text("Notifications My Clients\nReceive",
                            textAlign: TextAlign.start,
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
      body: Column(
        children: [
          Container(

            width: width,
            color: Color(0xffF3F3F3),
            child: Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20),
              child: textComoon("Promotions", 14,Color(0xff292929), FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 17,),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        textComoonfade("Service Promo",14,Color(0xff292929), FontWeight.w700),
                        SizedBox(height: height*0.01,),
                        textComoonfade("Send notification to your clients when you are running promo on a service.",12,Color(0xff414141), FontWeight.w500),
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    valueFontSize: 12.0,
                    toggleSize: 18.0,
                    activeColor: Color(0xff01635D),
                    value: serviceS,
                    onToggle: (value) {
                      setState(() {
                        serviceS = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 17,),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        textComoonfade("Product Promo",14,Color(0xff292929), FontWeight.w700),
                        SizedBox(height: height*0.01,),
                        textComoonfade("Send notification to your clients when you are running promo on a product.",12,Color(0xff414141), FontWeight.w500),
                      ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    valueFontSize: 12.0,
                    toggleSize: 18.0,
                    activeColor: Color(0xff01635D),
                    value: productS,
                    onToggle: (value) {
                      setState(() {
                        productS = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
