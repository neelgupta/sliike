import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/Demographic/demographic.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/amenities/Amenities.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/business_name_info/business_name_info.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/business_photos/businessphoto/business_photo.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/employees/employees.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/health_safety/health_safety_rules.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/location/location/location.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class business_Detail extends StatefulWidget {
  const business_Detail({Key? key}) : super(key: key);

  @override
  State<business_Detail> createState() => _business_DetailState();
}

class _business_DetailState extends State<business_Detail> {
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
                        child: Text("Beautician Details",
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return business_Name_Info();
                      },));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        textComoon("Beautician Name & Info",14,Color(0xff414141), FontWeight.w500),

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
                        return business_Photo();
                      },));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        textComoon("Business Photos & Licence",14,Color(0xff414141), FontWeight.w500),

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
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return location();
                      },));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        textComoon("Location",14,Color(0xff414141), FontWeight.w500),

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
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Amenities();
                      },));

                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        textComoon("Amenities",14,Color(0xff414141), FontWeight.w500),

                        Container(
                          height: 15,
                          width: 30,
                          child: Image.asset("assets/images/righticon.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 17,),
                //   decoration: BoxDecoration(
                //       border: Border(bottom: BorderSide(color: Colors.black12))
                //   ),
                //   child: InkWell(
                //     onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context) {
                //       return Employees();
                //     },));
                //
                //     },
                //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //
                //         textComoon("Employees",14,Color(0xff414141), FontWeight.w500),
                //
                //         Container(
                //           height: 15,
                //           width: 30,
                //           child: Image.asset("assets/images/righticon.png"),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return health_Safety_Rule();
                      },));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        textComoon("Health & Safety Rules",14,Color(0xff414141), FontWeight.w500),

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
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return demograPhic();
                      },));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        textComoon("Demographic",14,Color(0xff414141), FontWeight.w500),

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
        ),
    );
  }
}
