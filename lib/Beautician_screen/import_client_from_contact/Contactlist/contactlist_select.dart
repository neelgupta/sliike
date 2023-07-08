import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/import_client_from_contact/client_list/client_list.dart';
import 'package:new_sliikeapps_apps/services/invite_services.dart';
import 'package:new_sliikeapps_apps/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types, must_be_immutable
class contactLIst_Select extends StatefulWidget {
  List<Contact>? contacts;
  bool isADD;

  contactLIst_Select(this.contacts, this.isADD, {Key? key}) : super(key: key);

  @override
  State<contactLIst_Select> createState() => _contactLIst_SelectState();
}

// ignore: camel_case_types, must_be_immutable
class _contactLIst_SelectState extends State<contactLIst_Select> {
  // bool checkboxvalue = false;

  List<bool>? checkboxvalue;

  TextEditingController search = TextEditingController();

  List<Contact> localSearchData = [];

  done2() {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (ctxDialog) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              AlertDialog(
                titlePadding: EdgeInsets.zero,
                title: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'PT.ABADI',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Text('Lantai 1'),
                      ],
                    ),
                  ),
                ),
                content: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Maret 2020'),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () => print('Pilih Foto'),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            alignment: Alignment.center,
                            height: 100,
                            width: 200,
                            child: Text('Pilih Foto'),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 200,
                  right: 200,
                ),
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).errorColor,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20,
                    ),
                    onPressed: () => print('close'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: <Widget>[
            // titleHeaderRow(title: '$indexOrder'),
            // titleHeaderRow(
            //     title: '$indexOrder', textAlign: TextAlign.left),
            // titleHeaderRow(title: '$indexOrder'),
            // titleHeaderRow(title: month.toString()),
            // titleHeaderRow(title: month.toString()),
          ],
        ),
      ),
    );
  }

  String _name = "";
  String _number = "";

  done() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            AlertDialog(
              alignment: Alignment.center,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: textComoon("Clients", 14,
                            const Color(0xff111111), FontWeight.w700),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: textComoon("Successfully Invited", 12,
                            Colors.black87, FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => clientListContact(
                                    widget.contacts, widget.isADD),
                              ));
                              
                        },

                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff219653),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 12, bottom: 12),
                            child: Center(
                              child: textComoon(
                                  "DONE", 10, Colors.white, FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Positioned(
              left: width * 0.43,
              top: height * 0.36,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: Image.asset("assets/images/tick.png"),
              ),
            ),
          ],
        );
      },
    );
  }

  Future whatsapp(String contact, String message) async {
    var androidUrl = "whatsapp://send?phone=$contact&text=$message";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('$message')}";
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl),
            mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(androidUrl),
            mode: LaunchMode.externalApplication);
      }
    } on Exception {
      showToast(message: "WhatsApp is not installed.");
    }
  }

  InviteServices _inviteServices = InviteServices();

  getName? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      checkboxvalue = List.generate(widget.contacts!.length, (index) => false);
      name = await _inviteServices.getBeauticianProfile(context);
      setState(() {});
    });
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
                            Text("Contact List",
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
                          child: Text("Select contacts and send invite.",
                              style: TextStyle(
                                  fontSize: 12,
                                  // you can change it accordingly
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
      body: WillPopScope(
        onWillPop: () async {
          Loader.hide();
          return true;
        },
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                TextField(
                  controller: search,
                  onChanged: (value) {
                    setState(() {
                      searchService(value);
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Search service",
                    hintStyle: const TextStyle(color: Color(0xff707070)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 12, right: 12, bottom: 10),
                      child: SizedBox(
                        height: 5,
                        child: Image.asset("assets/images/search-normal.png"),
                      ),
                    ),
                    labelStyle: const TextStyle(
                        fontFamily: 'spartan', color: Colors.black54),
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
                SizedBox(
                  height: height * 0.02,
                ),
                // Row(
                //   children: [
                //     Custom_Checkbox(
                //       isChecked: checkboxvalue,
                //       onChange: (value) {
                //         setState(() {
                //           checkboxvalue = value;
                //         });
                //       },
                //       backgroundColor: const Color(0xff01635D),
                //       borderColor: const Color(0xff01635D),
                //       icon: Icons.check,
                //       iconColor: Colors.white,
                //       size: 24,
                //       iconSize: 20,
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Text("Select All (${widget.contacts!.length})",
                //         style: const TextStyle(
                //             fontSize: 12,
                //             fontFamily: "spartan",
                //             color: Color(0xff292929),
                //             fontWeight: FontWeight.w600)),
                //   ],
                // ),
                SizedBox(
                  height: height * 0.01,
                ),
                const Divider(
                  thickness: 1,
                  color: (Color(0xffCFCFCF)),
                ),
                if (checkboxvalue != null)
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: search.text.isNotEmpty
                          ? localSearchData.length
                          : widget.contacts!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 2),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  search.text.isNotEmpty
                                      ? Custom_Checkbox(
                                          isChecked: checkboxvalue![index],
                                          onChange: (value) {
                                            print(widget.contacts);
                                            setState(() {
                                              checkboxvalue![index] = value;
                                              _name = localSearchData[index]
                                                  .displayName;
                                              _number = localSearchData[index]
                                                  .phones
                                                  .first
                                                  .number;
                                              print(_name);
                                              print(_number);
                                            });
                                          },
                                          backgroundColor:
                                              const Color(0xff01635D),
                                          borderColor: const Color(0xff01635D),
                                          icon: Icons.check,
                                          iconColor: Colors.white,
                                          size: 24,
                                          iconSize: 20,
                                        )
                                      : Custom_Checkbox(
                                          isChecked: checkboxvalue![index],
                                          onChange: (value) {
                                            print(widget.contacts);
                                            setState(() {
                                              checkboxvalue![index] = value;
                                              _name = widget
                                                  .contacts![index].displayName;
                                              _number = widget.contacts![index]
                                                  .phones.first.number;
                                              print(_name);
                                              print(_number);
                                            });
                                          },
                                          backgroundColor:
                                              const Color(0xff01635D),
                                          borderColor: const Color(0xff01635D),
                                          icon: Icons.check,
                                          iconColor: Colors.white,
                                          size: 24,
                                          iconSize: 20,
                                        ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffCFCFCF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                        "assets/images/profile.png",
                                        fit: BoxFit.fill),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      search.text.isNotEmpty
                                          ? localSearchData[index].displayName
                                          : widget.contacts![index].displayName,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff414141),
                                        fontFamily: "spartan",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                                color: (Color(0xffCFCFCF)),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                //Spacer(),
                SizedBox(
                  width: width,
                  height: 100,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            String message = "Hello, $_name\n"
                                "This is ${name?.data.firstName} ${name?.data.lastName}\n"
                                "I am inviting you to join Sliike platform. The digital marketplace where you can easily book and pay for my beauty services and products.\n"
                                "Click here to accept my invite and go to your app store or  ${"www.sliike.com"} to download the app.";
                            if (_name != "") {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) async {
                                await whatsapp(_number, message)
                                    .then((value) async {
                                  await _inviteServices
                                      .inviteContacts(context, _number)
                                      .then((value) {
                                    done();
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           clientListContact(widget.contacts,
                                    //               widget.isADD),
                                    //     ));
                                  });
                                });
                              });
                            } else {
                              done();
                              showToast(message: "Please select any contact");
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xff01635D)),
                            child: const Text("SEND INVITE",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "spartan",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // body: _body(),
    );
  }

  searchService(String value) {
    if (value.isNotEmpty) {
      localSearchData.clear();
      for (int i = 0; i < widget.contacts!.length; i++) {
        if (widget.contacts![i].displayName
            .toLowerCase()
            .contains(value.toLowerCase())) {
          localSearchData.add(widget.contacts![i]);
          setState(() {});
        }
      }
      // log("localSearchData :: ${localSearchData}");
    }
  }
}
