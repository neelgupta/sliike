import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class faq_beauty extends StatefulWidget {
  const faq_beauty({Key? key}) : super(key: key);

  @override
  State<faq_beauty> createState() => _faq_beautyState();
}

class _faq_beautyState extends State<faq_beauty> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
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
                    SizedBox(width: width*0.30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("FAQ",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.bold)),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: height*0.04,),
              TextField(
                style: TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Describe your issue"
                ),
              ),
              SizedBox(height: height*0.02,),
              Container(
                height: height*0.80,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textComoon("How can I upload my busness on Sliike?", 12,Colors.black, FontWeight.w500),

                        //  Spacer(),
                          Icon(Icons.keyboard_arrow_down_rounded,size: 30,)
                        ],),
                      Divider(color: Colors.black54,)
                    ],
                  );
                },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
