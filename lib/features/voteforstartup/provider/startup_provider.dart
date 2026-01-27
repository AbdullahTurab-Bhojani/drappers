import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../appconfig.dart';
import '../../../../core/api_client/client.dart';
import '../domain/models/startup_model.dart';
import '../domain/repository/startup_api_repo.dart';
import '../domain/repository/startup_repo.dart';

final startupRepositoryProvider = Provider<StartupRepository>(
  (ref) => StartupApiRepository(ref.read(client(AppConfig.baseUrl))),
);

final startupListProvider = FutureProvider.family<List<StartupModel>, String?>((
  ref,
  keyword,
) async {
  final repo = ref.read(startupRepositoryProvider);
  return repo.getStartups(page: 1, count: 10, keyword: keyword);
});
