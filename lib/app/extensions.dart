import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';

extension ContextExtension on BuildContext {
  void showNewDialog({
    required String title,
    required String content,
  }) =>
      showDialog(
        context: this,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text(
                AppStrings.okay.tr(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
}