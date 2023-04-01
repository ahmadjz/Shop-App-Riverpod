// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show immutable;
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';

@immutable
class ProductsState {
  final List<ProductData> products;
  final int currentPage;
  final int? lastPage;
  final IsLoading isLoading;
  final bool isErrorAccord;

  const ProductsState({
    required this.products,
    required this.currentPage,
    required this.lastPage,
    required this.isLoading,
    required this.isErrorAccord,
  });

  ProductsState.unknown()
      : products = [],
        currentPage = 1,
        lastPage = null,
        isErrorAccord = true,
        isLoading = false;

  @override
  bool operator ==(covariant ProductsState other) =>
      identical(this, other) ||
      (products == other.products &&
          currentPage == other.currentPage &&
          lastPage == other.lastPage &&
          isErrorAccord == other.isErrorAccord &&
          isLoading == other.isLoading);

  @override
  int get hashCode => Object.hash(
        products,
        currentPage,
        lastPage,
        isLoading,
        isErrorAccord,
      );

  ProductsState copyWith({
    List<ProductData>? products,
    int? currentPage,
    int? lastPage,
    IsLoading? isLoading,
    bool? isErrorAccord,
  }) {
    return ProductsState(
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      isLoading: isLoading ?? this.isLoading,
      isErrorAccord: isErrorAccord ?? this.isErrorAccord,
    );
  }
}
