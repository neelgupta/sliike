import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class photos extends StatefulWidget {
  const photos({Key? key}) : super(key: key);

  @override
  State<photos> createState() => _photosState();
}

class _photosState extends State<photos> {
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
            SizedBox(height: height*0.03,),
            textComoon("Photos",14,Color(0xff292929),FontWeight.w600),
            SizedBox(height: height*0.03,),
            Container(
           
                child: Image(
                  image: AssetImage(
                      "assets/images/clientphotos.png"),fit: BoxFit.fill,

                )),
          ],
        ),
      ),
    );
  }
}
