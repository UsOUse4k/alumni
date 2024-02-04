import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/network/keys.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, path: '/signIn'),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: PasswordChangeRoute.page, path: '/passwordChange'),
        AutoRoute(page: SignInSuccessRoute.page, path: '/singInSuccess'),
        AutoRoute(page: PasswordRecoveryRoute.page, path: '/passwordRecovery'),
        AutoRoute(
            page: PasswordChangeSuccessRoute.page, path: '/passwordRecovery'),
        AutoRoute(page: SignInConfirmRoute.page, path: '/signInConfirm'),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
          guards: [
            AuthGuard(),
          ],
        ),
        AutoRoute(page: NewsRoute.page, path: '/news'),
        AutoRoute(page: NewsDetailRoute.page, path: '/newsDetail'),
        AutoRoute(page: CreateNewsRoute.page, path: '/createNews'),
        AutoRoute(page: UpdateNewsRoute.page, path: '/updateNews'),
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
        AutoRoute(page: ProfileUpdateRoute.page, path: '/profileUpdate'),
        AutoRoute(page: StudentFilterRoute.page, path: '/studentFilter'),
        AutoRoute(page: StudentRoute.page, path: '/students'),
        AutoRoute(page: StudentDetailRoute.page, path: '/studentsDetail'),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    const secureStorage = FlutterSecureStorage();
    final String? accessToken = await secureStorage.read(key: Keys.TOKEN);
    if (await secureStorage.containsKey(key: Keys.TOKEN) &&
        !JwtDecoder.isExpired(accessToken ?? '')) {
      resolver.next();
    } else {
      await secureStorage.delete(key: Keys.REFRESH_TOKEN);
      await secureStorage.delete(key: Keys.TOKEN);
      router.replace(const LoginRoute());
    }
  }
}
