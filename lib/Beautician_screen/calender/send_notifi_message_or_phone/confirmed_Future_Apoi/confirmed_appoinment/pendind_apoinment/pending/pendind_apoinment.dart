import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

import '../../../../../../bottomnavbar/calender/send_notifi_message_or_phone/calender_screen/calender.dart';
import '../../../../../../bottomnavbar/calender/send_notifi_message_or_phone/confirmed_Future_Apoi/confirmed_appoinment/future_appointment/edit_apoinment/edit_add_service.dart';

// ignore: camel_case_types
class pendind_apoinment extends StatefulWidget {
  const pendind_apoinment({Key? key}) : super(key: key);

  @override
  State<pendind_apoinment> createState() => _pendind_apoinmentState();
}

// ignore: camel_case_types
class _pendind_apoinmentState extends State<pendind_apoinment> {
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
          color: const Color(0xffF2C94C),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        height: height * 0.06,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(
                                image:
                                AssetImage("assets/images/blackcancel.png"),

                              )),
                        ),
                      ),
                    ),
                    //  SizedBox(width: width/5,),
                    const Text("PENDING!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w700)),

                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: InkWell(
                        onTap: (){
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              alignment: Alignment.bottomCenter,
                              insetPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              title: StatefulBuilder(
                                builder: (context, setState) {
                                  return Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return const edit_add_service();
                                          },));
                                        },
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 30,

                                              child: Image.asset("assets/images/edit.png"),
                                            ),
                                            const SizedBox(width: 20,),
                                            textComoon("Edit appointment", 14, const Color(0xff111111),
                                                FontWeight.w500),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: height*0.04,),
                                      InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                          cancelhowDialog();
                                        },
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 30,

                                              child: Image.asset("assets/images/cancel_circle.png"),
                                            ),
                                            const SizedBox(width: 20,),
                                            textComoon("Cancel appointment", 14, const Color(0xff111111),
                                                FontWeight.w500),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.05,
                                      ),
                                      commonButtonborder(context,"CLOSE",12,FontWeight.w600,const Color(0xff01635D),(){
                                        Navigator.pop(context);
                                      }),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),

                                    ],
                                  );
                                },
                              ),
                            );
                          },);
                        },
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: const Icon(Icons.more_vert,
                              size: 30, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: SizedBox(
          height: height*0.8,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffF3F3F3)),
                  child: IntrinsicHeight(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff707070),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Wed, Mar 16",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: VerticalDivider(
                            color: Color(0xffCFCFCF),
                            thickness: 1,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff707070),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "9:00 AM",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Color(0xffCFCFCF),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/images/profile.png",
                              fit: BoxFit.fill),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Joe Cambell",
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
                            const Text(
                              "+1 514 888 7722",
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
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Divider(
                      thickness: 1,
                      color: (Color(0xffCFCFCF)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Service",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff707070),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(alignment: Alignment.topRight,
                          child: const Text(
                            "Men’s Cut",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff111111),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Container(alignment: Alignment.topRight,
                          child: const Text(
                            "30 minutes",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff707070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Container(alignment: Alignment.topRight,
                          child: const Text(
                            "\$20:00",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff707070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1,
                  color: (Color(0xffCFCFCF)),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  color: const Color(0xffF3F3F3),
                  height: height * 0.06,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: textComoon(
                        "Payments", 14, const Color(0xff292929), FontWeight.w600),
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Color(0xffCFCFCF),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding:  const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/card.png",
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textComoon("Credit Card", 14, const Color(0xff292929),
                                FontWeight.w700),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                  child: textComoon("Not Paid", 10,
                                      const Color(0xffF2C94C), FontWeight.w600)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(children: [
                          Container(
                              child: textComoon("\$26.00", 12,
                                  const Color(0xff01635D), FontWeight.w700)),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            height: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          )
                        ]),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Divider(
                  thickness: 1,
                  color: (Color(0xffCFCFCF)),
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textComoon("Total", 10, const Color(0xff707070),
                        FontWeight.w500),
                    textComoon("\$26:00", 12, const Color(0xff292929),
                        FontWeight.w700),
                  ],
                ),
              ),
              SizedBox(height: height*0.01,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: CommonButton(context,"SEND REMINDER", 12, FontWeight.w600, Colors.white, () { }),
              ),],
          ),
        ),
      ),
    );
  }

  cancelhowDialog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    // double width = MediaQuery.of(context).size.width -
    //     MediaQuery.of(context).padding.right -
    //     MediaQuery.of(context).padding.left;
    return  showDialog(context: context, builder: (context) {
      return AlertDialog(
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.symmetric(horizontal: 30),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        title: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              children: <Widget>[

                Container(
                  alignment: Alignment.center,
                  height: 40,


                  child: Image.asset("assets/images/redclose.png"),
                ),
                SizedBox(height: height*0.02,),
                Container(alignment: Alignment.center,
                  child: textComoon("Cancel Appointment?", 14, const Color(0xff111111),
                      FontWeight.w700),
                ),
                SizedBox(height: height*0.02,),
                Container(alignment: Alignment.center,
                  child: textComoon("Cancelling this appointment would\nremove it from your appointment list", 12, const Color(0xff414141),
                      FontWeight.w500),
                ),
                SizedBox(height: height*0.03,),
                Container(alignment: Alignment.center,
                  child: textComoon("Do you want to continue?", 12, const Color(0xff111111),
                      FontWeight.w500),
                ),
                SizedBox(height: height*0.02,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: const Color(0xff414141),width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                            child: Center(
                              child: textComoon("NO,CANCEL", 10, const Color(0xff828282),
                                  FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const calender();
                          },));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffFF2A1C),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                            child: Center(
                              child: textComoon("YES, CANCEL", 10, const Color(0xffFFFFFF),
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
  }
}
