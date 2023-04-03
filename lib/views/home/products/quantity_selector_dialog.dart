import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/extensions.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/providers/products/cart_provider.dart';
import 'package:shop_app_riverpod/providers/products/quantity_state_provider.dart';

class QuantitySelectorDialog extends ConsumerWidget {
  final int productId;

  const QuantitySelectorDialog({Key? key, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(quantityStateProvider);
    final quantityNotifier = ref.read(quantityStateProvider.notifier);

    return AlertDialog(
      title: Text(AppStrings.selectQuantity.tr()),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (quantity > 1) {
                quantityNotifier.decrement();
              }
            },
            icon: const Icon(Icons.remove),
          ),
          Text(quantity.toString()),
          IconButton(
            onPressed: () {
              quantityNotifier.increment();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            Future.delayed(
              const Duration(
                milliseconds: 200,
              ),
              () {
                quantityNotifier.defaultState();
              },
            );
          },
          child: Text(AppStrings.cancelButton.tr()),
        ),
        TextButton(
          onPressed: () async {
            final cartNotifier = ref.read(cartStateProvider.notifier);

            (await cartNotifier.addProductToCart(
              productId: productId,
              quantity: quantity,
            ))
                .fold(
              (failure) => context.showNewDialog(
                showCancelButton: false,
                title: AppStrings.error.tr(),
                content: failure.message,
                thenFunction: () {
                  Navigator.of(context).pop();
                  Future.delayed(
                    const Duration(
                      milliseconds: 200,
                    ),
                    () {
                      quantityNotifier.defaultState();
                    },
                  );
                },
              ),
              (_) => context.showNewDialog(
                showCancelButton: false,
                title: AppStrings.success.tr(),
                content: AppStrings.itemAddedToCartSuccessfully.tr(),
                thenFunction: () {
                  Navigator.of(context).pop();
                  quantityNotifier.defaultState();
                },
              ),
            );
          },
          child: Text(AppStrings.okay.tr()),
        ),
      ],
    );
  }
}
