// ignore: duplicate_ignore
// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class locaionAllow extends StatefulWidget {
  const locaionAllow({Key? key}) : super(key: key);

  @override
  State<locaionAllow> createState() => _locaionAllowState();
}

class _locaionAllowState extends State<locaionAllow> {
  Position? p;
  String lat = "";
  String long = "";
  double? lati, longi;
  GoogleMapController? mapController;

  CameraPosition _initialLocation =
      CameraPosition(target: startLocation, zoom: 20);

  static LatLng startLocation =
      const LatLng(41.3326643802986, 19.8263257802456);
  String tempsadress = "";
  String tempscountry = "";
  String tempsprovince = "";
  String tempsstreetadress = "";
  String tempslocation = "Location Name:";
  String tempsaprtmentnumber = "";
  String tempscity = "";
  String tempspostalcode = "";
  String tempslatitude = "";
  String tempslogitude = "";

  String citypostlcode = "";

  @override
  void initState() {
    // TODO: implem
    //
    //  ent initState
    super.initState();
    getLocation();
  }
  getlatitude(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat,long);
    Placemark places = placemarks[0];
    //get pl// ace name from lat and lang
      print("placemarks---$placemarks");

      tempsadress =
      "${places.country}Street Address===${places.street}City===${places.locality}\tsubAdministrativeArea===${places.subAdministrativeArea}\tpostalCode===${places.postalCode}\tsubLocality===${places.subLocality}\t${places.name}\t${places.subThoroughfare}";
      citypostlcode =
      "${placemarks.first.subAdministrativeArea},${placemarks.first.postalCode}";
      tempscountry = "${placemarks.first.country}";
      tempslocation = places.administrativeArea.toString();
      tempsstreetadress = places.street.toString();
      tempscity = places.locality.toString();
      tempspostalcode = places.postalCode.toString();

  }


  final Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // ignore: unrelated_type_equality_checks
    if (serviceEnabled == LocationPermission.denied) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("getcurrentlocation=$p");
      lati = p!.latitude;
      longi = p!.longitude;
      lat = p!.latitude.toString();
      long = p!.longitude.toString();
      print("///lat${p!.latitude}");
      print("///long${p!.longitude}");
      startLocation = LatLng(lati!, longi!);

      print("startLocation==$startLocation");
      print("startLocation==$startLocation");
      // showLocation =  LatLng(lati!, longi!);
      _initialLocation = CameraPosition(target: startLocation, zoom: 20);
      print(" _initialLocation=$_initialLocation");
       getlatitude(p!.latitude,p!.longitude);
      setState(() {});

    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
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
                          Navigator.pop(context);
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
              var prefs = await SharedPreferences.getInstance();
              // prefs.setString(UserPrefs.keybusinessName,);
              // prefs.setString(UserPrefs.keybusinessNumber, businessNumber);
              prefs.setString(UserPrefs.keyaddress, tempsadress);
              prefs.setString(UserPrefs.keycountry, tempscountry);
              prefs.setString(UserPrefs.keyprovince, tempsprovince);
              prefs.setString(UserPrefs.keystreet_address, tempsstreetadress);
              prefs.setString(UserPrefs.keyapartment, tempsaprtmentnumber);
              prefs.setString(UserPrefs.keycity, tempscity);
              prefs.setString(UserPrefs.keypost_code, tempspostalcode);
              prefs.setString(UserPrefs.keylalatitude, lat);
              prefs.setString(UserPrefs.keylongitude, long);
              var valuestorebusineadress =
                  prefs.getString(UserPrefs.keyaddress) ?? "";
              var v2 = prefs.getString(UserPrefs.keycountry) ?? "";

              print("v1=====$valuestorebusineadress");
              print("v2=====$v2");

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return BussIneSSInfo();
              //   },
              // ));
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
                      onMapCreated: (controller) {
                        setState(() {
                          mapController = controller;
                        });
                      },
                      mapToolbarEnabled: false,
                      initialCameraPosition: _initialLocation,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      zoomGesturesEnabled: true,
                      polylines: Set<Polyline>.of(polylines.values),
                      markers: Set.from(markers),

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
                                Text(
                                  tempsstreetadress,
                                  style: const TextStyle(
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  citypostlcode,
                                  style: const TextStyle(
                                      color: Color(0xff707070),
                                      fontFamily: "spartan",
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
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
}
