import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class reviews extends StatefulWidget {
  const reviews({Key? key}) : super(key: key);

  @override
  State<reviews> createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
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
            textComoon("Reviews",14,Color(0xff292929),FontWeight.w600),
            SizedBox(height: height*0.035,),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
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
                          width: width * 0.025,
                        ),
                        Container(
                          //width: width * 0.4,
                          child: Text(
                            "Gina Ray",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff292929),
                              fontFamily: "spartan",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacer(),
                  Row(
                    children: [
                      textComoon(
                          "30 Mar 2022",
                          12,
                          Color(0xff707070),
                          FontWeight.w500),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: textComoon("4.5", 10,
                        Color(0xff707070), FontWeight.w500),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Icon(Icons.thumb_up_off_alt,
                      color: Color(0xff707070)),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: textComoon("200 like", 10,
                        Color(0xff707070), FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text:
                      'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Pellentesque tristique elit in\nnibh ultricies rhoncus. ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'spartan',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff707070),
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {},
                          text: 'Read more',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'spartan',
                            color: Color(0xff2F80ED),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
