import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class health_detail extends StatefulWidget {
  String detailForClient;
  health_detail(this.detailForClient, {Key? key}) : super(key: key);

  @override
  State<health_detail> createState() => _health_detailState();
}

class _health_detailState extends State<health_detail> {
  TextEditingController Detail=TextEditingController();
  bool Detailstatus=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Detail.text = widget.detailForClient;
    print(widget.detailForClient);
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
                                    image:
                                    AssetImage("assets/images/cancel.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Additional details",
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
        child: Container(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.03,),
                textComoon("Additional Details for clients", 14, Color(0xff292929), FontWeight.w700),
                SizedBox(height: height*0.01,),
                Container(
                  child: TextField(
                    controller: Detail,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff292929),
                        fontWeight: FontWeight.w500,
                        fontFamily: "spartan"),
                    onChanged: (value) {
                      Detailstatus = false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, top: 15),
                      // hintText: "Description",
                      // labelText: "Description",
                      labelStyle:
                      TextStyle(fontFamily: 'spartan', color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                CommonButton(
                    context, "OK", 12, FontWeight.w600, Colors.white, () {
                      Navigator.pop(context,
                        Detail.text
                      );
                      print(Detail.text);
                }),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
