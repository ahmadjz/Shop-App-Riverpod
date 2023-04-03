import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/providers/products/products_provider.dart';
import 'package:shop_app_riverpod/views/home/products/product_list_item.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsStateProvider);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: productsState.products.length,
            itemBuilder: (context, index) {
              final product = productsState.products[index];
              return ProductListItem(product: product);
            },
          ),
        ),
        Row(
          children: [
            if (productsState.currentPage > 1)
              TextButton(
                onPressed: () {
                  ref.read(productsStateProvider.notifier).gotToPreviousPage();
                },
                child: Text(AppStrings.previous.tr()),
              ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            if (productsState.lastPage != null)
              if (productsState.currentPage < (productsState.lastPage!))
                TextButton(
                  onPressed: () {
                    ref.read(productsStateProvider.notifier).gotToNextPage();
                  },
                  child: Text(AppStrings.next.tr()),
                ),
          ],
        ),
      ],
    );
  }
}
