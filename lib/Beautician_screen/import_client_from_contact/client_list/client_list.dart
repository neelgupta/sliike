import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/bottomnavbar.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/import_client_from_contact/Contactlist/contactlist_select.dart';

// ignore: camel_case_types, must_be_immutable
class clientListContact extends StatefulWidget {
  List<Contact>? contacts;
   clientListContact(this.contacts, {Key? key}) : super(key: key);

  @override
  State<clientListContact> createState() => _clientListContactState();
}
// ignore: camel_case_types, must_be_immutable
class _clientListContactState extends State<clientListContact> {
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
                            SizedBox(width: width/5,),
                        const Text("Clients List",
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
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: height*0.55,
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
                              SizedBox(
                                width: width*0.5,
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
                              const Spacer(),
                              ///pending Button ?
                              Container(

                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(4),

                                    color: const Color(0xffFFD059),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                  child: Text("Pending",style: TextStyle(fontFamily: 'Cairo',fontSize: 12,color: Color(0xff111111)),),
                                ),
                              ),
                              ///Accepted buttom ?
                              // Container(
                              //
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadiusDirectional.circular(4),
                              //
                              //     color: Color(0xff219653),
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                              //     child: Text("Accepted",style: TextStyle(fontSize: 10,fontFamily: 'Cairo',color: Color(0xffFFFFFF)),),
                              //   ),
                              // ),
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
              const Spacer(),
              SizedBox(

                width: width*0.4,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return contactLIst_Select(widget.contacts);
                    },));
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
                      Expanded(
                        child: Text("ADD CLIENT",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff2F80ED),
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.04,),

              InkWell(
                onTap: () {
                  setState(() {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const BottomNavigation();
                      },));
                    });
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff01635D)),
                  child: const Text("START USING APP",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "spartan",
                          color: Colors.white)),
                ),
              ),
              SizedBox(height: height*0.04,),
            ],
          ),
        ),
      ),
    );
  }
}
