import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ServiceDescription extends StatefulWidget {
  String desc;
  String img;
  ServiceDescription(this.desc,this.img,{super.key});

  @override
  State<ServiceDescription> createState() => _ServiceDescriptionState();
}

class _ServiceDescriptionState extends State<ServiceDescription> {
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
        toolbarHeight: height * 0.14, //
        flexibleSpace: Container(
          color: const Color(0xffF5F7F7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Colors.black),
                        ),
                        SizedBox(
                          width: width * 0.3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: Text("Men's Cut",
                                    style: TextStyle(
                                        fontSize: 18,
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xff292929),
                                        fontFamily: "spartan",
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Service description",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
              widget.desc!=""?  "${widget.desc}":"Description not available!",
                style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color(0xff707070),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Gallery",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl:
                      // imageUrl:
                      //     "${getPortfolioModel?.data?[index]}",
                      "${widget.img}",
                  imageBuilder: (context, imageProvider) => Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                        image: DecorationImage(
                            image: NetworkImage(
                                "${widget.img}"),
                            fit: BoxFit.fill)),
                  ),
                  progressIndicatorBuilder: (context, url, process) =>
                      Container(
                          height: height * 0.16,
                          width: width,
                          margin: const EdgeInsets.all(5),
                          child:
                              const Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26)
                      ),
                      // color: Colors.amber,
                      height: height * 0.16,
                      width: width,
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text("No Image")
                        ],
                      ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
