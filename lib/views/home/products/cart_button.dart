import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_riverpod/app/resources/color_manager.dart';
import 'package:shop_app_riverpod/providers/products/cart_provider.dart';
import 'package:shop_app_riverpod/states/products/models/cart_state.dart';
import 'package:shop_app_riverpod/views/home/products/cart_modal.dart';

class CartButton extends ConsumerWidget {
  const CartButton({super.key});
  void _showCartModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CartModal();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartState cartState = ref.watch(cartStateProvider);
    return Padding(
      padding: EdgeInsets.all(30.w),
      child: SizedBox(
        width: 100.w,
        child: GestureDetector(
          onTap: () {
            _showCartModal(context);
          },
          child: Stack(
            children: <Widget>[
              const IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              cartState.cart?.itemCounts == 0
                  ? Container()
                  : Positioned(
                      child: Stack(
                        children: <Widget>[
                          Icon(
                            Icons.brightness_1,
                            size: 60.w,
                            color: ColorManager.green,
                          ),
                          Positioned(
                            top: 3.0,
                            right: 4.0,
                            child: Center(
                              child: Text(
                                "${cartState.cart?.itemCounts}",
                                style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
