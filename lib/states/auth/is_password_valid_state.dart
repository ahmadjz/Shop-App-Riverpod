import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/functions.dart';

class IsPasswordValidState extends StateNotifier<bool> {
  IsPasswordValidState() : super(true);

  void validatePassword(String password) {
    state = isPasswordValid(password);
  }
}
