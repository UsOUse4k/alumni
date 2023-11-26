import 'package:alumni/feauture/students/domain/model/student/student_model.dart';
import 'package:alumni/feauture/students/presentation/bloc/student_bloc/student_bloc.dart';
import 'package:alumni/feauture/students/presentation/widget/student_app_bar.dart';
import 'package:alumni/feauture/students/presentation/widget/student_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/student_loading.dart';

@RoutePage()
class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage>
    with AutomaticKeepAliveClientMixin {
  AllStudentModel? allStudentModel;
  List<UsersModel> students = [];

  int limit = 20;
  int offset = 0;

  String? name;
  String? education;
  String? species;
  int? yearRelease;

  @override
  void initState() {
    context.read<StudentBloc>().add(GetAllStudentEvent(limit, offset));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        context.read<StudentBloc>().add(GetAllStudentEvent(limit, offset));
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: StudentAppBar(
          onChanged: (value) {
            filterStudent(value);
          },
          onFilter: (name, education, species, yearOfRelease) {
            setState(() {
              this.name = name;
              this.education = education;
              this.species = species;
              yearRelease = yearOfRelease;
            });
          },
          name: name,
          education: education,
          species: species,
          yearOfRelease: yearRelease,
          onClean: () {
            name = null;
            education = null;
            species = null;
            yearRelease = null;
          },
        ),
        body: BlocConsumer<StudentBloc, StudentState>(
          listener: (context, state) {
            if (state is StudentSuccess) {
              allStudentModel = state.allStudent;
              students = state.allStudent.users ?? [];
            }
          },
          builder: (context, state) {
            if (state is StudentLoading) {
              return const StudentLoadingCard();
            }
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: students.length,
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: StudentCard(
                          user: students[index],
                        ),
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: students.length >= 20
                            ? Row(
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
                                                      const Color(0xFF153964))),
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
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void filterStudent(String? value) {
    setState(() {
      students = allStudentModel!.users!
          .where(
            (element) => ('${element.name} ${element.surname}')
                .toLowerCase()
                .contains(value?.toLowerCase() ?? ''),
          )
          .toList();
    });
  }

  void forward() {
    offset += 1;
    context.read<StudentBloc>().add(GetAllStudentEvent(offset, limit));
  }

  void backward() {
    offset -= 1;
    context.read<StudentBloc>().add(GetAllStudentEvent(offset, limit));
  }

  @override
  bool get wantKeepAlive => true;
}
