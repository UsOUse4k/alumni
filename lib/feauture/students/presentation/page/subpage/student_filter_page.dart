import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_drop_down.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/students/presentation/bloc/student_bloc/student_bloc.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StudentFilterPage extends StatefulWidget {
  const StudentFilterPage({
    Key? key,
    required this.onFilter,
    required this.name,
    required this.education,
    required this.species,
    required this.yearOfRelease,
    required this.onClean,
  }) : super(key: key);

  final Function(
    String? name,
    String? education,
    String? species,
    int? yearOfRelease,
  ) onFilter;
  final Function() onClean;

  final String? name;
  final String? education;
  final String? species;
  final int? yearOfRelease;

  @override
  State<StudentFilterPage> createState() => _StudentFilterPageState();
}

class _StudentFilterPageState extends State<StudentFilterPage> {
  late final TextEditingController dateReleaseController;
  late final TextEditingController nameController;

  List<String> educationList = [
    "Среднее-Профессиональное",
    "Бакалавриат",
    "Магистратура",
    "Докторантура",
    "Аспирантура"
  ];

  String? selectedEducation;

  List<String> specialityList = [
    "Программист",
    "Врач",
    "Психолог",
    "Переводчик"
  ];

  String? selectedSpeciality;

  @override
  void initState() {
    selectedSpeciality = widget.species;
    selectedEducation = widget.education;
    dateReleaseController =
        TextEditingController(text: '${widget.yearOfRelease ?? ''}');
    nameController = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              textFormFieldHeight: 40,
              contentPadding: const EdgeInsets.only(top: 10, left: 10),
              hintStyle: AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
              isTextRequired: true,
              isFilled: true,
              filledColor: NeutralColor.white,
              hintText: 'Напишите Имя',
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
              title: 'Имя',
              controller: nameController,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: CustomDropDown(
                onChanged: (value) {
                  selectedEducation = value;
                },
                value: selectedEducation,
                items: educationList.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(
                          fontFamily: 'Intro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
                title: 'Образование',
                hintText: 'Выберите степень',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: CustomDropDown(
                onChanged: (value) {
                  selectedSpeciality = value;
                },
                value: selectedSpeciality,
                items: specialityList.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(
                          fontFamily: 'Intro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
                title: 'Специальность',
                hintText: 'Выберите Специальность',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              textFormFieldHeight: 40,
              contentPadding: const EdgeInsets.only(top: 10, left: 10),
              hintStyle: AFonts.r0i15.copyWith(color: const Color(0xFFBCBCBC)),
              isTextRequired: true,
              isFilled: true,
              filledColor: NeutralColor.white,
              hintText: 'Напишите Год выпуска',
              title: 'Год выпуска',
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.number,
              controller: dateReleaseController,
            ),
            const SizedBox(
              height: 15,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        nameController.clear();
                        dateReleaseController.clear();
                        selectedEducation = null;
                        selectedSpeciality = null;
                        setState(() {});
                        widget.onClean.call();

                        context.read<StudentBloc>().add(
                              FilterStudentEvent(
                                0,
                                20,
                                selectedEducation,
                                selectedSpeciality,
                                nameController.text.isEmpty
                                    ? null
                                    : nameController.text,
                                dateReleaseController.text.isEmpty
                                    ? null
                                    : int.parse(dateReleaseController.text),
                              ),
                            );
                      },
                      height: 40,
                      backgroundColor: const Color(0xFFF5F5F5),
                      elevation: 0,
                      title: 'Сбросить',
                      textStyle: const TextStyle(
                        fontFamily: 'Intro',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF153964),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        context.read<StudentBloc>().add(
                              FilterStudentEvent(
                                0,
                                20,
                                selectedEducation,
                                selectedSpeciality,
                                nameController.text.isEmpty
                                    ? null
                                    : nameController.text,
                                dateReleaseController.text.isEmpty
                                    ? null
                                    : int.parse(dateReleaseController.text),
                              ),
                            );
                        widget.onFilter.call(
                          nameController.text,
                          selectedEducation,
                          selectedSpeciality,
                          int.tryParse(dateReleaseController.text),
                        );

                        context.router.pop();
                      },
                      height: 40,
                      backgroundColor: const Color(0xFF153964),
                      title: 'Применить',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
