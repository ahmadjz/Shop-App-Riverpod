import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/auth/models/auth_state.dart';

class UserInfoNotifier extends StateNotifier<AuthState> {
  UserInfoNotifier()
      : super(
          const AuthState.unknown(),
        );

  void updateState(AuthState authState) {
    state = authState;
  }
}
