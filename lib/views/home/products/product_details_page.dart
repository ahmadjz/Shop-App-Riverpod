import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_riverpod/app/resources/color_manager.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';
import 'package:shop_app_riverpod/views/home/products/product_image.dart';
import 'package:shop_app_riverpod/views/home/products/quantity_selector_dialog.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductData product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.productDetails.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductImage(
                productImageUrl: product.imageUrl,
              ),
              SizedBox(height: 50.h),
              Text(
                product.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 60.sp,
                    ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                AppStrings.details.tr(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 50.sp, color: ColorManager.textGrey),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                product.description,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 40.sp,
                    ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                AppStrings.price.tr(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 50.sp, color: ColorManager.textGrey),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                product.price,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 40.sp,
                    ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Consumer(
                builder: (context, ref, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: 150.h,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => QuantitySelectorDialog(
                            productId: product.id,
                          ),
                        );
                      },
                      child: Text(AppStrings.addToCart.tr()),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
