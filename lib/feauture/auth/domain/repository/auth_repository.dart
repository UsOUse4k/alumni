import 'package:alumni/feauture/auth/domain/model/sing_in_model.dart';

import '../model/token/token_model.dart';

abstract class AuthRepository {
  Future<TokenModel> login(String username, String password);
  Future<String> signIn(SignInModel signIn);
  Future<String> sendConfirmMail(String mail);
  Future<String> logout(String refreshToken);
  Future<String> changePassword(
    String email,
    int code,
    String password,
    String confirmPassword,
  );
}
