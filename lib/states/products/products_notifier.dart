import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/dependency_injection.dart';
import 'package:shop_app_riverpod/data/network/failure.dart';
import 'package:shop_app_riverpod/domain/repository/repository.dart';
import 'package:shop_app_riverpod/states/products/models/products_state.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  ProductsNotifier(this.ref)
      : super(
          ProductsState.unknown(),
        );
  final StateNotifierProviderRef<ProductsNotifier, ProductsState> ref;
  final Repository _repositoryImplementer = instance<Repository>();

  Future<Either<Failure, void>> gotToNextPage() async {
    state = state.copyWith(currentPage: state.currentPage + 1);
    return await fetchData();
  }

  void restoreDefaultPage() async {
    state = state.copyWith(currentPage: 1);
  }

  Future<Either<Failure, void>> gotToPreviousPage() async {
    state = state.copyWith(currentPage: state.currentPage - 1);
    return await fetchData();
  }

  Future<Either<Failure, void>> fetchData() async {
    state = state.copyWith(isLoading: true);
    state = state.copyWith(isErrorAccord: false);
    return (await _repositoryImplementer.fetchProducts(state.currentPage)).fold(
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
        state = ProductsState(
          products: data.products,
          currentPage: state.currentPage,
          lastPage: state.lastPage ?? data.meta!.lastPage,
          isErrorAccord: false,
          isLoading: false,
        );
        return const Right(Void);
      },
    );
  }
}
