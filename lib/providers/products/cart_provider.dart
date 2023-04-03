import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/products/cart_notifier.dart';
import 'package:shop_app_riverpod/states/products/models/cart_state.dart';

final cartStateProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(ref),
);
