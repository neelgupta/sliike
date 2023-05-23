// ignore_for_file: camel_case_types
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import '../../Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

const kGoogleApiKey = "AIzaSyCziqe1Q-d4HMC3D9ZyYDFkBtx8ZHrzGzM";

class editLocation extends StatefulWidget {
  final List<dynamic> data;
  const editLocation({Key? key, required this.data}) : super(key: key);

  @override
  State<editLocation> createState() => _editLocationState();
}

class _editLocationState extends State<editLocation> {
  TextEditingController adress=TextEditingController();
  TextEditingController city=TextEditingController();
  TextEditingController pravince=TextEditingController();
  TextEditingController postalcode=TextEditingController();
  TextEditingController country=TextEditingController();
  String latitude = "";
  String longitude = "";
  bool adressstatus = false;
  bool citystatus = false;
  bool pravincestatus = false;
  bool postalcodestatus = false;
  bool countrystatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pravince.text = widget.data[4];
    adress.text = widget.data[2];
    country.text = widget.data[6];
    city.text = widget.data[3];
    postalcode.text = widget.data[5];
    latitude = widget.data[0];
    longitude = widget.data[1];
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
                            padding: const EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image:
                                    AssetImage("assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width/6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: const Text("Current Location",
                                  textAlign: TextAlign.center,
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    SizedBox(height: height*0.02,),
                textComoon("Edit Location", 14, const Color(0xff292929),
                    FontWeight.w700),
                SizedBox(height: height*0.04,),
                TextField(
                  controller: adress,
                  readOnly: true,
                  onTap: () async {
                      _handlePressButton();
                  },
                  onChanged: (value) {
                    setState(() {
                      adressstatus=false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Address",
                    labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Color(0xff292929)),
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
                SizedBox(height: height*0.025,),
                TextField(
                  controller: city,
                  readOnly: true,
                  onChanged: (value) {
                    setState(() {
                      citystatus=false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "city",
                    labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Color(0xff292929)),
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
                SizedBox(height: height*0.025,),
                TextField(
                  controller: pravince,
                  readOnly: true,
                  onChanged: (value) {
                    setState(() {
                      pravincestatus=false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Province",
                    labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Color(0xff292929)),
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
                SizedBox(height: height*0.025,),
                TextField(
                  controller: postalcode,
                  readOnly: true,
                  onChanged: (value) {
                    setState(() {
                      postalcodestatus=false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Postal Code",
                    labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Color(0xff292929)),
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
                SizedBox(height: height*0.025,),
                TextField(
                  controller: country,
                  readOnly: true,
                  onChanged: (value) {
                    setState(() {
                      countrystatus=false;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Country",
                    labelStyle:
                    const TextStyle(fontFamily: 'spartan', color: Color(0xff292929)),
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
                const Spacer(),
                commonButtonorange(context,"SAVE", 12, FontWeight.w600, Colors.white, () {
                  Navigator.pop(context,[adress.text,city.text,pravince.text,postalcode.text,country.text,latitude,longitude]);
                })
              ],
            ),
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
    pravince.text = "${places.subLocality}";
    adress.text = "${places.street}";
    country.text = "${places.country}";
    city.text = "${places.locality}";
    postalcode.text = "${places.postalCode}";
    latitude = lat.toString();
    longitude = long.toString();
    setState(() {});
    Loader.hide();
  }
}
