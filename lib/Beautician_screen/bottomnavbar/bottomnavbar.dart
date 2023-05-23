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
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/main_scrren/mainscreen.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/brands/brands_tab_screen.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clientsmain.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/product/product_main_.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'calender/send_notifi_message_or_phone/calender_screen/calender.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

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
  }

  Future<void> typenavibar() async {
    var prefs = await SharedPreferences.getInstance();
    prefservicedata = prefs.getBool(UserPrefs.keyisserviceprovide) ??false;
    print("prefservicedata===${prefservicedata}");
    setState(() {});
  }

  int selectedScreenIndex = 0;
  int selectedScreenIndex2 = 0;
  List servicesSreens = [
    productbaar(),
    // clientsmain(),
    // brands_Tab_Screen(),
    // Center(child: Text("gist")),
    more_Main_Sccreen(),
  ];

  List prodctScreens = [
    calender(),
    // clientsmain(),
    // productbaar(),
    // brands_Tab_Screen(),
    more_Main_Sccreen(),
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
          ?prodctScreens[selectedScreenIndex]:servicesSreens[selectedScreenIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreenIndex,
        selectedItemColor: Color(0xff01635D),
        unselectedItemColor: Color(0xffA0A0A0),
        onTap: _selectScreen,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items:prefservicedata ? [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/calender.png",
              height: 20,
              color: selectedScreenIndex == 0
                  ? Color(0xff01635D)
                  : Color(0xffA0A0A0)),
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
                      ? Color(0xff01635D)
                      : Color(0xffA0A0A0)),
              label: "More"),
          ]: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/product.png",
              height: 20,
              color: selectedScreenIndex == 0
                  ? Color(0xff01635D)
                  : Color(0xffA0A0A0)),
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
                      ? Color(0xff01635D)
                      : Color(0xffA0A0A0)),
              label: "More"),
          ]

      ),
    );
  }
}
