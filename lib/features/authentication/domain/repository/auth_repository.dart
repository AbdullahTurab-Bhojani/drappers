import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../appconfig.dart';
import '../../../../core/api_client/client.dart';
import '../../data/dto/forget_dto/forget_password.dart';
import '../../data/dto/login_dto/login_dto.dart';
import '../../data/dto/logout_dto/logout_dto.dart';
import '../../data/dto/refresh_token_dto/refreshtoken.dart';
import '../../data/dto/reset_dto/reset_password_dto.dart';
import '../../data/dto/sign_up_dto/sign_up.dart';
import '../../data/dto/social_dto/social_dto.dart';
import '../../data/dto/user_update_dto/user_update.dart';
import '../models/login_response.dart';
import '../models/base_response.dart';
import '../models/refresh_token_response.dart';
import '../models/signup_response.dart';
import '../models/user_response.dart';
import 'auth_api_repository.dart';

abstract interface class AuthRepository {
  Future<SignUpResponseDto> signUp(SignUpDto signup);

  Future<LoginResponse> login(LoginDto loginDto);

  Future<dynamic> socialLogin(SocialDTO socialDTO);

  Future<BaseResponse> logout(LogoutDTO logoutDto);

  Future<BaseResponse> forgetPassword(ForgetPasswordDTO forgetPasswordDto);

  Future<BaseResponse> resetPassword(ResetPasswordDTO resetPasswordDto);

  Future<UpdateUserResponse> updateProfile(UpdateUserDTO updateUserDto);

  Future<TokenResponseModel> refreshToken(RefreshTokenModel refreshDto);
}

final authRepository = Provider<AuthRepository>(
  (ref) => AuthApiRepository(ref.read(client(AppConfig.baseUrl))),
);
final authRepository1 = Provider<AuthRepository>(
  (ref) => AuthApiRepository(ref.read(refreshClient(AppConfig.baseUrl))),
);
