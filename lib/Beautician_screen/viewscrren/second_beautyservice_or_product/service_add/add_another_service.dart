import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/first_beautyproduc_only/addyour_work_hours/add_your_work_hours.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/second_beautyservice_or_product/service_add/categorytype_service.dart';

// ignore: camel_case_types, must_be_immutable
class addAnother_Service extends StatefulWidget {
  bool secondflow;
  addAnother_Service({Key? key, required this.secondflow}) : super(key: key);

  @override
  State<addAnother_Service> createState() => _addAnother_ServiceState();
}

// ignore: camel_case_types
class _addAnother_ServiceState extends State<addAnother_Service> {
  @override
  void initState() {
    // TODO: implement initState
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
        toolbarHeight: height * 0.18, //
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
                                border: Border.all(color: Colors.white)),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/backwhite.png"),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Add Services",
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 60,
                        ),
                        Expanded(
                          child: Text(
                              "Add your services, so clients can see\nwhat you offer.",
                              style: TextStyle(
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "3/",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff292929),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "4",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffA0A0A0),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height * 0.53,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return
                      // },));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/delete.png"))),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "",
                                    style: TextStyle(
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "\$for",
                                    style: TextStyle(
                                        fontFamily: 'spartan',
                                        color: Color(0xff414141),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          color: Color(0xffCFCFCF),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return addServicetype(
                        secondflow: true,
                      );
                    },
                  ));
                });
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.add_circle_outline_rounded,
                    size: 30,
                    color: Color(0xff2F80ED),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("ADD ANOTHER SERVICE",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2F80ED),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const add_Your_Work_Hours(secondflow: true);
                    },
                  ));
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff01635D)),
                child: const Text("CONTINUE",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                "These services will be added to your Sliike profile as your available services. You can add more as needed.",
                style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff414141),
                    fontFamily: "spartan",
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
