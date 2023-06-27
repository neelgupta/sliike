import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/import_client_from_contact/client_list/client_list.dart';
import 'package:new_sliikeapps_apps/services/invite_services.dart';
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

  List<bool> ? checkboxvalue;

  TextEditingController search = TextEditingController();

  String _name = "";
  String _number = "";

  Future whatsapp(String contact,String message) async{
    var androidUrl = "whatsapp://send?phone=$contact&text=$message";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('$message')}";
    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl),mode: LaunchMode.externalApplication);
      }
      else{
        await launchUrl(Uri.parse(androidUrl),mode: LaunchMode.externalApplication);
      }
    } on Exception{
      Fluttertoast.showToast(msg: "WhatsApp is not installed.");
    }
  }


  InviteServices _inviteServices = InviteServices();

  getName ? name;

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
                  onChanged: (value) {},
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
                if(checkboxvalue!=null)Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.contacts!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 2),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Custom_Checkbox(
                                  isChecked: checkboxvalue![index],
                                  onChange: (value) {
                                    print(widget.contacts);
                                    setState(() {
                                      checkboxvalue![index] = value;
                                      _name = widget.contacts![index].displayName;
                                      _number =  widget.contacts![index].phones.first.number;
                                      print(_name);
                                      print(_number);
                                    });
                                  },
                                  backgroundColor: const Color(0xff01635D),
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
                                    widget.contacts![index].displayName,
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
                          onTap: () async{
                            String message = "Hello, $_name\n"
                                "This is ${name?.data.firstName} ${name?.data.lastName}\n"
                                "I am inviting you to join Sliike platform. The digital marketplace where you can easily book and pay for my beauty services and products.\n"
                                "Click here to accept my invite and go to your app store or  ${"www.sliike.com"} to download the app.";
                            if(_name!=""){
                             WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                              await whatsapp(_number,message).then((value){
                                _inviteServices.inviteContacts(context, _number);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => clientListContact(widget.contacts,widget.isADD),));
                              });
                             });
                            }else{
                              Fluttertoast.showToast(msg: "Please select any contact");
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


}


