import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/location/location/location.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

const kGoogleApiKey = "AIzaSyCziqe1Q-d4HMC3D9ZyYDFkBtx8ZHrzGzM";

class edit_Location extends StatefulWidget {
  final List<dynamic> data;
  const edit_Location({Key? key, required this.data}) : super(key: key);

  @override
  State<edit_Location> createState() => _edit_LocationState();
}

class _edit_LocationState extends State<edit_Location> {
  TextEditingController Address = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Province = TextEditingController();
  TextEditingController PostalCode = TextEditingController();
  TextEditingController Country = TextEditingController();
  bool method = false;
  bool Addressstatus = false;
  bool Citystatus = false;
  bool Provincestatus = false;
  bool PostalCodestatus = false;
  bool Countrystatus = false;
  String status = "";
  String latitude = "";
  String longitude = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Province.text = widget.data[4];
    Address.text = widget.data[2];
    Country.text = widget.data[6];
    City.text = widget.data[3];
    PostalCode.text = widget.data[5];
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
      body: SingleChildScrollView(
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
                Container(
                  child: TextField(
                    controller: Province,
                    style: TextStyle(color: Color(0xff292929),fontSize: 16,fontFamily: "spartan",fontWeight: FontWeight.w500),
                    onChanged: (value) {
                      Provincestatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Province",
                      labelText: "Province",
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
                  Navigator.pop(context,[Address.text,City.text,Province.text,PostalCode.text,Country.text,latitude,longitude]);
                    // Navigator.push(context,MaterialPageRoute(builder: (context) {
                    //   return location();
                    // },));
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       alignment: Alignment.center,
                    //       insetPadding: EdgeInsets.symmetric(
                    //         horizontal: 30,),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //           BorderRadius.all(Radius.circular(20))),
                    //       title: StatefulBuilder(
                    //         builder: (context, setState) {
                    //           return Padding(
                    //             padding: const EdgeInsets.only(top: 50,bottom: 50),
                    //             child: Column(
                    //               children: <Widget>[
                    //                 Container(
                    //                   height: height*0.1,
                    //                   // width: tw*0.2,
                    //                   child: Image(image: AssetImage("assets/images/Group 12079.png")),
                    //                 ),
                    //                 SizedBox(height: 20,),
                    //                 textComoon("Location Successfully Updated", 12,Colors.black, FontWeight.w700),
                    //
                    //               ],
                    //             ),
                    //           );
                    //         },
                    //       ),
                    //     );
                    //   },
                    // );
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
