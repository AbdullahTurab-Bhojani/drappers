import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../appconfig.dart';
import '../../../../core/api_client/client.dart';
import '../models/startup_model.dart';
import 'startup_api_repo.dart';

abstract interface class StartupRepository {
  Future<List<StartupModel>> getStartups({
    required int page,
    required int count,
    String? keyword,
  });

  Future<StartupModel?> getStartupById(int id);
  Future<bool> voteStartup(int startupId);
}

final authRepository = Provider<StartupRepository>(
  (ref) => StartupApiRepository(ref.read(client(AppConfig.baseUrl))),
);
