import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/providers/auth/is_password_valid_provider.dart';

class PasswordTextField extends ConsumerWidget {
  const PasswordTextField({super.key, required this.passwordController});
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordValid = ref.watch(isPasswordValidProvider);
    final isPasswordValidNotifier = ref.read(isPasswordValidProvider.notifier);
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onChanged: (value) => isPasswordValidNotifier.validatePassword(value),
      decoration: InputDecoration(
        labelText: AppStrings.password.tr(),
        errorText: isPasswordValid ? null : AppStrings.passwordError.tr(),
      ),
    );
  }
}
