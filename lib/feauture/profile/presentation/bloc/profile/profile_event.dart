part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  const UpdateProfileEvent(this.updateProfile);

  final UpdateProfileModel updateProfile;

  @override
  List<Object?> get props => [updateProfile];
}

