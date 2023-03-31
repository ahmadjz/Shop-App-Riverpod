import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/states/auth/logout_notifier.dart';

final logoutNotifierProvider = StateNotifierProvider<LogoutNotifier, IsLoading>(
  (ref) => LogoutNotifier(ref),
);
