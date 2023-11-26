import 'package:alumni/feauture/auth/data/data_source/auth_data_source.dart';
import 'package:alumni/feauture/auth/domain/model/sing_in_model.dart';
import 'package:alumni/feauture/auth/domain/model/token/token_model.dart';
import 'package:dio/dio.dart';

class AuthApiDataSource {
  AuthApiDataSource(this.authDataSource);

  final AuthDataSource authDataSource;

  Future<TokenModel> login(String username, String password) async {
    Response response = await authDataSource.login(username, password);

    if (response.statusCode == 200) {
      return TokenModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<TokenModel> refreshToken(String token) async {
    Response response = await authDataSource.refreshToken(token);

    if (response.statusCode == 200) {
      return TokenModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<String> signIn(SignInModel signIn) async {
    Response response = await authDataSource.signIn(signIn);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<String> sendConfirmMail(String mail) async {
    Response response = await authDataSource.sendConfirmMail(mail);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<String> logout(String refreshToken) async {
    Response response = await authDataSource.logout(refreshToken);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<String> changePassword(
    String email,
    int code,
    String password,
    String confirmPassword,
  ) async {
    Response response = await authDataSource.changePassword(
      email,
      code,
      password,
      confirmPassword,
    );

    if (response.statusCode == 200) {
      return response.data['message'];
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }
}
