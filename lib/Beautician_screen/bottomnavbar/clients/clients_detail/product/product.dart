import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
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
            textComoon("Product",14,Color(0xff292929),FontWeight.w600),
            SizedBox(height: height*0.035,),



            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                  height: height,

                  child: ListView.builder(
                    shrinkWrap: true,

                    itemCount:2,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {

                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(color: Color(0xffCFCFCF),width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("assets/images/product1.png")
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Container(
                                        height: 90,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            textComoon("Lakme Body Cream", 12, Color(0xff414141), FontWeight.w500),
                                           SizedBox(height: 10,),
                                           textComoon("\$999", 12, Color(0xff111111), FontWeight.w600),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: 20,
                                        child: Image.asset("assets/images/righticon.png"),
                                      ),

                                    ],
                                  ),

                                ),

                              ),
                              SizedBox(height: 15,),
                            ],
                          ),

                      );
                    },)


              ),
            )
          ],
        ),
      ),
    );
  }
}
