import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/feauture/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:alumni/feauture/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:alumni/feauture/auth/presentation/widget/password_change_success.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  late final TextEditingController codeController;
  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmController;

  @override
  void initState() {
    context.read<OtpBloc>().add(SendConfirmCode(widget.email));
    codeController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    passwordConfirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            context.router.push(const PasswordChangeSuccessRoute());
          } else if (state is AuthError) {
            showErrorSnackBar(state.message, context);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Text(
                  'Восстановление пароля',
                  style: AFonts.h1i28,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Введите код который мы отправили на почту',
                  style: AFonts.b0i16,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: CustomTextFormField(
                  hintText: 'код',
                  textInputType: TextInputType.number,
                  controller: codeController,
                  contentPadding: const EdgeInsets.only(left: 10),
                  isFilled: true,
                  borderRadius: 12,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: CustomTextFormField(
                  hintText: 'пароль',
                  controller: passwordController,
                  contentPadding: const EdgeInsets.only(left: 10),
                  obscureText: true,
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
                  hintText: 'подтвердите пароль',
                  controller: passwordConfirmController,
                  contentPadding: const EdgeInsets.only(left: 10),
                  obscureText: true,
                  isFilled: true,
                  borderRadius: 12,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    if (codeController.text.isEmpty &&
                        passwordController.text.isEmpty &&
                        passwordConfirmController.text.isEmpty) {
                      showErrorSnackBar('Заполините все поля', context);
                    } else if (passwordController.text !=
                        passwordConfirmController.text) {
                      showErrorSnackBar('Пароли не совпадают', context);
                    } else {
                      context.read<AuthBloc>().add(
                            ChangePasswordEvent(
                              widget.email,
                              int.parse(codeController.text),
                              passwordController.text,
                              passwordConfirmController.text,
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
                    'Изменить',
                    style: AFonts.h2i18.copyWith(color: NeutralColor.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
