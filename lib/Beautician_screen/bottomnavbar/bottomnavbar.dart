// import 'package:flutter/material.dart';
// import 'package:new_sliikeapps_apps/screen/viewscrren/calender_screen/calender.dart';
//
// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({Key? key}) : super(key: key);
//
//   @override
//   _BottomNavigationExampleState createState() =>
//       _BottomNavigationExampleState();
// }
//
// class _BottomNavigationExampleState extends State {
//   int _selectedTab = 0;
//
//   List _pages = [
//     calender(),
//     Center(
//       child: Text("Products"),
//     ),
//     Center(
//       child: Text("Products"),
//     ),
//     Center(
//       child: Text("Brands"),
//     ),
//     Center(
//       child: Text("More"),
//     ),
//   ];
//
//   _changeTab(int index) {
//     setState(() {
//       _selectedTab = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: _pages[_selectedTab],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedTab,
//         onTap: (index) => _changeTab(index),
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(icon: Image.asset("assets/images/calender.png"), label: "Calendar"),
//           BottomNavigationBarItem(icon: Image.asset("assets/images/clients.png"), label: "Clients"),
//           BottomNavigationBarItem(
//               icon:  Image.asset("assets/images/product.png"), label: "Product"),
//           BottomNavigationBarItem(
//               icon:Image.asset("assets/images/brands.png"), label: "Brands"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.menu), label: "More"),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_setup.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/main_scrren/mainscreen.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/product/product_main_.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../custom_widget/textcommon/textcommon.dart';
import 'calender/send_notifi_message_or_phone/calender_screen/calender.dart';

class BottomNavigation extends StatefulWidget {
  String? dbpopup;
  BottomNavigation({Key? key, this.dbpopup}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool prefservicedata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    typenavibar();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.dbpopup == "1") {
        dashBoardPopUp();
      }
    });
  }

  Future<void> typenavibar() async {
    var prefs = await SharedPreferences.getInstance();
    prefservicedata = prefs.getBool(UserPrefs.keyisserviceprovide) ?? false;
    print("prefservicedata===$prefservicedata");
    setState(() {});
  }

  int selectedScreenIndex = 0;
  int selectedScreenIndex2 = 0;

  dashBoardPopUp() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.symmetric(horizontal: 30),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Image.asset("assets/images/dbpopup.png"),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: textComoon(
                        "Hello Tolu, would you like to continue\n with your business profile set up? This\n will help clients get clear details about\n your services, costs and more.",
                        14,
                        const Color(0xff414141),
                        FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff01635D),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 13, bottom: 13),
                        child: Center(
                          child: textComoon("REMIND ME LATER", 10, Colors.white,
                              FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return business_SetUp(
                              email: "", isStripeSetUp: false);
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff01635D)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 13, bottom: 13),
                        child: Center(
                          child: textComoon("CONTINUE WITH SETUP", 10,
                              Color(0xff01635D), FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  String status = "";

  List servicesSreens = [
    const productbaar(),
    // clientsmain(),
    // brands_Tab_Screen(),
    // Center(child: Text("gist")),
    const more_Main_Sccreen(),
  ];

  List prodctScreens = [
    calender(),
    // clientsmain(),
    // productbaar(),
    // brands_Tab_Screen(),
    const more_Main_Sccreen(),
  ];

  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

// void _selectScreen2(int index) {
//   setState(() {
//     selectedScreenIndex2 = index;
//   });
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: prefservicedata
          ? prodctScreens[selectedScreenIndex]
          : servicesSreens[selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedScreenIndex,
          selectedItemColor: const Color(0xff01635D),
          unselectedItemColor: const Color(0xffA0A0A0),
          onTap: _selectScreen,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: prefservicedata
              ? [
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/images/calender.png",
                        height: 20,
                        color: selectedScreenIndex == 0
                            ? const Color(0xff01635D)
                            : const Color(0xffA0A0A0)),
                    label: "Calendar",
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Image.asset("assets/images/clients.png",
                  //       height: 20,
                  //       color: selectedScreenIndex == 1
                  //           ? Color(0xff01635D)
                  //           : Color(0xffA0A0A0)),
                  //   label: "Clients",
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: Image.asset("assets/images/product.png",
                  //       height: 20,
                  //       color: selectedScreenIndex == 2
                  //           ? Color(0xff01635D)
                  //           : Color(0xffA0A0A0)),
                  //   label: "Product",
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: Image.asset("assets/images/brands.png",
                  //       height: 20,
                  //       color: selectedScreenIndex == 3
                  //           ? Color(0xff01635D)
                  //           : Color(0xffA0A0A0)),
                  //   label: "Brands",
                  // ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu,
                          color: selectedScreenIndex == 4
                              ? const Color(0xff01635D)
                              : const Color(0xffA0A0A0)),
                      label: "More"),
                ]
              : [
                  BottomNavigationBarItem(
                    icon: Image.asset("assets/images/product.png",
                        height: 20,
                        color: selectedScreenIndex == 0
                            ? const Color(0xff01635D)
                            : const Color(0xffA0A0A0)),
                    label: "Product",
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Image.asset("assets/images/clients.png",
                  //       height: 20,
                  //       color: selectedScreenIndex == 1
                  //           ? Color(0xff01635D)
                  //           : Color(0xffA0A0A0)),
                  //   label: "Clients",
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: Image.asset("assets/images/brands.png",
                  //       height: 20,
                  //       color: selectedScreenIndex == 2
                  //           ? Color(0xff01635D)
                  //           : Color(0xffA0A0A0)),
                  //   label: "Brands",
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: Image.asset("assets/images/gistmessge.png",
                  //       height: 20,
                  //       color: selectedScreenIndex == 3
                  //           ? Color(0xff01635D)
                  //           : Color(0xffA0A0A0)),
                  //   label: "Gist",
                  // ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu,
                          color: selectedScreenIndex == 4
                              ? const Color(0xff01635D)
                              : const Color(0xffA0A0A0)),
                      label: "More"),
                ]),
    );
  }
}
