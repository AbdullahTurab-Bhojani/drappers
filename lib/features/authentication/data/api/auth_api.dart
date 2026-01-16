import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/models/login_response.dart';
import '../../domain/models/signup_response.dart';
import '../dto/login_dto/login_dto.dart';
import '../dto/sign_up_dto/sign_up.dart';
import '../dto/social_dto/social_dto.dart';
part 'auth_api.g.dart';

@RestApi(baseUrl: '/webapi-drapper/auth/')
abstract class AuthApi {
  factory AuthApi(Dio client) = _AuthApi;

  @POST('signUp')
  Future<SignUpResponseDto> signUp(@Body() SignUpDto signUp);

  @POST('login')
  Future<LoginResponse> login(@Body() LoginDto login);

  @POST('socialLogin')
  Future<dynamic> socialLogin(@Body() SocialDTO socialDTO);
}
