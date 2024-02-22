part of 'vacancy_bloc.dart';

abstract class VacancyState extends Equatable {
  const VacancyState();

  @override
  List<Object?> get props => [];
}

class VacancyInitial extends VacancyState {}

class VacancyLoading extends VacancyState {}

class VacancyDeleteSuccess extends VacancyState {}

class VacancyListSuccess extends VacancyState {
  const VacancyListSuccess(this.vacancyList);

  final VacancyList vacancyList;

  @override
  List<Object?> get props => [vacancyList];
}

class CreateVacancySuccess extends VacancyState {}

class UpdateVacancySuccess extends VacancyState {}

class VacancyDetailSuccess extends VacancyState {
  const VacancyDetailSuccess(this.vacancy);

  final Vacancy vacancy;

  @override
  List<Object?> get props => [vacancy];
}

class VacancyError extends VacancyState {
  const VacancyError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
