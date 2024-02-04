import 'package:alumni/feauture/students/domain/model/student/student_model.dart';
import 'package:alumni/feauture/students/domain/repository/student_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository studentRepository;
  StudentBloc(this.studentRepository) : super(StudentInitial()) {
    on<GetAllStudentEvent>((event, emit) async {
      emit(StudentLoading());
      try {
        final allStudents =
            await studentRepository.getAllStudent(event.limit, event.offset);
        emit(
          StudentSuccess(allStudents),
        );
      } catch (e) {
        emit(
          StudentError(
            e.toString(),
          ),
        );
      }
    });

    on<FilterStudentEvent>((event, emit) async {
      emit(StudentLoading());
      try {
        final allStudents = await studentRepository.filterStudent(
            event.limit,
            event.offset,
            event.education,
            event.species,
            event.releaseYear,
            event.name);
        emit(
          StudentSuccess(allStudents),
        );
      } catch (e) {
        emit(
          StudentError(
            e.toString(),
          ),
        );
      }
    });

    on<GetDetailStudentEvent>((event, emit) async {
      emit(StudentLoading());
      try {
        final students = await studentRepository.getDetailStudent(event.id);
        emit(
          StudentDetailSuccess(students),
        );
      } catch (e) {
        emit(
          StudentError(
            e.toString(),
          ),
        );
      }
    });
  }
}
