part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();
}

class GetAllStudentEvent extends StudentEvent {
  const GetAllStudentEvent(this.limit, this.offset);

  final int limit;
  final int offset;

  @override
  List<Object?> get props => [limit, offset];
}

class GetDetailStudentEvent extends StudentEvent {
  const GetDetailStudentEvent(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}

class FilterStudentEvent extends StudentEvent {
  const FilterStudentEvent(this.offset, this.limit, this.education,
      this.species, this.name, this.releaseYear);

  final int offset;
  final int limit;
  final String? education;
  final String? species;
  final String? name;
  final int? releaseYear;

  @override
  List<Object?> get props =>
      [offset, limit, education, species, name, releaseYear];
}
