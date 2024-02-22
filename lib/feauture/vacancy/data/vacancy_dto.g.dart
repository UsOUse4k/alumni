// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacancyDto _$VacancyDtoFromJson(Map<String, dynamic> json) => VacancyDto(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      companyLogo: json['companyLogo'] as String,
      salary: json['salary'] as String,
      requirements: json['requirements'] as String,
      position: json['position'] as String,
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => ContactsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdate: json['lastUpdate'] as String?,
      updatedBy: json['updatedBy'] as String,
    );

Map<String, dynamic> _$VacancyDtoToJson(VacancyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'salary': instance.salary,
      'requirements': instance.requirements,
      'position': instance.position,
      'contacts': instance.contacts,
      'lastUpdate': instance.lastUpdate,
      'updatedBy': instance.updatedBy,
    };

ContactsDto _$ContactsDtoFromJson(Map<String, dynamic> json) => ContactsDto(
      whatsapp: json['whatsapp'] as String,
      telegram: json['telegram'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ContactsDtoToJson(ContactsDto instance) =>
    <String, dynamic>{
      'whatsapp': instance.whatsapp,
      'telegram': instance.telegram,
      'email': instance.email,
    };
