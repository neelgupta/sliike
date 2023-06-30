class PaymentDetail {
  int? status;
  bool? success;
  Data? data;

  PaymentDetail({this.status, this.success, this.data});

  factory PaymentDetail.fromJson(Map<String, dynamic> json) {
    return PaymentDetail(
        status: json['status'],
        success: json['success'],
        data: json['data'] != null ? Data.fromJson(json['data']) : null);
  }
}

class Data {
  String? services;
  String? subTotal;
  String gst;
  String hst;
  String qst;
  String pst;
  String? discount;
  int gstInPer;
  int hstInPer;
  int pstInPer;
  int qstInPer;
  String? total;

  Data(
      {this.services,
      this.subTotal,
      this.discount,
      required this.gst,
      required this.hst,
      required this.qst,
      required this.pst,
      required this.gstInPer,
      required this.hstInPer,
      required this.pstInPer,
      required this.qstInPer,
      this.total});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      services: json['services'].toString(),
      subTotal: json['subTotal'].toString(),
      discount: json['discount'].toString(),
      gst: json["GST"] ?? "",
      hst: json["HST"] ?? "",
      qst: json["QST"] ?? "",
      pst: json["PST"] ?? "",
      gstInPer: json["GstInPer"] ?? "",
      hstInPer: json["HstInPer"] ?? "",
      pstInPer: json["PstInPer"] ?? "",
      qstInPer: json["QstInPer"] ?? "",
      total: json['total'].toString(),
    );
  }

  Map<String, dynamic> toMap() => {
        "services": services,
        "subTotal": subTotal,
        "GST": gst,
        "HST": hst,
        "QST": qst,
        "PST": pst,
        "discount": discount,
        "GstInPer": gstInPer,
        "HstInPer": hstInPer,
        "PstInPer": pstInPer,
        "QstInPer": qstInPer,
        "total": total,
      };
}

// class CardDetails {
//   CardDetails({});
//
//   CardDetails.fromJson(Map<String, dynamic> json) {}
// }