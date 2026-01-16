import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../drappers.dart';
import '../../authentication/data/dto/login_dto/login_dto.dart';
import '../../authentication/domain/models/login_response.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../user/domain/repository/user_repository.dart';
part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
class LoginProvider extends _$LoginProvider {
  @override
  AppLoadingState build() {
    return const AppLoadingState.initial();
  }

  Future<LoginResponse> onSubmit({required LoginDto loginDto}) async {
    if (ref.mounted) {
      state = const AppLoadingState.loading();
    }

    try {
      final repo = ref.read(authRepository);
      final response = await repo.login(loginDto);

      if (!ref.mounted) {
        return response;
      }

      if (response.isSuccess) {
        state = const AppLoadingState.success(null);
        await ref
            .read(localDataProvider)
            .setAccessToken(response.data.accessToken);

        final user = ref.read(userRepository);
        final userResponse = await user.getUser();
        await ref.read(localDataProvider).saveUser(userResponse.data);
      } else {
        state = const AppLoadingState.error();
      }

      return response;
    } catch (e, st) {
      debugPrint('Login Error: $e\n$st');

      if (ref.mounted) {
        state = const AppLoadingState.error();
      }

      rethrow;
    }
  }
}
