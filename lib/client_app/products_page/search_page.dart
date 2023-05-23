// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../home_screen/search_screen.dart';

class serach_page extends StatefulWidget {
  const serach_page({Key? key}) : super(key: key);

  @override
  State<serach_page> createState() => _serach_pageState();
}

class _serach_pageState extends State<serach_page> {
  List service= ["All Categories","Barber","Hair Care","Make-up","Facials/Skin Care","Spa","Tattoo Art"
    ,"Nails","Photography","Beauty Consultant","Beauty Product Shop"];
  bool searchbyservice = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    if(searchbyservice) {
                      setState(() {
                        searchbyservice = false;
                      });
                    } else {Navigator.pop(context);}
                  },
                  child: Image.asset(height:height*0.03 ,"assets/images/Group 55.png",),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    if(!searchbyservice) {
                      setState(() {
                        searchbyservice = true;
                      });
                    }
                    print(searchbyservice);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: height*0.07,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: TextField(
                      readOnly: !searchbyservice,
                      onTap: () {
                        if(!searchbyservice) {
                          setState(() {
                            searchbyservice = true;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search for services or stylist",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                searchbyservice?serviceSearch():search()
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget search(){
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height*0.02,),
        Wrap(alignment: WrapAlignment.start,
          runSpacing: 13,
          spacing: 15,
          children: [
            for(int i=0;i<service.length;i++)
              Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45)
                ),
                child: Text(service[i],style: const TextStyle(fontFamily: "spartan",fontSize: 12,color: Colors.black54),),
              )
          ],
        ),
        SizedBox(height: height*0.04,),
        Container(
          alignment: Alignment.topLeft,
          child: const Text("Recent searches",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: "spartan",fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: height*0.02,),
        Row(
          children: [
            SizedBox(
                height: height*0.15,
                width: width*0.30,
                child: const Image(image: AssetImage("assets/images/Rectangle 944.png"),fit: BoxFit.fill,)),
            SizedBox(width: width*0.04,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Lakme",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "spartan",
                        color: Colors.black)),
                Text("Hair product",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "spartan",
                        color: Colors.black54)),
              ],
            )
          ],
        ),
        SizedBox(height: height*0.02,),
        const Divider(color: Colors.black,),
      ],
    );
  }

  Widget serviceSearch() {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Services",style: TextStyle(fontFamily: "spartan",fontWeight: FontWeight.bold,fontSize: 16),),
        SizedBox(height: height*0.02,),
        SizedBox(
          height: height*0.30,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5,itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchScreen();
                },));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: height*0.007),
                child: Row(
                  children: [
                    Container(
                      height: width*0.08,
                      width: width*0.08,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF2994A)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset("assets/images/search.png",height: width*0.04,color: const Color(0xFFF2994A),),
                    ),
                    SizedBox(width: width*0.02,),
                    const Text("Hair salon",style: TextStyle(fontFamily: "spartan",color: Colors.black,fontSize: 12),)
                  ],
                ),
              ),
            );
          },),
        ),
        const Text("Vendors",style: TextStyle(fontFamily: "spartan",fontWeight: FontWeight.bold,fontSize: 16),),
        SizedBox(height: height*0.02,),
        SizedBox(
          height: height*0.40,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5,itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: height*0.007),
              child: Row(
                children: [
                  Container(
                    height: width*0.08,
                    width: width*0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/Group 12006.jpg"),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: width*0.02,),
                  const Text("Hair sparkle beauty",style: TextStyle(fontFamily: "spartan",color: Colors.black,fontSize: 12),)
                ],
              ),
            );
          },),
        ),
      ],
    );
  }
}
