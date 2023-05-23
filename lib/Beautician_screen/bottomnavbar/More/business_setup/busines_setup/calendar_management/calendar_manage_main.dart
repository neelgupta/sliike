import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/calendar_management/busines_hours.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/calendar_management/calendar_adjustment.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class calendar_Mang_Main extends StatefulWidget {
  const calendar_Mang_Main({Key? key}) : super(key: key);

  @override
  State<calendar_Mang_Main> createState() => _calendar_Mang_MainState();
}

class _calendar_Mang_MainState extends State<calendar_Mang_Main> {
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
                      SizedBox(width: width*0.09,),
                      Container(
                        child: Text("Calendar Management",
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
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return calendar_Adjustment();
                  },));

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textComoon("Calendar Management",14,Color(0xff292929), FontWeight.w700),
                            SizedBox(height: height*0.01,),
                            textComoonfade("Independently adjust work hours for any day or add time off for specific dates.",12,Color(0xff707070), FontWeight.w500),
                          ],
                        ),
                      ),

                      Container(alignment: Alignment.topRight,
                        height: 15,
                        width: 30,
                        child: Image.asset("assets/images/righticon.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return busines_Hours();
                  },));

                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textComoon("Business Hours",14,Color(0xff292929), FontWeight.w700),
                            SizedBox(height: height*0.01,),
                            textComoonfade("Set your standard business hours here. If you need to adjust specific dates, use calendar above.",12,Color(0xff707070), FontWeight.w500),
                          ],
                        ),
                      ),

                      Container(alignment: Alignment.topRight,
                        height: 15,
                        width: 30,
                        child: Image.asset("assets/images/righticon.png"),
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
