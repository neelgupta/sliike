import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signin/signin.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/viewscrren/signup/signup.dart';



class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  List imageList = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];
  List<Container> text = [
    Container(
  child: Column(
  children: [
  const Text("LIST BEAUTY SERVICES",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 18,fontWeight: FontWeight.bold),),
  const SizedBox(height: 40,),
  Container(
  alignment: Alignment.center,
  child: const Text("Connect To More Clients \nGrow Your Business \nIncrease Your Revenue",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 14),textAlign: TextAlign.center,)),
  ],
  ),
  ),
    Container(
  child: Column(
  children: [
  const Text("LIST BEAUTY PRODUCTS",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 18,fontWeight: FontWeight.bold),),
  const SizedBox(height: 40,),
  Container(
  alignment: Alignment.center,
  child: const Text("Sell and ship niche beauty products to\n clients with ease.",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 14),textAlign: TextAlign.center,)),
  ],
  ),
  ),
    Container(
  child: Column(
  children: [
  const Text("ADVERTISE YOUR BRAND",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 18,fontWeight: FontWeight.bold),),
  const SizedBox(height: 40,),
  Container(
  alignment: Alignment.center,
  child: const Text("Increase Your Brand Awareness\n Increase Traffic To Your Webpage \nSignificantly Grow Sales",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 14),textAlign: TextAlign.center,)),
  ],
  ),
  ),
    Container(
  child: Column(
  children: [
  const Text("CONNECT YOUR COMMUNITY",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 18,fontWeight: FontWeight.bold),),
  const SizedBox(height: 40,),
  Container(
  alignment: Alignment.center,
  child: const Text("Get Beauty & Health Tips\nGet Cultural Connections\nGain Friendship & Community\nGet Answers to Beauty Questions",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 14),textAlign: TextAlign.center,)),
  ],
  ),
  ),

  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height*0.8,
            child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: [
                      Image.asset('${imageList[index]}',fit: BoxFit.fill),
                      SizedBox(height: height*0.1,),
                      Container(
                          child: text[index],
                          )
                    ],
                  );
                },
                itemCount: 4,
                pagination: const SwiperPagination(alignment: Alignment.center,margin: EdgeInsets.only(top: 40),builder: DotSwiperPaginationBuilder(color: Colors.grey,activeColor: Colors.black,activeSize: 8,size: 5)),
              ),
          ),
          const SizedBox(height: 20,),
          const Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const signInScreen();
              },));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff01635D)),
                child: const Text("SIGN IN",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "spartan",
                        color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(height:20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("New to Sliike?",style: TextStyle(color: Colors.black,fontFamily: "spartan",fontSize: 12)),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return signUp();
                },));
              },
                  child: const Text(" SIGN UP",style: TextStyle(color: Color(0xFF01635D),fontFamily: "spartan",fontSize: 12,fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height:40,),
        ],
      ),
    );
  }
}
