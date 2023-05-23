import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class busines_Hours extends StatefulWidget {
  const busines_Hours({Key? key}) : super(key: key);

  @override
  State<busines_Hours> createState() => _busines_HoursState();
}

class _busines_HoursState extends State<busines_Hours> {
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
                                  AssetImage("assets/images/cancel.png"),

                                )),
                          ),
                        ),
                      ),
                      SizedBox(width: width*0.19,),
                      Container(
                        child: Text("Busines Hours",
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
      body: SingleChildScrollView(
        child: Container(
          height: height*0.85,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.02,),
                textComoon("Business Hours",14,Color(0xff292929), FontWeight.w700),
                SizedBox(height: height*0.01,),
                textComoonfade("Set your standard business hours here. If you need to adjust specific dates, use calendar above.",12,Color(0xff707070), FontWeight.w500),

                SizedBox(height: height*0.02,),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Text(
                              "Monday",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "spartan",
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Break: 9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "spartan",
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dividerCommon(),
                SizedBox(height: height*0.01,),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Text(
                              "Tuesday",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "spartan",
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Break: 9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "spartan",
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dividerCommon(),
                SizedBox(height: height*0.01,),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Text(
                              "Wednesday",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "spartan",
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Break: 9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "spartan",
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dividerCommon(),
                SizedBox(height: height*0.01,),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Text(
                              "Thursday",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "spartan",
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Break: 9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "spartan",
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dividerCommon(),
                SizedBox(height: height*0.01,),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Text(
                              "Friday",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "spartan",
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Break: 9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "spartan",
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dividerCommon(),
                SizedBox(height: height*0.01,),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Text(
                              "Saturday",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Closed",
                                style: TextStyle(
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "spartan",
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Break: 9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "spartan",
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dividerCommon(),
                SizedBox(height: height*0.01,),
                Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Text(
                              "Sunday",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "spartan",
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Closed",
                                style: TextStyle(
                                    color: Color(0xff292929),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "spartan",
                                    fontSize: 12),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Break: 9:00 - 17:00",
                                style: TextStyle(
                                    color: Color(0xff292D32),
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "spartan",
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.08,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                            child: Image.asset("assets/images/righticon.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                dividerCommon(),
                Spacer(),
                CommonButton(context, "SAVE",12, FontWeight.w600, Colors.white, () { }),
               // SizedBox(height: height*0.03,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
