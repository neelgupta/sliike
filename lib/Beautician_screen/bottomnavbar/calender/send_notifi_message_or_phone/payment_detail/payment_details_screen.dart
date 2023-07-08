import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/services/calender_service.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';
import '../../../../../utils/util.dart';
import '../../../../b_model/appointment_payment_details.dart';
import '../../../../custom_widget/ButtonCommon/Button.dart';
import '../../../../custom_widget/textcommon/textcommon.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({Key? key, required this.appointmentId})
      : super(key: key);

  final String appointmentId;

  @override
  State<PaymentDetailScreen> createState() => PaymentDetailScreenState();
}

class PaymentDetailScreenState extends State<PaymentDetailScreen> {
  TextEditingController emailAdress = TextEditingController();
  bool emailAdressstatus = false;
  bool isloading = false;

  PaymentData? paymentData;

  var scr = new GlobalKey();

  final pdf = pw.Document();

  late Uint8List image;

  CalenderService calenderService = CalenderService();

  File? pdfFile;

  String bookingId = "";

  takescrshot() async {
    RenderRepaintBoundary? boundary =
        scr.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image = await boundary!.toImage();
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();
    screenToPdf("Payment Details", pngBytes).then((value) async {
      sendEmailInvoice(context);
    });
    print(pngBytes);
  }

