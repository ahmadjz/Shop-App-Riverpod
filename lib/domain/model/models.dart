// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';

part 'models.g.dart';

class UserData {
  final UserId id;
  final String name;
  final String email;
  UserData({
    required this.id,
    required this.name,
    required this.email,
  });
}

class Authentication {
  final UserData? userData;
  final UserToken userToken;
  Authentication({
    required this.userData,
    required this.userToken,
  });
}

class LogoutData {
  final String message;
  LogoutData({
    required this.message,
  });
}

@JsonSerializable()
class ProductData {
  final int id;
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  ProductData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}

class MetaData {
  int currentPage;
  int lastPage;
  MetaData({
    required this.currentPage,
    required this.lastPage,
  });
}

class ProductsData {
  final List<ProductData> products;
  final MetaData? meta;
  ProductsData({
    required this.products,
    required this.meta,
  });
}

class ProductInCartData {
  int id;
  int productId;
  String? productName;
  int totalQuantity;
  String totalPrice;
  String unitPrice;
  ProductInCartData({
    required this.id,
    required this.productId,
    this.productName,
    required this.totalQuantity,
    required this.totalPrice,
    required this.unitPrice,
  });
}

class CartData {
  int id;
  String totalPrice;
  int itemCounts;
  List<ProductInCartData> productsInCart;
  CartData({
    required this.id,
    required this.totalPrice,
    required this.itemCounts,
    required this.productsInCart,
  });
}
