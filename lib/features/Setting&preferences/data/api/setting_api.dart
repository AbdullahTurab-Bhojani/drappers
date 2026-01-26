import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/models/faqs_model.dart';
import '../../domain/models/static_content.dart';
part 'setting_api.g.dart';

@RestApi(baseUrl: '/webapi-drapper/static-content/')
abstract class SettingApi {
  factory SettingApi(Dio dio, {String baseUrl}) = _SettingApi;

  @GET('getPolicies')
  Future<StaticContent> getPolicies(@Query('type') String type);

  @GET('getFaqs')
  Future<FaqModel> getFaqs();
}
