import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/auth/models/auth_state.dart';
import 'package:shop_app_riverpod/states/auth/user_info_state.dart';

final userInfoProvider = StateNotifierProvider<UserInfoNotifier, AuthState>(
  (ref) => UserInfoNotifier(),
);
