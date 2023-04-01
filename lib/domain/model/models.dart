// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';

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
