import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getProvinceMoel.dart';
import 'package:new_sliikeapps_apps/services/address_service.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';


const kGoogleApiKey = "AIzaSyCziqe1Q-d4HMC3D9ZyYDFkBtx8ZHrzGzM";

class edit_Location extends StatefulWidget {
  final String ? address;
  final String ? city;
  final String ? province;
  final String ? pin;
  final String ? country;
  const edit_Location({Key? key,this.address,this.city,this.province,this.pin,this.country}) : super(key: key);

  @override
  State<edit_Location> createState() => _edit_LocationState();
}

class _edit_LocationState extends State<edit_Location> {
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Province = TextEditingController();
  TextEditingController PostalCode = TextEditingController();
  TextEditingController Country = TextEditingController();
  AddressService addressService = AddressService();
  bool method = false;
  bool Addressstatus = false;
  bool Citystatus = false;
  bool Provincestatus = false;
  bool PostalCodestatus = false;
  bool Countrystatus = false;
  String status = "";
  String latitude = "";
  String longitude = "";
  bool isLoading = false;
  GetProvince? getProvince;
  String? province;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProvinceData();
    if(widget.address != null && widget.city!=null && widget.pin !=null && widget.country!=null){
      Address.text = widget.address!;
      City.text = widget.city!;
      PostalCode.text = widget.pin!;
      Country.text = widget.country!;
    }
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
                      SizedBox(width: width*0.15,),
                      Container(
                        child: Text("Business Location",
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
      body:
      isLoading ?
      Center(child: CircularProgressIndicator(color: Color(0xff01635D)),):
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.02,),
                textComoon("Edit Location", 14, Color(0xff292929), FontWeight.w600),
                SizedBox(height: height*0.04,),
                Container(
                  child: TextField(
                    onTap: (){
                      _handlePressButton();
                    },
                    readOnly: true,
                    controller: Address,
                    style: TextStyle(color: Color(0xff292929),fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w500),
                    onChanged: (value) {
                      Addressstatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Address",
                      labelText: "Address",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                Addressstatus?Container(
                  height: 30,
                  child: Text("$status",style: TextStyle(fontFamily: 'spartan',fontSize: 12,color: Colors.red),),
                ):Container(height: 20,),
                Container(
                  child: TextField(
                    controller: City,
                    style: TextStyle(color: Color(0xff292929),fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w500),
                    onChanged: (value) {
                      Citystatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "City",
                      labelText: "City",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                Citystatus?Container(
                  height: 30,
                  child: Text("$status",style: TextStyle(fontFamily: 'spartan',fontSize: 12,color: Colors.red),),
                ):Container(height: 25,),
                if(getProvince?.data != null)DropdownButtonHideUnderline(
                  child: Container(
                    height: 48,
                    width: width,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xff707070), width: 1)),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          'Province',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "spartan",
                            color: Color(0xff707070),
                          ),
                        ),
                      ),
                      items: getProvince==null?[]:(getProvince!.data ?? []).map((items) {
                        return DropdownMenuItem(
                          value: items.id,
                          child: Text(
                            items.name ?? "",
                            style: const TextStyle(fontSize: 14, color: Color(0xff292929)),
                          ),
                        );
                      }).toList(),
                      value: province,
                      onChanged: (value) {
                        province = "";
                        setState(() {
                          province = value.toString();
                          log(province!);
                        });
                      },
                      icon: (const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Color(0xff707070),
                      )),
                    ),
                  ),
                ),
                Provincestatus?Container(
                  height: 30,
                  child: Text("$status",style: TextStyle(fontFamily: 'spartan',fontSize: 12,color: Colors.red),),
                ):Container(height: 25,),
                Container(
                  child: TextField(
                    controller: PostalCode,
                    style: TextStyle(color: Color(0xff292929),fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w500),
                    onChanged: (value) {
                      PostalCodestatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Postal Code",
                      labelText: "Postal Code",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                PostalCodestatus?Container(
                  height: 30,
                  child: Text("$status",style: TextStyle(fontFamily: 'spartan',fontSize: 12,color: Colors.red),),
                ):Container(height: 25,),
                Container(
                  child: TextField(
                    controller: Country,
                    style: TextStyle(color: Color(0xff292929),fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w500),
                    onChanged: (value) {
                      Countrystatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Country",
                      labelText: "Country",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                Countrystatus?Container(
                  height: 30,
                  child: Text("$status",style: TextStyle(fontFamily: 'spartan',fontSize: 12,color: Colors.red),),
                ):Container(height: 25,),
                Spacer(),
                CommonButton(context,"SAVE",12, FontWeight.w600, Colors.white, () {
                  updateSalonLocation();
                  print(Helper.prefs!.getString(UserPrefs.keyutoken));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateSalonLocation() async   {
    try {
      setState(() {
        isLoading = true;
      });
      var Body = {
        "latitude" : latitude,
        "longitude" : longitude,
        "address" : Address.text,
        "city" : City.text,
        "provinceId" : province.toString(),
        "zipCode" : PostalCode.text,
        "country" : Country.text,
      };
      var Headers = {
        "Authorization" : "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
        // "Content-Type" : "application/json",
      };
      var postUri = Uri.parse("${ApiUrlList.updateSalonLocation}");
      var res = await http.put(
        postUri,
        body: Body,
        headers: Headers
      );
      log('updateSalonLocation code: ${res.statusCode}');
      log('updateSalonLocation body: ${res.body}');
      Map map = jsonDecode(res.body);
      if(res.statusCode == 200){
        isLoading = false;
        Navigator.pop(context);
        setState(() {});
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }else {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  getProvinceData() async {
    getProvince = await addressService.getProvince();
     if(widget.province!=null){
       for(int i = 0; i < getProvince!.data!.length; i++){
         if(widget.province == getProvince!.data![i].id){
           province = getProvince!.data![i].id;
           setState(() {});
         }
       }
     }
    isLoading = false;
    setState(() {});
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      mode: Mode.overlay,
      language: 'en',
      types: [""],
      strictbounds: false,
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [
        Component(Component.country, "usa"),Component(Component.country, "in"),Component(Component.country, "pk"),Component(Component.country, "cn"),Component(Component.country, "ca")
        // Component(Component.country, "usa"),Component(Component.country, "in"),Component(Component.country, "pk"),Component(Component.country, "af"),Component(Component.country, "au"),Component(Component.country, "at"),Component(Component.country, "bd"),Component(Component.country, "ca"),Component(Component.country, "cn"),Component(Component.country, "fr"),
        // Component(Component.country, "de"),Component(Component.country, "hk"),Component(Component.country, "ir"),Component(Component.country, "iq"),Component(Component.country, "id"),Component(Component.country, "ie"),Component(Component.country, "it"),Component(Component.country, "jp"),Component(Component.country, "ke"),Component(Component.country, "lv"),
        // Component(Component.country, "lt"),Component(Component.country, "my"),Component(Component.country, "mv"),Component(Component.country, "mx"),Component(Component.country, "ma"),Component(Component.country, "mm"),Component(Component.country, "na"),Component(Component.country, "np"),Component(Component.country, "nz"),Component(Component.country, "om"),
        // Component(Component.country, "pl"),Component(Component.country, "ro"),Component(Component.country, "ru"),Component(Component.country, "sa"),Component(Component.country, "sg"),Component(Component.country, "za"),Component(Component.country, "es"),Component(Component.country, "lk"),Component(Component.country, "se"),Component(Component.country, "ch"),
        // Component(Component.country, "th"),Component(Component.country, "tr"),Component(Component.country, "ua"),Component(Component.country, "ae"),Component(Component.country, "uz"),Component(Component.country, "vn"),Component(Component.country, "zm"),Component(Component.country, "zw"),Component(Component.country, "gb"),Component(Component.country, "uk"),
      ],
    );

    displayPrediction(p, context);
  }

  Future<void> displayPrediction(Prediction? p, BuildContext context) async {
    if (p != null) {
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId!);
      final latitude = detail.result.geometry!.location.lat;
      final longitude = detail.result.geometry!.location.lng;
      getlatitude(latitude, longitude);
    }
  }

  getlatitude(double lat, double long) async {
    Loader.show(context,
        isSafeAreaOverlay: false,
        overlayColor: Colors.black26,
        progressIndicator: const CircularProgressIndicator(
            backgroundColor: Color(0xff01635D)),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff01635D))));
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    Placemark places = placemarks[0];

    print(places);
    Province.text = "${places.subLocality}";
    Address.text = "${places.street}";
    Country.text = "${places.country}";
    City.text = "${places.locality}";
    PostalCode.text = "${places.postalCode}";
    latitude = lat.toString();
    longitude = long.toString();
    setState(() {});
    Loader.hide();
  }
}
