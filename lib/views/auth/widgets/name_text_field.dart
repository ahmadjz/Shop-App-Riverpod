import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';

class NameTextField extends ConsumerWidget {
  const NameTextField({super.key, required this.nameController});
  final TextEditingController nameController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      obscureText: true,
      controller: nameController,
      decoration: InputDecoration(
        labelText: AppStrings.name.tr(),
      ),
    );
  }
}
