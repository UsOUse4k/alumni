import 'dart:io';

class UpdateProfileModel {
  final String name;
  final String surname;
  final String education;
  final String speciality;
  final String graduationDate;
  final String location;
  final String phoneNumber;
  final String placeToWork;
  final String jobPosition;
  final String shortInfo;
  final String accomplishment;
  final File? avatar;

  UpdateProfileModel({
    required this.name,
    required this.surname,
    required this.education,
    required this.speciality,
    required this.graduationDate,
    required this.location,
    required this.phoneNumber,
    required this.placeToWork,
    required this.jobPosition,
    required this.shortInfo,
    required this.accomplishment,
    required this.avatar,
  });
}
