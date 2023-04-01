import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/states/products/models/products_state.dart';
import 'package:shop_app_riverpod/states/products/products_notifier.dart';

final productsStateProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(ref),
);
