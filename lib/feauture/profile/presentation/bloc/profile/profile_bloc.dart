import 'dart:async';

import 'package:alumni/feauture/profile/domain/model/profile_model.dart';
import 'package:alumni/feauture/profile/domain/model/update_profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc(this.profileRepository) : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await profileRepository.getProfile();
        emit(ProfileSuccess(profile));
      } catch (e) {
        emit(ProfileError());
      }
    });

    on<UpdateProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        await profileRepository.updateProfile(event.updateProfile);
        emit(const ProfileUpdateSuccess());
      } catch (e,s) {
        print(e);
        print(s);
        emit(ProfileError());
      }
    });
  }
}
