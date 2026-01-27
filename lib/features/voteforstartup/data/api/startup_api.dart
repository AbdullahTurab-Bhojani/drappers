import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/startup_response_model.dart';
import '../../domain/models/vote_response_model.dart';
part 'startup_api.g.dart';

@RestApi(baseUrl: '/webapi-drapper/startup-management/')
abstract class StartupApi {
  factory StartupApi(Dio client) = _StartupApi;

  @GET('getStartups')
  Future<StartupListResponse> getStartups({
    @Query('page') required int page,
    @Query('count') required int count,
    @Query('keyword') String? keyword,
  });

  @GET('getStartupById')
  Future<StartupResponse> getStartupById(@Query('id') int id);

  @POST('voteStartup')
  Future<VoteResponse> voteStartup(@Body() Map<String, String> body);
}
