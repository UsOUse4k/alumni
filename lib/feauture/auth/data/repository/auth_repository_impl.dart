import 'package:alumni/core/utils/error_utils.dart';
import 'package:alumni/feauture/auth/data/source/remote/auth_api_data_source.dart';
import 'package:alumni/feauture/auth/domain/model/sing_in_model.dart';
import 'package:alumni/feauture/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

import '../../domain/model/token/token_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.apiDataSource);

  final AuthApiDataSource apiDataSource;

  @override
  Future<TokenModel> login(String username, String password) async {
    try {
      final result = await apiDataSource.login(username, password);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<String> signIn(SignInModel signIn) async {
    try {
      final result = await apiDataSource.signIn(signIn);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<String> sendConfirmMail(String mail) async {
    try {
      final result = await apiDataSource.sendConfirmMail(mail);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<String> logout(String refreshToken) async {
    try {
      final result = await apiDataSource.logout(refreshToken);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<String> changePassword(
    String email,
    int code,
    String password,
    String confirmPassword,
  ) async {
    try {
      final result = await apiDataSource.changePassword(
        email,
        code,
        password,
        confirmPassword,
      );
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }
}
