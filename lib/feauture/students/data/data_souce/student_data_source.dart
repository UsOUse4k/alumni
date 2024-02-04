import 'package:alumni/core/network/dio_setting.dart';
import 'package:dio/dio.dart';

class StudentDataSource {
  StudentDataSource({required this.dioSetting});

  final DioSetting dioSetting;

  Future<Response> getAllStudents(int limit, int offset) async {
    return dioSetting.dio.get('/api/users?limit=$limit&offset=$offset');
  }

  Future<Response> getDetailStudent(String studentId) async {
    return dioSetting.dio.get('/api/user/$studentId');
  }

  Future<Response> filterStudent(
    int limit,
    int offset,
    String? education,
    String? species,
    int? releaseYear,
    String? name,
  ) async {
    final response = await dioSetting.dio.get(
      '/api/users?limit=$limit&offset=$offset',
      data: {
        name == null ? '' : "name": name,
        releaseYear == null ? '' : "yearOfRelease": releaseYear,
        education == null ? '' : "education": education,
        species == null ? '' : "specialty": species
      },
    );

    return response;
  }
}
