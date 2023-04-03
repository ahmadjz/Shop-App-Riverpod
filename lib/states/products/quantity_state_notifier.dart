import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantityStateNotifier extends StateNotifier<int> {
  QuantityStateNotifier()
      : super(
          1,
        );

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }

  void defaultState() {
    state = 1;
  }
}
