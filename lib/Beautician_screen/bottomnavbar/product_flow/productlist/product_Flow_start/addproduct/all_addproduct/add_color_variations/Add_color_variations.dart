import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class add_color_variations extends StatefulWidget {
  const   add_color_variations({Key? key}) : super(key: key);

  @override
  State<add_color_variations> createState() => _add_color_variationsState();
}

class _add_color_variationsState extends State<add_color_variations> {
  TextEditingController color=TextEditingController();
  int colorLength = 1;
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
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
                  child: Row(
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
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Image(
                                  image:
                                  AssetImage("assets/images/Group 55.png"),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 5,
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          child: Text("Add Variation",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
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
      body: Container(
        height: height*0.8,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(alignment: Alignment.topLeft,
                  child: textComoon(
                      "Add color variation(s)", 14, Color(0xff292929), FontWeight.w700)),
              SizedBox(
                height: height * 0.03,
              ),
              Container(

                height: height*0.1 * colorLength,
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: colorLength,
                  itemBuilder: (context, index) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    textComoon("Add color", 12,Color(0xff414141),FontWeight.w500),
                    SizedBox(height: height*0.01,),
                    Container(
                    height: height*0.05,
                      child: TextField(
                        controller: color,
                        onChanged: (value) {
                          setState(() {
                            //namestatus=false;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          // hintText: "First Name",
                          // labelText: "First Name",
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
                      SizedBox(height: height*0.02,),
                  ],);
                },),
              ),

              SizedBox(height: height*0.01,),
              InkWell(
                onTap: () {
                  setState(() {
                    colorLength++;
                  });
                },
                child: Row(
                  children: [
                    Container(
                        width: 20,
                        height: 20,
                        child: Image.asset("assets/images/add-square.png")),
                    SizedBox(
                      width: 10,
                    ),
                    textComoon("Add more color", 12, Color(0xff1571ED),
                        FontWeight.w500),

                  ],
                ),
              ),
               Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(alignment: Alignment.center,
                    height: height*0.05,
                    width: width*0.4,
                    child: textComoon("CANCEL",12,Color(0xff414141), FontWeight.w600),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xff414141)),borderRadius: BorderRadius.all(Radius.circular(5))),),
                  Container(alignment: Alignment.center,
                    height: height*0.05,
                    width: width*0.4,
                    child: Text("SAVE",style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(border: Border.all(color: Color(0xFF01635D) ),color:Color(0xFF01635D) ,borderRadius: BorderRadius.all(Radius.circular(5))),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
