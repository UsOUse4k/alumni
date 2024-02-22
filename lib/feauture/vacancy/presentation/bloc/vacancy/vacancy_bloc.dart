import 'dart:io';

import 'package:alumni/feauture/vacancy/domain/vacancy.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy_list.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vacancy_event.dart';
part 'vacancy_state.dart';

class VacancyBloc extends Bloc<VacancyEvent, VacancyState> {
  final VacancyRepository _repository;

  VacancyBloc(this._repository) : super(VacancyInitial()) {
    on<GetVacancyListEvent>(getVacancyList);
    on<GetVacancyDetailEvent>(getVacancyDetail);
    on<CreateVacancyEvent>(createVacancy);
    on<UpdateVacancyEvent>(updateVacancy);
    on<DeleteVacancyEvent>(deleteVacancy);
  }

  void getVacancyList(GetVacancyListEvent event, Emitter emit) async {
    try {
      emit(VacancyLoading());
      final vacancyList = await _repository.getVacancyList(
        limit: event.limit,
        offset: event.offset,
      );
      emit(VacancyListSuccess(vacancyList));
    } catch (e) {
      emit(VacancyError(e.toString()));
    }
  }

  void deleteVacancy(DeleteVacancyEvent event, Emitter emit) async {
    try {
      emit(VacancyLoading());
      await _repository.deleteVacancy(event.vacancyId);
      emit(VacancyDeleteSuccess());
    } catch (e) {
      emit(VacancyError(e.toString()));
    }
  }

  void getVacancyDetail(GetVacancyDetailEvent event, Emitter emit) async {
    try {
      emit(VacancyLoading());
      final vacancyDetail = await _repository.getVacancyDetail(event.vacancyId);
      emit(VacancyDetailSuccess(vacancyDetail));
    } catch (e) {
      emit(VacancyError(e.toString()));
    }
  }

  void createVacancy(CreateVacancyEvent event, Emitter emit) async {
    try {
      emit(VacancyLoading());
      await _repository.createVacancy(
        companyName: event.companyName,
        companyLogos: event.companyLogos,
        salary: event.salary,
        requirements: event.requirements,
        whatsapp: event.whatsapp,
        telegram: event.telegram,
        email: event.email,
        position: event.position,
      );
      emit(CreateVacancySuccess());
    } catch (e) {
      emit(VacancyError(e.toString()));
    }
  }

  void updateVacancy(UpdateVacancyEvent event, Emitter emit) async {
    try {
      emit(VacancyLoading());
      await _repository.updateVacancy(
        vacancyId: event.vacancyId,
        companyName: event.companyName,
        companyLogos: event.companyLogos,
        salary: event.salary,
        requirements: event.requirements,
        whatsapp: event.whatsapp,
        telegram: event.telegram,
        email: event.email,
        position: event.position,
      );
      emit(UpdateVacancySuccess());
    } catch (e) {
      emit(VacancyError(e.toString()));
    }
  }
}
