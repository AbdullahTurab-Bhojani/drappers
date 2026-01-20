import 'package:dio/dio.dart';
import '../../data/api/user_api.dart';
import '../models/user_model.dart';
import 'user_repository.dart';

class UserApiRepository implements UserRepository {
  UserApiRepository(this.client);

  final Dio client;

  @override
  Future<UserModel> getUser() async {
    return await UserApi(client).getUser();
  }
}
