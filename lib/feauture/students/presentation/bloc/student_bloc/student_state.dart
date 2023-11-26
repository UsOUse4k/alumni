part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentSuccess extends StudentState {
  const StudentSuccess(this.allStudent);
  final AllStudentModel allStudent;

  @override
  List<Object> get props => [allStudent];
}

class StudentDetailSuccess extends StudentState {
  const StudentDetailSuccess(this.student);
  final UsersModel student;

  @override
  List<Object> get props => [student];
}

class StudentError extends StudentState {
  const StudentError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
