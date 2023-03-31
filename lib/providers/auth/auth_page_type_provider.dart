import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/auth/auth_page_type_state.dart';

final authPageTypeProvider = StateNotifierProvider<AuthPageTypeState, bool>(
    (ref) => AuthPageTypeState());
