import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/add_service.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/profile_images.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class service_Setup_Main extends StatefulWidget {
  const service_Setup_Main({Key? key}) : super(key: key);

  @override
  State<service_Setup_Main> createState() => _service_Setup_MainState();
}

class _service_Setup_MainState extends State<service_Setup_Main> {

  List categorytitle=['Men’s Cut','Women’s Cut','Beard Trim'];
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
                                      AssetImage("assets/images/Group 55.png"),
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

                                child: Text("Service Set-Up",
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
              SizedBox(height: height*0.03,),

              InkWell(
                onTap: () {

                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.03),
                  width: width,
                  height: height*0.065,
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset("assets/images/search.png",height: height*0.03),
                      ),
                      SizedBox(width: width*0.03),
                      Text("Search for services...",style: TextStyle(fontSize: 14,fontFamily: "spartan"),)
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black45)
                  ),
                ),
              ),
              SizedBox(height: height*0.04,),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categorytitle.length,
                  itemBuilder: (context, index) {
                    return Container(

                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return profile_Images();
                          },));
                        },
                        child: Column(
                          children: [
                            SizedBox(height: height*0.01,),
                            Row(
                              children: [
                                Container(

                                  child: Image.asset("assets/images/delete.png",height: 30,
                                      fit: BoxFit.fill),
                                ),

                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${categorytitle[index]}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff414141),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      "\$30 for 45 min",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff707070),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    //   return ();
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
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Divider(
                              thickness: 1,
                              color: (Color(0xffCFCFCF)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },

                ),
              ),
            ],
          ),
        ),
        floatingActionButton: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return addService();
            },));
          },
          child: Container(
            width: width*0.45,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff01635D),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  textComoon("ADD SERVICE",12, Colors.white, FontWeight.w600),

                  Icon(Icons.add,size: 40,color: Colors.white,),

                ],
              ),
            ),
          ),
        )
    );
  }
}
