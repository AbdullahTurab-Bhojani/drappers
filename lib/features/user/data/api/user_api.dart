import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/user_model.dart';
part 'user_api.g.dart';

@RestApi(baseUrl: '/webapi-drapper/auth/')
abstract class UserApi {
  factory UserApi(Dio client) = _UserApi;

  @GET('user')
  Future<UserModel> getUser();
}
