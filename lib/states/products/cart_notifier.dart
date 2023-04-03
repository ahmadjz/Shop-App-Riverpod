import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/app_preferences.dart';
import 'package:shop_app_riverpod/app/dependency_injection.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/network/failure.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';
import 'package:shop_app_riverpod/domain/repository/repository.dart';
import 'package:shop_app_riverpod/states/products/models/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier(this.ref)
      : super(
          const CartState.unknown(),
        );
  final StateNotifierProviderRef<CartNotifier, CartState> ref;
  final Repository _repositoryImplementer = instance<Repository>();
  final AppPreferences appPreferences = instance<AppPreferences>();

  Future<Either<Failure, void>> addProductToCart(
      {required int productId, required int quantity}) async {
    final UserToken userToken = await appPreferences.getUserToken();
    state = state.copyWith(isLoading: true);
    state = state.copyWith(isErrorAccord: false);
    final response = await _repositoryImplementer.addProductToCart(
        productId, quantity, userToken);
    return _handleResponse(response);
  }

  Future<Either<Failure, void>> getCart() async {
    final UserToken userToken = await appPreferences.getUserToken();
    state = state.copyWith(isLoading: true);
    state = state.copyWith(isErrorAccord: false);
    final response = await _repositoryImplementer.getCart(userToken);
    return _handleResponse(response);
  }

  Future<Either<Failure, void>> removeProductFromCart(int productId) async {
    final UserToken userToken = await appPreferences.getUserToken();
    state = state.copyWith(isLoading: true);
    state = state.copyWith(isErrorAccord: false);
    final response = await _repositoryImplementer.removeProductFromCart(
        productId, userToken);
    return _handleResponse(response);
  }

  Future<Either<Failure, void>> _handleResponse(
      Either<Failure, CartData> response) async {
    return response.fold(
      (failure) {
        state = state.copyWith(isErrorAccord: true);
        state = state.copyWith(isLoading: false);
        return Left(
          Failure(
            code: failure.code,
            message: failure.message,
          ),
        );
      },
      (data) {
        state = CartState(
          cart: data,
          isErrorAccord: false,
          isLoading: false,
        );
        return const Right(Void);
      },
    );
  }
}
