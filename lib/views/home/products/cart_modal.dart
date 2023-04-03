import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_riverpod/app/resources/color_manager.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/providers/products/cart_provider.dart';
import 'package:shop_app_riverpod/views/animations/loading_animation_view.dart';

class CartModal extends ConsumerWidget {
  const CartModal({super.key});

  Future<void> _showDeleteConfirmDialog(
      BuildContext context, WidgetRef ref, int productId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppStrings.deleteProductConfirmation.tr()),
          actions: <Widget>[
            TextButton(
              child: Text(AppStrings.cancelButton.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppStrings.delete.tr()),
              onPressed: () {
                ref
                    .read(cartStateProvider.notifier)
                    .removeProductFromCart(productId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartStateProvider);
    final cartData = cartState.cart!;
    return Container(
      padding: EdgeInsets.all(50.w),
      child: cartState.isLoading
          ? const LoadingAnimationView()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppStrings.totalPrice.tr()}${cartData.totalPrice}',
                  style: TextStyle(
                    fontSize: 55.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  '${AppStrings.itemsCount.tr()}${cartData.itemCounts}',
                  style: TextStyle(
                    fontSize: 55.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  AppStrings.productsInCart.tr(),
                  style: TextStyle(
                    fontSize: 55.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartData.productsInCart.length,
                    itemBuilder: (context, index) {
                      final product = cartData.productsInCart[index];
                      return ListTile(
                        title: Text(
                          '${product.productName}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '${AppStrings.quantity.tr()}: ${product.totalQuantity} - ${AppStrings.price.tr()}: ${product.totalPrice}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: ColorManager.red),
                          onPressed: () {
                            _showDeleteConfirmDialog(
                                context, ref, product.productId);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
