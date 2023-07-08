import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/promotions/_add_promotions.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/models/getProductsModel.dart';
import 'package:new_sliikeapps_apps/models/getServicesModel.dart';
import 'package:new_sliikeapps_apps/services/promotion_services.dart';

class promotion extends StatefulWidget {
  const promotion({Key? key}) : super(key: key);

  @override
  State<promotion> createState() => _promotionState();
}

class _promotionState extends State<promotion> {
  bool Product = false;
  bool Service = true;
  bool isLoading = true;
  String type = "1";
  int myproductcnt = 0;
  GetServices? getServices;
  GetProducts? getProducts;
  PromotionServices _promotionServices = PromotionServices();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (type == "1") {
        getServices = await _promotionServices.getServices(context);
        getProducts = await _promotionServices.getProducts(context);
        if (getServices?.status == 200 && getProducts?.status == 200) {
          setState(() {
            isLoading = false;
          });
        }
        setState(() {});
      }
    });
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.13, //
          flexibleSpace: Container(
            color: Color(0xffFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 10),
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
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.15,
                        ),
                        Container(
                          child: Text("Promotions",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
                        ),
                        Container(
                          child: isLoading
                              ? Text("")
                              : Text(
                                  type == "1" && getServices?.data != null
                                      ? "(${getServices?.data!.length})"
                                      : type == "2" && getProducts?.data != null
                                          ? "(${getProducts?.data!.length})"
                                          : "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff707070),
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(color: Color(0xff01635D)),
              )
            : getServices != null || getProducts != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: height * 0.08,
                          width: width,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // isLoading = true;
                                    Service = true;
                                    Product = false;
                                    type = "1";
                                    _promotionServices.getServices(context);
                                    setState(() {});
                                    print(type);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: Service
                                          ? Color(0xff01635D)
                                          : Color(0xffEBEFEE),
                                    ),
                                    child: Text(
                                      "Service",
                                      style: TextStyle(
                                          color: Service
                                              ? Colors.white
                                              : Color(0xff01635D),
                                          fontFamily: 'spartan',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     // isLoading = true;
                                //     Service = false;
                                //     Product = true;
                                //     type = "2";
                                //     _promotionServices.getProducts(context);
                                //     if (getProducts?.data == 200) {
                                //       setState(() {
                                //         isLoading = false;
                                //       });
                                //     }
                                //     setState(() {});
                                //     print(type);
                                //   },
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(
                                //         vertical: 12, horizontal: 15),
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(21),
                                //         color: Product
                                //             ? Color(0xff01635D)
                                //             : Color(0xffEBEFEE)),
                                //     child: Text(
                                //       "Product",
                                //       style: TextStyle(
                                //           color: Product
                                //               ? Colors.white
                                //               : Color(0xff01635D),
                                //           fontFamily: 'spartan',
                                //           fontSize: 12,
                                //           fontWeight: FontWeight.w600),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (type == "1")
                          getServices != null &&
                                  (getServices!.data ?? []).isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: getServices?.data?.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Material(
                                            elevation: 15,
                                            child: Container(
                                              height: height * 0.20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff78D6F5),
                                                      Color(0xffD4F2FB),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    stops: [0.30, 0.10],
                                                    tileMode: TileMode.clamp,
                                                  ),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color:
                                                          Color(0xff78D6F5))),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.07),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        "${getServices?.data?[index].isDiscPercentage == 0 ? "\$" : ""}${getServices?.data?[index].discount}${getServices?.data?[index].isDiscPercentage == 1 ? "\%" : ""}\n"
                                                        "OFF",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.5)),
                                                    Spacer(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                            width: width * 0.5,
                                                            child: Text(
                                                                "${getServices?.data?[index].promotionTitle}",
                                                                maxLines: null,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ))),
                                                        SizedBox(
                                                          height:
                                                              height * 0.015,
                                                        ),
                                                        Text(
                                                            "${getServices?.data?[index].serviceName}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        SizedBox(
                                                          height:
                                                              height * 0.015,
                                                        ),
                                                        SizedBox(
                                                            width: width * 0.5,
                                                            child: Text(
                                                                "${DateFormat('d MMMM').format(getServices!.data![index].startDate!)} - ${DateFormat('d MMMM, y').format(getServices!.data![index].endDate!)}",
                                                                maxLines: null,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ))),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Expanded(child: noRunningPromos()),
                        if (type == "2")
                          getProducts != null &&
                                  (getProducts!.data ?? []).isNotEmpty
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: getProducts?.data?.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Material(
                                            elevation: 15,
                                            child: Container(
                                              height: height * 0.20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff78D6F5),
                                                      Color(0xffD4F2FB),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    stops: [0.30, 0.10],
                                                    tileMode: TileMode.clamp,
                                                  ),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color:
                                                          Color(0xff78D6F5))),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.07),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        "${getServices?.data?[index].isDiscPercentage == 0 ? "\$" : ""}${getServices?.data?[index].discount}${getServices?.data?[index].isDiscPercentage == 1 ? "\%" : ""}\n"
                                                        "OFF",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 1.5)),
                                                    Spacer(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                            width: width * 0.5,
                                                            child: Text(
                                                                "${getProducts?.data?[index].promotionTitle}",
                                                                maxLines: null,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ))),
                                                        SizedBox(
                                                          height:
                                                              height * 0.015,
                                                        ),
                                                        Text(
                                                            "${getProducts?.data?[index].serviceName}",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                        SizedBox(
                                                          height:
                                                              height * 0.015,
                                                        ),
                                                        SizedBox(
                                                            width: width * 0.5,
                                                            child: Text(
                                                                "${DateFormat('d MMMM').format(getProducts!.data![index].startDate!)} - ${DateFormat('d MMMM, y').format(getProducts!.data![index].endDate!)}",
                                                                maxLines: null,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ))),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Expanded(child: noRunningPromosProduct()),
                        SizedBox(
                          height: 10,
                        ),
                        getProducts?.data != null &&
                                (getServices!.data ?? []).isNotEmpty
                            ? CommonButton(context, "ADD NEW PROMOTION", 12,
                                FontWeight.w600, Colors.white, () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return add_promotion(
                                      type: type,
                                    );
                                  },
                                )).then((value) async {
                                  getServices = await _promotionServices
                                      .getServices(context);
                                  getProducts = await _promotionServices
                                      .getProducts(context);
                                });
                              })
                            : SizedBox(),
                        SizedBox(
                          height: 20,
                        )
                        // ///promotions 0 ?ADD to No Page
                        // myproductcnt==1?Column(
                        //   children: [
                        //     SingleChildScrollView(
                        //       child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children: [
                        //           SizedBox(height: height*0.1,),
                        //           Container(alignment: Alignment.center,
                        //               height: 120, child:Image.asset("assets/images/promotionadd.png",fit: BoxFit.fill,)),
                        //           SizedBox(height: height*0.02,),
                        //           textComooncenter("You currently have no running promotions", 14, Color(0xff292929),FontWeight.w700),
                        //           SizedBox(height: height*0.025,),
                        //           InkWell(
                        //             onTap: (){
                        //               Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //                 return add_promotion();
                        //               },));
                        //             },
                        //             child: Container(alignment: Alignment.center,
                        //               height: 50,
                        //               width: width*0.5,
                        //               decoration: BoxDecoration(
                        //                 color: Color(0xff01635D),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //               child: Center(child: textComooncenter("ADD POMOTION", 12, Colors.white, FontWeight.w600)),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     )
                        //   ],
                        // ):Column(
                        //   children: [
                        //     ///1 service
                        //     Service == true
                        //         ? SingleChildScrollView(
                        //       child: Container(
                        //         height: height*0.7,
                        //         child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Container(
                        //               alignment: Alignment.topLeft,
                        //               height: height*0.18,
                        //               width: width,
                        //               decoration: BoxDecoration(color: Color(0xffD4F2FB),
                        //
                        //                 borderRadius: BorderRadius.circular(5),
                        //                 border: Border.all(color: Color(0xffD4F2FB),width: 1),
                        //               ),
                        //               child: Row(
                        //                 // crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   Container(
                        //                     height: height*0.18,
                        //                     width: 90,
                        //                     decoration: BoxDecoration(
                        //                       color: Color(0xff78D6F5),
                        //                       borderRadius: BorderRadius.only(
                        //                         topLeft: Radius.circular(5),
                        //                         bottomLeft: Radius.circular(5),),),
                        //                     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        //                       mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         textComoonfade("50 %", 18, Color(0xff292929), FontWeight.w700),
                        //                         textComoonfade("OFF", 18, Color(0xff292929), FontWeight.w700),
                        //
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   SizedBox(width: 10,),
                        //                   Expanded(
                        //                     child: Container(
                        //
                        //                       child: Column(
                        //                         mainAxisAlignment: MainAxisAlignment.center,
                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                        //                         children: [
                        //                           textComoon("Save Big on Beard Trim",14, Color(0xff292929), FontWeight.w700),
                        //                           SizedBox(height: 5,),
                        //                           textComoonfade("Beard Trim", 12, Color(0xff414141), FontWeight.w500),
                        //                           SizedBox(height: 5,),
                        //                           textComoonfade("17 April - 22 April,2022", 12, Color(0xff414141), FontWeight.w500),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //
                        //                 ],
                        //               ),
                        //
                        //             ),
                        //             Spacer(),
                        //             CommonButton(context, "ADD NEW PROMOTION",12, FontWeight.w600, Colors.white, () {
                        //               Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //                 return add_promotion();
                        //               },));
                        //             }),
                        //           ],
                        //         ),
                        //       ),
                        //     )
                        //         : SizedBox(),
                        //
                        //     ///2 Product
                        //     Product== true
                        //         ? SingleChildScrollView(
                        //       child: Container(
                        //         height: height*0.7,
                        //         child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Container(
                        //               alignment: Alignment.topLeft,
                        //               height: height*0.18,
                        //               width: width,
                        //               decoration: BoxDecoration(color: Color(0xffD4F2FB),
                        //
                        //                 borderRadius: BorderRadius.circular(5),
                        //                 border: Border.all(color: Color(0xffD4F2FB),width: 1),
                        //               ),
                        //               child: Row(
                        //                 // crossAxisAlignment: CrossAxisAlignment.center,
                        //                 children: [
                        //                   Container(
                        //                     height: height*0.18,
                        //                     width: 90,
                        //                     decoration: BoxDecoration(
                        //                       color: Color(0xff78D6F5),
                        //                       borderRadius: BorderRadius.only(
                        //                         topLeft: Radius.circular(5),
                        //                         bottomLeft: Radius.circular(5),),),
                        //                     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        //                       mainAxisAlignment: MainAxisAlignment.center,
                        //                       children: [
                        //                         textComoonfade("50 %", 18, Color(0xff292929), FontWeight.w700),
                        //                         textComoonfade("OFF", 18, Color(0xff292929), FontWeight.w700),
                        //
                        //                       ],
                        //                     ),
                        //                   ),
                        //                   SizedBox(width: 10,),
                        //                   Expanded(
                        //                     child: Container(
                        //
                        //                       child: Column(
                        //                         mainAxisAlignment: MainAxisAlignment.center,
                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                        //                         children: [
                        //                           textComoon("Save Big on Beard Trim",14, Color(0xff292929), FontWeight.w700),
                        //                           SizedBox(height: 5,),
                        //                           textComoonfade("Beard Trim", 12, Color(0xff414141), FontWeight.w500),
                        //                           SizedBox(height: 5,),
                        //                           textComoonfade("17 April - 22 April,2022", 12, Color(0xff414141), FontWeight.w500),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ),
                        //
                        //                 ],
                        //               ),
                        //
                        //             ),
                        //             Spacer(),
                        //             CommonButton(context, "ADD NEW PROMOTION",12, FontWeight.w600, Colors.white, () {
                        //               Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //                 return add_promotion();
                        //               },));
                        //             }),
                        //           ],
                        //         ),
                        //       ),
                        //     )
                        //         : SizedBox(),
                        //   ],
                        // ),
                      ],
                    ),
                  )
                : Center(child: Text("Something went wrong !!")));
  }

  Widget noRunningPromos() => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/nopromo.png",
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You currently have no running\n promotions",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return add_promotion(
                        type: "1",
                      );
                    },
                  ));
                },
                child: Container(
                  color: Color(0xff01635D),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "ADD PROMOTION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget noRunningPromosProduct() => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/nopromo.png",
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You currently have no running\n promotions",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return add_promotion(
                        type: "2",
                      );
                    },
                  ));
                },
                child: Container(
                  color: Color(0xff01635D),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "ADD PROMOTION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
