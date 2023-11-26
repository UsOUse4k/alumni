part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class LogoutSuccess extends AuthState{}

class LoginSuccess extends AuthState {
  const LoginSuccess(this.token);

  final TokenModel token;

  @override
  List<Object> get props => [token];
}

class SignInSuccess extends AuthState {}
class ChangePasswordSuccess extends AuthState {}

class AuthLoading extends AuthState {}
