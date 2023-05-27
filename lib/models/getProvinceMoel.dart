class GetProvince {
  int? status;
  bool? success;
  List<Data>? data;
  String? message;

  GetProvince({this.status, this.success, this.data, this.message});

  factory GetProvince.fromJson(Map<String, dynamic> json) {
    return GetProvince(
    status : json['status'],
    success : json['success'],
        data : List<Data>.from((json["data"] ?? []).map((x) => Data.fromJson(x))),
    message : json['message'],
    );
  }
}

class Data {
  String? id;
  String? name;

  Data({this.id, this.name});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
    id : json['_id'],
    name : json['name'],
    );
  }
}
