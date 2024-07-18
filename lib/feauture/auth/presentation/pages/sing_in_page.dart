import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_back_button.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/feauture/auth/domain/model/sing_in_model.dart';
import 'package:alumni/feauture/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:alumni/feauture/auth/presentation/widget/auth_background.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController usernameController;
  late final TextEditingController surnameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  ValueNotifier<bool?> isAgreedPrivacy = ValueNotifier(false);
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> passwordConfirmVisible = ValueNotifier(true);

  @override
  void initState() {
    usernameController = TextEditingController();
    surnameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            context.router.replace(const SignInSuccessRoute());
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
                const Stack(
                  children: [
                    AuthBackground(),
                    Positioned(
                      left: 5,
                      top: 25,
                      child: CustomBackButton(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Регистрация',
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
                    hintText: 'имя',
                    controller: usernameController,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    contentPadding: const EdgeInsets.only(left: 10),
                    isFilled: true,
                    borderRadius: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: CustomTextFormField(
                    hintText: 'фамилия',
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: surnameController,
                    contentPadding: const EdgeInsets.only(left: 10),
                    isFilled: true,
                    borderRadius: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: CustomTextFormField(
                    hintText: 'e-mail',
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    contentPadding: const EdgeInsets.only(left: 10),
                    isFilled: true,
                    borderRadius: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: CustomTextFormField(
                    hintText: 'телефон',
                    textInputType: TextInputType.number,
                    controller: phoneController,
                    contentPadding: const EdgeInsets.only(left: 10),
                    isFilled: true,
                    borderRadius: 12,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: ValueListenableBuilder(
                    valueListenable: passwordVisible,
                    builder: (BuildContext context, value, Widget? child) {
                      return CustomTextFormField(
                        hintText: 'пароль',
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        contentPadding: const EdgeInsets.only(left: 10),
                        obscureText: value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            passwordVisible.value = !passwordVisible.value;
                          },
                          icon: Icon(
                            value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: PrimaryColor.s200,
                          ),
                        ),
                        isFilled: true,
                        borderRadius: 12,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewPadding.bottom,
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: passwordConfirmVisible,
                      builder: (BuildContext context, value, Widget? child) {
                        return CustomTextFormField(
                          hintText: 'подтвердите пароль',
                          controller: confirmPasswordController,
                          textInputAction: TextInputAction.next,
                          contentPadding: const EdgeInsets.only(left: 10),
                          obscureText: value,
                          suffixIcon: IconButton(
                            onPressed: () {
                              passwordConfirmVisible.value =
                                  !passwordConfirmVisible.value;
                            },
                            icon: Icon(
                              value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: PrimaryColor.s200,
                            ),
                          ),
                          isFilled: true,
                          borderRadius: 12,
                        );
                      },
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: isAgreedPrivacy,
                  builder: (BuildContext context, value, Widget? child) {
                    return Padding(
                      padding: const EdgeInsets.only(),
                      child: CheckboxListTile(
                        title: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: NeutralColor.primary,
                            ),
                            children: [
                              const TextSpan(text: 'Вы соглашаетесь '),
                              TextSpan(
                                text: 'Правилам пользования ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchUrl(
                                        'https://ru.wikipedia.org/wiki/Privacy');
                                  },
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(text: 'и '),
                              TextSpan(
                                text: 'Политекой конфиденциальности ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchUrl(
                                        'https://ru.wikipedia.org/wiki/Privacy');
                                  },
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(
                                  text: 'тогда продолжаете регистрацию ')
                            ],
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        visualDensity: const VisualDensity(
                            vertical: VisualDensity.minimumDensity,
                            horizontal: VisualDensity.minimumDensity),
                        value: value,
                        onChanged: (value) {
                          isAgreedPrivacy.value = value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      if (phoneController.text.isEmpty &&
                          emailController.text.isEmpty &&
                          passwordController.text.isEmpty &&
                          confirmPasswordController.text.isEmpty &&
                          usernameController.text.isEmpty &&
                          surnameController.text.isEmpty) {
                        showErrorSnackBar('Заполните все поля', context);
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        showErrorSnackBar('Пароли не совпадают', context);
                      } else if (!(isAgreedPrivacy.value!)) {
                        showErrorSnackBar(
                            'Вы не можете зарегистрироватся если не согласитесь с нашими условиями',
                            context);
                      } else {
                        context.read<AuthBloc>().add(
                              SignInEvent(
                                SignInModel(
                                  telephone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                  name: usernameController.text,
                                  surname: surnameController.text,
                                ),
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
                        )),
                    child: Text(
                      'Зарегистрироваться',
                      style: AFonts.h2i18.copyWith(color: NeutralColor.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _launchUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
