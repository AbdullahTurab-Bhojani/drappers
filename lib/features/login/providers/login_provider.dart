import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../authentication/data/dto/login_dto/login_dto.dart';
import '../../authentication/domain/models/login_response.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../user/domain/repository/user_repository.dart';
import '../../../drappers.dart';

part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
class LoginProvider extends _$LoginProvider {
  @override
  AppLoadingState build() {
    return const AppLoadingState.initial();
  }

  Future<LoginResponse> onSubmit({required LoginDto loginDto}) async {
    state = const AppLoadingState.loading();

    try {
      final authRepo = ref.read(authRepository);
      final pref = ref.read(localDataProvider);
      final userRepo = ref.read(userRepository);
      final response = await authRepo.login(loginDto);
      await pref.setLogout();
      await pref.setAccessToken(response.data!.accessToken!);
      await pref.setRefreshToken(response.data!.refreshToken!);

      final userResponse = await userRepo.getUser();
      await pref.saveUser(userResponse.data!);
      await pref.saveUserId(userResponse.data!.id.toString());
      await pref.saveUserName(userResponse.data!.fullName ?? '');
      await pref.setIsLogin();

      state = AppLoadingState.success(response);
      return response;
    } catch (e) {
      state = AppLoadingState.error(
        e.toString().replaceFirst('Exception: ', ''),
      );
      rethrow;
    }
  }
}
