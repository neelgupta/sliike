import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/second_beautyservice_or_product/service_add/add_another_service.dart';

// ignore: camel_case_types
class addServicetypetwo extends StatefulWidget {
  const addServicetypetwo({Key? key}) : super(key: key);

  @override
  State<addServicetypetwo> createState() => _addServiceState();
}

// ignore: camel_case_types
class _addServiceState extends State<addServicetypetwo> {
  TextEditingController description = TextEditingController();
  TextEditingController servicePrice = TextEditingController();
  TextEditingController duration = TextEditingController();

  bool descriptionstatus = false;
  bool servicePriceStatus = false;
  bool durationStatus = false;
  String status = "";
  bool arrow = false;

  List categoryradioList = [
    'Barber',
    'Hair Care',
    'Make-up',
    'Nails',
    'SPA',
    'Massage',
    'Facial/Skin Care',
    'Tattoo Art',
    'Photography',
    'Beauty Consultant'
  ];
  String? selectdradioValue = "";


  List<String> mindropdownlist = <String>[
    "30 min",
    "25 min",
    "20 min",
    "15 min",
    "10 min"
  ];
  String? selectedvaluemin = "30 min";

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 10,
              ),
              const Text("Choose service category",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff292929),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(

                            height: height * 0.7,
                            width: width - 40,

                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: categoryradioList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectdradioValue =
                                            categoryradioList[index]
                                                .toString();
                                        print(selectdradioValue);
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 1)),
                                      child: Column(
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              //here change to your color
                                              unselectedWidgetColor:
                                              const Color(0xff01635D),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 8,
                                                  bottom: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    "${categoryradioList[index]}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                            0xff292929),
                                                        fontFamily:
                                                        "spartan",
                                                        fontWeight:
                                                        FontWeight
                                                            .normal),
                                                  ),
                                                  Radio<String>(
                                                    value:
                                                    categoryradioList[
                                                    index],
                                                    activeColor: const Color(
                                                        0xff01635D),
                                                    groupValue:
                                                    selectdradioValue,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectdradioValue =
                                                            value
                                                                .toString();
                                                        print(
                                                            selectdradioValue);
                                                        Navigator.pop(
                                                            context);
                                                      });
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: width,
                                            color: const Color(0xffE7E7E7),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  });
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xff707070), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Service category",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffff7070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.normal),
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Color(0xff707070),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color(0xffCFCFCF),
                thickness: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Choose service category",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff292929),
                      fontFamily: "spartan",
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xffE7E7E7), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              arrow = !arrow;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Men's Cut",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                              arrow == true
                                  ? const Icon(Icons.keyboard_arrow_up,
                                      size: 30, color: Color(0xff707070))
                                  : const Icon(Icons.keyboard_arrow_down,
                                      size: 30, color: Color(0xff707070)),
                            ],
                          ),
                        ),
                        arrow == true
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Color(0xffCFCFCF),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                      "You can suggest Service Type through the Help Centre.",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff707070),
                                          fontFamily: "spartan",
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),

                                    child: DropdownButtonFormField(
                                      enableFeedback: true,
                                      isDense: true,
                                      isExpanded: true,
                                      alignment: Alignment.center,
                                      elevation: 2,
                                      value: selectedvaluemin,
                                      items:
                                          mindropdownlist.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items,style: const TextStyle(fontSize: 12),),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedvaluemin = newValue!;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                      ),
                                      decoration: InputDecoration(
                                        //labelText: "Duration",
                                        label: const Text("Duration",
                                        style: TextStyle(color: Color(0xff292929))),

                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              const BorderSide(color: Colors.black38),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              const BorderSide(color: Colors.black38),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  TextField(
                                    controller: servicePrice,
                                    style:
                                        const TextStyle(color: Color(0xff292929)),
                                    onChanged: (value) {
                                      setState(() {
                                        servicePriceStatus = false;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      hintText: "00",
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff292929)),
                                      prefixIcon: SizedBox(
                                        width: 70,
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(
                                                        left: 20, right: 10),
                                                child: Text("\$",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Color(
                                                            0xff292929))),
                                              ),
                                              VerticalDivider(
                                                color: Color(0xff707070),
                                                thickness: 1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      labelText: "Service Price",
                                      labelStyle: const TextStyle(
                                          fontFamily: 'spartan',
                                          color: Colors.black54),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5),
                                        borderSide:
                                            const BorderSide(color: Colors.black38),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5),
                                        borderSide:
                                            const BorderSide(color: Colors.black38),
                                      ),
                                    ),
                                  ),
                                  servicePriceStatus
                                      ? SizedBox(
                                          height: 30,
                                          child: Text(
                                            status,
                                            style: const TextStyle(
                                                fontFamily: 'spartan',
                                                fontSize: 12,
                                                color: Colors.red),
                                          ),
                                        )
                                      : Container(
                                          height: 20,
                                        ),
                                ],
                              )
                            : Column(
                                children: const [],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text("Service Description ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff292929),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                  Text("(optional)",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff707070),
                          fontFamily: "spartan",
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: description,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 15,
                    color: Color(
                      0xff414141,
                    )),
                onChanged: (value) {
                  descriptionstatus = false;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 20, top: 12, bottom: 12),
                  hintText: "Description",
                  labelText: "Description",
                  labelStyle:
                      const TextStyle(fontFamily: 'spartan', color: Colors.black54),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.black38),
                  ),
                ),
              ),
              descriptionstatus
                  ? SizedBox(
                      height: 30,
                      child: Text(
                        status,
                        style: const TextStyle(
                            fontFamily: 'spartan',
                            fontSize: 12,
                            color: Color(0xff2F80ED)),
                      ),
                    )
                  : Container(
                      height: 20,
                    ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    String edescription = description.text;
                    if (edescription.length > 150) {
                      setState(() {
                        descriptionstatus = true;
                        status = "Max of 150 characters";
                      });
                    } else {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return addAnother_Service(secondflow: false,);
                        },
                      ));
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text("SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)),
                ),
              ),
              SizedBox(
                height: height * 0.03,
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
