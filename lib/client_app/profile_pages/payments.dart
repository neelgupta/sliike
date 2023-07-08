// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:new_sliikeapps_apps/models/getCardDetailsModel.dart';
import 'package:new_sliikeapps_apps/services/card_services.dart';

import '../../utils/util.dart';
import '../products_page/new_card.dart';

class payments extends StatefulWidget {
  const payments({Key? key}) : super(key: key);

  @override
  State<payments> createState() => _paymentsState();
}

class _paymentsState extends State<payments> {
  bool card = false;
  cardServices _cardServices = cardServices();
  GetCardDetailsData? getCardDetailsData;
  List<bool> isChecked = [];
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getCardDetailsData = await _cardServices.getCardDetails(context);
      isChecked =
          List.generate(getCardDetailsData!.data!.length, (index) => false);
      txtCardName = List.generate(
          getCardDetailsData!.data!.length, (index) => TextEditingController());
      txtCardNo = List.generate(
          getCardDetailsData!.data!.length, (index) => TextEditingController());
      txtExp = List.generate(
          getCardDetailsData!.data!.length, (index) => TextEditingController());
      txtCvv = List.generate(
          getCardDetailsData!.data!.length, (index) => TextEditingController());
      for (int i = 0; i < getCardDetailsData!.data!.length; i++) {
        txtCardName[i].text = getCardDetailsData!.data![i].cardName!;
        txtCardNo[i].text =
            "xxxx xxxx xxxx ${getCardDetailsData!.data![i].cardLastFour!}";
        txtExp[i].text =
            "${getCardDetailsData!.data![i].expiryMonth!}/${getCardDetailsData!.data![i].expiryYear!}";
        txtCvv[i].text = getCardDetailsData!.data![i].cardCVV ?? "";
        isChecked[i] =
            getCardDetailsData!.data![i].isPrimary == 0 ? false : true;
      }
      setState(() {});
    });
    super.initState();
  }

  List<TextEditingController> txtCardName = [TextEditingController()];
  List<TextEditingController> txtCardNo = [TextEditingController()];
  List<TextEditingController> txtExp = [TextEditingController()];
  List<TextEditingController> txtCvv = [TextEditingController()];

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: height * 0.06,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Image(
                            image: AssetImage("assets/images/Group 55.png"),
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("payments",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold))
                          .tr(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const Text("payments_info",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "spartan"))
                .tr(),
            SizedBox(
              height: height * 0.02,
            ),
            (getCardDetailsData?.data ?? []).isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: getCardDetailsData!.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(05),
                                height: height * 0.24,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    // color: Colors.red,
                                    image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/cardPayment.png"),
                                  fit: BoxFit.fill,
                                )),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 20),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            "${getCardDetailsData!.data![index].cardBrand}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(right: 10, top: 75),
                                        child: Text(
                                            "${getCardDetailsData!.data![index].cardLastFour}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                              "${getCardDetailsData!.data![index].cardName}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white70,
                                                  fontSize: 15)),
                                          Spacer(),
                                          Text(
                                              "${getCardDetailsData!.data![index].expiryMonth!}/${getCardDetailsData!.data![index].expiryYear!}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white70,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Image(image: const AssetImage("assets/images/Frame 427320901.png"),height: height*0.24,width: width,fit: BoxFit.fill,),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextField(
                                readOnly: true,
                                controller: txtCardName[index],
                                style: const TextStyle(
                                    fontFamily: "spartan", fontSize: 12),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: "card_name".tr(),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextField(
                                readOnly: true,
                                controller: txtCardNo[index],
                                style: const TextStyle(
                                    fontFamily: "spartan", fontSize: 12),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: "card_number".tr(),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.42,
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: txtExp[index],
                                      style: const TextStyle(
                                          fontFamily: "spartan", fontSize: 12),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(5),
                                        CardExpirationFormatter(),
                                      ],
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: "expire_date".tr(),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: width * 0.42,
                                    child: TextField(
                                      readOnly: true,
                                      controller: txtCvv[index],
                                      style: const TextStyle(
                                          fontFamily: "spartan", fontSize: 12),
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: "cvv".tr(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: height * 0.05,
                                    width: width * 0.05,
                                    child: Checkbox(
                                      activeColor: const Color(0xFFDD6A03),
                                      value: isChecked[index],
                                      onChanged: (bool? value) {
                                        for (var i = 0;
                                            i < isChecked.length;
                                            i++) {
                                          isChecked[i] = false;
                                        }
                                        isChecked[index] = true;
                                        _cardServices.saveSelectedCard(
                                            getCardDetailsData!
                                                .data![index].cardToken,
                                            value! ? 1 : 0);
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.04,
                                  ),
                                  const Text("use_this_card",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "spartan",
                                              color: Colors.black))
                                      .tr(),
                                  Spacer(),
                                  if (!isChecked[index])
                                    InkWell(
                                        onTap: () {
                                          deleteCard(index);
                                        },
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        ))
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              const Divider(
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                    child: Text("No cards avialble, Please add New card"),
                  )),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return new_card();
                  },
                ));
              },
              child: Row(
                children: [
                  Image(
                    image: const AssetImage("assets/images/Group 12095.png"),
                    height: height * 0.04,
                    width: width * 0.06,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Text("add_new_card",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "spartan",
                              color: Color(0xffDD6A03)))
                      .tr(),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  deleteCard(index) async {
    Response response = await _cardServices.deleteCard(
        context, getCardDetailsData!.data![index].cardToken);

    if (response.statusCode == 200) {
      getCardDetailsData!.data!.removeAt(index);
      isChecked.removeAt(index);
      setState(() {});
    }
  }
}
