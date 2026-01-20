import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/authentication/domain/repository/auth_repository.dart';
import '../../authentication/data/dto/reset_dto/reset_password_dto.dart';

final changePasswordProvider = FutureProvider.family<String, ResetPasswordDTO>((
  ref,
  dto,
) async {
  final authRepo = ref.read(authRepository);
  try {
    final response = await authRepo.resetPassword(dto);
    return response.message;
  } catch (e) {
    throw Exception(e.toString());
  }
});
