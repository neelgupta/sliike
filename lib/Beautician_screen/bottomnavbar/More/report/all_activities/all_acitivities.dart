import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/report/all_activities/report.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/services/beautician_report_service.dart';

class all_Activities extends StatefulWidget {
  const all_Activities({Key? key}) : super(key: key);

  @override
  State<all_Activities> createState() => _all_ActivitiesState();
}

class _all_ActivitiesState extends State<all_Activities> {
  String? weekvalue;
  var weekitemslist = ["Today", "February"];
  List topservicecut = ["Men’s Cut", "Women’s Cut", "Beard Trim"];

  DateTime pickedDate = DateTime.now();

  BeauticianReport _beauticianReport = BeauticianReport();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _beauticianReport.getBeauticianReports(DateFormat('yyyy-MM-dd').format(pickedDate),4,0);
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
                                      AssetImage("assets/images/Group 55.png"),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.2,
                      ),
                      Container(
                        child: Text("All Activities",
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: height * 0.42,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xffCFCFCF), width: 1)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: textComoon("Recent sales", 16,
                              Color(0xff292929), FontWeight.w700)),
                    ),
                    Container(
                        height: height * 0.32,
                        alignment: Alignment.center,
                        child: Center(
                            child: textComoon("Graph", 16, Color(0xffCFCFCF),
                                FontWeight.w700))),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: height * 0.42,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xffCFCFCF), width: 1)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                              alignment: Alignment.topLeft,
                              child: textComoon("Appointments", 16,
                                  Color(0xff292929), FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 5),
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.3,
                            height: 40,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black38)),
                            child: DropdownButton(
                              hint: Text("TODAY"),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff414141),
                                  fontFamily: 'spartan',
                                  fontWeight: FontWeight.w500),
                              underline: SizedBox(),
                              dropdownColor: Colors.white,
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.yellow,
                              isExpanded: true,
                              icon: Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff414141)),
                              value: weekvalue,
                              items: weekitemslist.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  weekvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: height * 0.33,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/images/apoinment.png",
                                height: height * 0.1,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            textComoon("No Appointments Today", 14,
                                Color(0xff292929), FontWeight.w700),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Schedule appointments in the ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'spartan',
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff414141)),
                                    children: [
                                      TextSpan(
                                          text: 'calendar\n',
                                          style: TextStyle(
                                              fontFamily: 'spartan',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Color(0xff2F80ED))),
                                      TextSpan(
                                          text:
                                              'section to add appointments here.',
                                          style: TextStyle(
                                              fontFamily: 'spartan',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Color(0xff414141)))
                                    ])),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffCFCFCF), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textComoon("Top Services", 16, Color(0xff292929),
                          FontWeight.w700),
                      SizedBox(
                        height: height * 0.035,
                      ),
                      ListView.separated(
                        itemCount: topservicecut.length,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComoon("${topservicecut[index]}", 14,
                                  Color(0xff292929), FontWeight.w700),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              textComoon("16 Last month/ 9 This month", 10,
                                  Color(0xff414141), FontWeight.w400),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffCFCFCF), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textComoon("Top Products", 16, Color(0xff292929),
                          FontWeight.w700),
                      SizedBox(
                        height: height * 0.035,
                      ),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 58,
                                    width: 58,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/Rectangle 967.png"))),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textComoon("Smoothning Cream", 12,
                                            Color(0xff000000), FontWeight.w800),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        textComoonfade(
                                            "48 Last month/ 24 This month",
                                            10,
                                            Color(0xff414141),
                                            FontWeight.w400),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xffCFCFCF),
                                ),
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return report();
                      },
                    ));
                  },
                  child: Text("Report temp")),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
