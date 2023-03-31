import 'package:flutter/foundation.dart' show immutable;
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';

@immutable
class AuthState {
  final UserToken? userToken;
  final UserId? userId;
  final String? userName;
  final bool isTokenValid;

  const AuthState({
    required this.userToken,
    required this.userId,
    required this.userName,
    required this.isTokenValid,
  });

  const AuthState.unknown()
      : userToken = null,
        userName = null,
        isTokenValid = false,
        userId = null;

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (userToken == other.userToken &&
          userId == other.userId &&
          isTokenValid == other.isTokenValid &&
          userName == other.userName);

  @override
  int get hashCode => Object.hash(
        userToken,
        userId,
        userName,
        isTokenValid,
      );
}
