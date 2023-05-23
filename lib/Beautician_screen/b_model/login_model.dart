class BeauticianSigninModel {
  int? status;
  bool? success;
  String? token;
  String? message;

  BeauticianSigninModel({this.status, this.success, this.token, this.message});

  BeauticianSigninModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}
