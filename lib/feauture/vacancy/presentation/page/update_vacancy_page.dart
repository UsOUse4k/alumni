import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy.dart';
import 'package:alumni/feauture/vacancy/presentation/bloc/vacancy/vacancy_bloc.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/vacancy_action_button.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/vacancy_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class UpdateVacancyPage extends StatefulWidget {
  const UpdateVacancyPage({super.key, required this.vacancy});

  final Vacancy vacancy;

  @override
  State<UpdateVacancyPage> createState() => _UpdateVacancyPageState();
}

class _UpdateVacancyPageState extends State<UpdateVacancyPage> {
  late TextEditingController companyNameController;
  late TextEditingController positionController;
  late TextEditingController salaryController;
  late TextEditingController requirmentsController;
  late TextEditingController whasappController;
  late TextEditingController telegramController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    companyNameController =
        TextEditingController(text: widget.vacancy.companyName);
    positionController = TextEditingController(text: widget.vacancy.position);
    salaryController = TextEditingController(text: widget.vacancy.salary);
    requirmentsController =
        TextEditingController(text: widget.vacancy.requirements);
    whasappController =
        TextEditingController(text: widget.vacancy.contacts.whatsapp);
    telegramController =
        TextEditingController(text: widget.vacancy.contacts.telegram);
    emailController =
        TextEditingController(text: widget.vacancy.contacts.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: BlocConsumer<VacancyBloc, VacancyState>(
          listener: (context, state) {
            if (state is UpdateVacancySuccess) {
              showSuccessSnackBar('Успешно изменена вакансия', context);
              context.router.pop();
              context
                  .read<VacancyBloc>()
                  .add(GetVacancyDetailEvent(widget.vacancy.id));
            } else if (state is VacancyDeleteSuccess) {
              showSuccessSnackBar('Вакансия успешно удалена', context);
              context.router.replace(const HomeRoute());
            } else if (state is VacancyError) {
              showErrorSnackBar(state.message, context);
            }
          },
          builder: (context, state) {
            if (state is VacancyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Компания',
                    style: AFonts.b1i13,
                  ),
                  const SizedBox(height: 4),
                  VacancyTextField(
                    controller: companyNameController,
                    hintText: 'Введите компанию',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Должность',
                    style: AFonts.b1i13,
                  ),
                  const SizedBox(height: 4),
                  VacancyTextField(
                    controller: positionController,
                    hintText: 'Введите должность',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Оклад',
                    style: AFonts.b1i13,
                  ),
                  const SizedBox(height: 4),
                  VacancyTextField(
                    controller: salaryController,
                    hintText: 'Введите предложенную зарплату',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Требования',
                    style: AFonts.b1i13,
                  ),
                  const SizedBox(height: 4),
                  VacancyTextField(
                    controller: requirmentsController,
                    hintText: 'Введите требония для кандидатов на вакансию',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Контакты',
                    style: AFonts.b1i13,
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/whatsapp.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: VacancyTextField(
                          controller: whasappController,
                          isSmall: true,
                          hintText: '+996 whatsapp',
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/telegram.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: VacancyTextField(
                          controller: telegramController,
                          isSmall: true,
                          hintText: '@ username telegram',
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/mail.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: VacancyTextField(
                          controller: emailController,
                          isSmall: true,
                          hintText: 'E-mail',
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: VacancyActionButton(
                      text: 'Удалить вакансию',
                      backColor: const Color(0xff992124),
                      onTap: () {
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) => vacancyDeletionDialog(context),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 13),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: VacancyActionButton(
                      text: 'Опубликовать',
                      backColor: const Color(0xff153964),
                      onTap: () {
                        if (isValidate()) {
                          context.read<VacancyBloc>().add(UpdateVacancyEvent(
                                vacancyId: widget.vacancy.id,
                                companyName: companyNameController.text,
                                position: positionController.text,
                                salary: salaryController.text,
                                requirements: requirmentsController.text,
                                whatsapp: whasappController.text,
                                telegram: telegramController.text,
                                email: emailController.text,
                              ));
                        } else {
                          showErrorSnackBar("Заполните все поля", context);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 45),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool isValidate() {
    return companyNameController.text.isNotEmpty &&
        positionController.text.isNotEmpty &&
        salaryController.text.isNotEmpty &&
        requirmentsController.text.isNotEmpty &&
        whasappController.text.isNotEmpty &&
        telegramController.text.isNotEmpty &&
        emailController.text.isNotEmpty;
  }

  Widget vacancyDeletionDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: NeutralColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Удаление вакансии',
        style: TextStyle(
          fontFamily: 'Intro',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Вы точно хотите удалить вакансию ?',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Intro'),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        PrimaryButton(
          width: 100,
          backgroundColor: const Color(0xFF153964),
          onPressed: () {
            context.router.pop();
          },
          elevation: 0,
          title: 'Нет',
        ),
        PrimaryButton(
          width: 100,
          onPressed: () {
            context
                .read<VacancyBloc>()
                .add(DeleteVacancyEvent(widget.vacancy.id));
            context.router.pop();
          },
          title: 'Да',
          elevation: 0,
          backgroundColor: const Color(0xFFDFDFDF),
          textStyle: const TextStyle(
            fontFamily: 'Intro',
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color(0xFF153964),
          ),
        ),
      ],
    );
  }
}
