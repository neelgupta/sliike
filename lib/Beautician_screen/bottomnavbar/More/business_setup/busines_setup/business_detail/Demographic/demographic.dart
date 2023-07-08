import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';

class demograPhic extends StatefulWidget {
  const demograPhic({Key? key}) : super(key: key);

  @override
  State<demograPhic> createState() => _demograPhicState();
}

class _demograPhicState extends State<demograPhic> {
  bool checkboxvalue = false;
  int valuecheck = 1;
  bool isLoading = false;
  getDemographyListData? getDemography;
  getDemographySelectedData? selectedDemography;
  List demographicsIds = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDemographyList();
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
                            width: width * 0.15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Demographics",
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(color: Color(0xff01635D)),
              )
            : getDemography != null && getDemography!.data.length != 0
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          textComoonfade(
                              "Update your demographics so clients can find you using their chosen demographics.",
                              12,
                              Color(0xff414141),
                              FontWeight.w500),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xffCFCFCF),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              height: height * 0.065,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffF3F3F3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: textComoon("Update demographic :", 12,
                                    Color(0xff292929), FontWeight.w700),
                              )),
                          SizedBox(
                            height: height * 0.025,
                          ),
                          if (selectedDemography?.data != null)
                            Container(
                              // color: Colors.red,
                              height: height * 0.4,
                              child: ListView.builder(
                                itemCount: getDemography!.data.length,
                                itemBuilder: (context, index) {
                                  log("getHealthSafetyData!.data[index].isSelected! : ${getDemography!.data[index].isSelected}");
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Transform.scale(
                                            scale: 1.5,
                                            child: Checkbox(
                                              checkColor: Colors.white,
                                              activeColor: Color(0xff01635D),
                                              value: getDemography!
                                                  .data[index].isSelected,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  getDemography!.data[index]
                                                      .isSelected = value!;
                                                  getDemography!.data[index]
                                                          .isSelected
                                                      ? demographicsIds.add(
                                                          getDemography!
                                                              .data[index].id)
                                                      : demographicsIds.remove(
                                                          getDemography!
                                                              .data[index].id);
                                                });
                                              },
                                            ),
                                          ),

                                          // Custom_Checkbox(
                                          //   isChecked: amenity!.data[index].isSelected!,
                                          //   onChange: (value) {
                                          //     setState(() {
                                          //       amenity!.data[index].isSelected = value;
                                          //       amenity!.data[index].isSelected! ? amenityIds.add(amenity!.data[index].id) :
                                          //       amenityIds.remove(amenity!.data[index].id);
                                          //     });
                                          //   },
                                          //   backgroundColor: Color(0xff01635D),
                                          //   borderColor: Color(0xff01635D),
                                          //   icon: Icons.check,
                                          //   iconColor: Colors.white,
                                          //   size: 24,
                                          //   iconSize: 20,
                                          // ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          textComoon(
                                              "${getDemography!.data[index].name}",
                                              14,
                                              Color(0xff292929),
                                              FontWeight.w500),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: height * 0.01),
                                        child: Divider(
                                          thickness: 1,
                                          color: Color(0xffCFCFCF),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CommonButton(context, "SAVE", 12, FontWeight.w600,
                              Colors.white, () {
                            addMyDemographics();
                          }),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          commonButtonborderreadius(
                              context,
                              "PREFER NOT TO SHARE",
                              12,
                              FontWeight.w600,
                              Color(0xff01635D), () {
                            Navigator.pop(context);
                          }),
                          SizedBox(
                            height: height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                    "No Data Found !!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )));
  }

  getDemographyList() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(Uri.parse(
      "https://sliike-server.onrender.com/api/v1/option/getDemography",
    ));
    log("getDemographyList Code ====> ${response.statusCode}");
    log("getDemographyList Body ====>  ${response.body}");
    Map map = jsonDecode(response.body);
    if (map['status'] == 200) {
      getDemography = getDemographyListData.fromjson(map);
      await getDemographySelected();
      setState(() {
        isLoading = false;
      });
    } else if (response.statusCode == 401) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const signInScreen();
        },
      ), (route) => false);
    } else {
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  addMyDemographics() async {
    setState(() {
      isLoading = true;
    });
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    print(Headers);
    var Body = {
      "demographicsIds": demographicsIds,
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.addMyDemographics),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("addMyDemographics Code : ${response.statusCode}");
    log("addMyDemographics Body : ${response.body}");
    log("addMyDemographics PayLoad : ${Body}");
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      showToast(message: map["message"]);
    } else {
      setState(() {
        isLoading = false;
      });
      showToast(message: map["message"]);
    }
  }

  getDemographySelected() async {
    var Headers = {
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var getUri = Uri.parse(ApiUrlList.getAmenity);
    var response = await http.get(
        Uri.parse(
          "https://sliike-server.onrender.com/api/v1/beautician/getMyDemographics",
        ),
        headers: Headers);
    log("getDemographySelected Code ====> ${response.statusCode}");
    log("getDemographySelected Body ====>  ${response.body}");
    Map map = jsonDecode(response.body);
    if (map['status'] == 200) {
      setState(() {
        selectedDemography = getDemographySelectedData.fromjson(map);
        for (int i = 0; i < getDemography!.data.length; i++) {
          for (int j = 0; j < selectedDemography!.data.length; j++) {
            if (selectedDemography!.data[j].id.toLowerCase() ==
                getDemography!.data[i].id.toLowerCase()) {
              setState(() {
                demographicsIds.add(selectedDemography!.data[j].id);
                getDemography!.data[i].isSelected = true;
              });
              log("getHealthSafetyData!.data[i].isSelected : ${getDemography!.data[i].isSelected}");
            }
          }
        }
        isLoading = false;
      });
    } else if (response.statusCode == 401) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const signInScreen();
        },
      ), (route) => false);
    } else {
      selectedDemography = null;
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }
}

class getDemographyListData {
  int status;
  List<Data> data;
  getDemographyListData(this.status, this.data);

  factory getDemographyListData.fromjson(Map<dynamic, dynamic> map) {
    List list = map["data"];
    List<Data> d = list.map((e) => Data.fromjson(e)).toList();
    return getDemographyListData(map['status'], d);
  }
}

class Data {
  String id;
  String name;
  bool isSelected;
  Data(this.id, this.name, this.isSelected);

  factory Data.fromjson(Map<dynamic, dynamic> map) {
    return Data(map["_id"], map["demographyName"], false);
  }
}

class getDemographySelectedData {
  int status;
  String message;
  List<Data> data;
  getDemographySelectedData(this.status, this.message, this.data);

  factory getDemographySelectedData.fromjson(Map<dynamic, dynamic> map) {
    List list = map["data"];
    List<Data> d = list.map((e) => Data.fromjson(e)).toList();
    return getDemographySelectedData(map['status'], map['message'], d);
  }
}

class getData {
  String id;
  String name;
  getData(
    this.id,
    this.name,
  );

  factory getData.fromjson(Map<dynamic, dynamic> map) {
    return getData(
      map["_id"],
      map["name"],
    );
  }
}
