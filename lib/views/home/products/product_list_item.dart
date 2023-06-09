import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_riverpod/app/resources/assets_manager.dart';
import 'package:shop_app_riverpod/app/resources/color_manager.dart';
import 'package:shop_app_riverpod/app/resources/routes_manager.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/domain/model/models.dart';
import 'package:shop_app_riverpod/providers/auth/is_guest_provider.dart';

class ProductListItem extends ConsumerWidget {
  const ProductListItem({
    super.key,
    required this.product,
  });
  final ProductData product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final isGuest = ref.watch(isGuestProvider);
        if (isGuest) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppStrings.pleaseLoginToViewProduct.tr()),
            ),
          );
        } else {
          AppRouter.router.navigateTo(
            context,
            AppRoutes.productDetailsPageRoute,
            routeSettings: RouteSettings(
              arguments: product,
            ),
          );
        }
      },
      child: SizedBox(
        child: SizedBox(
          height: 350.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.sp),
                child: FadeInImage(
                  // TODO: This code works for handling no available image
                  // but it still throws an exception in the IDE
                  // that problem is cause by Flutter team and not solved yet
                  // https://github.com/flutter/flutter/issues/69125
                  // https://github.com/flutter/flutter/issues/107416
                  width: 300.w,
                  height: 300.w,
                  fit: BoxFit.cover,
                  image: Image.network(
                    width: 300.w,
                    height: 300.w,
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ).image,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      width: 300.w,
                      height: 300.w,
                      ImageAssets.productPlaceHolder,
                      fit: BoxFit.cover,
                    );
                  },
                  placeholder: const AssetImage(
                    ImageAssets.productPlaceHolder,
                  ),
                ),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: Container(
                  height: 300.h,
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    color: ColorManager.greyCard,
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.title,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelLarge),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(product.description,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(product.price,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
