import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/order/order.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_Flow_start/addproduct/addproduct_photos/addproduct_photos.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_list/product_list.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/stockrecord/stockrecord.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

class productbaar extends StatefulWidget {

  const productbaar({Key? key}) : super(key: key);

  @override
  State<productbaar> createState() => _productbaarState();
}

class _productbaarState extends State<productbaar> {
   var selectedItem = '';
  bool ProductList = true;
  bool Orders = false;
  bool StockRecord = false;
  String type = "1";

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
          color: Color(0xff01635D),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Container(
                          child: Text("Products",
                              style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.w700)),
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              alignment: Alignment.center,
              height: height * 0.06,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          ProductList = true;

                          Orders = false;

                          StockRecord = false;

                          type = "1";

                          // notificationf(type);

                          print(type);
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: ProductList ? Color(0xff01635D) : Colors.white,
                            border: Border.all(
                                color: ProductList
                                    ? Color(0xff01635D)
                                    : Colors.black38)),
                        child: Text(
                          "Product List",
                          style: TextStyle(
                              color:
                              ProductList ? Colors.white : Color(0xff01635D),
                              fontFamily: 'spartan',
                              fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          ProductList = false;

                          Orders = true;

                          StockRecord = false;

                          type = "2";

                          // notificationf(type);

                          print(type);
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: Orders ? Color(0xff01635D) : Colors.white,
                            border: Border.all(
                                color: Orders
                                    ? Color(0xff01635D)
                                    : Colors.black38)),
                        child: Text(
                          "Orders",
                          style: TextStyle(
                              color: Orders ? Colors.white : Color(0xff01635D),
                              fontFamily: 'spartan',
                              fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          ProductList = false;

                          Orders = false;

                          StockRecord = true;

                          type = "3";

                          // notificationf(type);

                          print(type);
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color:
                            StockRecord ? Color(0xff01635D) : Colors.white,
                            border: Border.all(
                                color: StockRecord
                                    ? Color(0xff01635D)
                                    : Colors.black38)),
                        child: Text(
                          "StockRecord",
                          style: TextStyle(
                              color: StockRecord
                                  ? Colors.white
                                  : Color(0xff01635D),
                              fontFamily: 'spartan',
                              fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),





                  ],
                ),
              ),
            ),
            ///productlist ADD
            ProductList==true? Expanded(child: productList(context)):Container(),
            //AddProduct(context),

            ///order select
            Orders==true?Expanded(child: order(context)):Container(),

            StockRecord==true?Expanded(child: stackRecord(context)):Container(),
          ],

        ),
        floatingActionButton:  ProductList==true
        ?InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return addProduct_Photos();
            },));
          },
          child: Container(
            width: width*0.29,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff01635D),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  textComoon("ADD",12, Colors.white, FontWeight.w600),
                  SizedBox(width: 10,),
                  Icon(Icons.add,size: 20,color: Colors.white,),

                ],
              ),
            ),
          ),
        ):SizedBox(),

    );

  }
}
