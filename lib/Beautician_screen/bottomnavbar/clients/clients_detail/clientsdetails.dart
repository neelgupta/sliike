import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clients_detail/Apoinments/apoinment.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clients_detail/payment/payments.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clients_detail/photos/photos.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clients_detail/product/product.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clients_detail/reviews/reviews.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/notes.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class clientsDetails extends StatefulWidget {
  const clientsDetails({Key? key}) : super(key: key);

  @override
  State<clientsDetails> createState() => _clientsDetailsState();
}

class _clientsDetailsState extends State<clientsDetails> {
  bool showStats = false;

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
          color: Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
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
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/backwhite.png"),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 5,
                        ),
                        Container(
                          child: Text("Client Details",
                              style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
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
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Color(0xffD7E0DD),
                radius: 50,
                child: Container(
                  child: Image.asset("assets/images/tempj.png"),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            textComoon("Joe Combell", 14, Color(0xff292929), FontWeight.w600),
            SizedBox(
              height: height * 0.01,
            ),
            textComoon(
                "+1 514 888 7722", 12, Color(0xff707070), FontWeight.w600),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: Color(0xffAFC0BB))),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child: Image.asset(
                                "assets/images/contact_message.png")),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                        child: textComoon(
                            "Message", 12, Color(0xff01635D), FontWeight.w500)),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: Color(0xffAFC0BB))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child: Image.asset(
                          "assets/images/contact_call.png",
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                        child: textComoon(
                            "Call", 12, Color(0xff01635D), FontWeight.w500)),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) {
                          return notes();
                        },));
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 1, color: Color(0xffAFC0BB))),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Image.asset(
                            "assets/images/edit-2.png",
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                        child: textComoon(
                            "Note", 12, Color(0xff01635D), FontWeight.w500)),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                          showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            alignment: Alignment.bottomCenter,
                            insetPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            title: StatefulBuilder(
                              builder: (context, setState) {
                                return Column(
                                  children: <Widget>[

                                    Container(
                                      alignment: Alignment.center,
                                      height: 40,


                                      child: Image.asset("assets/images/con_delete.png"),
                                    ),
                                    SizedBox(height: height*0.02,),
                                    Container(alignment: Alignment.center,
                                      child: textComoon("Delete Client", 14, Color(0xff111111),
                                          FontWeight.w700),
                                    ),
                                    SizedBox(height: height*0.02,),
                                    Container(alignment: Alignment.center,
                                      child:Text(textAlign: TextAlign.center,"Are you sure you want to delete this\nclient?",   overflow: TextOverflow.fade,style: TextStyle(
                                        color: Color(0xff414141),fontSize: 12,fontWeight: FontWeight.w500,
                                        fontFamily: "spartan",
                                      ),)

                                    ),

                                    SizedBox(height: height*0.03,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Color(0xff414141),width: 1)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                                                child: Center(
                                                  child: textComoon("CANCEL", 10, Color(0xff828282),
                                                      FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){
                                              Navigator.pop(context);
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              //   return ();
                                              // },));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Color(0xffFF2A1C),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                                                child: Center(
                                                  child: textComoon("YES, DELETE", 10, Color(0xffFFFFFF),
                                                      FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        },);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 1, color: Color(0xffAFC0BB))),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Image.asset("assets/images/con_delete.png")),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                        child: textComoon(
                            "Delete", 12, Color(0xff01635D), FontWeight.w500)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            !showStats?InkWell(
              onTap: () {
                setState(() {
                  showStats = !showStats;
                });
              },
              child: Container(
                color: Color(0xffFAFAFA),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textComoon(
                          "Show Stats", 12, Color(0xff2F80ED), FontWeight.w600),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 15,
                        width: 15,
                        child: Image.asset("assets/images/bottomblue.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ):SizedBox(),
            showStats
                ? Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      textComoon("Last Purchase", 10,
                                          Color(0xff707070), FontWeight.w500),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      textComoon("Mar 15, 2022", 12,
                                          Color(0xff292929), FontWeight.w500),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      textComoon("Products", 10,
                                          Color(0xff707070), FontWeight.w500),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      textComoon("2", 12, Color(0xff292929),
                                          FontWeight.w500),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      textComoon("Cancellations", 10,
                                          Color(0xff707070), FontWeight.w500),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      textComoon("0", 12, Color(0xff292929),
                                          FontWeight.w500),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      textComoon("All time purchase", 10,
                                          Color(0xff707070), FontWeight.w500),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      textComoon("25 products", 12,
                                          Color(0xff292929), FontWeight.w500),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * 0.2,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      textComoon("Total Tevenue", 10,
                                          Color(0xff707070), FontWeight.w500),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      textComoon("\$500.08", 12,
                                          Color(0xff292929), FontWeight.w500),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xffCFCFCF),
                          ),
                          showStats?InkWell(
                            onTap: () {
                              setState(() {
                                showStats = false;
                              });
                            },
                            child: Container(
                              color: Color(0xffFAFAFA),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, bottom: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    textComoon(
                                        "Hide Stats", 12, Color(0xff2F80ED), FontWeight.w600),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 15,
                                      width: 15,
                                      child: Image.asset("assets/images/a1.png"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ):
                              SizedBox()
                        ],
                      ),
                    ),
                  )
                : Container(),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       showStats = !showStats;
            //     });
            //   },
            //   child: Container(
            //     //  color: Colors.amber,
            //     // color: Color(0xffFAFAFA),
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 15, bottom: 15),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           textComoon(
            //               "Hide Stats", 12, Color(0xff2F80ED), FontWeight.w600),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Container(
            //             height: 15,
            //             width: 15,
            //             child: Image.asset("assets/images/topblue.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            DefaultTabController(
                length: 5, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Color(0xff01635D),
                          unselectedLabelColor: Color(0xff414141),
                          tabs: [
                            Tab(text: 'Apointments'),
                            Tab(text: 'Photos'),
                            Tab(text: 'Payments'),
                            Tab(text: 'Products'),
                            Tab(text: 'Reviews'),
                          ],
                        ),
                      ),
                      Container(
                          height: height*0.8, //height of TabBarView
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            apoinment(),
                            photos(),
                            payments(),
                            product(),
                            reviews(),
                          ]))
                    ])),
          ],
        ),
      ),
    );
  }
}
