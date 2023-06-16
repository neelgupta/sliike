// To parse this JSON data, do
//
//     final getProductListData = getProductListDataFromMap(jsonString);

import 'dart:convert';

GetProductListData getProductListDataFromMap(String str) => GetProductListData.fromMap(json.decode(str));

String getProductListDataToMap(GetProductListData data) => json.encode(data.toMap());

class GetProductListData {
  int? status;
  bool? success;
  Data? data;

  GetProductListData({
    this.status,
    this.success,
    this.data,
  });

  factory GetProductListData.fromMap(Map<String, dynamic> json) => GetProductListData(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "success": success,
    "data": data?.toMap(),
  };
}

class Data {
  List<Category>? category;

  Data({
    this.category,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toMap())),
  };
}

class Category {
  List<ProductList>? productList;
  String? id;
  String? productCategoryName;

  Category({
    this.productList,
    this.id,
    this.productCategoryName,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    productList: json["productList"] == null ? [] : List<ProductList>.from(json["productList"]!.map((x) => ProductList.fromMap(x))),
    id: json["_id"],
    productCategoryName: json["productCategoryName"],
  );

  Map<String, dynamic> toMap() => {
    "productList": productList == null ? [] : List<dynamic>.from(productList!.map((x) => x.toMap())),
    "_id": id,
    "productCategoryName": productCategoryName,
  };
}

class ProductList {
  String? productName;
  String? productId;

  ProductList({
    this.productName,
    this.productId,
  });

  factory ProductList.fromMap(Map<String, dynamic> json) => ProductList(
    productName: json["productName"],
    productId: json["productId"],
  );

  Map<String, dynamic> toMap() => {
    "productName": productName,
    "productId": productId,
  };
}
