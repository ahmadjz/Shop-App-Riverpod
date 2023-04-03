import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/providers/auth/is_guest_provider.dart';
import 'package:shop_app_riverpod/providers/auth/logout_notifier_provider.dart';
import 'package:shop_app_riverpod/providers/products/cart_provider.dart';
import 'package:shop_app_riverpod/providers/products/products_provider.dart';
import 'package:shop_app_riverpod/states/products/models/cart_state.dart';
import 'package:shop_app_riverpod/views/animations/error_animation_view.dart';
import 'package:shop_app_riverpod/views/animations/loading_animation_view.dart';
import 'package:shop_app_riverpod/views/home/products/home_page_app_bar.dart';
import 'package:shop_app_riverpod/views/home/products/home_page_body.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productsStateProvider.notifier).fetchData();
      ref.read(cartStateProvider.notifier).getCart();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isLogoutLoading = ref.watch(logoutNotifierProvider);
    final isUserGuest = ref.watch(isGuestProvider);
    final productsState = ref.watch(productsStateProvider);
    CartState? cartState;
    if (!isUserGuest) {
      cartState = ref.watch(cartStateProvider);
    }
    final isLoading = productsState.isLoading ||
        isLogoutLoading ||
        (cartState?.isLoading ?? false);
    final isError =
        productsState.isErrorAccord || (cartState?.isErrorAccord ?? false);

    return Scaffold(
      appBar: isLoading || isError ? null : const HomePageAppBar(),
      body: Center(
          child: isLoading
              ? const LoadingAnimationView()
              : isError
                  ? const ErrorAnimationView()
                  : const HomePageBody()),
    );
  }
}
