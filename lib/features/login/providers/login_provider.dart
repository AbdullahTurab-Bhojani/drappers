import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../authentication/data/dto/login_dto/login_dto.dart';
import '../../authentication/domain/models/login_response.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../user/domain/repository/user_repository.dart';
import '../../../drappers.dart';

part 'login_provider.g.dart';

@Riverpod()
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

      final apiMessage = response.message;

      if (!response.isSuccess || response.data == null) {
        state = AppLoadingState.error(apiMessage);
        return response;
      }

      final accessToken = response.data!.accessToken;
      final refreshToken = response.data!.refreshToken;

      if (accessToken == null || refreshToken == null) {
        state = AppLoadingState.error(apiMessage);
        return response;
      }

      await pref.setLogout();
      await pref.setAccessToken(accessToken);
      await pref.setRefreshToken(refreshToken);

      final userResponse = await userRepo.getUser();

      if (userResponse.data == null) {
        state = AppLoadingState.error(apiMessage);
        return response;
      }

      final user = userResponse.data!;
      await pref.saveUser(user);
      await pref.saveUserId(user.id.toString());
      await pref.saveUserName(user.fullName ?? '');
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
