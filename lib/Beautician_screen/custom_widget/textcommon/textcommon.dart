

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

Widget textComoon(String text,double font,Color colors,FontWeight fontweight){

  return Text(
      text,
      overflow: TextOverflow.ellipsis,


      style: TextStyle(
      fontSize: font,
      color: colors,
  fontFamily: "spartan",
  fontWeight: fontweight,
  )).tr();
}

Widget textComoonfade(String text,double font,Color colors,FontWeight fontweight){

  return Text(
      text,
      overflow: TextOverflow.fade,


      style: TextStyle(
        fontSize: font,
        color: colors,
        fontFamily: "spartan",
        fontWeight: fontweight,
      )).tr();
}

Widget textComooncenter(String text,double font,Color colors,FontWeight fontweight){

  return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: font,
        color: colors,
        fontFamily: "spartan",
        fontWeight: fontweight,
      ));
}
