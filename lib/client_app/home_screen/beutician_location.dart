import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/search_screen.dart';

import '../../utils/app_colors.dart';

// ignore: must_be_immutable
class BeuticianLocation extends StatefulWidget {
  List<ServiceDModel> placesList;
  double lat;
  double long;

  BeuticianLocation(
      {Key? key,
      required this.placesList,
      required this.lat,
      required this.long})
      : super(key: key);

  @override
  State<BeuticianLocation> createState() => _BeuticianLocationState();
}

class _BeuticianLocationState extends State<BeuticianLocation> {
  Position? p;
  String lat = "";
  String long = "";

  ServiceDModel? selectedPlace;
  bool showSelectedLoc = false;

  double? lati, longi;
  GoogleMapController? mapController;
  Iterable markers = [];

  // List updatedList = [];

  late CameraPosition _initialLocation;

  locationLatLng() {
    List markersList = [];
    for (int index = 0; index < widget.placesList.length; index++) {
      if (widget.placesList[index].location == null) {
        widget.placesList.removeAt(index);
      } else {}
    }

    log("placesList len : ${widget.placesList.length}");

    for (int index = 0; index < widget.placesList.length; index++) {
      log("id ===> ${widget.placesList[index].id}");
      log("Latitude ====> ${widget.placesList[index].location!.coordinates[0]}");
      log("Longitude ===> ${widget.placesList[index].location!.coordinates[1]}");
      log("type ===> ${widget.placesList[index].location!.type}");
      if (widget.placesList[index].location != null &&
          widget.placesList[index].location!.coordinates[0] != null &&
          widget.placesList[index].location!.coordinates[1] != null) {
        markersList.add(
          Marker(
            onTap: () {
              // updatedList.clear();

              setState(() {
                selectedPlace = widget.placesList[index];
                showSelectedLoc = !showSelectedLoc;
              });

              // lati = widget.placesList[index].location!.coordinates[1];
              // longi = widget.placesList[index].location!.coordinates[0];
              // if (lati == widget.placesList[index].location!.coordinates[1] &&
              //     longi == widget.placesList[index].location!.coordinates[0]) {
              //   updatedList.add(widget.placesList[index]);
              //   log(updatedList);
              // }
            },
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return services(
            //       beauticianId: widget.placesList[index].id,
            //       businessName: widget.placesList[index].businessName,
            //     );
            //   },));
            // },
            markerId: MarkerId(widget.placesList[index].id),
            position: LatLng(
              widget.placesList[index].location!.coordinates[1],
              widget.placesList[index].location!.coordinates[0],
            ),
            infoWindow: InfoWindow(
              title: widget.placesList[index].businessName,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return services(
                      beauticianId: widget.placesList[index].id,
                      businessName: widget.placesList[index].businessName,
                    );
                  },
                ));
              },
            ),
          ),
        );
      }
    }
    setState(() {
      markers = markersList;
    });
    log("markers : ${markers.length}");
  }

  @override
  void initState() {
    log("Data :: ${widget.placesList}");
    _initialLocation =
        CameraPosition(target: LatLng(widget.lat, widget.long), zoom: 20);
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
      body: SafeArea(
        child: Stack(
          children: [
            //g map
            GoogleMap(
              onTap: (latLng) {
                lat = latLng.latitude.toString();
                long = latLng.longitude.toString();
                log(lat);
                log(long);
              },
              initialCameraPosition: _initialLocation,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.terrain,
              // zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              compassEnabled: true,
              rotateGesturesEnabled: false,
              markers: Set.from(markers),
            ),
            //back button
            Positioned(
              left: 12,
              top: 15,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.blackColor,
                    size: 24,
                  ),
                ),
              ),
            ),
            bottomHorizontalLocationList(height, width),

            Positioned(
              right: 15,
              bottom: 115,
              child: GestureDetector(
                onTap: () {
                  //open bottom sheet
                  showBottomPlacesListSheet(height, width);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryOrangeColor,
                  ),
                  child: Icon(
                    Icons.list_rounded,
                    color: AppColors.whiteColor,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBottomPlacesListSheet(height, width) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Container(
          height: height * 0.65,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 65,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ],
              ),
              Text(
                "Nearby Places",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "spartan",
                ),
              ),
              Text(
                "Found ${widget.placesList.length} places near you",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: "spartan",
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: AppColors.greyColor.withOpacity(0.6),
                height: 20,
                thickness: 1,
              ),
              // SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: widget.placesList.length,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.greyColor.withOpacity(0.6),
                      height: 20,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return services(
                                beauticianId: widget.placesList[index].id,
                                businessName:
                                    widget.placesList[index].businessName,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: widget.placesList[index].logoPath,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                padding: const EdgeInsets.all(10),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                ),
                                margin: const EdgeInsets.all(5),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, process) => Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.all(5),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: AppColors.greyColor.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                margin: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.error),
                                      SizedBox(height: 10),
                                      const Text("No Image")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${widget.placesList[index].businessName}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "spartan",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      if (widget.placesList[index].isLicensed ==
                                          "1")
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Image.asset(
                                            "assets/images/Subtract (1).png",
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      if (widget.placesList[index].hasShop == 0)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Image.asset(
                                            "assets/images/independentmen.png",
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      // Spacer(),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  widget.placesList[index].address.isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          "${widget.placesList[index].address[0].apartment} ${widget.placesList[index].address[0].city} ${widget.placesList[index].address[0].zipCode}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontFamily: "spartan",
                                          ),
                                        ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/Map pin.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "${widget.placesList[index].dis.calculated.toStringAsFixed(2)}Km",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      // Spacer(),
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       height: height * 0.02,
                                  //       child: const Image(
                                  //           image: AssetImage(
                                  //               "assets/images/Star 1.png")),
                                  //     ),
                                  //     const SizedBox(
                                  //       width: 5,
                                  //     ),
                                  //     Container(
                                  //       alignment:
                                  //           Alignment.topLeft,
                                  //       child: const Text(
                                  //           "4.0 Ratings",
                                  //           style: TextStyle(
                                  //               color: Colors
                                  //                   .black,
                                  //               fontSize: 14,
                                  //               fontFamily:
                                  //                   "spartan")),
                                  //     ),
                                  //     const SizedBox(
                                  //       width: 5,
                                  //     ),
                                  //     Container(
                                  //       alignment:
                                  //           Alignment.topLeft,
                                  //       child: const Text(
                                  //           "120reviews",
                                  //           style: TextStyle(
                                  //               color: Colors
                                  //                   .grey,
                                  //               fontSize: 14,
                                  //               fontFamily:
                                  //                   "spartan")),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bottomHorizontalLocationList(height, width) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: ListView.separated(
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(bottom: 35, left: 15, right: 15, top: 10),
          itemCount: widget.placesList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return services(
                        beauticianId: widget.placesList[index].id,
                        businessName: widget.placesList[index].businessName,
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                // height: 260,
                width: width * 0.78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor.withOpacity(0.12),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.placesList[index].logoPath,
                      imageBuilder: (context, imageProvider) => Container(
                        padding: const EdgeInsets.all(10),
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                        margin: const EdgeInsets.all(5),
                      ),
                      progressIndicatorBuilder: (context, url, process) =>
                          Container(
                              height: 125,
                              width: double.infinity,
                              margin: const EdgeInsets.all(5),
                              child: const Center(
                                  child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) => Container(
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error),
                              SizedBox(height: 10),
                              const Text("No Image")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${widget.placesList[index].businessName}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              if (widget.placesList[index].isLicensed == "1")
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Image.asset(
                                    "assets/images/Subtract (1).png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              if (widget.placesList[index].hasShop == 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Image.asset(
                                    "assets/images/independentmen.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(height: 5),
                          widget.placesList[index].address.isEmpty
                              ? const SizedBox()
                              : Text(
                                  "${widget.placesList[index].address[0].apartment} ${widget.placesList[index].address[0].city} ${widget.placesList[index].address[0].zipCode}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "spartan",
                                  ),
                                ),
                          const SizedBox(height: 5),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       height: height * 0.02,
                          //       child: const Image(
                          //           image: AssetImage(
                          //               "assets/images/Star 1.png")),
                          //     ),
                          //     const SizedBox(
                          //       width: 5,
                          //     ),
                          //     Container(
                          //       alignment:
                          //           Alignment.topLeft,
                          //       child: const Text(
                          //           "4.0 Ratings",
                          //           style: TextStyle(
                          //               color: Colors
                          //                   .black,
                          //               fontSize: 14,
                          //               fontFamily:
                          //                   "spartan")),
                          //     ),
                          //     const SizedBox(
                          //       width: 5,
                          //     ),
                          //     Container(
                          //       alignment:
                          //           Alignment.topLeft,
                          //       child: const Text(
                          //           "120reviews",
                          //           style: TextStyle(
                          //               color: Colors
                          //                   .grey,
                          //               fontSize: 14,
                          //               fontFamily:
                          //                   "spartan")),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
