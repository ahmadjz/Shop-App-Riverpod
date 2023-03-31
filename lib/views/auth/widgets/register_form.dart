import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/views/auth/widgets/email_text_field.dart';
import 'package:shop_app_riverpod/views/auth/widgets/name_text_field.dart';
import 'package:shop_app_riverpod/views/auth/widgets/password_text_field.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function() onSubmit;

  const RegisterForm({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameTextField(nameController: nameController),
        EmailTextField(emailController: emailController),
        PasswordTextField(passwordController: passwordController),
        SizedBox(height: 60.h),
        ElevatedButton(
          onPressed: onSubmit,
          child: Text(AppStrings.registerButton.tr()),
        ),
      ],
    );
  }
}
