part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginEvent extends AuthEvent {
  const LoginEvent(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

class LogoutEvent extends AuthEvent{
  const LogoutEvent(this.refreshToken);

  final String refreshToken;

  @override
  List<Object?> get props => [refreshToken];

}

class ChangePasswordEvent extends AuthEvent {
  const ChangePasswordEvent(
    this.email,
    this.code,
    this.password,
    this.confirmPassword,
  );

  final String email;
  final int code;
  final String password;
  final String confirmPassword;

  @override
  List<Object?> get props => [email, code, password, confirmPassword];
}

class SignInEvent extends AuthEvent {
  const SignInEvent(this.signIn);

  final SignInModel signIn;

  @override
  List<Object?> get props => [signIn];
}
