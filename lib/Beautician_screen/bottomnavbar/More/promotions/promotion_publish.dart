import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/promotions/promotion.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/ButtonCommon/Button.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class promotion_Publish extends StatefulWidget {
  const promotion_Publish({Key? key}) : super(key: key);

  @override
  State<promotion_Publish> createState() => _promotion_PublishState();
}

class _promotion_PublishState extends State<promotion_Publish> {
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
                        width: width * 0.15,
                      ),
                      Container(
                        child: Text("Add Promotion",
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height*0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                textComoon("Save Big on Beard Trim", 18, Color(0xff292929), FontWeight.w700),
                SizedBox(height: height*0.01,),
                textComoonfade("Save big from on beard trim  17 April to 22 April. Get 50% off on this service.", 14, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.05,),
                Container(
                  height: height*0.1,
                  width: width,
                  decoration: BoxDecoration(
                    color: Color(0xff78D6F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:Center(child: textComoon("50% OFF", 18, Color(0xff292929), FontWeight.w700)),
                ),
                SizedBox(height: height*0.04,),
                textComoon("Service", 12, Color(0xff292929), FontWeight.w700),
                SizedBox(height: height*0.01,),
                textComoon("Beard Trim", 14, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.02),
                textComoon("Promo Period", 12, Color(0xff292929), FontWeight.w700),
                SizedBox(height: height*0.01,),
                textComoon("17 April,2022 - 22 April,2022", 14, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.01,),
                dividerCommon(),
                Spacer(),
                textComoon("Note: ", 12, Color(0xff292929), FontWeight.w700),
                SizedBox(height: height*0.01,),
                textComooncenter("This promo can not be deleted\nonce posted.", 12, Color(0xff414141), FontWeight.w500),
                SizedBox(height: height*0.02,),
                CommonButton(context, "PUBLISH", 12, FontWeight.w600, Colors.white, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return promotion();
                },));
                }),
               // SizedBox(height: height*0.04,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
