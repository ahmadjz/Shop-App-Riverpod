import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/providers/auth/logout_notifier_provider.dart';
import 'package:shop_app_riverpod/views/animations/loading_animation_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogoutLoading = ref.watch(logoutNotifierProvider);
    final logoutNotifier = ref.read(logoutNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                logoutNotifier.logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: isLogoutLoading
            ? const LoadingAnimationView()
            : const Text("Welcome to the Home Page!"),
      ),
    );
  }
}
