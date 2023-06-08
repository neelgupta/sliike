
import 'package:flutter/material.dart';


// ignore: non_constant_identifier_names
Widget CommonButton(BuildContext context,String TextString,double FontSize,FontWeight FontWeight,Color Colors,Function()? ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff01635D)),
      child: Text(TextString,
          style: TextStyle(
              fontSize: FontSize,
              fontFamily: "spartan",
              fontWeight: FontWeight,
              color: Colors)),
    ),
  );
}

///bg  color black
Widget commonButtonblack(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff111111)),
      child: Text(textString,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: "spartan",
              fontWeight: fontWeight,
              color: colors)),
    ),
  );
}
///bg  color blue
Widget commonButtonblue(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff1571ED)),
      child: Text(textString,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: "spartan",
              fontWeight: fontWeight,
              color: colors)),
    ),
  );
}

// ignore: non_constant_identifier_names
///border color green or bg white
Widget commonButtonborder(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff01635D),width: 1),
          color: const Color(0xffFFFFFF)),
      child: Text(textString,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: "spartan",
              fontWeight: fontWeight,
              color: colors)),
    ),
  );
}

///border color green or bg white  radius 5
Widget commonButtonborderreadius(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff01635D),width: 1),
          color: const Color(0xffFFFFFF)),
      child: Text(textString,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: "spartan",
              fontWeight: fontWeight,
              color: colors)),
    ),
  );
}



///border grey bg white
Widget commonButtonbordergrey(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff707070),width: 1),
          color: const Color(0xffFFFFFF)),
      child: Text(textString,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: "spartan",
              fontWeight: fontWeight,
              color: colors)),
    ),
  );
}

Widget commonButtonoricon(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff01635D)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            child: Image.asset("assets/images/share.png"),
          ),

          const SizedBox(width: 10,),
          Text(textString,
              style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: "spartan",
                  fontWeight: fontWeight,
                  color: colors)),
        ],
      ),
    ),
  );
}

///orance
Widget commonButtonorange(BuildContext context,String textString,double fontSize,FontWeight fontWeight,Color colors,VoidCallback ontap){
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.right - MediaQuery.of(context).padding.left;

  return  InkWell(
    onTap: ontap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffDD6A03)),
      child: Text(textString,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: "spartan",
              fontWeight: fontWeight,
              color: colors)),
    ),
  );
}

Widget dividerCommon(){
  return  const Divider(thickness: 1,color: Color(0xffCFCFCF),);
}


