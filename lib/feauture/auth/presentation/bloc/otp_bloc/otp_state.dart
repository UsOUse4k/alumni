part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}
class OtpError extends OtpState {
  const OtpError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
class OtpLoading extends OtpState {}
class OtpSuccess extends OtpState {}
