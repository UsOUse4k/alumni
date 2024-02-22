import 'package:alumni/feauture/vacancy/data/vacancy_dto.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vacancy_list_dto.g.dart';

@JsonSerializable()
class VacancyListDto {
  final int total;
  final int totalPages;
  final int currentPage;
  final bool hasNextPage;
  final bool hasPrevPage;
  final int perPage;
  final List<VacancyDto> results;

  VacancyListDto({
    required this.total,
    required this.totalPages,
    required this.currentPage,
    required this.hasNextPage,
    required this.hasPrevPage,
    required this.perPage,
    required this.results,
  });

  factory VacancyListDto.fromJson(Map<String, dynamic> json) =>
      _$VacancyListDtoFromJson(json);

  VacancyList toDomain() {
    return VacancyList(
      total: total,
      vacancies: results
          .map(
            (result) => result.toDomain(),
          )
          .toList(),
    );
  }
}
