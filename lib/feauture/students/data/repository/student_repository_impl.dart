import 'package:alumni/core/utils/error_utils.dart';
import 'package:alumni/feauture/students/data/source/remote/student_api_data_source.dart';
import 'package:alumni/feauture/students/domain/model/student/student_model.dart';
import 'package:alumni/feauture/students/domain/repository/student_repository.dart';
import 'package:dio/dio.dart';

class StudentRepositoryImpl extends StudentRepository {
  StudentRepositoryImpl(this.studentApiDataSource);

  final StudentApiDataSource studentApiDataSource;

  @override
  Future<AllStudentModel> getAllStudent(int limit, int offset) async {
    try {
      final result = await studentApiDataSource.getAllStudents(limit, offset);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<UsersModel> getDetailStudent(String id) async {
    try {
      final result = await studentApiDataSource.getDetailStudent(id);
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }

  @override
  Future<AllStudentModel> filterStudent(
      int limit,
      int offset,
      String? education,
      String? species,
      int? releaseYear,
      String? name) async {
    try {
      final result = await studentApiDataSource.filterStudent(
        limit,
        offset,
        education,
        species,
        releaseYear,
        name,
      );
      return result;
    } on DioException catch (e) {
      throw showError(e.response?.data['message']);
    }
  }
}
