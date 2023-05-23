//JSR
// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/brands_page/brands.dart';
import 'package:new_sliikeapps_apps/client_app/home_screen/home_explore.dart';
import 'package:new_sliikeapps_apps/client_app/products_page/products.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/profile.dart';

import 'home_appointments.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int _selectedIndex = 0;
  final List _screens = [
    const home_explore(),
    const home_appointments(),
    // const products(),
    // const brands(),
    const profile(),
  ];

  void _onselectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: Color(0xFFDD5103)),
        iconSize: 10,
        currentIndex: _selectedIndex,
        onTap: _onselectIndex,
        selectedItemColor: const Color(0xFFDD5103),
        items: [
          BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage("assets/images/Group 21.png"),
              width: 20,
              color:
                  _selectedIndex == 0 ? const Color(0xFFDD5103) : Colors.grey,
            ),
            label: "explore".tr(),
          ),
          BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("assets/images/note.png"),
                width: 20,
                color:
                    _selectedIndex == 1 ? const Color(0xFFDD5103) : Colors.grey,
              ),
              label: "appointments".tr()),
          // BottomNavigationBarItem(
          //     icon: Image(
          //       image: const AssetImage("assets/images/archive.png"),
          //       width: 20,
          //       color:
          //           _selectedIndex == 2 ? const Color(0xFFDD5103) : Colors.grey,
          //     ),
          //     label: "products".tr()),
          // BottomNavigationBarItem(
          //     icon: Image(
          //       image: const AssetImage("assets/images/category.png"),
          //       width: 20,
          //       color:
          //           _selectedIndex == 3 ? const Color(0xFFDD5103) : Colors.grey,
          //     ),
          //     label: "brands".tr()),
          BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("assets/images/menu.png"),
                width: 20,
                color:
                    _selectedIndex == 4 ? const Color(0xFFDD5103) : Colors.grey,
              ),
              label: "more".tr()),
        ],
      ),
    );
  }
}
