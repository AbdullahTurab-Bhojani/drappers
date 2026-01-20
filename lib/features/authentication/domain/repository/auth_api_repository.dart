import 'package:dio/dio.dart';
import '../../data/api/auth_api.dart';
import '../../data/dto/forget_dto/forget_password.dart';
import '../../data/dto/login_dto/login_dto.dart';
import '../../data/dto/logout_dto/logout_dto.dart';
import '../../data/dto/reset_dto/reset_password_dto.dart';
import '../../data/dto/sign_up_dto/sign_up.dart';
import '../../data/dto/social_dto/social_dto.dart';
import '../../data/dto/user_update_dto/user_update.dart';
import '../models/login_response.dart';
import '../models/base_response.dart';
import '../models/signup_response.dart';
import '../models/user_response.dart';
import 'auth_repository.dart';

class AuthApiRepository implements AuthRepository {
  AuthApiRepository(this.client);

  final Dio client;

  @override
  Future<SignUpResponseDto> signUp(SignUpDto signup) async {
    return await AuthApi(client).signUp(signup);
  }

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    return await AuthApi(client).login(loginDto);
  }

  @override
  Future<dynamic> socialLogin(SocialDTO socialDTO) async {
    return await AuthApi(client).socialLogin(socialDTO);
  }

  Future<BaseResponse> logout(LogoutDTO logoutDto) async {
    return await AuthApi(client).logout(logoutDto);
  }

  @override
  Future<BaseResponse> forgetPassword(
    ForgetPasswordDTO forgetPasswordDto,
  ) async {
    return await AuthApi(client).forgetPassword(forgetPasswordDto);
  }

  @override
  Future<BaseResponse> resetPassword(ResetPasswordDTO resetPasswordDto) async {
    return await AuthApi(client).resetPassword(resetPasswordDto);
  }

  @override
  Future<UpdateUserResponse> updateProfile(UpdateUserDTO updateUserDto) async {
    return await AuthApi(client).updateProfile(updateUserDto);
  }
}
