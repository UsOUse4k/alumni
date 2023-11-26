import 'dart:io';

import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_back_button.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/students/domain/model/student/student_model.dart';
import 'package:alumni/feauture/students/presentation/bloc/student_bloc/student_bloc.dart';
import 'package:alumni/feauture/students/presentation/widget/student_info_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class StudentDetailPage extends StatefulWidget {
  const StudentDetailPage({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  UsersModel? usersModel;

  @override
  void initState() {
    context.read<StudentBloc>().add(GetDetailStudentEvent(widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StudentBloc, StudentState>(
        listener: (context, state) {
          if (state is StudentDetailSuccess) {
            usersModel = state.student;
          }
        },
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                leading: const CustomBackButton(),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 15, bottom: 12),
                  title: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: NeutralColor.primary,
                        blurRadius: 30,
                        offset: Offset(0, 30),
                      )
                    ]),
                    child: Text(
                      '${usersModel?.name ?? ''} ${usersModel?.surname ?? ''}',
                      style: AFonts.h1i28.copyWith(
                        color: NeutralColor.white,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  background: CachedNetworkImage(
                    imageUrl: usersModel?.avatar ?? '',
                    fit: BoxFit.cover,
                    errorWidget: (context, _, __) => const Icon(Icons.error),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    StudentInfoCard(
                        title: 'Образование',
                        value: usersModel?.education ?? 'Нет данных'),
                    StudentInfoCard(
                        title: 'Специальность',
                        value: usersModel?.specialty ?? 'Нет данных'),
                    StudentInfoCard(
                        title: 'Год выпуска',
                        value: '${usersModel?.yearOfRelease ?? 2023}'),
                    StudentInfoCard(
                        title: 'Местоположение',
                        value: usersModel?.place ?? 'Нет данных'),
                    StudentInfoCard(
                        title: 'Контактная информация',
                        value: usersModel?.phoneNumber ?? 'Нет данных'),
                    StudentInfoCard(
                        title: 'Профессиональная информация ',
                        value: usersModel?.shortBiography ?? 'Нет данных'),
                    StudentInfoCard(
                        title: 'Образование и достижения',
                        value: usersModel?.educationAndGoals ?? 'Нет данных'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: PrimaryButton(
                          width: 200,
                          height: 50,
                          backgroundColor: const Color(0xFF153964),
                          onPressed: () {
                            openUrl('tel:${usersModel?.phoneNumber ?? 'Нет данных'}');
                          },
                          textStyle: AFonts.h2i18.copyWith(
                            color: NeutralColor.white,
                          ),
                          title: 'Связатся',
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void openUrl(String url,
      {LaunchMode launchMode =
          LaunchMode.externalNonBrowserApplication}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: Platform.isIOS ? LaunchMode.externalApplication : launchMode,
      );
    } else {}
  }
}
