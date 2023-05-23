// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(image: AssetImage("assets/images/Rectangle 28.png"),fit: BoxFit.fill)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: height*0.06,
                        child:Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                      ),
                    ),
                    SizedBox(width: width*0.22,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Feedback",
                            style: TextStyle(
                                fontSize: 23,
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
              const Text("Leave your feedback here, we will see to it immediately",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                      color: Colors.black)),
              SizedBox(height: height*0.04,),
              const TextField(
                style: TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Subject"
                ),
              ),
              SizedBox(height: height*0.04,),
              const TextField(
                maxLines: 4,
                style: TextStyle(fontFamily: "spartan",fontSize: 12),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Description",
                ),
              ),
              SizedBox(height: height*0.04,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                height: height*0.10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12
                ),
                child: const Text("Thank for your feedback. A customer care personnel will reach out shortly",
                    style: TextStyle(
                        fontSize: 14,
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
                        color: const Color(0xffDD6A03)),
                    child: const Text("SUBMIT",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "spartan",
                            color: Colors.white))
                ),
              ),
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
        child: Container(
          height: height*0.35,
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
                SizedBox(
                  height: height*0.15,
                    child: Image.asset("assets/images/469342_1 1.png",fit: BoxFit.fill,)
                ),
                const Text("Thank you for reaching out!",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "spartan",
                        color: Colors.black,
                      fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: height*0.02,),
                const Text("A customer care personnel will get",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.black,
                    )
                ),
                const Text("back to you as soon as possible.",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                      color: Colors.black,
                    )
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}
