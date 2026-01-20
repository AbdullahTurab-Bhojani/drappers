import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../appconfig.dart';
import '../../../../core/api_client/client.dart';
import '../models/user_model.dart';
import 'user_api_repository.dart';

abstract interface class UserRepository {
  Future<UserModel> getUser();
}

final userRepository = Provider<UserRepository>(
  (ref) => UserApiRepository(ref.read(client(AppConfig.baseUrl))),
);
