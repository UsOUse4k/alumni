import 'package:alumni/feauture/students/data/data_souce/student_data_source.dart';
import 'package:alumni/feauture/students/domain/model/student/student_model.dart';
import 'package:dio/dio.dart';

class StudentApiDataSource {
  StudentApiDataSource(this.studentDataSource);

  final StudentDataSource studentDataSource;

  Future<AllStudentModel> getAllStudents(int limit, int offset) async {
    Response response = await studentDataSource.getAllStudents(limit, offset);

    if (response.statusCode == 200) {
      return AllStudentModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<AllStudentModel> filterStudent(
    int limit,
    int offset,
    String? education,
    String? species,
    int? releaseYear,
    String? name,
  ) async {
    Response response = await studentDataSource.filterStudent(
      limit,
      offset,
      education,
      species,
      releaseYear,
      name,
    );

    if (response.statusCode == 200) {
      return AllStudentModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }

  Future<UsersModel> getDetailStudent(String id) async {
    Response response = await studentDataSource.getDetailStudent(id);

    if (response.statusCode == 200) {
      return UsersModel.fromJson(response.data);
    } else if (response.statusCode! >= 400) {
      throw Exception('Error');
    } else {
      throw Exception('Error');
    }
  }
}
