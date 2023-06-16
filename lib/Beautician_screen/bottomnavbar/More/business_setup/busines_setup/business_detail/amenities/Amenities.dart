import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Amenities extends StatefulWidget {
  const Amenities({Key? key}) : super(key: key);

  @override
  State<Amenities> createState() => _AmenitiesState();
}

class _AmenitiesState extends State<Amenities> {
  List<bool> ? isCheck;
  bool isLoading = false;
  getAmenity ? amenity;
  getAmenitySelectedData ? selectedAmenties;
  List amenityIds = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAmenityList();
    // getAmenitySelected();
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
                      SizedBox(width: width*0.25,),
                      Container(
                        child: Text("Amenities",
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
      body: isLoading ? Center(child: CircularProgressIndicator(color: Color(0xff01635D)),):
      amenity!.data.isNotEmpty?
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.02,),
            textComoonfade("Build trust and comfort by informing your customers about the amenities that make your business stand out.", 12, Color(0xff414141), FontWeight.w500),
            SizedBox(height: height*0.01,),
            Divider(thickness: 1,color: Color(0xffCFCFCF),),
            SizedBox(height: height*0.025,),
            textComoon("Choose from the list", 14, Color(0xff292929),FontWeight.w700),
            SizedBox(height: height*0.025,),
            if(selectedAmenties?.data != null)Container(
              // color: Colors.red,
              height: height * 0.55,
              child: ListView.builder(
                itemCount: amenity!.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              checkColor: Colors.white,
                              activeColor: Color(0xff01635D),
                              value: amenity!.data[index].isSelected!,
                              onChanged: (bool? value) {
                                setState(() {
                                  amenity!.data[index].isSelected = value;
                                  amenity!.data[index].isSelected! ? amenityIds.add(amenity!.data[index].id) :
                                  amenityIds.remove(amenity!.data[index].id);
                                  // if(amenity!.data[index].isSelected!)amenityIds.remove(selectedAmenties!.data[index].id);
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
                          textComoon("${amenity!.data[index].name}",14,Color(0xff292929), FontWeight.w500),
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
            Spacer(),
            CommonButton(context,"SAVE",12, FontWeight.w600, Colors.white, () {saveAmenities();}),
            SizedBox(height: height*0.03,),
          ],
        ),
      ):
      Center(child: Text("No Amenties Found !!",style: TextStyle(fontWeight: FontWeight.bold),)),
    );
  }

  getAmenityList() async {
    var getUri = Uri.parse(ApiUrlList.getAmenityList);
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(
        getUri,
      );
      log("getAmenitiesList Code ====> ${response.statusCode}");
      log("getAmenitiesList Body ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if (map['status'] == 200) {
        setState(() {
          amenity = getAmenity.fromjson(map);
          isCheck = List.generate(amenity!.data.length, (index) => false);
          getAmenitySelected();
          // isLoading = false;
        });
      }
      else if(response.statusCode == 401){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return const signInScreen();
        },), (route) => false);
      }else{
        amenity = null;
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  saveAmenities() async {
    setState(() {
      isLoading = true;
    });
    var Headers = {
      'Content-Type': "application/json; charset=utf-8",
      "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
    };
    var Body = {
      "amenityIds" : amenityIds
    };
    var response = await http.post(
      Uri.parse(ApiUrlList.saveAmenities),
      body: jsonEncode(Body),
      headers: Headers,
    );
    log("saveAmenities Code : ${response.statusCode}");
    log("saveAmenities Body : ${response.body}");
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

  getAmenitySelected() async {
    try {
      setState(() {
        isLoading = true;
      });
      var Headers = {
        "Authorization":"Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var getUri = Uri.parse(ApiUrlList.getAmenity);
      var response = await http.get(
        Uri.parse("https://sliike-server.onrender.com/api/v1/beautician/getAmenities",),
        headers: Headers
      );
      log("getAmenities Code ====> ${response.statusCode}");
      log("getAmenities Body ====>  ${response.body}");
      Map map = jsonDecode(response.body);
      if(map['status'] == 200) {
        setState(() {
          selectedAmenties = getAmenitySelectedData.fromjson(map);
          isLoading = false;
          for(int i = 0; i < amenity!.data.length; i++){
              for(int j = 0; j < selectedAmenties!.data.length; j++){
                  if(selectedAmenties!.data[j].id.toLowerCase() == amenity!.data[i].id.toLowerCase()){
                    setState(() {
                      amenityIds.add(selectedAmenties!.data[j].id);
                      amenity!.data[i].isSelected = true;
                    });
                  log("amenity!.data[i].isSelected : ${amenity!.data[i].isSelected}");
                  }
                }

            }
        });
      }
      else if(response.statusCode == 401){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return const signInScreen();
        },), (route) => false);
      }else{
        amenity = null;
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


}

class getAmenity{
  int status;
  String message;
  List<Data>   data;
  getAmenity(this.status, this.message,this.data);

  factory getAmenity.fromjson(Map<dynamic,dynamic>map){
    List list = map["data"];
    List<Data> d = list.map((e) => Data.fromjson(e)).toList();
    return getAmenity(map['status'], map['message'],d);
  }
}
class Data{
  String id;
  String name;
  int status;
  bool? isSelected;
  Data(this.id, this.name, this.status,{this.isSelected = false});

  factory Data.fromjson(Map<dynamic,dynamic>map){
    return Data(map["_id"], map["name"], map["status"]);
  }
}

/// Selected Amenties Data ///
class getAmenitySelectedData{
  int status;
  String message;
  List<Data>  data;
  getAmenitySelectedData(this.status, this.message,this.data);

  factory getAmenitySelectedData.fromjson(Map<dynamic,dynamic>map){
    List list = map["data"];
    List<Data> d = list.map((e) => Data.fromjson(e)).toList();
    return getAmenitySelectedData(map['status'], map['message'],d);
  }
}
class getData{
  String id;
  String name;
  getData(this.id, this.name,);

  factory getData.fromjson(Map<dynamic,dynamic>map){
    return getData(map["_id"], map["name"],);
  }
}
