import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/auth/is_email_valid_state.dart';

final isEmailValidProvider = StateNotifierProvider<IsEmailValidState, bool>(
    (ref) => IsEmailValidState());
