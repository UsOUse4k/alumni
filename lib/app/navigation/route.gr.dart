// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alumni/feauture/auth/presentation/pages/login_page.dart' as _i4;
import 'package:alumni/feauture/auth/presentation/pages/password_change_page.dart'
    as _i7;
import 'package:alumni/feauture/auth/presentation/pages/password_recovery_page.dart'
    as _i9;
import 'package:alumni/feauture/auth/presentation/pages/sing_in_confirm_page.dart'
    as _i12;
import 'package:alumni/feauture/auth/presentation/pages/sing_in_page.dart'
    as _i13;
import 'package:alumni/feauture/auth/presentation/widget/password_change_success.dart'
    as _i8;
import 'package:alumni/feauture/auth/presentation/widget/sing_in_success.dart'
    as _i14;
import 'package:alumni/feauture/home/presentaion/pages/home_page.dart' as _i3;
import 'package:alumni/feauture/news/domain/model/news_detail/news_detail_model.dart'
    as _i25;
import 'package:alumni/feauture/news/presentation/page/news_page.dart' as _i6;
import 'package:alumni/feauture/news/presentation/page/subpage/create_news_page.dart'
    as _i1;
import 'package:alumni/feauture/news/presentation/page/subpage/news_detail_screen.dart'
    as _i5;
import 'package:alumni/feauture/news/presentation/page/subpage/update_news_page.dart'
    as _i18;
import 'package:alumni/feauture/profile/domain/model/profile_model.dart'
    as _i24;
import 'package:alumni/feauture/profile/presentation/page/profile_page.dart'
    as _i10;
import 'package:alumni/feauture/profile/presentation/page/subpage/profile_update_page.dart'
    as _i11;
import 'package:alumni/feauture/students/presentation/page/student_page.dart'
    as _i17;
import 'package:alumni/feauture/students/presentation/page/subpage/student_detail_page.dart'
    as _i15;
import 'package:alumni/feauture/students/presentation/page/subpage/student_filter_page.dart'
    as _i16;
import 'package:alumni/feauture/vacancy/domain/vacancy.dart' as _i26;
import 'package:alumni/feauture/vacancy/presentation/page/create_vacancy_page.dart'
    as _i2;
import 'package:alumni/feauture/vacancy/presentation/page/update_vacancy_page.dart'
    as _i19;
import 'package:alumni/feauture/vacancy/presentation/page/vacancy_detail_page.dart'
    as _i20;
import 'package:alumni/feauture/vacancy/presentation/page/vacancy_page.dart'
    as _i21;
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    CreateNewsRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreateNewsPage(),
      );
    },
    CreateVacancyRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CreateVacancyPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.NewsDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NewsPage(),
      );
    },
    PasswordChangeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PasswordChangePage(),
      );
    },
    PasswordChangeSuccessRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PasswordChangeSuccessPage(),
      );
    },
    PasswordRecoveryRoute.name: (routeData) {
      final args = routeData.argsAs<PasswordRecoveryRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.PasswordRecoveryPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfilePage(),
      );
    },
    ProfileUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileUpdateRouteArgs>(
          orElse: () => const ProfileUpdateRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProfileUpdatePage(
          key: args.key,
          profileModel: args.profileModel,
        ),
      );
    },
    SignInConfirmRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SignInConfirmPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SignInPage(),
      );
    },
    SignInSuccessRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SignInSuccessPage(),
      );
    },
    StudentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<StudentDetailRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.StudentDetailPage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    StudentFilterRoute.name: (routeData) {
      final args = routeData.argsAs<StudentFilterRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.StudentFilterPage(
          key: args.key,
          onFilter: args.onFilter,
          name: args.name,
          education: args.education,
          species: args.species,
          yearOfRelease: args.yearOfRelease,
          onClean: args.onClean,
        ),
      );
    },
    StudentRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.StudentPage(),
      );
    },
    UpdateNewsRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateNewsRouteArgs>(
          orElse: () => const UpdateNewsRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.UpdateNewsPage(
          key: args.key,
          newsDetailModel: args.newsDetailModel,
        ),
      );
    },
    UpdateVacancyRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateVacancyRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.UpdateVacancyPage(
          key: args.key,
          vacancy: args.vacancy,
        ),
      );
    },
    VacancyDetailRoute.name: (routeData) {
      final args = routeData.argsAs<VacancyDetailRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.VacancyDetailPage(
          key: args.key,
          vacancyId: args.vacancyId,
        ),
      );
    },
    VacancyRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.VacancyPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateNewsPage]
