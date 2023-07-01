import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/client_app/%20beautician%20_page/book_appoinment_payment.dart';
import 'package:new_sliikeapps_apps/client_app/profile_pages/add_new_address.dart';
import 'package:new_sliikeapps_apps/client_model/get_profile_model.dart';
import 'package:new_sliikeapps_apps/services/address_service.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({Key? key}) : super(key: key);

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  AddressService addressService = AddressService();
  bool isLoading = true;
  GetProfileModel? getProfile;
  String addressId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddress();
  }

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
        toolbarHeight: height * 0.13, // Set this height
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFCF0E6),
              image: DecorationImage(
                  image: AssetImage("assets/images/bgappbar.png"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: height * 0.06,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              image: AssetImage("assets/images/back.png"),
                              color: Colors.black,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("select_address",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: "spartan",
                                    fontWeight: FontWeight.bold))
                            .tr(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: const CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                      child: getProfile != null
                          ? ListView.builder(
                              itemCount: getProfile!.data.address.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.black38)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                            "${getProfile!.data.address[index].addressId.address}, ${getProfile!.data.address[index].addressId.apartment}"),
                                      ),
                                      const SizedBox(width: 10),
                                      // Spacer(),
                                      Radio<String>(
                                        activeColor: const Color(0xffDD6A03),
                                        value: getProfile!
                                            .data.address[index].addressId.id,
                                        groupValue: addressId,
                                        onChanged: (value) {
                                          setState(() {
                                            addressId = getProfile!.data
                                                .address[index].addressId.id;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          : Container()),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return add_new_address(
                            Address_Name: "",
                            Apartment_suite: "",
                            Location: "",
                            Province_name: "",
                            Zip_Code: "",
                            addressValue: false,
                          );
                        },
                      )).then((value) {
                        getAddress();
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add_circle_outline,
                          color: Color(0xffDD6A03),
                          size: 20,
                        ),
                        SizedBox(width: width * 0.01),
                        const Text(
                          "add_new_address",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffDD6A03)),
                        ).tr()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (addressId.isNotEmpty) {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return book_appoinment_payment(
                                addressId: addressId);
                          },
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please Select Address")));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffDD6A03)),
                      child: const Text("continue",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "spartan",
                                  color: Colors.white))
                          .tr(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  getAddress() async {
    setState(() {
      isLoading = true;
    });
    getProfile = await addressService.getAddressList();
    isLoading = false;
    addressId = "";
    setState(() {});
  }
}
