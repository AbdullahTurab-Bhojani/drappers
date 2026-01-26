import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../../drappers.dart';
import '../../../../features/authentication/data/dto/logout_dto/logout_dto.dart';
import '../../../../features/authentication/domain/repository/auth_repository.dart';
part 'logout_provider.g.dart';

@Riverpod(keepAlive: true)
class LogoutProvider extends _$LogoutProvider {
  @override
  AppLoadingState build() {
    return const AppLoadingState.initial();
  }

  Future<void> logout() async {
    if (state.isLoading) return;

    state = const AppLoadingState.loading();
    final pref = ref.read(localDataProvider);
    final authRepo = ref.read(authRepository);

    try {
      final refreshToken = pref.refreshToken;
      if (refreshToken != null && refreshToken.isNotEmpty) {
        await authRepo.logout(LogoutDTO(refreshToken: refreshToken));
      }

      await pref.setLogout();
      state = const AppLoadingState.success(null);
    } catch (e) {
      state = AppLoadingState.error(
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }
}
