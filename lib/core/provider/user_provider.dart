import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/user/domain/models/user_model.dart';
import '../local/domain/repositories/local_storage_repository.dart';

final userDataProvider = FutureProvider<UserData?>((ref) async {
  final sharedPref = ref.read(localDataProvider);
  return await sharedPref.getUser();
});
