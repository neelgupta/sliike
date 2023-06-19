import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/health_safety/health_additional_details.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class health_Safety_Rule extends StatefulWidget {
  const health_Safety_Rule({Key? key}) : super(key: key);

  @override
  State<health_Safety_Rule> createState() => _health_Safety_RuleState();
}

class _health_Safety_RuleState extends State<health_Safety_Rule> {
  bool checkboxvalue = false;

  bool isLoading = false;

  getHealthSafety ? getHealthSafetyData;

  getHealthSafetySelectedData ? selectedData;
  List healthId = [];
  String detailForClient = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHealthSafetyList();
    // getHealthSafetySelected();
    print(Helper.prefs!.getString(UserPrefs.keyutoken));
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
                                    image:
                                        AssetImage("assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Health & Safety Rules",
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
      body: isLoading ? Center(child: CircularProgressIndicator(color: Color(0xff01635D)),):
      getHealthSafetyData!=null && getHealthSafetyData!.data.length!=0?
      SingleChildScrollView(
        child: Container(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                textComoonfade(
                    "Select only the safety rules that apply to you and your venue. The checked items will be visible on your profile for your clients to see.",
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
                      child: textComoon("Select rules :", 12, Color(0xff292929),
                          FontWeight.w700),
                    )),
                SizedBox(
                  height: height * 0.025,
                ),

                // ListView Builder //
                if(selectedData?.data != null)Container(
                  // color: Colors.red,
                  height: height * 0.4,
                  child: ListView.builder(
                    itemCount: getHealthSafetyData!.data.length,
                    itemBuilder: (context, index) {
                      log("getHealthSafetyData!.data[index].isSelected! : ${getHealthSafetyData!.data[index].isSelected!}");
                      return Column(
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Color(0xff01635D),
                                  value: getHealthSafetyData!.data[index].isSelected!,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      getHealthSafetyData!.data[index].isSelected = value;
                                      getHealthSafetyData!.data[index].isSelected! ? healthId.add(getHealthSafetyData!.data[index].id) :
                                      healthId.remove(getHealthSafetyData!.data[index].id);
                                    });
                                  },),
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
                              SizedBox(width: 10,),
                              textComoon("${getHealthSafetyData!.data[index].name}",14,Color(0xff292929), FontWeight.w500),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: height*0.01),
                            child: Divider(thickness: 1,color: Color(0xffCFCFCF),),
                          ),
                          SizedBox(height: height*0.01,),
                        ],
                      ) ;
                    },
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),

                Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return health_detail(detailForClient);
                      },)).then((value) {
                        print(value);
                        if(value!=null) {
                          detailForClient = value;
                          setState(() {});
                        }
                      });
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            textComoon("Additional Details",14,Color(0xff292929), FontWeight.w500),
                            textComoon("(optional)",14,Color(0xff707070), FontWeight.w500),

                          ],
                        ),

                        Container(
                          height: 15,
                          width: 30,
                          child: Image.asset("assets/images/righticon.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xffCFCFCF),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Spacer(),
                CommonButton(context, "SAVE", 12, FontWeight.w600, Colors.white, () {saveHealthSafety();}),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ):
      Center(child: Text("No Data Found !!",style: TextStyle(fontWeight: FontWeight.bold),))
    );
  }

  getHealthSafetyList() async {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(
          Uri.parse("https://sliike-server.onrender.com/api/v1/option/getHealthSafetyList",)
      );
      log("getHealthSafetyList Code ====> ${response.statusCode}");
      log("getHealthSafetyList Body ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
          getHealthSafetyData = getHealthSafety.fromjson(map);
          await getHealthSafetySelected();
          isLoading = false;
          setState(() {});
      }
      else if(response.statusCode == 401){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return const signInScreen();
        },), (route) => false);
      }else{
        setState(() {
          isLoading = false;
        });
      }
      setState(() {
        isLoading = false;
      });
  }

  saveHealthSafety() async {
    setState(() {
      isLoading = true;
    });
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var Body = {
      "healthId" : healthId,
      "detailForClient" : detailForClient,
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.saveHealthSafety),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("saveHealthSafety Code : ${response.statusCode}");
    log("saveHealthSafety Body : ${response.body}");
    log("saveHealthSafety PayLoad : ${Body}");
    Map map = jsonDecode(response.body);
    if(response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          msg: map["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getHealthSafetySelected() async {
      setState(() {
        isLoading = true;
      });
      var Headers = {
        "Authorization":"Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var getUri = Uri.parse(ApiUrlList.getAmenity);
      var response = await http.get(
          Uri.parse("https://sliike-server.onrender.com/api/v1/beautician/getHealthSafety",),
          headers: Headers
      );
      log("getAmenities Code ====> ${response.statusCode}");
      log("getAmenities Body ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if(map['status'] == 200) {
        setState(() {
          selectedData = getHealthSafetySelectedData.fromjson(map);
          detailForClient = selectedData!.data!.detailForClient;
          for(int i = 0; i < getHealthSafetyData!.data.length; i++){
            for(int j = 0; j < selectedData!.data!.healthID!.length; j++){
              if(selectedData!.data!.healthID![j].id.toLowerCase() == getHealthSafetyData!.data[i].id.toLowerCase()){
                setState(() {
                  healthId.add(selectedData!.data!.healthID![j].id);
                  getHealthSafetyData!.data[i].isSelected = true;
                });
                log("getHealthSafetyData!.data[i].isSelected : ${getHealthSafetyData!.data[i].isSelected}");
              }
            }
          }
          isLoading = false;
        });
      }
      else if(response.statusCode == 401){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return const signInScreen();
        },), (route) => false);
      }else{
        getHealthSafetyData = null;
        setState(() {
          isLoading = false;
        });
      }
      setState(() {
        isLoading = false;
      });
  }

}

class getHealthSafety{
  int status;
  String message;
  List<getHealthSafetyData>  data;
  getHealthSafety(this.status, this.message,this.data);

  factory getHealthSafety.fromjson(Map<dynamic,dynamic>map){
    List list = map["data"];
    List<getHealthSafetyData> d = list.map((e) => getHealthSafetyData.fromjson(e)).toList();
    return getHealthSafety(map['status'], map['message'],d);
  }
}
class getHealthSafetyData{
  String id;
  String name;
  int status;
  bool? isSelected;
  getHealthSafetyData(this.id, this.name, this.status, {
    this.isSelected = false,
  });

  factory getHealthSafetyData.fromjson(Map<dynamic,dynamic>map){
    return getHealthSafetyData(map["_id"], map["name"], map["status"]);
  }
}


/// Selected getHealthSafety Data ///
class getHealthSafetySelectedData{
  int status;
  String message;
  getData ? data;
  getHealthSafetySelectedData(this.status, this.message,this.data);

  factory getHealthSafetySelectedData.fromjson(Map<dynamic,dynamic>map){
    Map map1 = map["data"];
    getData data = getData.fromjson(map1);
    return getHealthSafetySelectedData(map['status'], map['message'],data);
  }
}

class getData{
  String detailForClient;
  List<healthId> ? healthID;
  getData(this.detailForClient,this.healthID);
  factory getData.fromjson(Map<dynamic,dynamic>map){
    List list = map["healthId"];
    List<healthId> d = list.map((e) => healthId.fromjson(e)).toList();
    return getData(map["detailForClient"],d);
  }
}

class healthId{
  String id;
  String name;
  healthId(this.id, this.name,);
  factory healthId.fromjson(Map<dynamic,dynamic>map){
    return healthId(map["_id"], map["name"],);
  }
}