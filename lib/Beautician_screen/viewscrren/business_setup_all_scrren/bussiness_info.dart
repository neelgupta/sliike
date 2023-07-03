// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/type_first_second_bussines/bussinessinfo_type.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getProvinceMoel.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

import '../../../services/address_service.dart';

class BussIneSSInfo extends StatefulWidget {
  const BussIneSSInfo({Key? key}) : super(key: key);

  @override
  State<BussIneSSInfo> createState() => _BussIneSSInfoState();
}

class _BussIneSSInfoState extends State<BussIneSSInfo> {
  Position? p;
  String lat = "";
  String long = "";
  double? lati, longi;
  bool isLoading = false;
  GetProvince? getProvince;
  AddressService addressService = AddressService();
  GoogleMapController? mapController;
  String? provinceValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getProvinceData();
    phoneNumbercontriller.text =
        Helper.prefs!.getString(UserPrefs.keybusinessNumber) ?? "";
  }

  final Set<Marker> markers = Set();

  getlatitude(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    Placemark places = placemarks[0];

    print(places);
    areaorpin = "${places.thoroughfare},${places.postalCode}";
    locality = "${places.locality}";
    address = "${places.street},${places.locality},${places.subLocality}";
    enterYourAddresscontriller.text = address;
    countrycontriller.text = "${places.country}";
    // streetAddresscontriller.text = "${places.administrativeArea}";
    citycontriller.text = "${places.locality}";
    postalCodecontriller.text = "${places.postalCode}";
    setState(() {});
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Navigator.pop(context);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("currentlocation$p");
      lati = p!.latitude;
      longi = p!.longitude;
      lat = p!.latitude.toString();
      long = p!.longitude.toString();
      print("///lat${p!.latitude}");
      print("///long${p!.longitude}");
      startLocation = LatLng(lati!, longi!);
      _initialLocation = CameraPosition(target: startLocation, zoom: 20);

      await getlatitude(p!.latitude, p!.longitude);
      enterYourAddresscontriller.text = address;
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  CameraPosition _initialLocation =
      CameraPosition(target: startLocation, zoom: 20);
  static LatLng startLocation =
      const LatLng(41.3326643802986, 19.8263257802456);

  String areaorpin = "Area,Pin";
  String locality = "location";

  bool mapscreen = false;
  AddBusinessDetailModel? addBusinessDetailModel;
  TextEditingController businessnamecontriller = TextEditingController();
  TextEditingController phoneNumbercontriller = TextEditingController();
  TextEditingController enterYourAddresscontriller = TextEditingController();
  TextEditingController countrycontriller = TextEditingController();
  TextEditingController provincecontriller = TextEditingController();
  TextEditingController streetAddresscontriller = TextEditingController();
  TextEditingController apartmentStorecontriller = TextEditingController();
  TextEditingController citycontriller = TextEditingController();
  TextEditingController postalCodecontriller = TextEditingController();
  String address = "";
  bool businessnamestatus = false;
  bool phoneNumberStatus = false;
  bool enterYourAddressStatus = false;
  bool canadaStatus = false;
  bool provinceStatus = false;
  bool streetAddressStatus = false;
  bool apartmentStoreStatus = false;
  bool cityStatus = false;
  bool postalCodeStatus = false;
  String status = "";
  String latitude = "41.3326643802986";
  String longitude = "19.8263257802456";
  double height = 0;
  double width = 0;

  // CameraPosition? cameraPosition;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return WillPopScope(
      onWillPop: () async {
        return await false;
      },
      child: mapscreen
          ? mapView()
          : Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: height * 0.18, // Set this height
                  flexibleSpace: Container(
                      color: const Color(0xff01635D),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 10),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("Business Name and Location\nSetup",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xffFFFFFF),
                                              fontFamily: "spartan",
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          "Set up your business name and\nlocation for easy identification.",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "spartan",
                                              color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]))),
              body: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "1/",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "4",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffA0A0A0),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Business Details",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextField(
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                                // ],
                                controller: businessnamecontriller,
                                onChanged: (value) {
                                  businessnamestatus = false;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: "Business Name",
                                  hintStyle:
                                      const TextStyle(color: Color(0xff292929)),
                                  labelText: "Business Name",
                                  labelStyle: const TextStyle(
                                      fontFamily: 'spartan',
                                      color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                ),
                              ),
                            ),
                            businessnamestatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(height: 20),
                            Container(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: phoneNumbercontriller,
                                onChanged: (value) {
                                  phoneNumberStatus = false;
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  //  hintText: "+1 (514) 888-7722",hintStyle: TextStyle(color: Color(0xff292929)),
                                  labelText: "Phone Number",

                                  labelStyle: const TextStyle(
                                      fontFamily: 'spartan',
                                      color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                ),
                              ),
                            ),
                            phoneNumberStatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                  ),
                            const Divider(
                              thickness: 1,
                              color: Color(0xffCFCFCF),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text("Business location",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff292929),
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: enterYourAddresscontriller,
                              onChanged: (value) {
                                enterYourAddressStatus = false;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "Enter Your Address",
                                hintStyle:
                                    const TextStyle(color: Color(0xff000000)),
                                prefixIcon: SizedBox(
                                  width: 70,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                mapscreen = true;
                                              });
                                              print("stu==$mapscreen");
                                              // Navigator.push(context, MaterialPageRoute(
                                              //   builder: (context) {
                                              //     return locaionAllow();
                                              //   },
                                              // ));
                                            },
                                            icon: const Icon(
                                              Icons.location_on_rounded,
                                              color: Color(0xff01635D),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: VerticalDivider(
                                            color: Color(0xff707070),
                                            thickness: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                    fontFamily: 'spartan',
                                    color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                              ),
                            ),
                            enterYourAddressStatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                  ),
                            TextField(
                              controller: countrycontriller,
                              onChanged: (value) {
                                canadaStatus = false;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "Canada",
                                hintStyle:
                                    const TextStyle(color: Color(0xff414141)),
                                // prefixIcon:

                                // CountryCodePicker(
                                //   flagWidth: 25,
                                //   showCountryOnly: true,
                                //
                                //   onChanged: (obj) {
                                //     setState(() {
                                //       _countryname = obj.name.toString();
                                //       print("obj country  ${obj.name}");
                                //     });
                                //   },
                                //   initialSelection: 'CANADA',
                                //   enabled: true,
                                //   favorite: ['CANADA'],
                                //
                                //   textStyle: TextStyle(
                                //       fontSize: 10,
                                //       color: Colors.black87),
                                //
                                //
                                //   // optional. Shows only country name and flag when popup is closed.
                                // //  showOnlyCountryWhenClosed: true,
                                //   // optional. aligns the flag and the Text left
                                //   alignLeft: false,
                                // ),

                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Container(
                                //     width: 5,
                                //     height: 5,
                                //     child: Image.asset("assets/images/canada 1.png"),
                                //   ),
                                // ),
                                labelStyle: const TextStyle(
                                    fontFamily: 'spartan',
                                    color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                              ),
                            ),
                            canadaStatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                  ),
                            DropdownButtonHideUnderline(
                              child: Container(
                                height: 48,
                                width: width,
                                padding: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xff707070),
                                        width: 1)),
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
                                  items: getProvince == null
                                      ? []
                                      : (getProvince!.data ?? []).map((items) {
                                          return DropdownMenuItem(
                                            value: items.id,
                                            child: Text(
                                              items.name ?? "",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xff292929)),
                                            ),
                                          );
                                        }).toList(),
                                  value: provinceValue,
                                  onChanged: (value) {
                                    setState(() {
                                      provinceValue = value.toString();
                                      provinceStatus = true;
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
                            // TextField(
                            //   controller: provincecontriller,
                            //   onChanged: (value) {
                            //     provinceStatus = false;
                            //   },
                            //   decoration: InputDecoration(
                            //     contentPadding: const EdgeInsets.only(left: 20),
                            //     hintText: "Province",
                            //     hintStyle: const TextStyle(color: Color(0xff414141)),
                            //     labelStyle: const TextStyle(
                            //         fontFamily: 'spartan', color: Colors.black54),
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
                            provinceStatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                  ),
                            TextField(
                              controller: streetAddresscontriller,
                              onChanged: (value) {
                                streetAddressStatus = false;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "Street Address",
                                hintStyle:
                                    const TextStyle(color: Color(0xff414141)),
                                labelStyle: const TextStyle(
                                    fontFamily: 'spartan',
                                    color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                              ),
                            ),
                            streetAddressStatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                  ),
                            TextField(
                              controller: apartmentStorecontriller,
                              onChanged: (value) {
                                apartmentStoreStatus = false;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "Apartment/Store number",
                                hintStyle:
                                    const TextStyle(color: Color(0xff414141)),
                                labelStyle: const TextStyle(
                                    fontFamily: 'spartan',
                                    color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // apartmentStoreStatus
                            //     ? Container(
                            //         alignment: Alignment.topLeft,
                            //         height: 30,
                            //         child: Text(
                            //           "$status",
                            //           style: TextStyle(
                            //               fontFamily: 'spartan',
                            //               fontSize: 12,
                            //               color: Colors.red),
                            //         ),
                            //       )
                            //     : Container(
                            //         height: 15,
                            //       ),
                            Container(
                              child: TextField(
                                controller: citycontriller,
                                onChanged: (value) {
                                  cityStatus = false;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: "City",
                                  hintStyle:
                                      const TextStyle(color: Color(0xff414141)),
                                  labelStyle: const TextStyle(
                                      fontFamily: 'spartan',
                                      color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide:
                                        const BorderSide(color: Colors.black38),
                                  ),
                                ),
                              ),
                            ),
                            cityStatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                  ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: postalCodecontriller,
                              onChanged: (value) {
                                postalCodeStatus = false;
                              },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
                                hintText: "Postal Code",
                                hintStyle:
                                    const TextStyle(color: Color(0xff414141)),
                                labelStyle: const TextStyle(
                                    fontFamily: 'spartan',
                                    color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: Colors.black38),
                                ),
                              ),
                            ),
                            postalCodeStatus
                                ? Container(
                                    alignment: Alignment.topLeft,
                                    height: 30,
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                String businessName =
                                    businessnamecontriller.text;
                                String businessNumber =
                                    phoneNumbercontriller.text;
                                String address =
                                    enterYourAddresscontriller.text;
                                String country = countrycontriller.text;
                                String? province = provinceValue;
                                String street_address =
                                    streetAddresscontriller.text;
                                String apartment =
                                    apartmentStorecontriller.text;
                                String city = citycontriller.text;
                                String post_code = postalCodecontriller.text;
                                bool contactValid =
                                    RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                        .hasMatch(businessNumber);

                                setState(() {
                                  if (businessName.isEmpty) {
                                    businessnamestatus = true;
                                    provinceStatus = false;
                                    status = "Please Enter Business Name";
                                  } else if (businessNumber.isEmpty) {
                                    phoneNumberStatus = true;
                                    status = "Please Enter PhoneNumber";
                                  } else if (!contactValid) {
                                    phoneNumberStatus = true;
                                    status =
                                        "Please Enter Correct Phone Number";
                                  } else if (address.isEmpty) {
                                    enterYourAddressStatus = true;
                                    status = "Please Enter Address";
                                  } else if (country.isEmpty) {
                                    canadaStatus = true;
                                    status = "Please Enter country";
                                  } else if (provinceValue == null) {
                                    provinceStatus = true;
                                    status = "Please Enter province";
                                  } else if (street_address.isEmpty) {
                                    provinceStatus = false;
                                    streetAddressStatus = true;
                                    status = "Please Enter street address";
                                  } else if (city.isEmpty) {
                                    cityStatus = true;
                                    status = "Please Enter city";
                                  } else if (post_code.isEmpty) {
                                    postalCodeStatus = true;
                                    status = "Please Enter Post Code";
                                  } else {
                                    addBusinessDetail(
                                        businessName,
                                        businessNumber,
                                        address,
                                        country,
                                        province!,
                                        street_address,
                                        apartment,
                                        city,
                                        post_code,
                                        lat,
                                        long);
                                  }
                                });
                              },
                              child: Container(
                                width: width,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff01635D)),
                                child: Center(
                                  child: const Text(
                                    "CONTINUE",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "spartan",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
            ),
    );
  }

  Widget mapView() {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.18, //
          flexibleSpace: Container(
            color: const Color(0xff01635D),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const BussIneSSInfo();
                            },
                          ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                child: const Image(
                                  image:
                                      AssetImage("assets/images/backwhite.png"),
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Confirm that the pin\nis rightly placed",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: width,
          height: height * 0.15,
          color: Colors.white,
          child: GestureDetector(
            onTap: () async {
              getlatitude(double.parse(lat), double.parse(long));
              setState(() {
                mapscreen = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 30),
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "spartan",
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  )),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    height: height,
                    width: width,
                    child: GoogleMap(
                      zoomGesturesEnabled: true,
                      //enable Zoom in, out on map
                      // initialCameraPosition: CameraPosition( //innital position in map
                      //   target: startLocation, //initial position
                      //   zoom: 14.0, //initial zoom level
                      // ),
                      mapType: MapType.normal,
                      //map type
                      onMapCreated: (controller) {
                        //method called when map is created
                        setState(() {
                          mapController = controller;
                        });
                      },
                      // markers: Set.from(markers),
                      mapToolbarEnabled: false,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      markers: Set.from(markers),
                      initialCameraPosition: _initialLocation,
                      onCameraMove: (CameraPosition cameraPositiona) {
                        lat = cameraPositiona.target.latitude.toString();
                        long = cameraPositiona.target.longitude.toString();
                        // getlatitude(cameraPositiona.target.latitude,
                        //     cameraPositiona.target.longitude);
                        //   getlatitude(p!.latitude, p!.longitude);
                      },
                      // onCameraIdle: () {
                      //   getlatitude(p!.latitude, p!.longitude);
                      // },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset("assets/images/Maptrack.png"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 10, right: 10, bottom: 8),
                            child: textComoon("Adjust Pin", 12, Colors.white,
                                FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.2,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.location_on_rounded,
                                    color: Color(0xff707070),
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                  width: 1, color: const Color(0xffCFCFCF)),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      locality,
                                      style: const TextStyle(
                                          color: Color(0xff292929),
                                          fontFamily: "spartan",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      areaorpin,
                                      style: const TextStyle(
                                          color: Color(0xff707070),
                                          fontFamily: "spartan",
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> addBusinessDetail(
      String businessName,
      String businessNumber,
      String address,
      String country,
      String province,
      String street_address,
      String apartment,
      String city,
      String post_code,
      String lat,
      String long) async {
    try {
      Loader.show(context,
          isSafeAreaOverlay: false,
          overlayColor: Colors.black26,
          progressIndicator: const CircularProgressIndicator(
              backgroundColor: Color(0xffDD6A03)),
          themeData: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: const Color(0xff01635D))));
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
            "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };
      var bodydata = {
        'businessName': businessName,
        'businessNumber': businessNumber,
        'address': address,
        'country': country,
        'province': province,
        'street_address': street_address,
        'apartment': apartment,
        'city': city,
        'post_code': post_code,
        'coordinates': [lat, long],
      };
      var responce = await http.post(
        Uri.parse(ApiUrlList.addBusinessDetail),
        body: jsonEncode(bodydata),
        headers: headers,
      );
      var map = jsonDecode(responce.body.toString());
      print("statuscode ${responce.statusCode}");
      print("body${responce.body}");
      if (responce.statusCode == 200) {
        addBusinessDetailModel = AddBusinessDetailModel.fromJson(map);
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const bussinessInfoCATEGORY();
          },
        ));
      } else if (responce.statusCode == 401) {
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) {
            return signInScreen();
          },
        ), (route) => false);
      } else {
        Fluttertoast.showToast(
            msg: "${map['message']}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      Loader.hide();
    }
  }

  getProvinceData() async {
    getProvince = await addressService.getProvince();
    isLoading = false;
    setState(() {});
  }
}

class AddBusinessDetailModel {
  int? status;
  bool? success;
  String? message;

  AddBusinessDetailModel({this.status, this.success, this.message});

  AddBusinessDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
