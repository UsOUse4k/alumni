// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacancyListDto _$VacancyListDtoFromJson(Map<String, dynamic> json) =>
    VacancyListDto(
      total: json['total'] as int,
      totalPages: json['totalPages'] as int,
      currentPage: json['currentPage'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPrevPage: json['hasPrevPage'] as bool,
      perPage: json['perPage'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => VacancyDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VacancyListDtoToJson(VacancyListDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'hasNextPage': instance.hasNextPage,
      'hasPrevPage': instance.hasPrevPage,
      'perPage': instance.perPage,
      'results': instance.results,
    };
