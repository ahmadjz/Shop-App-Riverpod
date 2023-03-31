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
  UserData? userData;
  UserToken userToken;
  Authentication({
    required this.userData,
    required this.userToken,
  });
}
