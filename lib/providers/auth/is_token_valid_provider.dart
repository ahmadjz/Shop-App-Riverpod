import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_riverpod/app/app_preferences.dart';
import 'package:shop_app_riverpod/app/dependency_injection.dart';
import 'package:shop_app_riverpod/app/typedefs/typedefs.dart';
import 'package:shop_app_riverpod/domain/repository/repository.dart';
import 'package:shop_app_riverpod/providers/auth/user_info_provider.dart';
import 'package:shop_app_riverpod/states/auth/models/auth_state.dart';

part 'is_token_valid_provider.g.dart';

@riverpod
Future<void> isTokenValid(IsTokenValidRef ref) async {
  final Repository repositoryImplementer = instance<Repository>();
  final AppPreferences appPreferences = instance<AppPreferences>();

  final UserToken userToken = await appPreferences.getUserToken();
  (await repositoryImplementer.checkToken(userToken)).fold(
    (failure) {
      ref
          .read(userInfoProvider.notifier)
          .updateState(const AuthState.unknown());
    },
    (data) {
      ref.read(userInfoProvider.notifier).updateState(
            AuthState(
              userToken: userToken,
              userId: data.id,
              userName: data.name,
              isTokenValid: true,
            ),
          );
    },
  );
}
