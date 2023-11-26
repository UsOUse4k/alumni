import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  String? accessToken;
  String? refreshToken;
  UserModel? user;

  TokenModel({this.accessToken, this.refreshToken, this.user});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}

@JsonSerializable()
class UserModel {
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

  UserModel({
    this.id,
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
