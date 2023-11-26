part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  const ProfileSuccess(this.profile);

  final ProfileModel profile;

  @override
  List<Object> get props => [profile];
}

class ProfileUpdateSuccess extends ProfileState {
  const ProfileUpdateSuccess();

  @override
  List<Object> get props => [];
}

class ProfileError extends ProfileState {}
