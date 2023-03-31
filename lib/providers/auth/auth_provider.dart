import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/states/auth/auth_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, IsLoading>(
  (ref) => AuthNotifier(ref),
);
