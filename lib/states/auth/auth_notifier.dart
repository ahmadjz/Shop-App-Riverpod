import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_riverpod/app/dependency_injection.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/data/network/failure.dart';
import 'package:shop_app_riverpod/domain/repository/repository.dart';
import 'package:shop_app_riverpod/domain/requests.dart';
import 'package:shop_app_riverpod/providers/auth/user_info_provider.dart';
import 'package:shop_app_riverpod/states/auth/models/auth_state.dart';

class AuthNotifier extends StateNotifier<IsLoading> {
  AuthNotifier(this.ref)
      : super(
          false,
        );
  final StateNotifierProviderRef<AuthNotifier, bool> ref;
  final Repository _repositoryImplementer = instance<Repository>();

  Future<Either<Failure, void>> login(LoginRequest loginRequest) async {
    state = true;
    return (await _repositoryImplementer.login(loginRequest)).fold(
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
        ref.read(userInfoProvider.notifier).updateState(
              AuthState(
                userToken: data.userToken,
                userId: data.userData!.id,
                userName: data.userData!.name,
                isTokenValid: true,
              ),
            );
        return const Right(Void);
      },
    );
  }

  Future<Either<Failure, void>> register(
      RegisterRequest registerRequest) async {
    state = true;
    return (await _repositoryImplementer.register(registerRequest)).fold(
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
        ref.read(userInfoProvider.notifier).updateState(
              AuthState(
                userToken: data.userToken,
                userId: data.userData!.id,
                userName: data.userData!.name,
                isTokenValid: true,
              ),
            );
        return const Right(Void);
      },
    );
  }
}
