import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/location/edit_location/edit_location.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  bool method = false;
  int selectedRadio=1;
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
                      SizedBox(width: width*0.25,),
                      Container(
                        child: Text("Location",
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.025,),
            textComoon("Location", 16,Colors.black, FontWeight.w700),
            SizedBox(height: height*0.02,),
            GestureDetector(onTap: (){

            },

              child: Container(
                height: height*0.25,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mapimg.png"),fit: BoxFit.fill,
                  )
                ),
              ),
            ),
            SizedBox(height: height*0.04,),
            Column(
              children: [
                Container(
                 // height: height*0.17,
                  width: width,
                  decoration: BoxDecoration(color: Color(0xffFAFAFA),

                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xffE7E7E7),width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10),
                    child: Row(
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  textComoon("Address:",12, Color(0xff000000), FontWeight.w600),
                                  SizedBox(width: 5,),
                                  textComoon("2543 Tolmie St",12, Color(0xff707070), FontWeight.w600),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  textComoon("City:",12, Color(0xff000000), FontWeight.w600),
                                  SizedBox(width: 5,),
                                  textComoon("Vancouver",12, Color(0xff707070), FontWeight.w600),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  textComoon("State/province/area:",12, Color(0xff000000), FontWeight.w600),
                                  SizedBox(width: 5,),
                                  Container(
                                      width:width*0.2,child: textComoon("British Col",12, Color(0xff707070), FontWeight.w600)),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  textComoon("Postal Code:",12, Color(0xff000000), FontWeight.w600),
                                  SizedBox(width: 5,),
                                  textComoon("V6R 4C5",12, Color(0xff707070), FontWeight.w600),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  textComoon("Country:",12, Color(0xff000000), FontWeight.w600),
                                  SizedBox(width: 5,),
                                  textComoon("Canada",12, Color(0xff707070), FontWeight.w600),
                                ],
                              ),
                            ],
                          ),
                        ),
                         Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return edit_Location();
                            },));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff01635D),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset("assets/images/righticon.png",color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ),

                ),
              ],
            ),
            SizedBox(height: height*0.01,),
            Divider(thickness: 1,color: Color(0xffCFCFCF),),
            SizedBox(height: height*0.02,),
            textComoon("What’s your profile?", 14, Colors.black, FontWeight.w700),
            SizedBox(height: height*0.015,),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(5),
                   border: Border.all(color: Color(0xffA0A0A0), width: 1)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  child: Row(
                    children: [
                      Radio(
                        value: 1, groupValue: selectedRadio,
                        activeColor: Color(0xff01635D),
                        onChanged: (value) {
                        selectedRadio=value as int;
                      },),
                      Text(
                        "I own a salon",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff292929),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w500),
                      ),

                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Color(0xff707070),
                      )
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
