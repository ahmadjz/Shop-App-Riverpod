import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/functions.dart';

class IsEmailValidState extends StateNotifier<bool> {
  IsEmailValidState() : super(true);

  void validateEmail(String email) {
    state = isEmailValid(email);
  }
}
