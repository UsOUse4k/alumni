import 'package:alumni/feauture/profile/data/data_source/profile_data_source.dart';
import 'package:alumni/feauture/profile/domain/model/update_profile_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/model/profile_model.dart';

class ProfileApiDataSource{

  ProfileApiDataSource(this.profileDataSource);
  final ProfileDataSource profileDataSource;

  Future<ProfileModel> getProfile() async{
    Response response = await profileDataSource.getProfile();
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<bool> updateProfile(UpdateProfileModel updateProfileModel) async{
    Response response = await profileDataSource.updateProfile(updateProfileModel);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

}