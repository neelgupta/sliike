import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/edit_location.dart';

class NearYou extends StatefulWidget {
  const NearYou({Key? key}) : super(key: key);

  @override
  State<NearYou> createState() => _NearYouState();
}

class _NearYouState extends State<NearYou> {
  String address = "";
  String city = "";
  String province = "";
  String postalCode = "";
  String country = "";
  String latitude = "";
  String longitude = "";
  bool isLoading = true;

  bool isLocationEnable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
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
          color: const Color(0xffF5F7F7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Container(
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                child: const Image(
                                  image: AssetImage("assets/images/cancel.png"),
                                  color: Color(0xff414141),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: width / 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: const Text("Near You",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
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
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  textComoon("Current Location", 14, const Color(0xff111111),
                      FontWeight.w600),
                  SizedBox(height: height * 0.025),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: 1,
                  //   itemBuilder: (context, index) {
                  //     return
                  //   },
                  // ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFAFAFA),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffE7E7E7),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textComoon(
                                    "Address :  ",
                                    12,
                                    const Color(0xff111111),
                                    FontWeight.w600,
                                  ),
                                  Expanded(
                                    child: Text(
                                      address,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: const Color(0xff707070),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  textComoon(
                                    "City :  ",
                                    12,
                                    const Color(0xff111111),
                                    FontWeight.w600,
                                  ),
                                  textComoon(
                                    city,
                                    12,
                                    const Color(0xff707070),
                                    FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  textComoon(
                                    "State/province/area :  ",
                                    12,
                                    const Color(0xff111111),
                                    FontWeight.w600,
                                  ),
                                  Flexible(
                                    child: textComoon(
                                      province,
                                      // "British Col",
                                      12,
                                      const Color(0xff707070),
                                      FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  textComoon("Postal Code :  ", 12,
                                      const Color(0xff111111), FontWeight.w600),
                                  textComoon(
                                    postalCode,
                                    12,
                                    const Color(0xff707070),
                                    FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  textComoon("Country :  ", 12,
                                      const Color(0xff111111), FontWeight.w600),
                                  textComoon(
                                    country,
                                    12,
                                    const Color(0xff707070),
                                    FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  List data = [
                                    latitude,
                                    longitude,
                                    address,
                                    city,
                                    province,
                                    postalCode,
                                    country
                                  ];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return editLocation(
                                          data: data,
                                        );
                                      },
                                    ),
                                  ).then((value) {
                                    print(value);
                                    if (value != null) {
                                      setState(() {
                                        latitude = value[0];
                                        longitude = value[1];
                                        address = value[2];
                                        city = value[3];
                                        province = value[4];
                                        postalCode = value[5];
                                        country = value[6];
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  height: height * 0.06,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffDD6A03),
                                  ),
                                  child: Center(
                                    child: Container(
                                        padding: const EdgeInsets.all(4),
                                        child: const Image(
                                          image: AssetImage(
                                              "assets/images/righticon.png"),
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ),
                              // Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  // InkWell(
                  //   onTap: (){
                  //
                  //   },
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     width: width,
                  //     height: height * 0.06,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5),
                  //         color: const Color(0xffDD6A03)),
                  //     child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         const SizedBox(
                  //             height: 20,
                  //             child: Image(
                  //               image:
                  //               AssetImage("assets/images/loctionicon.png"),
                  //
                  //             )),
                  //         SizedBox(width: width*0.1,),
                  //         textComoon("ADD NEW LOCATION", 12,Colors.white,
                  //             FontWeight.w600),
                  //       ],
                  //     ),
                  //   ),
                  // )
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, [latitude, longitude, address]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffDD6A03)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textComoon("SAVE", 12, Colors.white, FontWeight.w600),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  getLocation() async {
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
      setState(() {
        isLocationEnable = false;
        isLoading = false;
      });
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          isLocationEnable = false;
          isLoading = false;
        });
        Navigator.pop(context);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      setState(() {
        isLocationEnable = false;
        isLoading = false;
      });
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      isLocationEnable = true;
      await getlatitude(p.latitude, p.longitude);
    }
  }

  getlatitude(double lat, double long) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
          const CircularProgressIndicator(backgroundColor: Color(0xffDD6A03)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff01635D),
        ),
      ),
    );
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
