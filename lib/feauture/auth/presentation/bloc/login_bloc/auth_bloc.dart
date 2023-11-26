import 'dart:async';

import 'package:alumni/feauture/auth/domain/model/sing_in_model.dart';
import 'package:alumni/feauture/auth/domain/model/token/token_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<SignInEvent>(singIn);
    on<ChangePasswordEvent>(changePassword);
    on<LogoutEvent>(logout);
  }

  void login(LoginEvent event, Emitter emit) async {
    emit(AuthLoading());
    try {
      final token = await authRepository.login(
        event.username,
        event.password,
      );
      emit(
        LoginSuccess(token),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void singIn(SignInEvent event, Emitter emit) async {
    emit(AuthLoading());
    try {
      await authRepository.signIn(event.signIn);
      emit(
        SignInSuccess(),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void changePassword(ChangePasswordEvent event, Emitter emit) async {
    emit(AuthLoading());
    try {
      await authRepository.changePassword(
        event.email,
        event.code,
        event.password,
        event.confirmPassword,
      );
      emit(
        ChangePasswordSuccess(),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void logout(LogoutEvent event, Emitter emit) async {
    emit(AuthLoading());
    try {
      await authRepository.logout(event.refreshToken);
      emit(
        LogoutSuccess(),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
