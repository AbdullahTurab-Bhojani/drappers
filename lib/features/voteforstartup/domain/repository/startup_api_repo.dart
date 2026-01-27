import 'package:dio/dio.dart';
import '../../data/api/startup_api.dart';
import '../models/startup_model.dart';
import 'startup_repo.dart';

class StartupApiRepository implements StartupRepository {
  StartupApiRepository(this.client);

  final Dio client;

  @override
  Future<List<StartupModel>> getStartups({
    required int page,
    required int count,
    String? keyword,
  }) async {
    final response = await StartupApi(
      client,
    ).getStartups(page: page, count: count, keyword: keyword);
    return response.data!;
  }

  @override
  Future<StartupModel?> getStartupById(int id) async {
    final response = await StartupApi(client).getStartupById(id);
    return response.data;
  }

  @override
  Future<bool> voteStartup(int startupId) async {
    final response = await StartupApi(
      client,
    ).voteStartup({"startupId": "$startupId"});
    return response.isSuccess;
  }
}
