import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/providers/auth/is_guest_provider.dart';
import 'package:shop_app_riverpod/providers/auth/logout_notifier_provider.dart';
import 'package:shop_app_riverpod/providers/products/products_provider.dart';
import 'package:shop_app_riverpod/views/home/products/cart_button.dart';

class HomePageAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUserGuest = ref.watch(isGuestProvider);
    return AppBar(
      title: const Text(AppStrings.products),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(productsStateProvider.notifier).restoreDefaultPage();
            if (isUserGuest) {
              ref.read(isGuestProvider.notifier).logOutFromGuest();
            } else {
              ref.read(logoutNotifierProvider.notifier).logout();
            }
          },
          icon: const Icon(Icons.logout),
        ),
        if (!isUserGuest) const CartButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
