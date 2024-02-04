import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/network/keys.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/feauture/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:alumni/feauture/profile/domain/model/profile_model.dart';
import 'package:alumni/feauture/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:alumni/feauture/students/presentation/widget/student_info_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  ProfileModel? profileModel;

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProfileBloc>().add(GetProfileEvent());
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSuccess) {
              profileModel = state.profile;
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: NeutralColor.white,
                  elevation: 1,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(left: 15, top: 0),
                    title: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: NeutralColor.primary,
                                blurRadius: 25,
                                offset: Offset(2, 45))
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${profileModel?.name ?? ''} ${profileModel?.surname ?? ''}',
                                style: AFonts.h1i28.copyWith(
                                  color: constraints.maxHeight > 100
                                      ? NeutralColor.white
                                      : NeutralColor.primary,
                                  fontSize: 20.sp,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.router.push(
                                    ProfileUpdateRoute(
                                      profileModel: profileModel,
                                    ),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  'assets/images/edit.svg',
                                  width: 20.w,
                                  height: 20.h,
                                  theme: SvgTheme(
                                    currentColor: constraints.maxHeight > 100
                                        ? NeutralColor.white
                                        : NeutralColor.primary,
                                  ),
                                ),
                                padding:
                                    const EdgeInsets.only(right: 10, top: 16),
                                constraints: const BoxConstraints(),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    collapseMode: CollapseMode.parallax,
                    background: CachedNetworkImage(
                      imageUrl: profileModel?.avatar ?? '',
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
                          value: profileModel?.education ?? 'Нет данных'),
                      StudentInfoCard(
                          title: 'Специальность',
                          value: profileModel?.specialty ?? 'Нет данных'),
                      StudentInfoCard(
                          title: 'Год выпуска',
                          value:
                              '${profileModel?.yearOfRelease ?? 'Нет данных'}'),
                      StudentInfoCard(
                          title: 'Местоположение',
                          value: profileModel?.place ?? 'Нет данных'),
                      StudentInfoCard(
                          title: 'Контактная информация',
                          value: profileModel?.phoneNumber ?? 'Нет данных'),
                      StudentInfoCard(
                          title: 'Профессиональная информация ',
                          value: profileModel?.shortBiography ?? 'Нет данных'),
                      StudentInfoCard(
                        title: 'Образование и достижения',
                        value: profileModel?.educationAndGoals ?? 'Нет данных',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: FilledButton(
                          onPressed: () async {
                            const secureStorage = FlutterSecureStorage();
                            final String? refreshToken = await secureStorage
                                .read(key: Keys.REFRESH_TOKEN);
                            await secureStorage.delete(key: Keys.REFRESH_TOKEN);
                            await secureStorage.delete(key: Keys.TOKEN);
                            if (mounted) {
                              context
                                  .read<AuthBloc>()
                                  .add(LogoutEvent(refreshToken ?? ''));
                              context.router.replace(const LoginRoute());
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(PrimaryColor.s100),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                          child: Text(
                            'Выйти',
                            style: AFonts.h2i18
                                .copyWith(color: NeutralColor.white),
                          ),
                        ),
                      ),
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

  @override
  bool get wantKeepAlive => true;
}
