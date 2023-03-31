import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app_riverpod/app/extensions.dart';
import 'package:shop_app_riverpod/app/resources/assets_manager.dart';
import 'package:shop_app_riverpod/app/resources/strings_manager.dart';
import 'package:shop_app_riverpod/domain/requests.dart';
import 'package:shop_app_riverpod/providers/auth/auth_page_type_provider.dart';
import 'package:shop_app_riverpod/providers/auth/auth_provider.dart';
import 'package:shop_app_riverpod/views/animations/loading_animation_view.dart';
import 'package:shop_app_riverpod/views/auth/widgets/login_form.dart';
import 'package:shop_app_riverpod/views/auth/widgets/register_form.dart';

class AuthPage extends ConsumerWidget {
  AuthPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitAuth(WidgetRef ref, BuildContext context, bool isLogin) async {
    final authNotifier = ref.read(authStateProvider.notifier);
    final result = isLogin
        ? await authNotifier.login(
            LoginRequest(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            ),
          )
        : await authNotifier.register(
            RegisterRequest(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            ),
          );

    result.fold(
      (failure) => context.showNewDialog(
        title: AppStrings.error.tr(),
        content: failure.message,
      ),
      (_) => context.showNewDialog(
        title: AppStrings.success.tr(),
        content: AppStrings.loggedInSuccessfully.tr(),
      ),
    );
  }

  void toggleLogin(Function() toggleLogin) {
    _emailController.clear();
    _passwordController.clear();
    toggleLogin();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoginPage = ref.watch(authPageTypeProvider);
    final isLoginPageNotifier = ref.read(authPageTypeProvider.notifier);
    final isLoading = ref.watch(authStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLoginPage
              ? AppStrings.loginPage.tr()
              : AppStrings.registerPage.tr(),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // to detect when the user taps outside of the text fields to dismiss the keyboard
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(50.w),
              child: isLoading
                  ? const LoadingAnimationView()
                  : Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.logo,
                            width: 750.w,
                          ),
                          if (isLoginPage)
                            LoginForm(
                              emailController: _emailController,
                              passwordController: _passwordController,
                              onSubmit: () => _submitAuth(ref, context, true),
                            )
                          else
                            RegisterForm(
                              nameController: _nameController,
                              emailController: _emailController,
                              passwordController: _passwordController,
                              onSubmit: () => _submitAuth(ref, context, false),
                            ),
                          TextButton(
                            onPressed: () => toggleLogin(
                              isLoginPageNotifier.toggleLogin,
                            ),
                            child: Text(
                              isLoginPage
                                  ? AppStrings.registerInstead.tr()
                                  : AppStrings.loginInstead.tr(),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
