import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:url_launcher/url_launcher.dart';

class contact_us_beauty extends StatefulWidget {
  const contact_us_beauty({Key? key}) : super(key: key);

  @override
  State<contact_us_beauty> createState() => _contact_us_beautyState();
}

class _contact_us_beautyState extends State<contact_us_beauty> {
  void _launchDailer(String mobileNumber) async {
    Uri phoneno = Uri.parse('tel:${mobileNumber}');
    if (await launchUrl(phoneno)) {
      launchUrl(phoneno);
    } else {
      print("111");
    }
    //dialer opened
  }

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
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
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
                                image: AssetImage("assets/images/Group 55.png"),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Contact Us",
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
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.20,
                width: width,
                child: Image.asset(
                  "assets/images/Frame _contact.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text("(514) 709-8276",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "spartan",
                      color: Color(0xFF01635D),
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * 0.04,
              ),
              Text("We are available Monday to Friday",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "spartan",
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: height * 0.02,
              ),
              Text("From 8am to 5pm",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "spartan",
                    color: Colors.black,
                  )),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _launchDailer("+15147098276");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.07,
                      width: width * 0.45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF01635D)),
                          color: Color(0xFF01635D),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/call.png"),
                            height: height * 0.03,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text("Call Us",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "spartan",
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.06,
              ),
              GestureDetector(
                onTap: () {
                  contactdialog();
                },
                child: Container(
                  height: height * 0.08,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/call.png"),
                        height: height * 0.03,
                        color: Color(0xFF01635D),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      textComoon("Get a call from Sliike customer care", 12,
                          Color(0xFF01635D), FontWeight.w600)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  contactdialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: height * 0.3,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 90,
                      child: Image.asset(
                        "assets/images/469342_1 1.png",
                        fit: BoxFit.fill,
                      )),
                  Text("Thank you for reaching out!",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.black,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textComooncenter(
                      "A customer care personel will call you soon",
                      13,
                      Colors.black,
                      FontWeight.w500)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