  Future screenToPdf(String fileName, Uint8List screenShot) async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
            child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
          );
        },
      ),
    );
    String path = (await getTemporaryDirectory()).path;
    pdfFile = await File('$path/$fileName.pdf').create();
    print(pdfFile);
    pdfFile!.writeAsBytesSync(await pdf.save());
    // await Share.shareFiles([pdfFile.path]);
  }

  getAppointmentPaymentDetails() async {
    setState(() {
      isloading = true;
    });
    // var date = DateFormat('yyyy-MM-dd').format(pickeddate);
    await calenderService
        .getAppointmentPaymentData(
      appointmentId: widget.appointmentId,
    )
        .then((details) {
      if (details != null) {
        if (details.data.isNotEmpty) {
          paymentData = details.data.first;
          for (var i in details.data) {
            bookingId = i.id;
          }
        }
      }

      return null;
    });

    setState(() {
      isloading = false;
    });
  }

  sendEmailInvoice(
    BuildContext context,
  ) async {
    Loader.show(
      context,
      isSafeAreaOverlay: false,
      overlayColor: Colors.black26,
      progressIndicator:
          const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
      themeData: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff01635D),
        ),
      ),
    );
    var getUri = Uri.parse(ApiUrlList.sendEmailInvoice);
    var request = http.MultipartRequest("POST", getUri);
    request.headers['Authorization'] =
        "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}";
    request.fields['email'] = emailAdress.text;
    request.fields['bookingId'] = bookingId;
    if (pdfFile!.path.isNotEmpty) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('invoicePdf', pdfFile!.path);
      request.files.add(multipartFile);
    }
    http.StreamedResponse response = await request.send();
    print('code: ${response.statusCode}');
    final res = await http.Response.fromStream(response);
    print('body: ${res.body}');
    Map map = jsonDecode(res.body);
    if (res.statusCode == 200) {
      // showToast(message: "${map['message']}");
    } else {
      // showToast(message: "${map['message']}");
    }
  }

  @override
  void initState() {
    super.initState();
    getAppointmentPaymentDetails();
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
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: const Color(0xff414141))),
                            child: Center(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Image(
                                    image: AssetImage(
                                        "assets/images/Group 55.png"),
                                    color: Color(0xff414141),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: const Text(
                                "Payments Details",
                                style: TextStyle(
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xff292929),
                                  fontFamily: "spartan",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RepaintBoundary(key: scr, child: Body(height, width)),
                      SizedBox(height: height * 0.01),
                      const Divider(
                        thickness: 1,
                        color: Color(0xffCFCFCF),
                      ),
                      const Spacer(),
                      commonButtonoricon(
                        context,
                        "SHARE",
                        12,
                        FontWeight.w600,
                        Colors.white,
                        () {
                          setState(() {
                            shareShowDailog();
                            // takescrshot();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  shareShowDailog() {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: textComoon("Share Receipt with Client", 14,
                        const Color(0xff292929), FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    child: TextField(
                      controller: emailAdress,
                      onChanged: (value) {
                        emailAdressstatus = false;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: "Email Address",
                        // labelText: "Email Address",
                        labelStyle: const TextStyle(
                            fontFamily: 'spartan', color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CommonButton(
                      context, "SEND", 12, FontWeight.w600, Colors.white, () {
                    takescrshot();
                  }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  commonButtonborder(context, "CLOSE", 12, FontWeight.w600,
                      const Color(0xff01635D), () {
                    Navigator.pop(context);
                  }),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget Body(height, width) => Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            children: [
              textComoon(
                "Receipt ID: ",
                12,
                const Color(0xff707070),
                FontWeight.w500,
              ),
              textComoon(
                " ${paymentData?.paymentInfo.bookingId}",
                12,
                const Color(0xff292929),
                FontWeight.w600,
              ),
              const Spacer(),
              textComoon(
                Util()
                    .MDEAformatter
                    .format(paymentData?.paymentInfo.paymentDate.toLocal() ??
                        DateTime.now())
                    .toString(),
                // "Mar 17 . 11:AM",
                12,
                const Color(0xff292929),
                FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffCFCFCF),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textComoon(
                "Items",
                12,
                const Color(0xff707070),
                FontWeight.w500,
              ),
              textComoon(
                "Amount",
                12,
                const Color(0xff707070),
                FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffCFCFCF),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xffD9DEDE),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 2, bottom: 2),
                                  child: textComoon("1", 12,
                                      const Color(0xff01635D), FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              textComoon(
                                  "${paymentData?.serviceDetails.serviceName} ",
                                  12,
                                  const Color(0xff292929),
                                  FontWeight.w700),
                              textComoon(
                                  "(${Util().formatMinuteDuration(
                                    hour: paymentData!.serviceDetails.duration
                                        .split(':')[0],
                                    min: paymentData!.serviceDetails.duration
                                        .split(':')[1],
                                  )})",
                                  12,
                                  const Color(0xff707070),
                                  FontWeight.w700),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 30),
                            child: Row(
                              children: [
                                Container(
                                  child: textComoon(
                                    Util().eMMMdYYYYhaformatter.format(
                                        paymentData!.dateTime.toLocal()),
                                    // "Wed, Mar 16, 2022. ",
                                    10,
                                    const Color(0xff707070),
                                    FontWeight.w600,
                                  ),
                                ),
                                Container(
                                    child: textComoon(
                                        Util()
                                            .haformatter
                                            .format(
                                                paymentData!.dateTime.toLocal())
                                            .toUpperCase(),
                                        // "8 AM",
                                        10,
                                        const Color(0xff292929),
                                        FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: textComoon(
                              "\$${paymentData!.serviceDetails.price}",
                              12,
                              const Color(0xff292929),
                              FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.015),
          const Divider(
            thickness: 1,
            color: Color(0xffCFCFCF),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: textComoon(
                  "Discount",
                  12,
                  const Color(0xff707070),
                  FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: width * 0.2,
                alignment: Alignment.topRight,
                child: textComoon(
                  "\$${paymentData!.paymentInfo.discount}",
                  12,
                  const Color(0xff292929),
                  FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: textComoon(
                  "Subtotal",
                  12,
                  const Color(0xff707070),
                  FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: width * 0.2,
                alignment: Alignment.topRight,
                child: textComoon(
                  "\$${paymentData!.paymentInfo.subTotal}",
                  12,
                  const Color(0xff292929),
                  FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          if (paymentData!.paymentInfo.HST != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textComoon(
                    "GST/HST",
                    12,
                    const Color(
                      0xff707070,
                    ),
                    FontWeight.w500),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: width * 0.2,
                  alignment: Alignment.topRight,
                  child: textComoon(
                    "\$${paymentData!.paymentInfo.HST}",
                    12,
                    const Color(0xff292929),
                    FontWeight.w500,
                  ),
                ),
              ],
            ),
          SizedBox(
            height: height * 0.01,
          ),
          if (paymentData!.paymentInfo.PST != 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                textComoon(
                    "QST/PST",
                    12,
                    const Color(
                      0xff707070,
                    ),
                    FontWeight.w500),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: width * 0.2,
                  alignment: Alignment.topRight,
                  child: textComoon(
                    "\$${paymentData!.paymentInfo.PST}",
                    12,
                    const Color(0xff292929),
                    FontWeight.w500,
                  ),
                ),
              ],
            ),
          SizedBox(height: height * 0.01),
          const Divider(
            thickness: 1,
            color: Color(0xffCFCFCF),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textComoon(
                "Total",
                12,
                const Color(0xff707070),
                FontWeight.w500,
              ),
              const SizedBox(
                width: 30,
              ),
              textComoon(
                "\$${paymentData!.paymentInfo.total}",
                12,
                const Color(0xff292929),
                FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          const Divider(
            thickness: 1,
            color: Color(0xffCFCFCF),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textComoon(
                "Paid ",
                12,
                const Color(0xff219653),
                FontWeight.w500,
              ),
              textComoon(
                "- Credit Card - ${Util().mmmDformatter.format(paymentData!.paymentInfo.paymentDate.toLocal())} - ${Util().haformatter.format(paymentData!.paymentInfo.paymentDate.toLocal())}",
                12,
                const Color(0xff707070),
                FontWeight.w500,
              ),
              const Spacer(),
              textComoon(
                "\$${paymentData!.paymentInfo.total}",
                12,
                const Color(0xff292929),
                FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          const Divider(
            thickness: 1,
            color: Color(0xffCFCFCF),
          ),
          SizedBox(height: height * 0.01),
          const Divider(
            thickness: 1,
            color: Color(0xffCFCFCF),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textComoon(
                "Final Total Paid",
                12,
                const Color(0xff707070),
                FontWeight.w500,
              ),
              const SizedBox(
                width: 30,
              ),
              textComoon(
                "\$${paymentData!.paymentInfo.total}",
                12,
                const Color(0xff292929),
                FontWeight.w500,
              ),
            ],
          ),
        ],
      );
}

sendEmailInvoice(BuildContext context, body) async {
  // Loader.show(
  //   context,
  //   isSafeAreaOverlay: false,
  //   overlayColor: Colors.black26,
  //   progressIndicator:
  //       const CircularProgressIndicator(backgroundColor: Color(0xff01635D)),
  //   themeData: Theme.of(context).copyWith(
  //     colorScheme: ColorScheme.fromSwatch().copyWith(
  //       secondary: const Color(0xff01635D),
  //     ),
  //   ),
  // );
  var getUri = Uri.parse(ApiUrlList.sendEmailInvoice);
  var Headers = {
    // 'Content-Type': "application/json; charset=utf-8",
    "Authorization": "Bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
  };
  var response = await http.post(getUri, headers: Headers, body: body);
  log("updateTax Body ==> ${response.body}");
  log("updateTax Code ==> ${response.statusCode}");
  log("updateTax Token ==> ${Helper.prefs!.getString(UserPrefs.keyutoken)}");
  log("updateTax PayLoad ==> ${body}");
  Map map = jsonDecode(response.body);
  if (response.statusCode == 200) {
    // showToast(
    //       message: "${map['message']}",);
    Loader.hide();
    // return GetProvinceListModel.fromMap(jsonDecode(response.body));
  } else {
    Loader.hide();
    // showToast(
    //       message: "${map['message']}",);
  }
  Loader.hide();
  // return GetProvinceListModel.fromMap(jsonDecode(response.body));
}
