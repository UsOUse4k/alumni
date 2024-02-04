import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/admin.dart';
import 'package:alumni/core/network/keys.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/feauture/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:alumni/feauture/auth/presentation/widget/auth_background.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier<bool> isPasswordNotVisible = ValueNotifier(true);
  final secureStorage = const FlutterSecureStorage();

  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            final token = state.token.accessToken;
            final refreshToken = state.token.refreshToken;
            await secureStorage.write(
              key: Keys.TOKEN,
              value: token,
            );
            await secureStorage.write(
              key: Keys.REFRESH_TOKEN,
              value: refreshToken,
            );
            Admin.isAdmin = state.token.user?.isAdmin ?? false;
            if (mounted) {
              context.router.push(const HomeRoute());
              usernameController.clear();
              passwordController.clear();
            }
          } else if (state is AuthError) {
            showErrorSnackBar(state.message, context);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                const AuthBackground(),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Вход',
                  style: AFonts.h1i28.copyWith(
                    color: TextColor.s100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: CustomTextFormField(
                    hintText: 'e-mail или номер телефона',
                    controller: usernameController,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(fontFamily: 'Intro'),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: PrimaryColor.s300,
                    ),
                    isFilled: true,
                    borderRadius: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      // bottom: MediaQuery.of(context).viewInsets.bottom
                      ),
                  child: SizedBox(
                    width: 300,
                    child: ValueListenableBuilder(
                        valueListenable: isPasswordNotVisible,
                        builder: (BuildContext context, value, Widget? child) {
                          return CustomTextFormField(
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: PrimaryColor.s300,
                            ),
                            controller: passwordController,
                            style: const TextStyle(fontFamily: 'Intro'),
                            suffixIcon: IconButton(
                              onPressed: () {
                                isPasswordNotVisible.value =
                                    !isPasswordNotVisible.value;
                              },
                              icon: Icon(
                                value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                                color: PrimaryColor.s200,
                              ),
                            ),
                            hintText: 'пароль',
                            obscureText: value,
                            isFilled: true,
                            borderRadius: 15,
                          );
                        }),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.router.push(const PasswordChangeRoute());
                  },
                  child: Text(
                    'Забыли пароль?',
                    style: AFonts.h4i9.copyWith(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: WarningColor.s200,
                      color: WarningColor.s200,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      if (usernameController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                        showErrorSnackBar('Заполните поля для ввода', context);
                      } else {
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                usernameController.text,
                                passwordController.text,
                              ),
                            );
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
                      'Войти',
                      style: AFonts.h2i18.copyWith(color: NeutralColor.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Нет аккаунта? ',
                        style: AFonts.h2i18.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: 'Зарегистрироватся',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.router.push(const SignInRoute());
                          },
                        style: AFonts.h2i18.copyWith(
                            color: PrimaryColor.s100,
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
