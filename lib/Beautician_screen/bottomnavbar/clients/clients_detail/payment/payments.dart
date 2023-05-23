import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/clients/clients_detail/payment/payment_detail.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class payments extends StatefulWidget {
  const payments({Key? key}) : super(key: key);

  @override
  State<payments> createState() => _paymentsState();
}

class _paymentsState extends State<payments> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.03,),
                  textComoon("Paymemt",14,Color(0xff292929),FontWeight.w600),
                  SizedBox(height: height*0.035,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xffCFCFCF),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/card.png",
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textComoon("Mar 15, 2022 - 9:30 AM", 12, Color(0xff292929),
                                FontWeight.w500),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                  child: textComoon("Beard Trim", 10,
                                      Color(0xff414141), FontWeight.w500)),
                            ),
                            SizedBox(height: height*0.005,),
                            textComoon("\$20.00", 14, Color(0xff292929),
                                FontWeight.w600),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return payMentDetail();
                          },));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff94c5a9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            child: textComoon("PAID",12,Color(0xff219653), FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.015,),
                  Divider(thickness: 1,color: Color(0xffCFCFCF),)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
