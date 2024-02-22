import 'package:alumni/feauture/vacancy/domain/vacancy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vacancy_dto.g.dart';

@JsonSerializable()
class VacancyDto {
  final String id;
  final String companyName;
  final String companyLogo;
  final String salary;
  final String requirements;
  final String position;
  final List<ContactsDto> contacts;
  final String? lastUpdate;
  final String updatedBy;

  VacancyDto({
    required this.id,
    required this.companyName,
    required this.companyLogo,
    required this.salary,
    required this.requirements,
    required this.position,
    required this.contacts,
    this.lastUpdate,
    required this.updatedBy,
  });

  factory VacancyDto.fromJson(Map<String, dynamic> json) =>
      _$VacancyDtoFromJson(json);

  Vacancy toDomain() {
    return Vacancy(
      id: id,
      companyName: companyName,
      companyLogo: companyLogo,
      salary: salary,
      requirements: requirements,
      position: position,
      contacts: contacts[0].toDomain(),
      lastUpdate: lastUpdate,
      updatedBy: updatedBy,
    );
  }
}

@JsonSerializable()
class ContactsDto {
  final String whatsapp;
  final String telegram;
  final String email;

  ContactsDto({
    required this.whatsapp,
    required this.telegram,
    required this.email,
  });

  factory ContactsDto.fromJson(Map<String, dynamic> json) =>
      _$ContactsDtoFromJson(json);

  Contacts toDomain() {
    return Contacts(
      whatsapp: whatsapp,
      telegram: telegram,
      email: email,
    );
  }
}
