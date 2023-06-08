import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';
import 'package:http/http.dart' as http;
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:fluttertoast/fluttertoast.dart';

class faq_beauty extends StatefulWidget {
  const faq_beauty({Key? key}) : super(key: key);

  @override
  State<faq_beauty> createState() => _faq_beautyState();
}

class _faq_beautyState extends State<faq_beauty> {
  Header ? faq;
  bool isLoading = true;
  List<bool> ? isExpand;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBeautyFAQList();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width-MediaQuery.of(context).padding.right-MediaQuery.of(context).padding.left;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.13, // Set this height
          flexibleSpace: Container(
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Rectangle 28.png"),fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20,bottom: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: height*0.06,
                          child:Container(
                              padding: const EdgeInsets.all(5),
                              child: const Image(image: AssetImage("assets/images/Group 55.png"),color: Colors.black,)),
                        ),
                      ),
                      SizedBox(width: width*0.30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("FAQ",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: isLoading ? Center(child: CircularProgressIndicator(color: Color(0xff01635D))):
        faq!=null && faq!.data.length!=0 ? SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                // const TextField(
                //   style: TextStyle(fontFamily: "spartan",fontSize: 12),
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     hintText: "Describe your issue"
                //   ),
                // ),
                SizedBox(height: height*0.02,),
                Container(
                  // color: Colors.red,
                  height: height*0.80,
                  child: ListView.builder(
                    itemCount: faq!.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                isExpand![index] = !isExpand![index];
                              });
                              print(isExpand![index]);
                            },
                            child: Row(
                              children:  [
                                Text("${faq!.data[index].question}", style: TextStyle(fontSize: 14, fontFamily: "spartan", color: Colors.black)),
                                Spacer(),
                                isExpand![index]?
                                Icon(Icons.keyboard_arrow_up_rounded,size: 30,):
                                Icon(Icons.keyboard_arrow_down_rounded,size: 30,)
                              ],),
                          ),
                          const SizedBox(height: 05,),
                          isExpand![index]?SizedBox() : const Divider(color: Colors.black54,),
                          isExpand![index]?
                          Row(
                            children:  [
                              Text("Answer - ${faq!.data[index].answer}", style: TextStyle(fontSize: 14, fontFamily: "spartan", color: Colors.black)),
                            ],):SizedBox(),
                          isExpand![index]?const Divider(color: Colors.black54,) : SizedBox(),
                        ],
                      );
                    },),
                )
              ],
            ),
          ),
        ):
        Center(child: Text("No FAQ's Available !!"))
    );
  }
  getBeautyFAQList() async {
    var postUri = Uri.parse(ApiUrlList.getBeautyFAQList);
    var request = http.MultipartRequest("GET", postUri);

    http.StreamedResponse response = await request.send();

    log('getClientFAQList Code ====>>> ${response.statusCode}');
    final res = await http.Response.fromStream(response);

    log('getClientFAQList Body ====>>> ${res.body}');
    Map map = jsonDecode(res.body);
    if(map['status']==200){
      setState(() {
        faq = Header.fromjson(map);
        isExpand = List.generate(faq!.data.length, (index) => false);
        isLoading = false;
      });
    }else{
      Fluttertoast.showToast(
          msg: "${map['message']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        faq = null;
        isLoading = false;
      });
    }
  }
}
class Header{
  int status;
  String message;
  List<Data> data;
  Header(this.status, this.message,this.data);

  factory Header.fromjson(Map<dynamic,dynamic>map){
    List list = map["data"];
    List<Data> d = list.map((e) => Data.fromjson(e)).toList();
    return Header(map['status'], map['message'],d);
  }
}
class Data{
  // String _id;
  String useFor;
  String question;
  String answer;
  Data(this.useFor, this.question, this.answer);

  factory Data.fromjson(Map<dynamic,dynamic>map){
    return Data(map["useFor"], map["question"], map["answer"]);
  }
}
