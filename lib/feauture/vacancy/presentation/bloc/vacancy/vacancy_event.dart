part of 'vacancy_bloc.dart';

abstract class VacancyEvent extends Equatable {
  const VacancyEvent();

  @override
  List<Object?> get props => [];
}

class GetVacancyListEvent extends VacancyEvent {
  const GetVacancyListEvent({
    required this.offset,
    required this.limit,
  });

  final int offset;
  final int limit;

  @override
  List<Object?> get props => [offset, limit];
}

class GetVacancyDetailEvent extends VacancyEvent {
  const GetVacancyDetailEvent(this.vacancyId);

  final String vacancyId;

  @override
  List<Object?> get props => [vacancyId];
}

class DeleteVacancyEvent extends VacancyEvent {
  const DeleteVacancyEvent(this.vacancyId);

  final String vacancyId;

  @override
  List<Object?> get props => [vacancyId];
}

class CreateVacancyEvent extends VacancyEvent {
  const CreateVacancyEvent({
    required this.companyName,
    this.companyLogos,
    required this.salary,
    required this.requirements,
    required this.position,
    required this.whatsapp,
    required this.telegram,
    required this.email,
  });

  final String companyName;
  final File? companyLogos;
  final String salary;
  final String requirements;
  final String position;
  final String whatsapp;
  final String telegram;
  final String email;

  @override
  List<Object?> get props => [
        companyName,
        companyLogos,
        salary,
        requirements,
        position,
        whatsapp,
        telegram,
        email,
      ];
}

class UpdateVacancyEvent extends VacancyEvent {
  const UpdateVacancyEvent({
    required this.vacancyId,
    required this.companyName,
    this.companyLogos,
    required this.salary,
    required this.requirements,
    required this.position,
    required this.whatsapp,
    required this.telegram,
    required this.email,
  });

  final String vacancyId;
  final String companyName;
  final File? companyLogos;
  final String salary;
  final String requirements;
  final String position;
  final String whatsapp;
  final String telegram;
  final String email;

  @override
  List<Object?> get props => [
        vacancyId,
        companyName,
        companyLogos,
        salary,
        requirements,
        position,
        whatsapp,
        telegram,
        email,
      ];
}
