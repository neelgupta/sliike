import 'package:flutter/material.dart';

// ignore: camel_case_types
class help{
  Widget first(){
    return Column(
      children: [
        const Text("LIST BEAUTY SERVICES",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 18,fontWeight: FontWeight.bold),),
        const SizedBox(height: 40,),
        Container(
            alignment: Alignment.center,
            child: const Text("Connect To More Clients \nGrow Your Business \nIncrease Your Revenue",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 14),textAlign: TextAlign.center,)),
      ],
    );
  }
}