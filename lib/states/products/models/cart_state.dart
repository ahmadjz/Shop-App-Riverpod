// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show immutable;
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';

@immutable
class CartState {
  final CartData? cart;
  final IsLoading isLoading;
  final bool isErrorAccord;

  const CartState({
    required this.cart,
    required this.isLoading,
    required this.isErrorAccord,
  });

  const CartState.unknown()
      : cart = null,
        isErrorAccord = true,
        isLoading = false;

  @override
  bool operator ==(covariant CartState other) =>
      identical(this, other) ||
      (cart == other.cart &&
          isErrorAccord == other.isErrorAccord &&
          isLoading == other.isLoading);

  @override
  int get hashCode => Object.hash(
        cart,
        isLoading,
        isErrorAccord,
      );

  CartState copyWith({
    CartData? cart,
    IsLoading? isLoading,
    bool? isErrorAccord,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      isLoading: isLoading ?? this.isLoading,
      isErrorAccord: isErrorAccord ?? this.isErrorAccord,
    );
  }
}
