import 'package:flutter/foundation.dart' show immutable;
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';

@immutable
class AuthState {
  final UserToken? userToken;
  final UserId? userId;
  final String? userName;
  final bool isUserLoggedIn;

  const AuthState({
    required this.userToken,
    required this.userId,
    required this.userName,
    required this.isUserLoggedIn,
  });

  const AuthState.unknown()
      : userToken = null,
        userName = null,
        isUserLoggedIn = false,
        userId = null;

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (userToken == other.userToken &&
          userId == other.userId &&
          isUserLoggedIn == other.isUserLoggedIn &&
          userName == other.userName);

  @override
  int get hashCode => Object.hash(
        userToken,
        userId,
        userName,
        isUserLoggedIn,
      );
}
