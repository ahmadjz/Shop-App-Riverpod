import 'package:flutter/material.dart';
import 'package:shop_app_riverpod/views/animations/error_animation_view.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ErrorAnimationView(),
      ),
    );
  }
}
