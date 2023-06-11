import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/services.dart';
import 'package:new_sliikeapps_apps/client_model/get_favorite_list_model.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:http/http.dart' as http;

class MyFavoritesViewAll extends StatefulWidget {
  const MyFavoritesViewAll({Key? key}) : super(key: key);

  @override
  State<MyFavoritesViewAll> createState() => _MyFavoritesViewAllState();
}

class _MyFavoritesViewAllState extends State<MyFavoritesViewAll> {

  bool isLoading = false;
  FavoriteListModel ? f;
  List<FavoritesData> favoritelist = [];
  String favoritesId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClientFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: isLoading ? const Center(child: CircularProgressIndicator(color: Color(0xffDD6A03),),)
          :Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: height*0.055,
                      width: width*0.05,
                      child: const Image(image: AssetImage("assets/images/Vector (1).png"),),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: height*0.05,
                    width: width*0.8,
                    child: const Text("My Favorites",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              height: height * 0.85,
              width: width,
              child: favoritelist.isEmpty
                  ? const Center(
                child: Text(
                  "No Favourite Products",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "spartan",
                  ),
                ),
              ) : ListView.builder(
                itemCount: favoritelist.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  favoritesId = favoritelist[index].id!;
                  print(
                      "listId ======> $favoritesId");
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return services(
                                  beauticianId:
                                  favoritelist[
                                  index]
                                      .id!);
                            }),
                      );
                      print("selectedFavoritesId ======> ${favoritelist[index].id!}");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width,
                            alignment: Alignment.center,
                            child: CachedNetworkImage(
                              imageUrl: favoritelist[index].logoPath ?? '',
                              imageBuilder: (context, imageProvider) => Container(
                                padding:
                                const EdgeInsets.all(10),
                                height: height * 0.18,
                                width: width * 0.6,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    image: DecorationImage(image: imageProvider,fit: BoxFit.fill)
                                ),
                                margin: const EdgeInsets.all(5),
                              ),
                              progressIndicatorBuilder: (context, url, process) => Container(
                                  height: height * 0.18,
                                  width: width * 0.6,
                                  margin: const EdgeInsets.all(5),
                                  child: const Center(child: CircularProgressIndicator())
                              ),
                              errorWidget: (context, url, error) => Container(
                                  height: height * 0.18,
                                  width: width * 0.6,
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: Center(child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.error),
                                      SizedBox(height: height*0.02,),
                                      const Text("No Image")
                                    ],
                                  ))
                              ),
                            ),
                          ),
                          Padding(
                              padding:
                              const EdgeInsets
                                  .only(
                                left: 15,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .start,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        alignment:
                                        Alignment
                                            .topLeft,
                                        child: Text(
                                            "${favoritelist[index].businessName}",
                                            style: const TextStyle(
                                                color: Colors
                                                    .black,
                                                fontSize:
                                                18,
                                                fontFamily:
                                                "spartan",
                                                fontWeight:
                                                FontWeight.w600)),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      if(favoritelist[index].isLicensed=="1")
                                      SizedBox(
                                        height:
                                        height *
                                            0.03,
                                        child: const Image(
                                            image: AssetImage(
                                                "assets/images/Subtract (1).png")),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  favoritelist[index]
                                      .address ==
                                      null
                                      ? const SizedBox()
                                      : Text(
                                      "${favoritelist[index].address!.apartment} ${favoritelist[index].address!.city} ${favoritelist[index].address!.zipCode}",
                                      style: const TextStyle(
                                          color: Colors
                                              .black,
                                          fontSize:
                                          12,
                                          fontFamily:
                                          "spartan")),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  if(favoritelist[index].rating!="0" && favoritelist[index].noOfReviews!="0")
                                  Row(
                                    children: [
                                      SizedBox(
                                        height:
                                            height *
                                                0.02,
                                        child: const Image(
                                            image: AssetImage(
                                                "assets/images/Star 1.png")),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        alignment:
                                            Alignment
                                                .topLeft,
                                        child: Text(
                                            "${favoritelist[index].rating} Ratings",
                                            style: TextStyle(
                                                color: Colors
                                                    .black,
                                                fontSize:
                                                    14,
                                                fontFamily:
                                                    "spartan")),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        alignment:
                                            Alignment
                                                .topLeft,
                                        child: Text(
                                            "${favoritelist[index].noOfReviews} reviews",
                                            style: TextStyle(
                                                color: Colors
                                                    .grey,
                                                fontSize:
                                                    14,
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  getClientFavoriteList() async {
    var Posturi = Uri.parse(ApiUrlList.getClientFavoriteList);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      print("getClientFavoriteList url is ====> $Posturi");

      var response = await http.get(
        Posturi,
        headers: headers,
      );

      print("getClientFavoriteList status code ====> ${response.statusCode}");
      log(" getClientFavoriteList res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          f = FavoriteListModel.fromjson(map);
          favoritelist = f!.data!.favoritesList!;
        }
      }else if(response.statusCode == 401){
        logoutdata();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return signInScreen();
        },), (route) => false);
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
