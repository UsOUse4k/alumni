import 'package:alumni/feauture/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:alumni/feauture/news/data/data_source/news_data_source.dart';
import 'package:alumni/feauture/news/data/repository/news_repository_impl.dart';
import 'package:alumni/feauture/news/data/source/remote/news_api_data_source.dart';
import 'package:alumni/feauture/news/domain/repository/news_repository.dart';
import 'package:alumni/feauture/news/presentation/bloc/news_bloc/news_bloc.dart';
import 'package:alumni/feauture/profile/data/data_source/profile_data_source.dart';
import 'package:alumni/feauture/profile/data/repository/profile_repository_impl.dart';
import 'package:alumni/feauture/profile/data/source/remote/profile_api_data_source.dart';
import 'package:alumni/feauture/profile/domain/repository/profile_repository.dart';
import 'package:alumni/feauture/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:alumni/feauture/students/data/data_souce/student_data_source.dart';
import 'package:alumni/feauture/students/data/repository/student_repository_impl.dart';
import 'package:alumni/feauture/students/data/source/remote/student_api_data_source.dart';
import 'package:alumni/feauture/students/domain/repository/student_repository.dart';
import 'package:alumni/feauture/students/presentation/bloc/student_bloc/student_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../feauture/auth/data/data_source/auth_data_source.dart';
import '../feauture/auth/data/repository/auth_repository_impl.dart';
import '../feauture/auth/data/source/remote/auth_api_data_source.dart';
import '../feauture/auth/domain/repository/auth_repository.dart';
import '../feauture/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import '../core/network/dio_setting.dart';

GetIt di = GetIt.instance;

initLocatorService() async {
  registerDio();

  registerDataSource();

  registerApiDataSource();

  registerRepository();

  registerBloc();
}

registerDio() async {
  di.registerLazySingleton(
        () => Dio(
      BaseOptions(
        baseUrl: 'http://134.209.109.212:3000',
      ),
    ),
  );
  di.registerLazySingleton(() => DioSetting(di<Dio>()));
}

registerDataSource() {
  di.registerLazySingleton(() => AuthDataSource(dioSetting: di<DioSetting>()));
  di.registerLazySingleton(() => ProfileDataSource(dioSetting: di<DioSetting>()));
  di.registerLazySingleton(() => NewsDataSource(dioSetting: di<DioSetting>()));
  di.registerLazySingleton(() => StudentDataSource(dioSetting: di<DioSetting>()));
}

registerApiDataSource() {
  di.registerLazySingleton(() => AuthApiDataSource(di<AuthDataSource>()));
  di.registerLazySingleton(() => ProfileApiDataSource(di<ProfileDataSource>()));
  di.registerLazySingleton(() => NewsApiDataSource(di<NewsDataSource>()));
  di.registerLazySingleton(() => StudentApiDataSource(di<StudentDataSource>()));
}

registerRepository() {
  di.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(di<AuthApiDataSource>()));
  di.registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(di<ProfileApiDataSource>()));
  di.registerLazySingleton<NewsRepository>(
          () => NewsRepositoryImpl(di<NewsApiDataSource>()));
  di.registerLazySingleton<StudentRepository>(
          () => StudentRepositoryImpl(di<StudentApiDataSource>()));

}

registerBloc() {
  di.registerFactory(() => AuthBloc(di<AuthRepository>()));
  di.registerFactory(() => OtpBloc(di<AuthRepository>()));
  di.registerFactory(() => NewsBloc(di<NewsRepository>()));
  di.registerFactory(() => ProfileBloc(di<ProfileRepository>()));
  di.registerFactory(() => StudentBloc(di<StudentRepository>()));
}



