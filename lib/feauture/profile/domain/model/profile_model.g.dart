// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      education: json['education'] as String?,
      specialty: json['specialty'] as String?,
      yearOfRelease: json['yearOfRelease'] as int?,
      place: json['place'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      workPlace: json['workPlace'] as String?,
      positionAtWork: json['positionAtWork'] as String?,
      shortBiography: json['shortBiography'] as String?,
      educationAndGoals: json['educationAndGoals'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'isAdmin': instance.isAdmin,
      'education': instance.education,
      'specialty': instance.specialty,
      'yearOfRelease': instance.yearOfRelease,
      'place': instance.place,
      'phoneNumber': instance.phoneNumber,
      'workPlace': instance.workPlace,
      'positionAtWork': instance.positionAtWork,
      'shortBiography': instance.shortBiography,
      'educationAndGoals': instance.educationAndGoals,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
    };
