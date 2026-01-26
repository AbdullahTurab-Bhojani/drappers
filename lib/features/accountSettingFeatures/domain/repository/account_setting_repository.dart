import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../appconfig.dart';
import '../../../../core/api_client/client.dart';
import '../models/delete_user.dart';
import 'account_setting_api_repository.dart';

abstract interface class AccountSettingRepository {
  Future<DeleteUserResponse> userDeactivate();
  Future<DeleteUserResponse> userDelete();
}

final accountRepository = Provider<AccountSettingRepository>(
  (ref) => AccountSettingApiRepository(ref.read(client(AppConfig.baseUrl))),
);
