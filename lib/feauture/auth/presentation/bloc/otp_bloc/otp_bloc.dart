import 'package:alumni/feauture/auth/domain/repository/auth_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository authRepository;
  OtpBloc(this.authRepository) : super(OtpInitial()) {
    on<SendConfirmCode>((event, emit) async {
      emit(OtpLoading());
      try {
        await authRepository.sendConfirmMail(event.mail);
        emit(OtpSuccess());
      } catch (e) {
        emit(OtpError(e.toString()));
      }
    });
  }
}
