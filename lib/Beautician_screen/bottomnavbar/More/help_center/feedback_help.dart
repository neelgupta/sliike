import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class feedback_beauty extends StatefulWidget {
  const feedback_beauty({Key? key}) : super(key: key);

  @override
  State<feedback_beauty> createState() => _feedback_beautyState();
}

class _feedback_beautyState extends State<feedback_beauty> {
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
                    SizedBox(width: width*0.22,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Feedback",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff292929),
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
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
              Text("Leave your feedback_beauty here, we will see to it immediately",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                      color: Colors.black)),
              SizedBox(height: height*0.04,),
              TextField(
                style: TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                    labelText: "Subject",labelStyle:  TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: height*0.04,),
              TextField(
                maxLines: 4,
                style: TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                    labelText: "Description",labelStyle:  TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: height*0.04,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                height: height*0.10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12
                ),
                child: Text("Thank for your feedback. A customer care personnel will reach out if shortly",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "spartan",
                        color: Color(0xFF1571ED))),
              ),
              SizedBox(height: height*0.25,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    feedbackdialog();
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff01635D)),
                    child: Text("SUBMIT",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "spartan",
                            color: Colors.white))
                ),
              ),
              SizedBox(height: height*0.03,),
            ],
          ),
        ),
      ),
    );
  }
  feedbackdialog(){
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    showDialog(context: context, builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 15),

        child: Container(
          height: height*0.3,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                    child: Image.asset("assets/images/469342_1 1.png",fit: BoxFit.fill,)
                ),
                Text("Thank you for reaching out!",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.black,
                      fontWeight: FontWeight.w700
                    )
                ),
                SizedBox(height: height*0.02,),
                textComooncenter("A customer care personnel will reach out if required",13, Colors.black, FontWeight.w500)


              ],
            ),
          ),
        ),
      );
    },);
  }
}
