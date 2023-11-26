import 'package:alumni/feauture/students/domain/model/student/student_model.dart';

abstract class StudentRepository {
  Future<AllStudentModel> getAllStudent(int limit, int offset);
  Future<AllStudentModel> filterStudent(
    int limit,
    int offset,
    String? education,
    String? species,
    int? releaseYear,
    String? name,
  );
  Future<UsersModel> getDetailStudent(String id);
}
