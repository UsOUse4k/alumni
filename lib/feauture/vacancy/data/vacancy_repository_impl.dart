import 'dart:io';

import 'package:alumni/core/network/dio_setting.dart';
import 'package:alumni/core/utils/error_utils.dart';
import 'package:alumni/feauture/vacancy/data/vacancy_dto.dart';
import 'package:alumni/feauture/vacancy/data/vacancy_list_dto.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy_list.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy_repository.dart';
import 'package:dio/dio.dart';

class VacancyRepositoryImpl implements VacancyRepository {
  final DioSetting _dioSetting;

  VacancyRepositoryImpl(this._dioSetting);

  @override
  Future<VacancyList> getVacancyList({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _dioSetting.dio
          .get("/api/vacancies?limit=$limit&offset=$offset");

      return VacancyListDto.fromJson(response.data).toDomain();
    } on DioException catch (e) {
      throw showError(e.response?.data["message"]);
    }
  }

  @override
  Future<Vacancy> getVacancyDetail(String vacancyId) async {
    try {
      final response = await _dioSetting.dio.get("/api/vacancies/$vacancyId");

      return VacancyDto.fromJson(response.data).toDomain();
    } on DioException catch (e) {
      throw showError(e.response?.data["message"]);
    }
  }

  @override
  Future<Vacancy> createVacancy({
    required String companyName,
    required File? companyLogos,
    required String salary,
    required String requirements,
    required String whatsapp,
    required String telegram,
    required String email,
    required String position,
  }) async {
    try {
      final formData = FormData.fromMap({
        "companyName": companyName,
        "salary": salary,
        "requirements": requirements,
        "content": {
          "whatsapp": whatsapp,
          "telegram": telegram,
          "email": email,
        },
        "position": position,
        if (companyLogos != null)
          "companyLogos": await MultipartFile.fromFile(companyLogos.path),
      });

      final response = await _dioSetting.dio.post(
        "/api/vacancies/create-vacancy",
        data: formData,
      );

      return VacancyDto.fromJson(response.data["vacancy"][0]).toDomain();
    } on DioException catch (e) {
      throw showError(e.response?.data["message"]);
    }
  }

  @override
  Future<Vacancy> updateVacancy({
    required String vacancyId,
    required String companyName,
    required File? companyLogos,
    required String salary,
    required String requirements,
    required String whatsapp,
    required String telegram,
    required String email,
    required String position,
  }) async {
    try {
      final formData = FormData.fromMap({
        "companyName": companyName,
        "salary": salary,
        "requirements": requirements,
        "content": {
          "whatsapp": whatsapp,
          "telegram": telegram,
          "email": email,
        },
        "position": position,
        if (companyLogos != null)
          "companyLogos": await MultipartFile.fromFile(companyLogos.path),
      });

      final response = await _dioSetting.dio.put(
        "/api/vacancies/update-vacancy/$vacancyId",
        data: formData,
      );

      return VacancyDto.fromJson(response.data["vacancy"][0]).toDomain();
    } on DioException catch (e) {
      throw showError(e.response?.data["message"]);
    }
  }

  @override
  Future<void> deleteVacancy(String vacancyId) async {
    try {
      await _dioSetting.dio.delete("/api/vacancies/delete-vacancy/$vacancyId");
    } on DioException catch (e) {
      throw showError(e.response?.data["message"]);
    }
  }
}
