// ignore_for_file: annotate_overrides

import 'package:dio/dio.dart';
import '../../data/api/auth_api.dart';
import '../../data/dto/login_dto/login_dto.dart';
import '../../data/dto/sign_up_dto/sign_up.dart';
import '../../data/dto/social_dto/social_dto.dart';
import '../models/login_response.dart';
import '../models/signup_response.dart';
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

  // @override
  // Future<VerificationResponseModel> verifyotp(Map<String, dynamic> body) async {
  //   return await AuthApi(client).verifyotp(body);
  // }

  // @override
  // Future<ForgotPasswordResponse> forgotPassword(
  //     Map<String, dynamic> body) async {
  //   return await AuthApi(client).forgotPassword(body);
  // }

  // @override
  // Future<ForgotPasswordResponse> resetPassword(
  //     Map<String, dynamic> body) async {
  //   return await AuthApi(client).resetPassword(body);
  // }

  // @override
  // Future<LogoutResponseModel> logout(LogoutDto dto) async {
  //   return await AuthApi(client).logout(dto.toJson());
  // }

  // Future<OtpResponseModel> sendotp(Map<String, dynamic> body) async {
  //   return await AuthApi(client).sendotp(body);
  // }

  // @override
  // Future<LogoutResponseModel> addDevice(LogoutDto dto) async {
  //   return await AuthApi(client).addDevice(dto.toJson());
  // }

  // @override
  // Future<ChangePasswordResponseModel> changePassword(
  //     ChangePasswordRequestDto body) async {
  //   return await AuthApi(client).changePassword(body);
  // }

  // @override
  // Future<DeleteAccountResponse> deleteAccount() async {
  //   return await AuthApi(client).deleteAccount({});
  // }
}
