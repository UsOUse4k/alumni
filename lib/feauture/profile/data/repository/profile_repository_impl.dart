import 'package:alumni/core/utils/error_utils.dart';
import 'package:alumni/feauture/profile/data/source/remote/profile_api_data_source.dart';
import 'package:alumni/feauture/profile/domain/model/profile_model.dart';
import 'package:alumni/feauture/profile/domain/model/update_profile_model.dart';
import 'package:alumni/feauture/profile/domain/repository/profile_repository.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(this.profileApiDataSource);

  final ProfileApiDataSource profileApiDataSource;

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final result = await profileApiDataSource.getProfile();
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<bool> updateProfile(UpdateProfileModel updateProfileModel) async {
    try {
      final result =
          await profileApiDataSource.updateProfile(updateProfileModel);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }
}
