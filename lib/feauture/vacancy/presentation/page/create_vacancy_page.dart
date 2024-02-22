import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/feauture/vacancy/presentation/bloc/vacancy/vacancy_bloc.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/vacancy_action_button.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/vacancy_text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class CreateVacancyPage extends StatefulWidget {
  const CreateVacancyPage({super.key});

  @override
  State<CreateVacancyPage> createState() => _CreateVacancyPageState();
}

class _CreateVacancyPageState extends State<CreateVacancyPage> {
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

    companyNameController = TextEditingController();
    positionController = TextEditingController();
    salaryController = TextEditingController();
    requirmentsController = TextEditingController();
    whasappController = TextEditingController();
    telegramController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: BlocConsumer<VacancyBloc, VacancyState>(
          listener: (context, state) {
            if (state is CreateVacancySuccess) {
              showSuccessSnackBar('Вакансия успешно создано', context);
              context.router.pop();
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
                      text: 'Опубликовать',
                      backColor: const Color(0xff153964),
                      onTap: () {
                        context.read<VacancyBloc>().add(
                              CreateVacancyEvent(
                                companyName: companyNameController.text,
                                position: positionController.text,
                                salary: salaryController.text,
                                requirements: requirmentsController.text,
                                whatsapp: whasappController.text,
                                telegram: telegramController.text,
                                email: emailController.text,
                              ),
                            );
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
}
