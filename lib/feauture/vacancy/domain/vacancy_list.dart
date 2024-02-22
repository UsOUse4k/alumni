import 'package:alumni/feauture/vacancy/domain/vacancy.dart';

class VacancyList {
  final int total;
  final List<Vacancy> vacancies;

  VacancyList({
    required this.total,
    required this.vacancies,
  });
}
