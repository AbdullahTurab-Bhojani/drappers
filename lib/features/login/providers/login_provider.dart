import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../authentication/data/dto/login_dto/login_dto.dart';
import '../../authentication/domain/models/login_response.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../user/domain/repository/user_repository.dart';

part 'login_provider.g.dart';

// State
sealed class AppLoadingState {
  const AppLoadingState();
}

class Initial extends AppLoadingState {
  const Initial();
}

class Loading extends AppLoadingState {
  const Loading();
}

class Success extends AppLoadingState {
  const Success();
}

class ErrorState extends AppLoadingState {
  final String message;
  const ErrorState(this.message);
}

// Provider
@Riverpod(keepAlive: true)
class LoginProvider extends _$LoginProvider {
  @override
  AppLoadingState build() {
    return const Initial();
  }

  Future<LoginResponse> onSubmit({required LoginDto loginDto}) async {
    state = const Loading();

    try {
      final response = await ref.read(authRepository).login(loginDto);
      await ref
          .read(localDataProvider)
          .setAccessToken(response.data!.accessToken!);
      await ref
          .read(localDataProvider)
          .setRefreshToken(response.data!.refreshToken!);
      final user = ref.read(userRepository);
      final userResponse = await user.getUser();
      await ref.read(localDataProvider).saveUser(userResponse.data!);
      state = const Success();
      return response;
    } catch (e) {
      state = ErrorState(e.toString().replaceFirst('Exception: ', ''));
      rethrow;
    }
  }
}
