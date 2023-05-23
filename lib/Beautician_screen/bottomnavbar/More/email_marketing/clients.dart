import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/checkbox.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

import '../../clients/addclient_screen/add_clients.dart';

class clients extends StatefulWidget {
  const clients({Key? key}) : super(key: key);

  @override
  State<clients> createState() => _clientsState();
}

class _clientsState extends State<clients> {
  List<Contact>? _contacts=[];
  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    final contacts = await FlutterContacts.getContacts();
    setState(() => _contacts = contacts);
  }
  bool checkboxvalue = false;
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.only(left: 20,right: 20),
         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding:  EdgeInsets.only(top: height*0.09),
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
                       width: width * 0.25,
                     ),
                     Container(
                       child: Text("Clients",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               fontSize: 16,
                               overflow: TextOverflow.ellipsis,
                               color: Colors.black,
                               fontFamily: "spartan",
                               fontWeight: FontWeight.w700)),
                     ),
                   ],
                 ),
               ),
             ),

             Row(mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 InkWell( onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context) {
                     return add_Clients();
                   },));
                 },
                   child: textComoon("Done", 12, Color(0xff01635D),
                       FontWeight.w600),
                 ),

               ],),
             SizedBox(
               height: height * 0.04,
             ),

             Row(
               children: [
                 Expanded(
                   child: Container(
                     child: TextField(
                       controller: search,
                       onChanged: (value) {},
                       decoration: InputDecoration(
                         contentPadding: EdgeInsets.only(left: 20),
                         hintText: "Search client",
                         hintStyle:
                         TextStyle(color: Color(0xff707070)),
                         suffixIcon: Container(
                           width: width * 0.15,
                           decoration: BoxDecoration(
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
                         labelStyle: TextStyle(
                             fontFamily: 'spartan',
                             color: Colors.black54),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5),
                           borderSide:
                           BorderSide(color: Colors.black38),
                         ),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5),
                           borderSide:
                           BorderSide(color: Colors.black38),
                         ),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Container(
                   width: width * 0.2,
                   decoration: BoxDecoration(
                     border: Border.all(
                         color: Color(0xffA0A0A0), width: 1),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Column(
                     children: [
                       Icon(Icons.arrow_drop_up_outlined,size: 22),
                       Icon(Icons.arrow_drop_down_outlined,size: 22,),

                     ],
                   ),
                 )
               ],
             ),

             SizedBox(
               height: height * 0.02,
             ),
             Container(alignment: Alignment.topRight,
               child: textComoon("Select All", 12, Color(0xff01635D),
                   FontWeight.w600),
             ),
             Expanded(
               child: Container(
                 alignment: Alignment.topCenter,
                 child:
                   ListView.separated(
                   separatorBuilder: (context, index) => Divider(
                     color: Colors.black,
                   ),
                   physics: BouncingScrollPhysics(),

                   shrinkWrap: true,
                   itemCount:  _contacts!.length,
                   itemBuilder: (context, index) {
                     return Container(
                       child: Padding(
                         padding:
                         const EdgeInsets.only(top: 10, bottom: 5),
                         child: Row(
                           children: [
                             Custom_Checkbox(
                               isChecked: checkboxvalue,
                               onChange: (value) {
                                 setState(() {
                                   checkboxvalue = value;
                                 });
                               },
                               backgroundColor: Color(0xff01635D),
                               borderColor: Color(0xff01635D),
                               icon: Icons.check,
                               iconColor: Colors.white,
                               size: 24,
                               iconSize: 20,
                             ),
                             SizedBox(
                               width: 15,
                             ),
                             Container(
                               width: 35,
                               height: 35,
                               decoration: BoxDecoration(
                                 color: Color(0xffCFCFCF),
                                 shape: BoxShape.circle,
                               ),
                               child: Image.asset(
                                   "assets/images/profile.png",
                                   fit: BoxFit.fill),
                             ),
                             SizedBox(
                               width: 20,
                             ),
                             Container(
                               width: width * 0.5,
                               child: Text(
                                 "${_contacts![index].displayName}",
                                 overflow: TextOverflow.ellipsis,
                                 style: TextStyle(
                                   fontSize: 12,
                                   color: Color(0xff414141),
                                   fontFamily: "spartan",
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     );
                   },
                 ),
               ),
             )
           ],
         ),
       ),
    );
  }
}
