import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/authentication/domain/repository/auth_repository.dart';
import '../../authentication/data/dto/reset_dto/reset_password_dto.dart';

final changePasswordProvider = FutureProvider.family<String, ResetPasswordDTO>((
  ref,
  dto,
) async {
  final authApi = ref.read(authRepository);

  String message = 'Something went wrong';

  final response = await authApi.resetPassword(dto);

  message = response.message;

  return message;
});
