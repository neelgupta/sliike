import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';

import '../../../../../../../calender/send_notifi_message_or_phone/new_appoinment/new_appinment_viewall_add_another/new_appoinment_view_Add.dart';

class edit_add_service extends StatefulWidget {
  const edit_add_service({Key? key}) : super(key: key);

  @override
  State<edit_add_service> createState() => _add_SreviceState();
}

class _add_SreviceState extends State<edit_add_service> {
  TextEditingController search = TextEditingController();
  String? selectdradioValue = "";

  List findserviceradioList = [
    'Men’s Cut',
    'Women’s Cut',
    'Beard Trim',
  ];
  List DurationTimeradioList = [
    "30 min",
    "25 min",
    "20 min",
    "15 min",
    "10 min",
    "5 min"
  ];
  String? selecttimedradioValue = "";

  List recurringOptionsList = [
    "Doesn’t recur",
    "Daily",
    "Weekly",
    "Every 2 weeks",
    "Every 3 weeks",
    "Every month",
    "Every 2 months",
    "Every 3 months",
    "Every 4 months",
    "Every 5 months",
    "Every 6 months",
    "Every year",
  ];
  String? recurringOptionsRadio = "";

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
                          width: width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text("Edit Appointment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: width,
          height: height * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Set Service",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff111111),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                ///find service
                InkWell(
                  onTap: () {
                    findservice();
                  },
                  child: Container(
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff01635D)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/search-whitenormal.png"),
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Find Service",
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.5,
                      child: Text("Set Date & Time",
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: Color(0xff111111),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Duration",
                        style: TextStyle(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Color(0xff111111),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff707070), width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mar 16 | 11:00 AM",
                                style: TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w500)),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Color(0xff707070),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Durationdialog();

                          });
                        },
                        child: Container(
                          height: 48,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Color(0xff707070), width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${selecttimedradioValue}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xff292929),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w500)),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Color(0xff707070),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Staff",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff111111),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: 48,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff707070), width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select option",
                            style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff707070),
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Color(0xff707070),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Recurring options",
                      style: TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff111111),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: (){
                    recurringoption();
                  },
                  child: Container(
                    height: 48,
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff707070), width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$recurringOptionsRadio",
                              style: TextStyle(
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff707070),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w500)),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 30,
                            color: Color(0xff707070),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Spacer(),
                CommonButton(
                    context, "SAVE", 12, FontWeight.w600, Colors.white, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return newAppoinment_Viwe_Add();
                  },));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }



  findservice() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(10),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: height - 60,
                width: width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Set Service",
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff292929),
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        child: TextField(
                          controller: search,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20),
                            hintText: "Search service",
                            hintStyle:
                            TextStyle(color: Color(0xff707070)),
                            suffixIcon: Container(
                              width: width * 0.2,
                              color: Color(0xff01635D),
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
                        height: height * 0.02,
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: findserviceradioList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectdradioValue =
                                        findserviceradioList[index]
                                            .toString();
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .center,
                                        children: [
                                          Container(
                                            height: 60,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "${findserviceradioList[index]}",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'spartan',
                                                      color: Color(
                                                          0xff292929),
                                                      fontWeight:
                                                      FontWeight
                                                          .w700,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "\$20 for 30 min",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'spartan',
                                                      color: Color(
                                                          0xff414141),
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Radio<String>(
                                            value:
                                            findserviceradioList[
                                            index],
                                            activeColor:
                                            Color(0xff01635D),
                                            groupValue:
                                            selectdradioValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectdradioValue =
                                                    value
                                                        .toString();

                                                Navigator.pop(
                                                    context);
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Color(0xffCFCFCF),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

          ),
        );
      },
    );
  }
  Durationdialog() {
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
          insetPadding: EdgeInsets.all(10),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: height - 60,
                width: width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: DurationTimeradioList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selecttimedradioValue =
                                    DurationTimeradioList[index].toString();
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 20),
                                              child: Text(
                                                "${DurationTimeradioList[index]}",
                                                style: TextStyle(
                                                    fontFamily: 'spartan',
                                                    color: Color(0xff292929),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Radio<String>(
                                          value: DurationTimeradioList[index],
                                          activeColor: Color(0xff01635D),
                                          groupValue: selecttimedradioValue,
                                          fillColor: MaterialStateColor.resolveWith(
                                                  (states) => Color(0xff01635D)),
                                          onChanged: (value) {
                                            setState(
                                                  () {
                                                selecttimedradioValue =
                                                    value.toString();
                                                print("===${selecttimedradioValue}");
                                                Navigator.pop(context);
                                              },
                                            );
                                          })
                                    ],
                                  ),

                                  Divider(
                                    thickness: 1,
                                    color: Color(0xffCFCFCF),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },

          ),
        );
      },
    );
  }
  recurringoption() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {

            return  Dialog(
              insetPadding: EdgeInsets.all(10),
              child: Container(
                height: height - 60,
                width: width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: recurringOptionsList.length,
                        itemBuilder: (context, index) {

                          return InkWell(
                            onTap: () {

                              recurringOptionsRadio =
                              recurringOptionsList[index];
                              print("------$recurringOptionsRadio");
                              Navigator.pop(context);

                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 20),
                                              child: Text(
                                                "${recurringOptionsList[index]}",
                                                style: TextStyle(
                                                    fontFamily: 'spartan',
                                                    color: Color(0xff292929),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Radio<String>(
                                          value: recurringOptionsList[index],
                                          activeColor: Color(0xff01635D),
                                          groupValue: recurringOptionsRadio,
                                          fillColor: MaterialStateColor.resolveWith(
                                                  (states) => Color(0xff01635D)),
                                          onChanged: (newvalue) {

                                            recurringOptionsRadio =
                                                newvalue.toString();
                                            print("======${recurringOptionsRadio}");
                                            Navigator.pop(context);

                                          })
                                    ],
                                  ),

                                  Divider(
                                    thickness: 1,
                                    color: Color(0xffCFCFCF),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },

        );
      },
    );
  }
}
