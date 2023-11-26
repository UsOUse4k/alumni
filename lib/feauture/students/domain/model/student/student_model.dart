import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable()
class AllStudentModel {
  @JsonKey(name: 'results')
  List<UsersModel>? users;
  int? total;

  AllStudentModel({this.users, this.total});

  factory AllStudentModel.fromJson(Map<String, dynamic> json) =>
      _$AllStudentModelFromJson(json);
}

@JsonSerializable()
class UsersModel {
  String? id;
  String? email;
  String? name;
  String? surname;
  bool? isAdmin;
  String? education;
  String? specialty;
  int? yearOfRelease;
  String? place;
  String? workPlace;
  String? positionAtWork;
  String? shortBiography;
  String? educationAndGoals;
  String? avatar;
  String? createdAt;
  String? phoneNumber;

  UsersModel({
    this.id,
    this.email,
    this.name,
    this.surname,
    this.isAdmin,
    this.education,
    this.specialty,
    this.yearOfRelease,
    this.place,
    this.workPlace,
    this.positionAtWork,
    this.shortBiography,
    this.educationAndGoals,
    this.avatar,
    this.createdAt,
    this.phoneNumber,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => _$UsersModelFromJson(json);
}
