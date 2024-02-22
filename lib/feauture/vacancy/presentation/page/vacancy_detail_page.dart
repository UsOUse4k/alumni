import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/admin.dart';
import 'package:alumni/feauture/vacancy/domain/vacancy.dart';
import 'package:alumni/feauture/vacancy/presentation/bloc/vacancy/vacancy_bloc.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/vacancy_action_button.dart';
import 'package:alumni/feauture/vacancy/presentation/widget/company_box.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class VacancyDetailPage extends StatefulWidget {
  const VacancyDetailPage({super.key, required this.vacancyId});

  final String vacancyId;

  @override
  State<VacancyDetailPage> createState() => _VacancyDetailPageState();
}

class _VacancyDetailPageState extends State<VacancyDetailPage> {
  Vacancy? vacancy;

  @override
  void initState() {
    super.initState();

    context.read<VacancyBloc>().add(GetVacancyDetailEvent(widget.vacancyId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: BlocConsumer<VacancyBloc, VacancyState>(
          listener: (context, state) {
            if (state is VacancyDetailSuccess) {
              vacancy = state.vacancy;
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff007AFF),
                        ),
                      ),
                      const Spacer(),
                      Admin.isAdmin ?? false
                          ? SizedBox(
                              width: 140,
                              child: VacancyActionButton(
                                text: 'Редактировать',
                                backColor: const Color(0xff153964),
                                onTap: () {
                                  context.router.push(
                                      UpdateVacancyRoute(vacancy: vacancy!));
                                },
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CompanyBox(
                    imageUrl: vacancy?.companyLogo ?? "",
                    name: vacancy?.companyName ?? "Нет данных",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Должность: ${vacancy?.position ?? "Нет данных"}",
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Оклад: от ${vacancy?.salary ?? "-"} KGZ",
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Требования: ',
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    vacancy?.requirements ?? "Нет данных",
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Контакты',
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 9, 8, 8),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/whatsapp.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        vacancy?.contacts.whatsapp ?? "Нет данных",
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/telegram.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        vacancy?.contacts.telegram ?? "Нет данных",
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/mail.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        vacancy?.contacts.email ?? "Нет данных",
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
