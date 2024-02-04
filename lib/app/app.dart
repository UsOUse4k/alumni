import 'package:alumni/app/navigation/route.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/feauture/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:alumni/feauture/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:alumni/feauture/news/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:alumni/feauture/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:alumni/feauture/students/presentation/bloc/student_bloc/student_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'di.dart';

class AlumniApp extends StatefulWidget {
  const AlumniApp({super.key});

  @override
  State<AlumniApp> createState() => _AlumniAppState();
}

class _AlumniAppState extends State<AlumniApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di<AuthBloc>(),
        ),
        BlocProvider<OtpBloc>(
          create: (context) => di<OtpBloc>(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => di<NewsBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => di<ProfileBloc>(),
        ),
        BlocProvider<StudentBloc>(
          create: (context) => di<StudentBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (context, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: NeutralColor.white,
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                  color: NeutralColor.white, centerTitle: true, elevation: 1),
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
