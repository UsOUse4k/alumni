import 'package:alumni/feauture/profile/domain/model/update_profile_model.dart';

import '../model/profile_model.dart';

abstract class ProfileRepository{
  Future<ProfileModel> getProfile();
  Future<bool> updateProfile(UpdateProfileModel updateProfileModel);
}