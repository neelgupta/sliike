class PaymentDetail {
  int? status;
  bool? success;
  Data? data;

  PaymentDetail({this.status, this.success, this.data});

  factory PaymentDetail.fromJson(Map<String, dynamic> json) {
    return PaymentDetail(
    status : json['status'],
    success : json['success'],
    data : json['data'] != null ? Data.fromJson(json['data']) : null);
  }
}

class Data {
  String? services;
  String? subTotal;
  String? discount;
  String? gstORhst;
  String? pstORqst;
  String? gstORhstInPer;
  String? pstORqstInPer;
  String? total;

  Data({this.services, this.subTotal, this.discount, this.gstORhst, this.pstORqst, this.gstORhstInPer, this.pstORqstInPer, this.total});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
    services : json['services'].toString(),
    subTotal : json['subTotal'].toString(),
    discount : json['discount'].toString(),
    gstORhst : json['gstORhst'].toString(),
    pstORqst : json['pstORqst'].toString(),
    gstORhstInPer : json['gstORhstInPer'].toString(),
    pstORqstInPer : json['pstORqstInPer'].toString(),
    total : json['total'].toString(),
    );
  }
}

// class CardDetails {
//   CardDetails({});
//
//   CardDetails.fromJson(Map<String, dynamic> json) {}
// }