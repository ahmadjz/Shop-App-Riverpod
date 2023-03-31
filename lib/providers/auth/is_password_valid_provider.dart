import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/auth/is_password_valid_state.dart';

final isPasswordValidProvider =
    StateNotifierProvider<IsPasswordValidState, bool>(
        (ref) => IsPasswordValidState());
