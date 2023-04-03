import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';

extension ContextExtension on BuildContext {
  void showNewDialog({
    required String title,
    required String? content,
    required bool showCancelButton,
    String? buttonText,
    Function()? buttonAction,
    Function()? thenFunction,
  }) =>
      showDialog(
        barrierDismissible: false,
        context: this,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: content == null ? null : Text(content),
          actions: [
            if (showCancelButton)
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Text(AppStrings.cancelButton.tr()),
              ),
            TextButton(
              child: Text(
                buttonText ?? AppStrings.okay.tr(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                buttonAction?.call();
              },
            )
          ],
        ),
      ).then(
        (value) => thenFunction?.call(),
      );
}
