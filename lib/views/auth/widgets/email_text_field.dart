import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/providers/auth/is_email_valid_provider.dart';

class EmailTextField extends ConsumerWidget {
  const EmailTextField({super.key, required this.emailController});
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmailValid = ref.watch(isEmailValidProvider);
    final isEmailValidNotifier = ref.read(isEmailValidProvider.notifier);
    return TextFormField(
      controller: emailController,
      onChanged: (value) => isEmailValidNotifier.validateEmail(value),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: AppStrings.email.tr(),
        errorText: isEmailValid ? null : AppStrings.emailError.tr(),
      ),
    );
  }
}
