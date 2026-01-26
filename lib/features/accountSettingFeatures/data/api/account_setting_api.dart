import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/delete_user.dart';
part 'account_setting_api.g.dart';

@RestApi(baseUrl: '/webapi-drapper/users/')
abstract class AccountSettingApi {
  factory AccountSettingApi(Dio dio, {String baseUrl}) = _AccountSettingApi;

  @PUT('deactivate')
  Future<DeleteUserResponse> deactivateUser();

  @DELETE('delete')
  Future<DeleteUserResponse> deleteUser();
}
