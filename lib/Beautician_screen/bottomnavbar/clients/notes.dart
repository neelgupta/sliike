import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class notes extends StatefulWidget {
  const notes({Key? key}) : super(key: key);

  @override
  State<notes> createState() => _notesState();
}

class _notesState extends State<notes> {
  TextEditingController notes=TextEditingController();
  bool notestatus=false;
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        child: Text("Notes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xff01635D),
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),


                    ],
                  ),
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
                textComoon("Add Note",14,Color(0xff292929),FontWeight.w600),
                SizedBox(height: height*0.035,),
                Container(
                  child: TextField(
                    maxLines: 5,
                    controller: notes,
                    onChanged: (value) {
                      notestatus=false;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20,top: 20),
                      hintText: "Drop a note...",
                     // labelText: "",
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
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textComoon("ATTACH FILE",12, Color(0xff2F80ED), FontWeight.w600),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        border: Border.all(width: 1,color: Color(0xff2F80ED))
                      ),
                        child: Icon(Icons.add,color: Color(0xff2F80ED),))
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(alignment: Alignment.center,
                      height: height*0.07,
                      width: width*0.4,
                      child: textComoon("CANCEL", 12, Color(0xff001635D), FontWeight.w600),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xff01635D)),borderRadius: BorderRadius.all(Radius.circular(5))),),
                    Container(alignment: Alignment.center,
                      height: height*0.07,
                      width: width*0.4,
                      child: textComoon("SAVE", 12, Color(0xffFFFFFF), FontWeight.w600),
                      decoration: BoxDecoration(border: Border.all(color: Color(0xff01635D) ),color:Color(0xff01635D) ,borderRadius: BorderRadius.all(Radius.circular(5))),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
