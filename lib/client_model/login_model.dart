import 'dart:convert';

///

class SigninModel {
  bool? success;
  int? status;
  String? message;

  SigninModel({this.success, this.status, this.message});

  SigninModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
