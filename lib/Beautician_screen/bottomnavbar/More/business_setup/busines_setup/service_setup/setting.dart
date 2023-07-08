import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class setting extends StatefulWidget {
  bool? isBookOnline;
  bool? isHomeService;
  String? intervalTime;
  String? noOfParallelClient;
  setting(
      {Key? key,
      this.isBookOnline,
      this.isHomeService,
      this.intervalTime,
      this.noOfParallelClient})
      : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  List<String> mindropdownlist = <String>[
    "15 min",
    "30 min",
    "45 min",
    "60 min",
  ];
  List<String> parallelClient = <String>["1", "2", "3", "4", "5", "6"];
  List<String> timelist = <String>["0", "25 min", "20 min", "15 min", "10 min"];
  String? selectedvaluemin = "30 min";
  String? selectedchosstime = "0";
  String? paraclientValue = "1";
  bool clentswitch = false;
  bool homeswitch = false;

  TextEditingController txtPClients = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paraclientValue = widget.noOfParallelClient ?? "1";
    clentswitch = widget.isBookOnline ?? false;
    homeswitch = widget.isHomeService ?? false;
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
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Settings",
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
      body: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height * 0.85,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textComoon("Allow clients to book online?", 14,
                            Color(0xff292929), FontWeight.w500),
                        SizedBox(
                          width: 20,
                        ),
                        FlutterSwitch(
                          width: 55.0,
                          height: 25.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          activeColor: Color(0xff01635D),
                          value: clentswitch,
                          onToggle: (value) {
                            setState(() {
                              clentswitch = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textComoon("Home Service?", 14, Color(0xff292929),
                            FontWeight.w500),
                        SizedBox(
                          width: 20,
                        ),
                        FlutterSwitch(
                          width: 55.0,
                          height: 25.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          activeColor: Color(0xff01635D),
                          value: homeswitch,
                          onToggle: (value) {
                            setState(() {
                              homeswitch = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  textComoon(
                      "Interval", 14, Color(0xff292929), FontWeight.w700),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textComoonfade(
                      "Set time slots for which clients can book between appointments. (e.g with 10min intervals, they can book appointments at 9:00, 9:10, 9:20, 9:30, etc.)",
                      12,
                      Color(0xff414141),
                      FontWeight.w500),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  DropdownButtonFormField(
                    enableFeedback: true,
                    isDense: true,
                    isExpanded: true,
                    alignment: Alignment.center,
                    elevation: 2,
                    value: selectedvaluemin,
                    items: mindropdownlist.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff292929)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedvaluemin = newValue!;
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Color(0xff969696),
                      ),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Service Category",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'spartan',
                          color: Color(0xff292929),
                          fontWeight: FontWeight.w500),
                      labelText: "Choose Time",
                      labelStyle: TextStyle(
                          fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xff292929)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xff292929)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.015),
                    child: Divider(
                      thickness: 1,
                      color: Color(0xffCFCFCF),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  textComoon("Parallel Clients", 14, Color(0xff292929),
                      FontWeight.w700),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  textComoonfade(
                      "Maximum number of clients able to book a service in the same time.",
                      12,
                      Color(0xff414141),
                      FontWeight.w500),
                  SizedBox(height: height * 0.03),
                  DropdownButtonFormField(
                    enableFeedback: true,
                    isDense: true,
                    isExpanded: true,
                    alignment: Alignment.center,
                    elevation: 2,
                    value: paraclientValue,
                    items: parallelClient.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff292929)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        paraclientValue = newValue!;
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Color(0xff969696),
                      ),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Parallel Client",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'spartan',
                          color: Color(0xff292929),
                          fontWeight: FontWeight.w500),
                      labelText: "Parallel Client",
                      labelStyle: TextStyle(
                          fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xff292929)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Color(0xff292929)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.015),
                    child: Divider(
                      thickness: 1,
                      color: Color(0xffCFCFCF),
                    ),
                  ),
                  Spacer(),
                  CommonButton(context, "OK", 12, FontWeight.w600, Colors.white,
                      () {
                    print(
                      homeswitch,
                    );
                    print(
                      clentswitch,
                    );
                    Navigator.pop(
                        context, [paraclientValue, homeswitch, clentswitch]);
                  }),
                  SizedBox(
                    height: height * 0.025,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
