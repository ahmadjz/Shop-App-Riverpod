import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/providers/auth/logout_notifier_provider.dart';
import 'package:shop_app_riverpod/providers/products/products_provider.dart';
import 'package:shop_app_riverpod/views/animations/error_animation_view.dart';
import 'package:shop_app_riverpod/views/animations/loading_animation_view.dart';
import 'package:shop_app_riverpod/views/home/products/product_list_item.dart';

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
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isLogoutLoading = ref.watch(logoutNotifierProvider);
    final logoutNotifier = ref.read(logoutNotifierProvider.notifier);
    final productsState = ref.watch(productsStateProvider);
    return Scaffold(
      appBar: productsState.isErrorAccord ||
              productsState.isLoading ||
              isLogoutLoading
          ? null
          : AppBar(
              title: const Text(AppStrings.products),
              actions: [
                IconButton(
                    onPressed: () {
                      logoutNotifier.logout();
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
      body: Center(
        child: productsState.isErrorAccord
            ? const ErrorAnimationView()
            : productsState.isLoading || isLogoutLoading
                ? const LoadingAnimationView()
                : Column(
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
                                ref
                                    .read(productsStateProvider.notifier)
                                    .gotToPreviousPage();
                              },
                              child: const Text('Previous'),
                            ),
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          if (productsState.currentPage <
                              (productsState.lastPage ?? 10))
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(productsStateProvider.notifier)
                                    .gotToNextPage();
                              },
                              child: const Text('Next'),
                            ),
                        ],
                      ),
                    ],
                  ),
      ),
    );
  }
}
