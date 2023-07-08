import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/product_flow/productlist/product_Flow_start/addproduct/all_addproduct/sale_add_product/All_add_product_sale.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';

Widget productList(BuildContext context) {
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  var selectedItem = 0;
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20,top: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: textComoon(
                "Products (2)", 14, const Color(0xff292929), FontWeight.bold)),
        SizedBox(
          height: height * 0.015,
        ),
        Expanded(
          child: Container(
              // color: Colors.red,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color(0xffE7E7E7), width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Material(
                                  elevation: 20,
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 4,
                                            offset: Offset(4, 0), // Shadow position
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/Rectangle218.png"))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    textComoon(
                                        "Gatsby Hair Dye",
                                        14,
                                        const Color(0xff292929),
                                        FontWeight.w600),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    textComoon(
                                        "120 in stock",
                                        12,
                                        const Color(0xff414141),
                                        FontWeight.w500),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    textComoon(
                                        "\$20",
                                        12,
                                        const Color(0xff292929),
                                        FontWeight.w600),
                                  ],
                                ),
                                const Spacer(),
                                PopupMenuButton(
                                  padding: EdgeInsets.only(bottom: 15),
                                  onSelected: (value) {
                                    selectedItem = value as int;
                                    if (selectedItem == 1) {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return const all_product_sale();
                                        },
                                      ));
                                    } else if (selectedItem == 2) {
                                      deletedialog(context);
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem(
                                        value: 1,
                                        child: textComoon("Edit", 12,
                                            Colors.black, FontWeight.w500),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: textComoon("Delete", 12,
                                            Colors.black, FontWeight.w500),
                                      ),
                                    ];
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              )),
        )
      ],
    ),
  );
}

 deletedialog(BuildContext context) {
  double height = MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  double width = MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.right -
      MediaQuery.of(context).padding.left;
  return showDialog(
    context: context,
    builder: (context) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: SizedBox(
              height: 250,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: 10,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Color(0xffFF2A1C),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: textComoon("Delete product?", 14,
                        const Color(0xff111111), FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: textComooncenter(
                          "You are trying to delete a product. This action can not be undone. Are you sure you want to delete this customer?",
                          12,
                          const Color(0xff414141),
                          FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: const Color(0xff414141),
                                      width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 10),
                                child: Center(
                                  child: textComoon("NO,CANCEL", 10,
                                      const Color(0xff828282), FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // Navigator.push(context, MaterialPageRoute(
                              //   builder: (context) {
                              //     return ();
                              //   },
                              // ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xffFF2A1C),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 10),
                                child: Center(
                                  child: textComoon("YES, DELETE", 10,
                                      const Color(0xffFFFFFF), FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 250),
            child: Container(
              alignment: Alignment.center,
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffFF2A1C), width: 1),
              ),
              child: Center(
                  child: Image.asset(
                "assets/images/delete.png",
                height: 40,
              )),
            ),
          ),
        ],
      );
    },
  );
}
