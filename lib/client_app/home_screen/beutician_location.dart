import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';

class BeuticianLocation extends StatefulWidget {
  List locationData;
  double lat;
  double long;

   BeuticianLocation({Key? key,required this.locationData, required this.lat, required this.long}) : super(key: key);

  @override
  State<BeuticianLocation> createState() => _BeuticianLocationState();
}

class _BeuticianLocationState extends State<BeuticianLocation> {

  Position? p;
  String lat = "";
  String long = "";
  double? lati, longi;
  GoogleMapController? mapController;
  Iterable markers = [];

  late CameraPosition _initialLocation;

  locationLatLng(){
    List marker = [];
    for(int index =0 ;index<widget.locationData.length; index++) {
      if(widget.locationData[index].location==null) {
        widget.locationData.removeAt(index);
      } else {
      }
    }
    print(widget.locationData.length);
    for(int index = 0 ;index<widget.locationData.length; index++) {
      print("id ===> ${widget.locationData[index].id}");
      print("Latitude ====> ${widget.locationData[index].location.coordinates[0]}");
      print("Longitude ===> ${widget.locationData[index].location.coordinates[1]}");
      print("type ===> ${widget.locationData[index].location.type}");
      if(widget.locationData[index].location!=null && widget.locationData[index].location.coordinates!=null && widget.locationData[index].location.coordinates[0]!=null && widget.locationData[index].location.coordinates[1]!=null) {
        marker.add(Marker(
            markerId: MarkerId(widget.locationData[index].id),
            position: LatLng(
              widget.locationData[index].location.coordinates[1],
              widget.locationData[index].location.coordinates[0],
            ),
            infoWindow: InfoWindow(title: widget.locationData[index].location.type)
        ));
      }
    }
    setState(() {
      markers = marker;
    });
    print("1111");
    print("markers ${markers.length}");
  }

  @override
  void initState() {
      _initialLocation = CameraPosition(target: LatLng(widget.lat, widget.long),zoom: 20);
      locationLatLng();
    super.initState();
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
      body: Stack(
        children: [
          SizedBox(
            height: height,
            child: GoogleMap(
              onTap: (latLng) {
                lat = latLng.latitude.toString();
                long = latLng.longitude.toString();
              },
              mapToolbarEnabled: false,
              initialCameraPosition: _initialLocation,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              markers: Set.from(markers),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
              child: Image.asset("assets/images/Bach Arrow.png",height: 120,)
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
            height: height * 0.31,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              itemCount: widget.locationData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return services(
                        beauticianId: widget.locationData[index].id,
                        businessName: widget.locationData[index].businessName,
                      );
                    },));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: height * 0.18,
                            width: width * 0.6,
                            decoration: BoxDecoration(
                                // image: const DecorationImage(
                                //     image: AssetImage("assets/images/Rectangle 865.png"),
                                //     fit: BoxFit.fill
                                // ),
                                borderRadius: BorderRadius.circular(8)),
                            margin: const EdgeInsets.all(5),
                            child: const Text("No Image Found"),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment:
                                            Alignment.topLeft,
                                        child: Text(
                                            "${widget.locationData[index].businessName}",
                                            style: const TextStyle(
                                                color: Colors
                                                    .black,
                                                fontSize: 18,
                                                fontFamily:
                                                    "spartan",
                                                fontWeight:
                                                    FontWeight
                                                        .w600)),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        child: const Image(
                                            image: AssetImage("assets/images/Subtract (1).png")),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  widget.locationData[index].address.isEmpty
                                      ? const SizedBox()
                                      :Text(
                                      "${widget.locationData[index].address[0].apartment} ${widget.locationData[index].address[0].province} ${widget.locationData[index].address[0].city} ${widget.locationData[index].address[0].zipCode}",
                                      style: const TextStyle(
                                          color:
                                              Colors.black,
                                          fontSize: 12,
                                          fontFamily:
                                              "spartan")),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: height * 0.02,
                                        child: const Image(
                                            image: AssetImage(
                                                "assets/images/Star 1.png")),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        alignment:
                                            Alignment.topLeft,
                                        child: const Text(
                                            "4.0 Ratings",
                                            style: TextStyle(
                                                color: Colors
                                                    .black,
                                                fontSize: 14,
                                                fontFamily:
                                                    "spartan")),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        alignment:
                                            Alignment.topLeft,
                                        child: const Text(
                                            "120reviews",
                                            style: TextStyle(
                                                color: Colors
                                                    .grey,
                                                fontSize: 14,
                                                fontFamily:
                                                    "spartan")),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            ),
          )
        ],
      ),
    );
  }
}
