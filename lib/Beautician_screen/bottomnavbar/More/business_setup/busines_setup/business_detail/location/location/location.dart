import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/location/edit_location/edit_location.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/move_to_settings_all/yourprofile/Yourprofile_onescreen.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/models/getLoactionDetailsModel.dart';
import 'package:new_sliikeapps_apps/services/address_service.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  late BitmapDescriptor myIcon;
  bool isLoading = true;
  String address = "";
  String city = "";
  String province = "";
  String postalCode = "";
  String country = "";
  String latitude = "38.9647";
  String longitude = "35.123";
  bool method = false;
  int selectedRadio = 1;
  AddressService addressService = AddressService();
  CameraPosition _initialLocation =
      CameraPosition(target: showLocation, zoom: 10);
  late GoogleMapController mapController;
  static LatLng showLocation = LatLng(25.2048493, 55.2707828);
  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      showLocation = LatLng(double.parse(latitude), double.parse(longitude));
      _initialLocation = CameraPosition(target: showLocation, zoom: 10);
      markers.add(Marker(
        markerId: MarkerId(""),
        position: LatLng(double.parse(latitude), double.parse(longitude)),
        icon: myIcon,
      ));
    });
  }

  void _updateMarker() {
    var newlatlang = LatLng(double.parse(latitude), double.parse(longitude));
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(
              size: Size(10.0, 20.0),
              devicePixelRatio: 2,
            ),
            'assets/images/map_pin.png')
        .then((onValue) {
      myIcon = onValue;
    });
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: newlatlang, zoom: 10)));
    markers.add(Marker(
      markerId: MarkerId(""),
      position: LatLng(double.parse(latitude), double.parse(longitude)),
      icon: myIcon,
    ));
    setState(() {});
  }

  List<Marker> markers = <Marker>[];
  late GoogleMapController controller;
  GetLocationDetailsData? getLocationDetailsData;
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    print(Helper.prefs!.getString(UserPrefs.keyutoken));
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(
              size: Size(10, 20),
              devicePixelRatio: 1,
            ),
            'assets/images/map_pin.png')
        .then(
      (onValue) {
        myIcon = onValue;
      },
    );
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
                        width: width * 0.25,
                      ),
                      Container(
                        child: Text("Location",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.025,
            ),
            textComoon("Location", 16, Colors.black, FontWeight.w700),
            SizedBox(
              height: height * 0.02,
            ),

            ///Google Maps ///
            SizedBox(
              height: height * 0.35,
              width: width,
              child: GoogleMap(
                onMapCreated: onMapCreated,
                onTap: (latLng) {},
                mapToolbarEnabled: false,
                initialCameraPosition: _initialLocation,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                markers: Set<Marker>.of(markers),
              ),
            ),
            // GestureDetector(onTap: (){
            //
            // },
            //   child: Container(
            //     height: height*0.25,
            //     width: width,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage("assets/images/mapimg.png"),fit: BoxFit.fill,
            //       )
            //     ),
            //   ),
            // ),
            SizedBox(
              height: height * 0.04,
            ),
            if (getLocationDetailsData?.data != null)
              Column(
                children: [
                  Container(
                    // height: height*0.17,
                    width: width,
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffE7E7E7), width: 1),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 15, left: 10),
                      child: Row(
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    textComoon("Address:", 12,
                                        Color(0xff000000), FontWeight.w600),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    textComoon("$address", 12,
                                        Color(0xff707070), FontWeight.w600),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    textComoon("City:", 12, Color(0xff000000),
                                        FontWeight.w600),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    textComoon("$city", 12, Color(0xff707070),
                                        FontWeight.w600),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    textComoon("State/province/area:", 12,
                                        Color(0xff000000), FontWeight.w600),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        width: width * 0.2,
                                        child: textComoon(
                                            "British Col",
                                            12,
                                            Color(0xff707070),
                                            FontWeight.w600)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    textComoon("Postal Code:", 12,
                                        Color(0xff000000), FontWeight.w600),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    textComoon("$postalCode", 12,
                                        Color(0xff707070), FontWeight.w600),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    textComoon("Country:", 12,
                                        Color(0xff000000), FontWeight.w600),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    textComoon("$country", 12,
                                        Color(0xff707070), FontWeight.w600),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return edit_Location(
                                    address: getLocationDetailsData!
                                        .data![0].address![0].address!,
                                    city: getLocationDetailsData!
                                        .data![0].address![0].city!,
                                    country: getLocationDetailsData!
                                        .data![0].country!,
                                    pin: getLocationDetailsData!
                                        .data![0].address![0].zipCode!,
                                    province: getLocationDetailsData!
                                        .data![0].address![0].province!.id!,
                                    lat: getLocationDetailsData!
                                        .data![0].location!.coordinates![1]
                                        .toString(),
                                    long: getLocationDetailsData!
                                        .data![0].location!.coordinates![0]
                                        .toString(),
                                  );
                                },
                              )).then((value) {
                                getLocationData();
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Color(0xff01635D),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                    "assets/images/righticon.png",
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: height * 0.01,
            ),
            Divider(
              thickness: 1,
              color: Color(0xffCFCFCF),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            textComoon(
                "What’s your profile?", 14, Colors.black, FontWeight.w700),
            SizedBox(
              height: height * 0.015,
            ),
            if (getLocationDetailsData?.data != null)
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => yourProfile_One(
                          hasShop: getLocationDetailsData!.data![0].hasShop,
                          isServe:
                              getLocationDetailsData!.data![0].isServeAtClient,
                          isOwn: getLocationDetailsData!
                              .data![0].isServeAtOwnPlace,
                        ),
                      )).then((value) {
                    getLocationData();
                  });
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xffA0A0A0), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          activeColor: Color(0xff01635D),
                          onChanged: (value) {
                            selectedRadio = value as int;
                          },
                        ),
                        Text(
                          getLocationDetailsData!.data![0].hasShop == 0
                              ? "I am independent"
                              : "I own a salon",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff292929),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
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
          ],
        ),
      ),
    );
  }

  getLocationData() async {
    getLocationDetailsData = await addressService.getLocationDetails();
    isLoading = false;
    address = getLocationDetailsData!.data![0].address![0].address!;
    city = getLocationDetailsData!.data![0].address![0].city!;
    province = getLocationDetailsData!.data![0].address![0].province!.name!;
    postalCode = getLocationDetailsData!.data![0].address![0].zipCode!;
    country = getLocationDetailsData!.data![0].country!;
    longitude =
        getLocationDetailsData!.data![0].location!.coordinates![0].toString();
    latitude =
        getLocationDetailsData!.data![0].location!.coordinates![1].toString();
    print(latitude);
    print(longitude);
    setState(() {});
    _updateMarker();
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
      Position p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await getlatitude(p.latitude, p.longitude);
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getlatitude(double lat, double long) async {
    Loader.show(context,
        isSafeAreaOverlay: false,
        overlayColor: Colors.black26,
        progressIndicator:
            const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
        themeData: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xff01635D))));
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    Placemark places = placemarks[0];

    print(places);
    latitude = lat.toString();
    longitude = long.toString();
    province = "${places.subLocality}";
    address = "${places.street}";
    country = "${places.country}";
    city = "${places.locality}";
    postalCode = "${places.postalCode}";
    isLoading = false;
    setState(() {});
    Loader.hide();
  }
}
