// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

HomeScreenModel? homeScreenModelFromJson(String str) =>
    HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel? data) =>
    json.encode(data!.toJson());

class HomeScreenModel {
  HomeScreenModel({
    this.status,
    this.data,
    this.categoriesCount,
  });

  String? status;
  List<Datum?>? data;
  int? categoriesCount;

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        categoriesCount: json["categories_count"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "categories_count": categoriesCount,
      };
}

class Datum {
  Datum({
    this.categoryId,
    this.categoryName,
    this.products,
  });

  int? categoryId;
  String? categoryName;
  List<Product?>? products;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        products: json["products"] == null
            ? []
            : List<Product?>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x!.toJson())),
      };
}

class Product {
  Product({
    this.kitchenItemId,
    this.kitchenItemName,
    this.kitchenItemImage,
    this.kitchenItemAmount,
    this.productsStatus,
    this.itemPackagingCharge,
    this.busaddress,
    this.userId,
    this.itemDiscountPrice,
    this.productsTempQuantity,
    this.productsMaxQuantity,
    this.productsQuantity,
    this.buyStatus,
    this.placeorderType,
    this.mode,
    this.businessStatus,
    this.verificationStatus,
    this.businessDrawerStatus,
    this.isDeliver,
    this.isCart,
    this.productsType,
  });

  int? kitchenItemId;
  String? kitchenItemName;
  List<KitchenItemImage?>? kitchenItemImage;
  int? kitchenItemAmount;
  int? productsStatus;
  int? itemPackagingCharge;
  Busaddress? busaddress;
  int? userId;
  int? itemDiscountPrice;
  int? productsTempQuantity;
  int? productsMaxQuantity;
  int? productsQuantity;
  bool? buyStatus;
  int? placeorderType;
  int? mode;
  int? businessStatus;
  int? verificationStatus;
  int? businessDrawerStatus;
  bool? isDeliver;
  bool? isCart;
  int? productsType;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        kitchenItemId: json["kitchen_item_id"],
        kitchenItemName: json["kitchen_item_name"],
        kitchenItemImage: json["kitchen_item_image"] == null
            ? []
            : List<KitchenItemImage?>.from(json["kitchen_item_image"]!
                .map((x) => KitchenItemImage.fromJson(x))),
        kitchenItemAmount: json["kitchen_item_amount"],
        productsStatus: json["products_status"],
        itemPackagingCharge: json["item_packaging_charge"],
        busaddress: busaddressValues!.map[json["busaddress"]],
        userId: json["user_id"],
        itemDiscountPrice: json["item_discount_price"],
        productsTempQuantity: json["products_temp_quantity"],
        productsMaxQuantity: json["products_max_quantity"],
        productsQuantity: json["products_quantity"],
        buyStatus: json["buy_status"],
        placeorderType: json["placeorder_type"],
        mode: json["mode"],
        businessStatus: json["business_status"],
        verificationStatus: json["verification_status"],
        businessDrawerStatus: json["business_drawer_status"],
        isDeliver: json["is_deliver"],
        isCart: json["is_cart"],
        productsType: json["products_type"],
      );

  Map<String, dynamic> toJson() => {
        "kitchen_item_id": kitchenItemId,
        "kitchen_item_name": kitchenItemName,
        "kitchen_item_image": kitchenItemImage == null
            ? []
            : List<dynamic>.from(kitchenItemImage!.map((x) => x!.toJson())),
        "kitchen_item_amount": kitchenItemAmount,
        "products_status": productsStatus,
        "item_packaging_charge": itemPackagingCharge,
        "busaddress": busaddressValues.reverse![busaddress],
        "user_id": userId,
        "item_discount_price": itemDiscountPrice,
        "products_temp_quantity": productsTempQuantity,
        "products_max_quantity": productsMaxQuantity,
        "products_quantity": productsQuantity,
        "buy_status": buyStatus,
        "placeorder_type": placeorderType,
        "mode": mode,
        "business_status": businessStatus,
        "verification_status": verificationStatus,
        "business_drawer_status": businessDrawerStatus,
        "is_deliver": isDeliver,
        "is_cart": isCart,
        "products_type": productsType,
      };
}

enum Busaddress { NEAR_BRIDGE }

final busaddressValues = EnumValues({"Near Bridge": Busaddress.NEAR_BRIDGE});

class KitchenItemImage {
  KitchenItemImage({
    this.images,
  });

  String? images;

  factory KitchenItemImage.fromJson(Map<String, dynamic> json) =>
      KitchenItemImage(
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "images": images,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
