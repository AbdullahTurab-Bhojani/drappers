import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../accountSettingFeatures/domain/models/delete_user.dart';
import '../../accountSettingFeatures/domain/repository/account_setting_repository.dart';

final deactivateUserProvider = FutureProvider.autoDispose<DeleteUserResponse>((
  ref,
) async {
  final api = ref.read(accountRepository);
  return await api.userDeactivate();
});
