import 'package:alumni/feauture/auth/data/data_source/auth_data_source.dart';
import 'package:alumni/feauture/auth/data/repository/auth_repository_impl.dart';
import 'package:alumni/feauture/auth/data/source/remote/auth_api_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'keys.dart';

class DioSetting {
  final Dio dio;
  String? accessToken;
  String? refreshToken;

  DioSetting(this.dio) {
    dio.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        const secureStorage = FlutterSecureStorage();
        accessToken = await secureStorage.read(key: Keys.TOKEN);
        refreshToken = await secureStorage.read(key: Keys.REFRESH_TOKEN);
        options.headers['Content-Type'] = 'application/json';
        options.headers['Authorization'] = 'Bearer $accessToken';

        if (accessToken != null && JwtDecoder.isExpired(accessToken ?? '')) {
          final token = await AuthApiDataSource(
              AuthDataSource(
                dioSetting: DioSetting(dio),
              ),
          ).refreshToken(refreshToken ?? '');

          await secureStorage.write(key: Keys.TOKEN, value: token.accessToken);
          await secureStorage.write(key: Keys.REFRESH_TOKEN, value: token.refreshToken);
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        // if (error.response?.statusCode == 401) {
        //   const secureStorage = FlutterSecureStorage();
        //   await secureStorage.delete(key: Keys.TOKEN);
        // }
        return handler.next(error);
      },
    ));
  }
}
