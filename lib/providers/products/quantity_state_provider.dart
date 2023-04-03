import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/products/quantity_state_notifier.dart';

final quantityStateProvider = StateNotifierProvider<QuantityStateNotifier, int>(
  (ref) => QuantityStateNotifier(),
);
