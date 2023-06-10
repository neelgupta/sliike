import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/booking_setting/booking_setting.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/business_detail/business_detail.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/calendar_management/calendar_manage_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/cancellation_policy/cancellation_policy.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/no_show_protection/no_show_protection.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/payment_sales/bank_detail/bank_detail_main_screen.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/plans_billing/plans_bulling_main/plans_bulling_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/bottomnavbar/More/business_setup/busines_setup/service_setup/setup_main.dart';
import 'package:new_sliikeapps_apps/Beautician_screen/custom_widget/textcommon/textcommon.dart';


class business_SetUp extends StatefulWidget {
  final String email;
  bool isStripeSetUp;
  business_SetUp( {Key? key,required this.email,required this.isStripeSetUp}) : super(key: key);

  @override
  State<business_SetUp> createState() => _business_SetUpState();
}

class _business_SetUpState extends State<business_SetUp> {
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
        toolbarHeight: height * 0.13, //

        flexibleSpace: Container(
          color: Color(0xffFFFFFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
                  child: Row(

                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: height * 0.06,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Container(
                                padding: EdgeInsets.all(5),
                                child: Image(
                                  image:
                                  AssetImage("assets/images/Group 55.png"),

                                )),
                          ),
                        ),
                      ),
                      SizedBox(width: width*0.15,),
                      Container(
                        child: Text("Business Set-Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontFamily: "spartan",
                                fontWeight: FontWeight.w700)),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              /// Beautician Details ///
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 17,),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return business_Detail();
                      },));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComoon("Beautician Details",14,Color(0xff292929), FontWeight.w700),
                              SizedBox(height: height*0.01,),
                              textComoonfade("Additional info on business name, photo,\nlocation, adding new team members etc.",10,Color(0xff707070), FontWeight.w500),
                            ],
                          ),
                        ),

                        Container(alignment: Alignment.topRight,
                          height: 15,
                          width: 30,
                          child: Image.asset("assets/images/righticon.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 17,),
              //     decoration: BoxDecoration(
              //         border: Border(bottom: BorderSide(color: Colors.black12))
              //     ),
              //     child: InkWell(
              //       onTap: (){
              //
              //         Navigator.push(context, MaterialPageRoute(builder: (context) {
              //           return service_Setup_Main();
              //         },));
              //       },
              //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //
              //           Expanded(
              //             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 textComoon("Service Set-Up",14,Color(0xff292929), FontWeight.w700),
              //                 SizedBox(height: height*0.01,),
              //                 textComoonfade("This section allows you to add more services and for your clients to see, book and pay.",10,Color(0xff707070), FontWeight.w500),
              //               ],
              //             ),
              //           ),
              //
              //           Container(alignment: Alignment.topRight,
              //             height: 15,
              //             width: 30,
              //             child: Image.asset("assets/images/righticon.png"),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return calendar_Mang_Main();
                    },));

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 17,),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComoon("Calendar Management",14,Color(0xff292929), FontWeight.w700),
                              SizedBox(height: height*0.01,),
                              textComoonfade("Here is where you can update your availability for clients to see and book your services.",10,Color(0xff707070), FontWeight.w500),
                            ],
                          ),
                        ),

                        Container(alignment: Alignment.topRight,
                          height: 15,
                          width: 30,
                          child: Image.asset("assets/images/righticon.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return bank_detail(email: widget.email,isStripeSetUp: widget.isStripeSetUp,);
                  },));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 17,),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black12))
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComoon("Payments & Sales Tax Profile",14,Color(0xff292929), FontWeight.w700),
                              SizedBox(height: height*0.01,),
                              textComoonfade("Provide Bank Details and Sales Tax numbers for your beauty business.",10,Color(0xff707070), FontWeight.w500),
                            ],
                          ),
                        ),

                        Container(alignment: Alignment.topRight,
                          height: 15,
                          width: 30,
                          child: Image.asset("assets/images/righticon.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: InkWell(
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return no_show_Protection();
              //     },));
              //
              //
              //     },
              //     child: Container(
              //       padding: EdgeInsets.symmetric(vertical: 17,),
              //       decoration: BoxDecoration(
              //           border: Border(bottom: BorderSide(color: Colors.black12))
              //       ),
              //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //
              //           Expanded(
              //             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 textComoon("No-Show Protection",14,Color(0xff292929), FontWeight.w700),
              //                 SizedBox(height: height*0.01,),
              //                 textComoonfade("This section is used to set payment reimbursement rules when a client doesn’t show up for a service that was reserved and confirmed.",10,Color(0xff707070), FontWeight.w500),
              //               ],
              //             ),
              //           ),
              //
              //           Container(alignment: Alignment.topRight,
              //             height: 15,
              //             width: 30,
              //             child: Image.asset("assets/images/righticon.png"),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: InkWell(
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //         return cancellation_Policy();
              //       },));
              //
              //     },
              //     child: Container(
              //       padding: EdgeInsets.symmetric(vertical: 17,),
              //       decoration: BoxDecoration(
              //           border: Border(bottom: BorderSide(color: Colors.black12))
              //       ),
              //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //
              //           Expanded(
              //             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 textComoon("Cancellation Policy",14,Color(0xff292929), FontWeight.w700),
              //                 SizedBox(height: height*0.01,),
              //                 textComoonfade("This policy allows you to set guidelines around appointment cancellations.",10,Color(0xff707070), FontWeight.w500),
              //               ],
              //             ),
              //           ),
              //
              //           Container(alignment: Alignment.topRight,
              //             height: 15,
              //             width: 30,
              //             child: Image.asset("assets/images/righticon.png"),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: InkWell(
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //         return booking_Setting();
              //       },));
              //
              //     },
              //     child: Container(
              //       padding: EdgeInsets.symmetric(vertical: 17,),
              //       decoration: BoxDecoration(
              //           border: Border(bottom: BorderSide(color: Colors.black12))
              //       ),
              //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //
              //           Expanded(
              //             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 textComoon("Booking Settings",14,Color(0xff292929), FontWeight.w700),
              //                 SizedBox(height: height*0.01,),
              //                 textComoonfade("Set up when present and future bookings can be made, and the time limit when confirmed appointments can be rescheduled.",10,Color(0xff707070), FontWeight.w500),
              //               ],
              //             ),
              //           ),
              //
              //           Container(alignment: Alignment.topRight,
              //             height: 15,
              //             width: 30,
              //             child: Image.asset("assets/images/righticon.png"),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20),
              //   child: GestureDetector(
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //         return plans_Bulling_Main();
              //       },));
              //
              //     },
              //     child: Container(
              //       padding: EdgeInsets.symmetric(vertical: 17,),
              //       decoration: BoxDecoration(
              //           border: Border(bottom: BorderSide(color: Colors.black12))
              //       ),
              //       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //
              //           Expanded(
              //             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 textComoon("Plans & Billing",14,Color(0xff292929), FontWeight.w700),
              //                 SizedBox(height: height*0.01,),
              //                 textComoonfade("The section allows you to select your preferred Sliike plan and enjoy the platform benefits and fee that come with each plan. ",10,Color(0xff707070), FontWeight.w500),
              //               ],
              //             ),
              //           ),
              //
              //           Container(alignment: Alignment.topRight,
              //             height: 15,
              //             width: 30,
              //             child: Image.asset("assets/images/righticon.png"),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
