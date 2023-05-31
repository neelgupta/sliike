
class getBeauticianProfilemodel {
  int? status;
  bool? success;
  Data? data;
  getBeauticianProfilemodel({this.status,this.success,this.data});
  factory getBeauticianProfilemodel.fromjson(Map<dynamic,dynamic>map){
     Map map1 = map['data'] ?? {};
     Data data=Data.fromjson(map1);
     return getBeauticianProfilemodel(
       status: map['status'] ?? 0,
       success: map['success'] ?? false,
       data: data,
     );
  }
}

class Data {
    String? id;
    UserId? userId;
    String? firstName;
    String? lastName;
    String? country;
    String? countryCode;
    String? businessName;
    int? businessNumber;
    String? uid;
    String? profileImage;
    // ignore: non_constant_identifier_names
    String? DOB;
    String? gender;
    bool? isStripeSetUp;
   Data({this.id,this.userId,this.firstName,this.lastName,this.country,this.countryCode,this.businessName,this.businessNumber,this.uid,this.profileImage,this.DOB,this.gender,this.isStripeSetUp});

    factory Data.fromjson(Map<dynamic,dynamic>map1){
        Map map2 = map1['userId'] ??{} ;
        UserId userId = UserId.frojson(map2);
        return Data(
          id: map1['_id'] ?? "" ,
            userId: userId,
            firstName: map1['firstName'] ?? "",
            lastName: map1['lastName'] ?? "",
            country: map1['country'] ?? "",
            countryCode: map1['country_code'] ?? "",
            businessName: map1['businessName'] ?? "",
            businessNumber: map1['businessNumber'] ?? 0,
            uid: map1['uid'] ?? "",
            profileImage: map1['profileImage'] ?? "",
            DOB: map1['DOB'] ?? "",
            gender: map1['gender'] ?? "",
            isStripeSetUp: map1['isStripeSetUp'] ?? false
        );
    }
}

class UserId {
  String? id;
  String? email;
  String? password;
  int? phoneNumber;
  int? isVerified;
  UserId({this.id,this.email,this.password,this.phoneNumber,this.isVerified});

  factory UserId.frojson(Map<dynamic,dynamic>map2){
    return UserId(
        id: map2['_id'] ?? "",
        email: map2['email'] ?? "",
        password: map2['password'] ?? "",
        phoneNumber: map2['phoneNumber'] ?? 0,
        isVerified: map2['isVerified'] ?? "");
  }
}
