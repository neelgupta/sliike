import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/employees/add_emplayee/add_emplayee.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/employees/edit_employe.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class Employees extends StatefulWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {

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
                          width: width*0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(

                              child: Text("Employees",
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
                height: height*0.06,
                child: Row(
                  children: [
                    Container(
                      child: Image.asset("assets/images/search.png",height: height*0.03),
                    ),
                    SizedBox(width: width*0.03),
                    Text("Search for services or stylist",style: TextStyle(fontSize: 12,fontFamily: "spartan"),)
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
            InkWell(
              onTap: (){
                SliikeBasicDailog();
              },
                child: Text("add 3 emplyoee")),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(height: height*0.01,),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xffD7E0DD),
                              child: Image.asset("assets/images/T.png",height: 10,
                                  fit: BoxFit.fill),
                            ),

                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Joe Cambell",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff414141),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "(Me)",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff707070),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Profile Owner",
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return edit_Employe();
                                },));
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
            return add_Emplayee();
          },));
        },
        child: Container(
          width: width*0.29,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xff01635D),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,

              children: [
                textComoon("ADD",12, Colors.white, FontWeight.w600),
                SizedBox(width: 10,),
                Icon(Icons.add,size: 20,color: Colors.white,),

              ],
            ),
          ),
        ),
      )
    );
  }

  SliikeBasicDailog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (context) {
        return  Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
             height: height*0.8,
            width: width,
            child: Column(
              children: [
                Container(

                  width: width,
                  decoration: BoxDecoration(
                    color: Color(0xffFCF0E6),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.04,),
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Image(
                            image:
                            AssetImage("assets/images/slickedailog.png"),height: height*0.15,fit: BoxFit.fill
                            ,
                          )),
                      SizedBox(height: height*0.01,),
                      textComoon("Sliike Basic", 16, Color(0xff292929), FontWeight.w700),
                      SizedBox(height: height*0.02,),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),

                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: textComooncenter(
                        "You can only add 3 employees based on your current plan. Upgrade your plan to add more employees.",
                        12,
                        Color(0xff292929),
                        FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(thickness: 1,color: Color(0xffCFCFCF),),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: textComoon("Upgrade Your Sliike Plan", 14, Color(0xff292929),
                        FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff00C0E3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15,bottom: 15,right: 10),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.01,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sliike Pro",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffffffff),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Add up to 10 employees",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xffffffff),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return edit_Employe();
                                },));
                              },
                              child: Container(
                                height: 15,
                                width: 30,
                                child: Image.asset("assets/images/righticon.png",color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
                SizedBox(
                  height: height * 0.02,
                ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff004BFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15,bottom: 15,right: 10),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.01,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sliike Premium",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffffffff),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  "Add unlimited employees",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xffffffff),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 15,
                              width: 30,
                              child: Image.asset("assets/images/righticon.png",color: Colors.white),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
              ],
            ),
          ),
        );
      },
    );
  }
}
