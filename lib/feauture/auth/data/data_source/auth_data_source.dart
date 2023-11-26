import 'package:alumni/feauture/auth/domain/model/sing_in_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/dio_setting.dart';

class AuthDataSource {
  AuthDataSource({required this.dioSetting});
  final DioSetting dioSetting;

  Future<Response> login(String username, String password) {
    return dioSetting.dio.post(
      '/api/auth/login',
      data: {
        "email": username,
        "password": password,
      },
    );
  }
  Future<Response> refreshToken(String token) {
    return dioSetting.dio.get(
      '/api/auth/login',
      data: {
        "refreshToken": token,
      },
    );
  }

  Future<Response> signIn(SignInModel signIn) {
    return dioSetting.dio.post(
      '/api/auth/registration',
      data: {
        "phoneNumber": signIn.telephone,
        "email": signIn.email,
        "password": signIn.password,
        "confirmPassword": signIn.confirmPassword,
        "name": signIn.name,
        "surname": signIn.surname
      },
    );
  }

  Future<Response> sendConfirmMail(String email) {
    return dioSetting.dio.post(
      '/api/auth/send-otp',
      data: {"email": email},
    );
  }

  Future<Response> logout(String refreshToken) {
    return dioSetting.dio.post(
      '/api/auth/logout',
      data: {"refreshToken": refreshToken},
    );
  }

  Future<Response> changePassword(
    String email,
    int code,
    String password,
    String confirmPassword,
  ) {
    return dioSetting.dio.post(
      '/api/auth/reset-password',
      data: {
        "email": email,
        "code": code,
        "newPassword": password,
        "confirmNewPassword": confirmPassword
      },
    );
  }
}
