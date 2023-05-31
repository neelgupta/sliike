// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getProvinceMoel.dart';
import 'package:new_sliikeapps_apps/services/address_service.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:http/http.dart' as http;

import '../../utils/preferences.dart';

const kGoogleApiKey = "AIzaSyCziqe1Q-d4HMC3D9ZyYDFkBtx8ZHrzGzM";

class add_new_address extends StatefulWidget {
  String Address_Name;
  String Location;
  String Apartment_suite;
  String Province_name;
  String Zip_Code;
  bool addressValue;

  add_new_address({
    Key? key,
    required this.Address_Name,
    required this.Location,
    required this.Apartment_suite,
    required this.Province_name,
    required this.Zip_Code,
    required this.addressValue,
  }) : super(key: key);

  @override
  State<add_new_address> createState() => _add_new_addressState();
}

class _add_new_addressState extends State<add_new_address> {
  bool home = true;
  bool work = false;
  bool other = false;
  AddressService addressService = AddressService();
  GetProvince? getProvince;
  String latitude = "";
  String longitude = "";
  bool isLoading = true;
  String ad_value = "";
  String? province;
  TextEditingController Address_home = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController apartment = TextEditingController();
  TextEditingController zip_code = TextEditingController();
  ClientAddress? a;

  @override
  void initState() {
    if (widget.Address_Name != "") {
      Address_home.text = widget.Address_Name;
    }
    if (widget.Location != "") {
      Address.text = widget.Location;
    }
    if (widget.Apartment_suite != "") {
      apartment.text = widget.Apartment_suite;
    }
    if (widget.Province_name != "") {
      province = widget.Province_name;
    }
    if (widget.Zip_Code != "") {
      zip_code.text = widget.Zip_Code;
    }
    if(widget.addressValue != false){
      if(home = true){
        home = widget.addressValue;
      }else if(work = true){
        work = widget.addressValue;
      }else{
        other = widget.addressValue;
      }
    }

    super.initState();
    getProvinceData();
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xffDD6A03),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: height * 0.06,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image:
                                        AssetImage("assets/images/Vector.png"),
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Add New Address",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Stack(children: [
                      home == true
                          ? Positioned(
                              top: 2,
                              left: 80,
                              child: Image.asset(
                                "assets/images/Group 12660.png",
                                height: height * 0.04,
                              ))
                          : work == true
                              ? Positioned(
                                  top: 2,
                                  left: 190,
                                  child: Image.asset(
                                    "assets/images/Group 12660.png",
                                    height: height * 0.04,
                                  ))
                              : Positioned(
                                  top: 2,
                                  right: 0,
                                  child: Image.asset(
                                    "assets/images/Group 12660.png",
                                    height: height * 0.04,
                                  )),
                      SizedBox(
                        height: height * 0.18,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  home = true;
                                  work = false;
                                  other = false;
                                });
                              },
                              child: Container(
                                height: height * 0.14,
                                width: width * 0.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: home == true
                                          ? const Color(0xFFDD6A03)
                                          : Colors.black),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/home-2.png",
                                      height: height * 0.04,
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text("Home",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "spartan",
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  home = false;
                                  work = true;
                                  other = false;
                                });
                              },
                              child: Container(
                                height: height * 0.14,
                                width: width * 0.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: work == true
                                          ? const Color(0xFFDD6A03)
                                          : Colors.black),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/briefcase.png",
                                      height: height * 0.04,
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text("Work",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "spartan",
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  home = false;
                                  work = false;
                                  other = true;
                                });
                              },
                              child: Container(
                                height: height * 0.14,
                                width: width * 0.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: other == true
                                          ? const Color(0xFFDD6A03)
                                          : Colors.black),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/element-3.png",
                                      height: height * 0.04,
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    const Text("Other",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "spartan",
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text("Address Name",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextField(
                      onTap: () async {
                          _handlePressButton();
                      },
                      controller: Address_home,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Home",
                        labelText: "Home",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'spartan',
                            color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text("Address",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "spartan",
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextField(
                      controller: Address,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintStyle: const TextStyle(color: Color(0xff000000)),
                        prefixIcon: SizedBox(
                          width: 70,
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                SizedBox(width: width * 0.04),
                                Image.asset(
                                  "assets/images/location.png",
                                  height: 25,
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                const VerticalDivider(
                                  color: Color(0xff707070),
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        labelStyle: const TextStyle(
                            fontFamily: 'spartan', color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    TextField(
                      controller: apartment,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Apartment/suite",
                        labelText: "Apartment/suite",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'spartan',
                            color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    // TextField(
                    //   controller: province,
                    //   cursorColor: Colors.black,
                    //   decoration: InputDecoration(
                    //     contentPadding: const EdgeInsets.only(left: 20),
                    //     hintText: "Province",
                    //     labelText: "Province",
                    //     labelStyle: const TextStyle(
                    //         fontSize: 12,
                    //         fontFamily: 'spartan',
                    //         color: Colors.black54),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(5),
                    //       borderSide: const BorderSide(color: Colors.black38),
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(5),
                    //       borderSide: const BorderSide(color: Colors.black38),
                    //     ),
                    //   ),
                    // ),
                    DropdownButtonHideUnderline(
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
                                color: const Color(0xff707070),
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
                            setState(() {
                              province = value.toString();
                            });
                          },
                          icon: (const Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: const Color(0xff707070),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SizedBox(
                      width: width * 0.50,
                      child: TextField(
                        controller: zip_code,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: "Zip Code",
                          labelText: "Zip Code",
                          labelStyle: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'spartan',
                              color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black38),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.15,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.07,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: const Text("CANCEL",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "spartan",
                                    color: Colors.black)),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            await addClientAddress(context, ad_value);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.07,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFDD6A03)),
                                color: const Color(0xFFDD6A03),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: const Text("SAVE",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.04,
                    )
                  ],
                ),
              ),
            ),
    );
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
            backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff01635D))));
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    Placemark places = placemarks[0];

    print(places);
    Address_home.text = places.street!.isEmpty ?  widget.Address_Name : "${places.street}";
    apartment.text = "${places.country}";
    Address.text = "${places.locality}";
    zip_code.text = "${places.postalCode}";
    latitude = lat.toString();
    longitude = long.toString();
    setState(() {});
    Loader.hide();
  }

  addClientAddress(context, String addressValue) async {
    var Posturi = Uri.parse(ApiUrlList.addClientAddress);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      if (home == true && work == false && other == false) {
        addressValue = "Home";
      } else if (home == false && work == true && other == false) {
        addressValue = "Work";
      } else {
        addressValue = "Other";
      }
      ad_value = addressValue;

      var bodydata = {
        "addressType": ad_value,
        "address": Address.text.trim(),
        "province": province,
        "street_address": Address_home.text.trim(),
        "apartment": apartment.text.trim(),
        "post_code": zip_code.text.trim(),
        // "coordinates": [41.3326643802986, 19.8263257802456],
      };

      print("hearders :: $headers ");
      print("addPersonalInfo url is :: $Posturi ");
      print("req bodydata :: $bodydata ");

      var response = await http.post(
        Posturi,
        body: jsonEncode(bodydata),
        headers: headers,
      );

      print("addPersonalInfo status code ==> ${response.statusCode}");
      print(" addPersonalInfo res body is :  ${response.body}");
      print("response ===> $response");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          a = ClientAddress.fromjson(map);
          Navigator.pop(context, true);

          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if(response.statusCode == 401){
          logoutdata();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
            return signInScreen();
          },), (route) => false);
        }else {
          Fluttertoast.showToast(
              msg: "${map['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        }
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
    isLoading = false;
    setState(() {});
  }
}


class ClientAddress {
  int? status;
  bool? success;
  String? message;

  ClientAddress({this.status, this.success, this.message});

  factory ClientAddress.fromjson(Map<dynamic, dynamic> map) {
    return ClientAddress(
        status: map['status'] ?? 0,
        success: map['success'] ?? false,
        message: map['message'] ?? "");
  }
}
