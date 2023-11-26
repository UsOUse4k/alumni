import 'package:alumni/core/network/dio_setting.dart';
import 'package:alumni/feauture/profile/domain/model/update_profile_model.dart';
import 'package:dio/dio.dart';

class ProfileDataSource {
  ProfileDataSource({required this.dioSetting});

  final DioSetting dioSetting;

  Future<Response> getProfile() async {
    return dioSetting.dio.get('/api/user/profile');
  }

  Future<Response> updateProfile(UpdateProfileModel updateProfile) async {
    FormData formData = FormData.fromMap({
      "name": updateProfile.name,
      "surname": updateProfile.surname,
      "education": updateProfile.education,
      "specialty": updateProfile.speciality,
      "yearOfRelease": updateProfile.graduationDate,
      "place": updateProfile.placeToWork,
      "workPlace": updateProfile.placeToWork,
      "positionAtWork": updateProfile.jobPosition,
      "shortBiography": updateProfile.shortInfo,
      "educationAndGoals": updateProfile.accomplishment,
      if (updateProfile.avatar != null) "avatars": await MultipartFile.fromFile(updateProfile.avatar!.path),
    });
    return dioSetting.dio.patch(
      '/api/user/update-profile',
      data: formData
    );
  }
}
