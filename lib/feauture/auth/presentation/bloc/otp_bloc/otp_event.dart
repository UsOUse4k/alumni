part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}

class SendConfirmCode extends OtpEvent {
  const SendConfirmCode(this.mail);

  final String mail;

  @override
  List<Object?> get props => [mail];
}