class CreateNewsRoute extends _i22.PageRouteInfo<void> {
  const CreateNewsRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CreateNewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateNewsRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreateVacancyPage]
class CreateVacancyRoute extends _i22.PageRouteInfo<void> {
  const CreateVacancyRoute({List<_i22.PageRouteInfo>? children})
      : super(
          CreateVacancyRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateVacancyRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewsDetailScreen]
class NewsDetailRoute extends _i22.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    _i23.Key? key,
    required String id,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const _i22.PageInfo<NewsDetailRouteArgs> page =
      _i22.PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i23.Key? key;

  final String id;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.NewsPage]
class NewsRoute extends _i22.PageRouteInfo<void> {
  const NewsRoute({List<_i22.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PasswordChangePage]
class PasswordChangeRoute extends _i22.PageRouteInfo<void> {
  const PasswordChangeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PasswordChangeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordChangeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PasswordChangeSuccessPage]
class PasswordChangeSuccessRoute extends _i22.PageRouteInfo<void> {
  const PasswordChangeSuccessRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PasswordChangeSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordChangeSuccessRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PasswordRecoveryPage]
class PasswordRecoveryRoute
    extends _i22.PageRouteInfo<PasswordRecoveryRouteArgs> {
  PasswordRecoveryRoute({
    _i23.Key? key,
    required String email,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          PasswordRecoveryRoute.name,
          args: PasswordRecoveryRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'PasswordRecoveryRoute';

  static const _i22.PageInfo<PasswordRecoveryRouteArgs> page =
      _i22.PageInfo<PasswordRecoveryRouteArgs>(name);
}

class PasswordRecoveryRouteArgs {
  const PasswordRecoveryRouteArgs({
    this.key,
    required this.email,
  });

  final _i23.Key? key;

  final String email;

  @override
  String toString() {
    return 'PasswordRecoveryRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileUpdatePage]
class ProfileUpdateRoute extends _i22.PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    _i23.Key? key,
    _i24.ProfileModel? profileModel,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ProfileUpdateRoute.name,
          args: ProfileUpdateRouteArgs(
            key: key,
            profileModel: profileModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileUpdateRoute';

  static const _i22.PageInfo<ProfileUpdateRouteArgs> page =
      _i22.PageInfo<ProfileUpdateRouteArgs>(name);
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({
    this.key,
    this.profileModel,
  });

  final _i23.Key? key;

  final _i24.ProfileModel? profileModel;

  @override
  String toString() {
    return 'ProfileUpdateRouteArgs{key: $key, profileModel: $profileModel}';
  }
}

/// generated route for
/// [_i12.SignInConfirmPage]
class SignInConfirmRoute extends _i22.PageRouteInfo<void> {
  const SignInConfirmRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SignInConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInConfirmRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SignInPage]
class SignInRoute extends _i22.PageRouteInfo<void> {
  const SignInRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SignInSuccessPage]
class SignInSuccessRoute extends _i22.PageRouteInfo<void> {
  const SignInSuccessRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SignInSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInSuccessRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.StudentDetailPage]
class StudentDetailRoute extends _i22.PageRouteInfo<StudentDetailRouteArgs> {
  StudentDetailRoute({
    _i23.Key? key,
    required String userId,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          StudentDetailRoute.name,
          args: StudentDetailRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentDetailRoute';

  static const _i22.PageInfo<StudentDetailRouteArgs> page =
      _i22.PageInfo<StudentDetailRouteArgs>(name);
}

class StudentDetailRouteArgs {
  const StudentDetailRouteArgs({
    this.key,
    required this.userId,
  });

  final _i23.Key? key;

  final String userId;

  @override
  String toString() {
    return 'StudentDetailRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i16.StudentFilterPage]
class StudentFilterRoute extends _i22.PageRouteInfo<StudentFilterRouteArgs> {
  StudentFilterRoute({
    _i23.Key? key,
    required dynamic Function(
      String?,
      String?,
      String?,
      int?,
    ) onFilter,
    required String? name,
    required String? education,
    required String? species,
    required int? yearOfRelease,
    required dynamic Function() onClean,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          StudentFilterRoute.name,
          args: StudentFilterRouteArgs(
            key: key,
            onFilter: onFilter,
            name: name,
            education: education,
            species: species,
            yearOfRelease: yearOfRelease,
            onClean: onClean,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentFilterRoute';

  static const _i22.PageInfo<StudentFilterRouteArgs> page =
      _i22.PageInfo<StudentFilterRouteArgs>(name);
}

class StudentFilterRouteArgs {
  const StudentFilterRouteArgs({
    this.key,
    required this.onFilter,
    required this.name,
    required this.education,
    required this.species,
    required this.yearOfRelease,
    required this.onClean,
  });

  final _i23.Key? key;

  final dynamic Function(
    String?,
    String?,
    String?,
    int?,
  ) onFilter;

  final String? name;

  final String? education;

  final String? species;

  final int? yearOfRelease;

  final dynamic Function() onClean;

  @override
  String toString() {
    return 'StudentFilterRouteArgs{key: $key, onFilter: $onFilter, name: $name, education: $education, species: $species, yearOfRelease: $yearOfRelease, onClean: $onClean}';
  }
}

/// generated route for
/// [_i17.StudentPage]
class StudentRoute extends _i22.PageRouteInfo<void> {
  const StudentRoute({List<_i22.PageRouteInfo>? children})
      : super(
          StudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.UpdateNewsPage]
class UpdateNewsRoute extends _i22.PageRouteInfo<UpdateNewsRouteArgs> {
  UpdateNewsRoute({
    _i23.Key? key,
    _i25.NewsDetailModel? newsDetailModel,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          UpdateNewsRoute.name,
          args: UpdateNewsRouteArgs(
            key: key,
            newsDetailModel: newsDetailModel,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateNewsRoute';

  static const _i22.PageInfo<UpdateNewsRouteArgs> page =
      _i22.PageInfo<UpdateNewsRouteArgs>(name);
}

class UpdateNewsRouteArgs {
  const UpdateNewsRouteArgs({
    this.key,
    this.newsDetailModel,
  });

  final _i23.Key? key;

  final _i25.NewsDetailModel? newsDetailModel;

  @override
  String toString() {
    return 'UpdateNewsRouteArgs{key: $key, newsDetailModel: $newsDetailModel}';
  }
}

/// generated route for
/// [_i19.UpdateVacancyPage]
class UpdateVacancyRoute extends _i22.PageRouteInfo<UpdateVacancyRouteArgs> {
  UpdateVacancyRoute({
    _i23.Key? key,
    required _i26.Vacancy vacancy,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          UpdateVacancyRoute.name,
          args: UpdateVacancyRouteArgs(
            key: key,
            vacancy: vacancy,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateVacancyRoute';

  static const _i22.PageInfo<UpdateVacancyRouteArgs> page =
      _i22.PageInfo<UpdateVacancyRouteArgs>(name);
}

class UpdateVacancyRouteArgs {
  const UpdateVacancyRouteArgs({
    this.key,
    required this.vacancy,
  });

  final _i23.Key? key;

  final _i26.Vacancy vacancy;

  @override
  String toString() {
    return 'UpdateVacancyRouteArgs{key: $key, vacancy: $vacancy}';
  }
}

/// generated route for
/// [_i20.VacancyDetailPage]
class VacancyDetailRoute extends _i22.PageRouteInfo<VacancyDetailRouteArgs> {
  VacancyDetailRoute({
    _i23.Key? key,
    required String vacancyId,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          VacancyDetailRoute.name,
          args: VacancyDetailRouteArgs(
            key: key,
            vacancyId: vacancyId,
          ),
          initialChildren: children,
        );

  static const String name = 'VacancyDetailRoute';

  static const _i22.PageInfo<VacancyDetailRouteArgs> page =
      _i22.PageInfo<VacancyDetailRouteArgs>(name);
}

class VacancyDetailRouteArgs {
  const VacancyDetailRouteArgs({
    this.key,
    required this.vacancyId,
  });

  final _i23.Key? key;

  final String vacancyId;

  @override
  String toString() {
    return 'VacancyDetailRouteArgs{key: $key, vacancyId: $vacancyId}';
  }
}

/// generated route for
/// [_i21.VacancyPage]
class VacancyRoute extends _i22.PageRouteInfo<void> {
  const VacancyRoute({List<_i22.PageRouteInfo>? children})
      : super(
          VacancyRoute.name,
          initialChildren: children,
        );

  static const String name = 'VacancyRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}
