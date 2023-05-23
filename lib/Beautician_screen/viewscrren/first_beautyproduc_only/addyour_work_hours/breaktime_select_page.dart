import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

// ignore: camel_case_types
class brealTime_Select extends StatefulWidget {
  // bool secondflow;

  const brealTime_Select({Key? key}) : super(key: key);

  @override
  State<brealTime_Select> createState() => _brealTime_SelectState();
}

// ignore: camel_case_types
class _brealTime_SelectState extends State<brealTime_Select> {
  Duration initialTimer = const Duration();
  String breakStartTime = "";
  String breakEndTime = "";
  List breaktime = [
    "00:00 ",
    "01:00 ",
    "01:15 ",
    "01:30 ",
    "01:45 ",
    "02:00 ",
    "02:15 ",
    "02:30",
    "02:45",
    "03:00",
    "03:15",
    "03:30",
    "03:45",
    "04:00",
    "04:15",
    "04:30",
    "04:45",
    "05:00",
    "05:15",
    "05:30",
    "05:45",
    "06:00",
    "06:15",
    "06:30",
    "06:45",
    "07:00",
    "07:15",
    "07:30",
    "07:45",
    "08:00",
    "08:15",
    "08:30",
    "08:45",
    "09:00",
    "09:15",
    "09:30",
    "09:45",
    "10:00",
    "10:15",
    "10:30",
    "10:45",
    "11:00",
    "11:15",
    "11:30",
    "11:45",
    "12:00",
    "12:15",
    "12:30",
    "12:45",
    "13:00",
    "13:15",
    "13:30",
    "13:45",
    "14:00",
    "14:15",
    "14:30",
    "14:45",
    "15:00",
    "15:15",
    "15:30",
    "15:45",
    "16:00",
    "16:15",
    "16:30",
    "16:45",
    "17:00",
    "17:15",
    "17:30",
    "17:45",
    "18:00",
    "18:15",
    "18:30",
    "18:45",
    "19:00",
    "19:15",
    "19:30",
    "19:45",
    "20:00",
    "20:15",
    "20:30",
    "20:45",
    "21:00",
    "21:15",
    "21:30",
    "21:45",
    "22:00",
    "22:15",
    "22:30",
    "22:45",
    "23:00",
    "23:15",
    "23:30",
    "23:45",
    "24:00",
  ];
  String pickedtimebreak = "";


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
        toolbarHeight: height * 0.18, //
        flexibleSpace: Container(
          color: const Color(0xffF5F7F7),
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
                            padding: const EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Break - Monday",
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 60,
                        ),
                        Expanded(
                          child: Text(
                              "Take a break, go for lunch or do you just want\nto relax? Choose your break time",
                              style: TextStyle(
                                  fontSize: 10,
                                  // you can change it accordingly
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff414141),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.6,
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: CupertinoPicker(
                        itemExtent: 60,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            breakStartTime = breaktime[index];
                          });
                        },
                        children: breaktime
                            .map((text) => Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(text,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: textComoon(
                          "to", 15, const Color(0xff292929), FontWeight.w500),
                    ),
                    SizedBox(
                      width: 100,
                      child: CupertinoPicker(
                        itemExtent: 60,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            breakEndTime = breaktime[index];
                          });
                        },
                        children: breaktime
                            .map((text) => Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(text,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "spartan",
                                            color: Colors.black)),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                    ),
                  )

                  // Close the modal
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(
                    context,
                    [
                      breakStartTime,
                      breakEndTime,
                    ],
                  );
                  // Navigator.push(context,MaterialPageRoute(builder: (context) {
                  //   return add_Your_Work_Hours(secondflow: false,);
                  // },));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text("SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
