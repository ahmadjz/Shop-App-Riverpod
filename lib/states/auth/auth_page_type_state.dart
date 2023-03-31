import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPageTypeState extends StateNotifier<bool> {
  AuthPageTypeState() : super(true);

  void toggleLogin() {
    state = !state;
  }
}
