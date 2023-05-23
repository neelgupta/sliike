import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/brands/All/see_All.dart';

// ignore: camel_case_types
class brands_Tab_Screen extends StatefulWidget {

  const brands_Tab_Screen({Key? key}) : super(key: key);

  @override
  State<brands_Tab_Screen> createState() => _brands_main_screenState();
}

// ignore: camel_case_types
class _brands_main_screenState extends State<brands_Tab_Screen> {

  TextEditingController search=TextEditingController();
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
          color: const Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Brands",
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 7,
        initialIndex: 0,
        child: Column(
          children: [
            Container(alignment: Alignment.bottomCenter,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xffEBEFEE),
              ),
              child: const TabBar(
                isScrollable: true,
                labelColor: Color(0xff01635D),
                unselectedLabelColor: Color(0xff414141),
                tabs: [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Beauty',
                  ),
                  Tab(
                    text: 'Cosmetics',
                  ),
                  Tab(
                    text: 'Fashion',
                  ),
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Lifestyle',
                  ),
                  Tab(
                    text: 'Personal Care',
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.025,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: search,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "Search service",
                  hintStyle:
                  const TextStyle(color: Color(0xff707070)),
                  suffixIcon: Container(
                    width: width * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: Color(0xff01635D),
                    ),
                    height: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                          "assets/images/search-whitenormal.png"),
                    ),
                  ),
                  labelStyle: const TextStyle(
                      fontFamily: 'spartan',
                      color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                    const BorderSide(color: Colors.black38),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                    const BorderSide(color: Colors.black38),
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.01,),
            const Divider(thickness: 1,color: Color(0xffCFCFCF),),
            const Expanded(
              child: TabBarView(

                children: <Widget>[
                  All(),
                  Text("brands 2"),
                  Text("brands 2"),
                  Text("brands 2"),
                  Text("brands 2"),
                  Text("brands 2"),
                  Text("brands 2"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
