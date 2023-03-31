import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/app_preferences.dart';
import 'package:shop_app_riverpod/app/dependency_injection.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/network/failure.dart';
import 'package:shop_app_riverpod/domain/repository/repository.dart';
import 'package:shop_app_riverpod/providers/auth/user_info_provider.dart';
import 'package:shop_app_riverpod/states/auth/models/auth_state.dart';

class LogoutNotifier extends StateNotifier<IsLoading> {
  LogoutNotifier(this.ref)
      : super(
          false,
        );
  final StateNotifierProviderRef<LogoutNotifier, bool> ref;
  final Repository _repositoryImplementer = instance<Repository>();
  final AppPreferences appPreferences = instance<AppPreferences>();

  Future<Either<Failure, void>> logout() async {
    final UserToken userToken = await appPreferences.getUserToken();
    state = true;
    return (await _repositoryImplementer.logout(userToken)).fold(
      (failure) {
        state = false;
        return Left(
          Failure(
            code: failure.code,
            message: failure.message,
          ),
        );
      },
      (data) {
        state = false;
        ref
            .read(userInfoProvider.notifier)
            .updateState(const AuthState.unknown());
        return const Right(Void);
      },
    );
  }
}
