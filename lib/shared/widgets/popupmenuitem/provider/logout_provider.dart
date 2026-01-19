import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../../features/authentication/data/dto/logout_dto/logout_dto.dart';
import '../../../../features/authentication/domain/repository/auth_repository.dart';

final logoutProvider = FutureProvider<String>((ref) async {
  final localData = ref.read(localDataProvider);
  final authApi = ref.read(authRepository);
  final token = localData.refreshToken;
  String message = 'Logout Successfully';
  try {
    if (token != null && token.isNotEmpty) {
      final response = await authApi.logout(LogoutDTO(refreshToken: token));
      message = response.message;
    }
  } catch (e) {
    message = 'Logout Failed, but data cleared';
  } finally {
    await localData.clearAllData();
  }
  return message;
});
