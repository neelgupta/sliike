class FavoriteListModel {
  int? status;
  bool? success;
  Data? data;
  String? message;

  FavoriteListModel({this.status, this.success, this.data, this.message});

  factory FavoriteListModel.fromjson(Map<dynamic, dynamic> map) {
    return FavoriteListModel(
        status: map['status'] ?? 0,
        success: map['success'] ?? false,
        data: Data.fromjson(map["data"]),
        message: map['message'] ?? "");
  }
}

class Data {
  List<FavoritesData>? favoritesList;

  Data({this.favoritesList});

  factory Data.fromjson(Map<dynamic, dynamic> map1) {
    List list = map1['favoritesList'];
    List<FavoritesData> favoritesList = list.map((e) => FavoritesData.fromjson(e)).toList();
    return Data(
      favoritesList: favoritesList,
    );
  }
}

class FavoritesData {
  String? id;
  String? firstName;
  String? lastName;
  String? country;
  String? country_code;
  List<String>? beauticianServiceId;
  int? isProvideService;
  int? isProvideProduct;
  int? totalEmployee;
  List<dynamic>? demographicIds;
  int? hasShop;
  int? IsServeAtClient;
  int? IsServeAtOwnPlace;
  int? screenStatus;
  int? isDeleted;
  String? DOB;
  String? gender;
  String? deviceToken;
  String? firebaseToken;
  Address? address;
  String? businessName;
  int? businessNumber;

  FavoritesData(
      {this.id,
      this.firstName,
      this.lastName,
      this.country,
      this.country_code,
      this.beauticianServiceId,
      this.isProvideService,
      this.isProvideProduct,
      this.totalEmployee,
      this.demographicIds,
      this.hasShop,
      this.IsServeAtClient,
      this.IsServeAtOwnPlace,
      this.screenStatus,
      this.isDeleted,
      this.DOB,
      this.gender,
      this.deviceToken,
      this.firebaseToken,
      this.address,
      this.businessName,
      this.businessNumber});

  factory FavoritesData.fromjson(Map<dynamic, dynamic> map2) {
    List<String> beauticianServiceId = List<String>.from(map2['beauticianServiceId'] ?? [].map((e) => e));
    List<dynamic> demographicIds = List<dynamic>.from(map2['beauticianServiceId'] ?? [].map((e) => e));
    return FavoritesData(
        id: map2['_id'] ?? "",
        firstName: map2['firstName'] ?? "",
        lastName: map2['lastName'] ?? "",
        country: map2['country'] ?? "",
        country_code: map2['country_code'] ?? "",
        beauticianServiceId: beauticianServiceId,
        isProvideService: map2['isProvideService'] ?? 0,
        isProvideProduct: map2['isProvideProduct'] ?? 0,
        totalEmployee: map2['totalEmployee'] ?? 0,
        demographicIds: demographicIds,
        hasShop: map2['hasShop'] ?? 0,
        IsServeAtClient: map2['IsServeAtClient'] ?? 0,
        IsServeAtOwnPlace: map2['IsServeAtOwnPlace'] ?? 0,
        screenStatus: map2['screenStatus'] ?? 0,
        isDeleted: map2['isDeleted'] ?? 0,
        DOB: map2['DOB'] ?? "",
        gender: map2['gender'] ?? "",
        deviceToken: map2['deviceToken'] ?? "",
        firebaseToken: map2['firebaseToken'] ?? "",
        address: Address.fromjson(map2['address'] ?? {}),
        businessName: map2['businessName'] ?? "",
        businessNumber: map2['businessNumber'] ?? 0
    );
  }
}

class Address{
  String? id;
  String? address;
  Province? province;
  String? apartment;
  String? city;
  String? zipCode;

  Address({this.id,this.address,this.province,this.apartment,this.city,this.zipCode});
  factory Address.fromjson(Map<dynamic, dynamic>map){
    return Address(
      id: map['_id'] ?? "",
      address: map['address'] ?? "",
      province: Province.fromjson(map['province'] ?? ""),
      apartment: map['apartment'] ?? "",
      city: map['city'] ?? "",
      zipCode: map["zipCode"].toString(),
    );
  }
}

class Province{
  String? id;
  String? province;

  Province({
    this.id,
    this.province
  });

  factory Province.fromjson(Map<dynamic, dynamic>map){
    return Province(
      id: map['_id'] ?? "",
      province: map['province'] ?? "",
    );
  }
}
