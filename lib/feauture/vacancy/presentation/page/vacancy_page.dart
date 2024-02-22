import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/admin.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy_list.dart';
import 'package:alumni/feauture/vacancy/presentation/bloc/vacancy/vacancy_bloc.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/vacancies_loading.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/vacancy_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage>
    with AutomaticKeepAliveClientMixin {
  VacancyList? vacancyList;
  List<Vacancy> vacancies = [];

  int limit = 10;
  int offset = 0;

  @override
  void initState() {
    super.initState();

    context.read<VacancyBloc>().add(GetVacancyListEvent(
          offset: offset,
          limit: limit,
        ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicator(
      onRefresh: () async {
        context.read<VacancyBloc>().add(GetVacancyListEvent(
              offset: offset,
              limit: limit,
            ));
      },
      child: Scaffold(
        floatingActionButton: Admin.isAdmin ?? false
            ? GestureDetector(
                onTap: () {
                  context.router.push(const CreateVacancyRoute());
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF153964),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
        body: SafeArea(
          child: Column(
            children: [
              Text(
                "Вакансии",
                style: AFonts.h1i28,
              ),
              BlocConsumer<VacancyBloc, VacancyState>(
                listener: (context, state) {
                  if (state is VacancyListSuccess) {
                    vacancyList = state.vacancyList;
                    vacancies = state.vacancyList.vacancies;
                  }
                },
                builder: (context, state) {
                  if (state is VacancyLoading) {
                    return const Expanded(
                      child: VacanciesLoading(),
                    );
                  }

                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(
                              left: 25,
                              right: 25,
                              top: 20,
                            ),
                            itemCount: vacancies.length,
                            itemBuilder: (context, index) {
                              final vacancy = vacancies[index];

                              return VacancyCard(
                                imageUrl: vacancy.companyLogo,
                                companyName: vacancy.companyName,
                                position: vacancy.position,
                                salary: vacancy.salary,
                                onTap: () {
                                  context.router.push(VacancyDetailRoute(
                                      vacancyId: vacancy.id));
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 10);
                            },
                          ),
                        ),
                        vacancies.length >= 20
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    offset != 0
                                        ? FilledButton(
                                            onPressed: () {
                                              backward();
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                const Color(0xFF153964),
                                              ),
                                            ),
                                            child: const Text(
                                              'Назад',
                                            ),
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    FilledButton(
                                      onPressed: () {
                                        forward();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xFF153964))),
                                      child: const Text(
                                        'Вперед',
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void forward() {
    offset += 1;
    context.read<VacancyBloc>().add(GetVacancyListEvent(
          offset: offset,
          limit: limit,
        ));
  }

  void backward() {
    offset -= 1;
    context.read<VacancyBloc>().add(GetVacancyListEvent(
          offset: offset,
          limit: limit,
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
