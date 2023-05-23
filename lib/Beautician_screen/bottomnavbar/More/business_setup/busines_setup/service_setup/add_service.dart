import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/setup_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';


class addService extends StatefulWidget {
  const addService({Key? key}) : super(key: key);

  @override
  State<addService> createState() => _addServiceState();
}

class _addServiceState extends State<addService> {
  TextEditingController description = TextEditingController();
  TextEditingController servicePrice = TextEditingController();
  bool servicePriceStatus = false;
  bool descriptionstatus = false;
  String status = "";
  bool clentswitch=false;

  bool arrow = false;
  String? selectedvaluemin = "30 min";
  List<String> durationtimelist = <String>[
    "1hr 30 min",
    "25 min",
    "20 min",
    "15 min",
    "10 min"
  ];
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
  String? selectedchosstime = "1hr 30 min";
  String? selectdradioValue = "";
  final List<String> items = [
    'Washing',
    'Coloring',
    'General treatment',
  ];
  String? selectedValuetype = "";

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "spartan",
                    ),
                  ),
                ),
                //Icon(Icons.chevron_right),
              ],
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
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
        toolbarHeight: height * 0.14, //
        flexibleSpace: Container(
          color: Color(0xffF5F7F7),
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
                            padding: EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Add Service",
                                  style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Choose service category",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff292929),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(

                            height: height * 0.7,
                            width: width - 40,

                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
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
                                              Color(0xff01635D),
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
                                                    style: TextStyle(
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
                                                    activeColor: Color(
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
                                            color: Color(0xffE7E7E7),
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
                      border: Border.all(color: Color(0xff707070), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectdradioValue == ""
                            ? Text(
                          "Service category",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff707070),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.normal),
                        )
                            : Text(
                          "$selectdradioValue",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff292929),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.normal),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: Color(0xff707070),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Divider(
                color: Color(0xffCFCFCF),
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Choose service type",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff292929),
                        fontFamily: "spartan",
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            selectedValuetype==""?Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: DropdownButtonHideUnderline(
                child: Container(
                  height: 48,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff707070), width: 1)),
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Service type',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "spartan",
                          color: Color(0xff707070),
                        ),
                      ),
                    ),
                    items: _addDividersAfterItems(items),
                    customItemsHeights: _getCustomItemsHeights(),
                    value: selectedValuetype == ""?null:selectedValuetype,
                    onChanged: (value) {
                      setState(() {
                        selectedValuetype = value as String;
                      });
                    },
                    buttonHeight: 60,
                    buttonPadding: EdgeInsets.only(right: 10),
                    icon: (Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: Color(0xff707070),
                    )),
                    dropdownMaxHeight: 200,
                    buttonWidth: 140,
                    itemPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
            ):
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xffE7E7E7), width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
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
                              Text("$selectedValuetype",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff292929),
                                      fontFamily: "spartan",
                                      fontWeight: FontWeight.bold)),
                              arrow == false
                                  ? Icon(Icons.keyboard_arrow_up,
                                  size: 30, color: Color(0xff707070))
                                  : Icon(Icons.keyboard_arrow_down,
                                  size: 30, color: Color(0xff707070)),
                            ],
                          ),
                        ),
                        arrow == true
                            ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                          children: [
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                thickness: 1,
                                color: Color(0xffCFCFCF),
                              ),
                              SizedBox(height: 5),
                              Container(alignment: Alignment.topLeft,
                                child: Text(
                                    "You can edit this title to your choice.",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff2F80ED),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              DropdownButtonFormField(
                                enableFeedback: true,
                                isDense: true,
                                isExpanded: true,
                                alignment: Alignment.center,
                                elevation: 2,
                                value: selectedchosstime,
                                items: durationtimelist.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: TextStyle(fontSize: 14, color: Color(0xff292929)),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedchosstime = newValue!;
                                  });
                                },
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,color: Color(0xff969696),
                                  ),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: "Duration",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'spartan',
                                      color: Color(0xff292929),
                                      fontWeight: FontWeight.w500),
                                  labelText: "Duration",
                                  labelStyle:
                                  TextStyle(fontFamily: 'spartan', color: Colors.black54),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Color(0xff292929)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color: Color(0xff292929)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Container(
                                child: TextField(
                                  controller: servicePrice,
                                  style:
                                  TextStyle(color: Color(0xff292929)),
                                  onChanged: (value) {
                                    setState(() {
                                      servicePriceStatus = false;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                    EdgeInsets.only(left: 20),
                                    hintText: "Service Price",
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff292929)),

                                    labelText: "Service Price",
                                    labelStyle: TextStyle(
                                        fontFamily: 'spartan',
                                        color: Color(0xff292929)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      borderSide:
                                      BorderSide(color: Color(0xff707070)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      borderSide:
                                      BorderSide(color: Color(0xff707070)),
                                    ),
                                  ),
                                ),
                              ),
                              servicePriceStatus
                                  ? Container(
                                height: 30,
                                child: Text(
                                  "$status",
                                  style: TextStyle(
                                      fontFamily: 'spartan',
                                      fontSize: 12,
                                      color: Colors.red),
                                ),
                              )
                                  : Container(
                                height: 20,
                              ),
                          ],
                        ),
                            )
                            : Column(
                          children: [],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  textComoon("Service Description", 14, Color(0xff292929),
                      FontWeight.w700),
                  textComoon(" (optional)", 14, Color(0xff707070),
                      FontWeight.w700),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child: TextField(
                  controller: description,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(
                        0xff414141,
                      )),
                  onChanged: (value) {
                    descriptionstatus = false;
                  },
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(left: 20, top: 5, bottom: 12),
                    hintText: "Description",
                    labelText: "Description",
                    labelStyle:
                    TextStyle(fontFamily: 'spartan', color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xff707070)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xff707070)),
                    ),
                  ),
                ),
              ),
            ),
            descriptionstatus
                ? Container(
              height: 30,
              child: Text(
                "$status",
                style: TextStyle(
                    fontFamily: 'spartan',
                    fontSize: 12,
                    color: Color(0xff2F80ED)),
              ),
            )
                : Container(
              height: 20,
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Container(

              width: width,
              color: Color(0xffF3F3F3),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 30,left: 20,right: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textComoon("Cancellation policy", 16,Color(0xff292929), FontWeight.w600),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    textComoonfade("Avoid been taken unaware on last minute appointment cancellation by clients. Choose when appointments can be cancelled by clients.", 14,Color(0xff414141), FontWeight.w500),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 17,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1,color: Color(0xffE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textComoon("Show to clients", 14, Color(0xff292929),FontWeight.w500),
                            SizedBox(width: 20,),
                            FlutterSwitch(
                              width: 55.0,
                              height: 25.0,
                              valueFontSize: 12.0,
                              toggleSize: 18.0,
                              activeColor: Color(0xff01635D),
                              value: clentswitch,
                              onToggle: (value) {
                                setState(() {
                                  clentswitch = value;
                                });
                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height*0.08,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return service_Setup_Main();
                          },
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff01635D)),
                        child: Text("SAVE",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "spartan",
                                color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "These services will be added to your Sliike profile as your available services. You can add more as needed.",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff414141),
                            fontFamily: "spartan",
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
