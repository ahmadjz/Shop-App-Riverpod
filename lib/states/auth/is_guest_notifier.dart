import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/providers/auth/user_info_provider.dart';
import 'package:shop_app_riverpod/states/auth/models/auth_state.dart';

class IsGuestNotifier extends StateNotifier<IsGuest> {
  IsGuestNotifier(this.ref)
      : super(
          false,
        );
  final StateNotifierProviderRef<IsGuestNotifier, bool> ref;

  void logInAsGuest() {
    state = true;
    ref.read(userInfoProvider.notifier).updateState(
          const AuthState(
            userToken: null,
            userId: null,
            userName: null,
            isUserLoggedIn: true,
          ),
        );
  }

  void logOutFromGuest() {
    ref.read(userInfoProvider.notifier).updateState(
          const AuthState(
            userToken: null,
            userId: null,
            userName: null,
            isUserLoggedIn: false,
          ),
        );
    state = false;
  }
}
