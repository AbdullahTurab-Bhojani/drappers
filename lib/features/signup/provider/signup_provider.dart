import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../drappers.dart';
import '../../authentication/data/dto/sign_up_dto/sign_up.dart';
import '../../authentication/domain/models/signup_response.dart';
import '../../authentication/domain/repository/auth_repository.dart';
part 'signup_provider.g.dart';

@Riverpod(keepAlive: true)
class SignUpProvider extends _$SignUpProvider {
  @override
  AppLoadingState build() {
    return const AppLoadingState.initial();
  }

  Future<SignUpResponseDto> onSubmit({required SignUpDto signUpDto}) async {
    if (ref.mounted) {
      state = const AppLoadingState.loading();
    }

    try {
      final repo = ref.read(authRepository);
      final response = await repo.signUp(signUpDto);

      if (!ref.mounted) {
        return response;
      }

      if (response.isSuccess) {
        state = const AppLoadingState.success(null);
      } else {
        state = const AppLoadingState.error();
      }

      return response;
    } catch (e, st) {
      debugPrint('Sign Up Error: $e\n$st');

      if (ref.mounted) {
        state = const AppLoadingState.error();
      }

      rethrow;
    }
  }
}
