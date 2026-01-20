import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../features/authentication/domain/repository/auth_repository.dart';
import '../../authentication/data/dto/forget_dto/forget_password.dart';

final forgetPasswordProvider = FutureProvider.family<String, String>((
  ref,
  email,
) async {
  final authApi = ref.read(authRepository); // aapka AuthRepository instance

  String message = 'Something went wrong';

  if (email.isNotEmpty) {
    final dto = ForgetPasswordDTO(email: email);
    final response = await authApi.forgetPassword(dto); // API call

    // response expected as: {"isSuccess": true, "data": {}, "message": "..."}
    message = response.message;
  }

  return message;
});
