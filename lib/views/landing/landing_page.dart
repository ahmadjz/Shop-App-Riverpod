import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/providers/auth/is_token_valid_provider.dart';
import 'package:shop_app_riverpod/providers/auth/user_info_provider.dart';
import 'package:shop_app_riverpod/views/animations/error_animation_view.dart';
import 'package:shop_app_riverpod/views/animations/loading_animation_view.dart';
import 'package:shop_app_riverpod/views/auth/auth_page.dart';
import 'package:shop_app_riverpod/views/home/home_page.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(isTokenValidProvider).when(
          data: (_) => Consumer(
            builder: (context, consumerRef, child) {
              final userInfo = consumerRef.watch(userInfoProvider);
              return userInfo.isTokenValid ? const HomePage() : AuthPage();
            },
          ),
          error: (error, stackTrace) => const ErrorAnimationView(),
          loading: () => const LoadingAnimationView(),
        );
  }
}
