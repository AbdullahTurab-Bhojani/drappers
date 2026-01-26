import 'package:dio/dio.dart';
import '../../data/api/account_setting_api.dart';
import '../models/delete_user.dart';
import 'account_setting_repository.dart';

class AccountSettingApiRepository implements AccountSettingRepository {
  AccountSettingApiRepository(this.client);

  final Dio client;

  @override
  Future<DeleteUserResponse> userDeactivate() async {
    return await AccountSettingApi(client).deactivateUser();
  }

  @override
  Future<DeleteUserResponse> userDelete() async {
    return await AccountSettingApi(client).deleteUser();
  }
}
