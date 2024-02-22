import 'dart:io';

import 'package:alumni/feauture/vacancy/domain/vacancy.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy_list.dart';

abstract class VacancyRepository {
  Future<VacancyList> getVacancyList({
    required int limit,
    required int offset,
  });
  Future<Vacancy> getVacancyDetail(String vacancyId);
  Future<void> deleteVacancy(String vacancyId);
  Future<void> updateVacancy({
    required String vacancyId,
    required String companyName,
    required File? companyLogos,
    required String salary,
    required String requirements,
    required String whatsapp,
    required String telegram,
    required String email,
    required String position,
  });
  Future<void> createVacancy({
    required String companyName,
    required File? companyLogos,
    required String salary,
    required String requirements,
    required String whatsapp,
    required String telegram,
    required String email,
    required String position,
  });
}
