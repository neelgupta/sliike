import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clients_detail/clientsdetails.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_Flow_start/addproduct/addproduct_photos/addproduct_photos.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';

import '../../custom_widget/textcommon/textcommon.dart';
import 'addclient_screen/add_clients.dart';

class clientsmain extends StatefulWidget {
  clientsmain({Key? key}) : super(key: key);

  @override
  State<clientsmain> createState() => _clientsmainState();
}

class _clientsmainState extends State<clientsmain> {
  TextEditingController search = TextEditingController();
  TextEditingController reply = TextEditingController();
  List<Contact> contacts = [];
  bool ClientListTab = true;
  bool ReviewsTab = false;
  bool NotificationsTab = false;
  String type = "1";
  int clientlist=0;
  //bool clientlistpending=false;

 List temp=["pendindg","pendindg","Accepted","Accepted","pendindg","pendindg","Accepted","Accepted"];
//List temp=[];
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Clients List",
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
      body: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            alignment: Alignment.center,

            width: width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        ClientListTab = true;
                        ReviewsTab = false;
                        NotificationsTab = false;
                        type = "1";
                        print(type);
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: ClientListTab ? Color(0xff01635D) : Colors.white,
                          border: Border.all(
                              color: ClientListTab
                                  ? Color(0xff01635D)
                                  : Colors.black38)),
                      child: Text(
                        "Client List",
                        style: TextStyle(
                            color:
                                ClientListTab ? Colors.white : Color(0xff01635D),
                            fontFamily: 'spartan',
                            fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        ClientListTab = false;
                        ReviewsTab = true;
                        NotificationsTab = false;
                        type = "2";
                        print(type);
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: ReviewsTab ? Color(0xff01635D) : Colors.white,
                          border: Border.all(
                              color: ReviewsTab
                                  ? Color(0xff01635D)
                                  : Colors.black38)),
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                            color: ReviewsTab ? Colors.white : Color(0xff01635D),
                            fontFamily: 'spartan',
                            fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        ClientListTab = false;
                        ReviewsTab = false;
                        NotificationsTab = true;
                        type = "3";
                        print(type);
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color:
                              NotificationsTab ? Color(0xff01635D) : Colors.white,
                          border: Border.all(
                              color: NotificationsTab
                                  ? Color(0xff01635D)
                                  : Colors.black38)),
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                            color: NotificationsTab
                                ? Colors.white
                                : Color(0xff01635D),
                            fontFamily: 'spartan',
                            fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 1,
              color: Color(0xffCFCFCF),
            ),
          ),

          ///ClientList
          ClientListTab ==true
              ?Container(
                child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 20),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: textComoon("Client List", 14, Color(0xff111111),
                              FontWeight.w700),
                        ),
                      ),
                      temp.length!=0?Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: TextField(
                                      controller: search,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 20),
                                        hintText: "Search service",
                                        hintStyle:
                                        TextStyle(color: Color(0xff707070)),
                                        suffixIcon: Container(
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            color: Color(0xff01635D),
                                          ),
                                          height: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.asset(
                                                "assets/images/search-whitenormal.png"),
                                          ),
                                        ),
                                        labelStyle: TextStyle(
                                            fontFamily: 'spartan',
                                            color: Colors.black54),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide:
                                          BorderSide(color: Colors.black38),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide:
                                          BorderSide(color: Colors.black38),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xffA0A0A0), width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Column(
                                      children: [
                                        Icon(Icons.unfold_more_sharp),
                                        // Icon(Icons.keyboard_arrow_down_sharp),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: height * 0.5,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: temp.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                    child: InkWell(
                                      onTap: () {
                                        ///pendid select to temproly condition
                                        temp[index]=="pending"?showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              alignment: Alignment.bottomCenter,
                                              insetPadding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 30),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10))),
                                              title: StatefulBuilder(
                                                builder: (context, setState) {
                                                  return Column(
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: height * 0.02,
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              alignment:
                                                              Alignment.center,
                                                              height: 30,
                                                              child: Image.asset(
                                                                  "assets/images/message.png"),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            textComoon(
                                                                "Send text message",
                                                                14,
                                                                Color(0xff111111),
                                                                FontWeight.w500),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                            top: 10, bottom: 10),
                                                        child: Divider(
                                                          thickness: 1,
                                                          color: Color(0xffCFCFCF),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(left: 15),
                                                              child: Container(
                                                                alignment:
                                                                Alignment.center,
                                                                height: 30,
                                                                child: Image.asset(
                                                                    "assets/images/email.png"),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 20,
                                                            ),
                                                            textComoon(
                                                                "Send email message",
                                                                14,
                                                                Color(0xff111111),
                                                                FontWeight.w500),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.05,
                                                      ),
                                                      commonButtonbordergrey(
                                                          context,
                                                          "CLOSE",
                                                          12,
                                                          FontWeight.w600,
                                                          Color(0xff707070), () {
                                                        Navigator.pop(context);
                                                      }),
                                                      SizedBox(
                                                        height: height * 0.01,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ):
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return clientsDetails();
                                        },));


                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 35,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffCFCFCF),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                      "assets/images/profile.png",
                                                      fit: BoxFit.fill),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  width: width * 0.5,
                                                  child: Text(
                                                    "Phillip Hills",
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff414141),
                                                      fontFamily: "spartan",
                                                    ),
                                                  ),
                                                ),

                                                Spacer(),

                                                ///pending Button ?
                                                temp[index]=="pending"||temp[index]=="Accepted"?
                                                Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(4),
                                                    color: Color(0xffFFD059),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 5,
                                                        bottom: 5),
                                                    child: Text(
                                                      "pending",
                                                      style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 12,
                                                          color: Color(0xff111111)),
                                                    ),
                                                  ),
                                                ):
                                                ///Accepted buttom ?
                                                Container(

                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadiusDirectional.circular(4),
                                                    color: Color(0xff219653),
                                                  ),

                                                  child: Padding(

                                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),

                                                    child: Text("Accepted",style: TextStyle(fontSize: 10,fontFamily: 'Cairo',color: Color(0xffFFFFFF)),),

                                                  ),

                                                ),






                                              ],
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: (Color(0xffCFCFCF)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ):Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: Column(

                          children: [
                            SizedBox(height: height*0.1,),
                            Container(height: 100, child:Image.asset("assets/images/addproduct.png",fit: BoxFit.fill,)),
                            SizedBox(height: height*0.02,),
                            textComooncenter("You currently have no client\nlisted here", 14, Color(0xff292929),FontWeight.w700),
                            SizedBox(height: height*0.02,),
                            Container(alignment: Alignment.center,
                                child: textComooncenter("When clients are added to your client list, they will appear here.", 12, Color(0xff414141), FontWeight.w500)),
                            SizedBox(height: height*0.02,),
                            InkWell(
                              onTap: (){

                                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                //   return ();
                                // },));

                              },
                              child: Container(
                                height: 50,
                                width: width*0.5,
                                decoration: BoxDecoration(
                                  color: Color(0xff01635D),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(child: textComooncenter("Add product", 12, Colors.white, FontWeight.w600)),
                              ),
                            )
                          ],
                        ),
                      )

                    ],
                  ),
              )
              : Column(),

          ///Reviews
          ReviewsTab == true
              ? Padding(
                  padding:  EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 10, bottom: 20),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: textComoon("Reviews", 14, Color(0xff111111),
                              FontWeight.w700),
                        ),
                      ),
                      Container(
                        height: height * 0.6,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xffCFCFCF),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                  "assets/images/profile.png",
                                                  fit: BoxFit.fill),
                                            ),
                                            SizedBox(
                                              width: width * 0.025,
                                            ),
                                            Container(
                                              //width: width * 0.4,
                                              child: Text(
                                                "Gina Ray",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff292929),
                                                  fontFamily: "spartan",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Spacer(),
                                      Row(
                                        children: [
                                          textComoon(
                                              "30 Mar 2022",
                                              12,
                                              Color(0xff707070),
                                              FontWeight.w500),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: textComoon("4.5", 10,
                                            Color(0xff707070), FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      Icon(Icons.thumb_up_off_alt,
                                          color: Color(0xff707070)),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: textComoon("200 like", 10,
                                            Color(0xff707070), FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Pellentesque tristique elit in\nnibh ultricies rhoncus. ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'spartan',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff707070),
                                          ),
                                          children: [
                                            TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {},
                                              text: 'Read more',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'spartan',
                                                color: Color(0xff2F80ED),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  Container(
                                    child: TextField(
                                      controller: reply,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 20),
                                        // hintText: "Enter your email",

                                        labelStyle: TextStyle(
                                            fontFamily: 'spartan',
                                            color: Colors.black54),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.black38),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.black38),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Color(0xff01635D)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              top: 10,
                                              bottom: 10),
                                          child: textComoon(
                                              "Reply",
                                              12,
                                              Color(0xffFFFFFF),
                                              FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
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
                      )
                    ],
                  ),
                )
              : Column(),

          ///notification
          NotificationsTab == true
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: textComoon("Notifications", 14,
                              Color(0xff111111), FontWeight.w700),
                        ),
                      ),
                      Container(
                        height: height * 0.6,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textComoon("New client added", 14,
                                      Color(0xff292929), FontWeight.w600),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Text(
                                      "Rita Dunkins was successfully add to your clint list.",
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff414141),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "spartan",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  textComoon("30 Mar 2022", 12,
                                      Color(0xffA0A0A0), FontWeight.w500),
                                  SizedBox(
                                    height: height * 0.01,
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
                      )
                    ],
                  ),
                )
              : Column(
                  children: [],
                )
        ],
      ),
      floatingActionButton: ClientListTab
          ? FloatingActionButton(
              backgroundColor: Color(0xff01635D),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return add_Clients();
                },));
              },
              child: Icon(
                Icons.add,
              ),
            )
          : SizedBox(),
    );
  }
}
