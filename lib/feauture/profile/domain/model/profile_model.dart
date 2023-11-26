import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  String? id;
  String? email;
  String? name;
  String? surname;
  bool? isAdmin;
  String? education;
  String? specialty;
  int? yearOfRelease;
  String? place;
  String? phoneNumber;
  String? workPlace;
  String? positionAtWork;
  String? shortBiography;
  String? educationAndGoals;
  String? avatar;
  String? createdAt;

  ProfileModel(
      {this.id,
        this.email,
        this.name,
        this.surname,
        this.isAdmin,
        this.education,
        this.specialty,
        this.yearOfRelease,
        this.place,
        this.phoneNumber,
        this.workPlace,
        this.positionAtWork,
        this.shortBiography,
        this.educationAndGoals,
        this.avatar,
        this.createdAt,
      });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);


}
