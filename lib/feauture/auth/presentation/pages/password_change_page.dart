import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_back_button.dart';
import 'package:alumni/core/widget/custom_snack_bar.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/auth/presentation/pages/password_recovery_page.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({Key? key}) : super(key: key);

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  late final TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Восстановление пароля',
              style: AFonts.h1i28,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Введите e-mail, мы отправим на вашу форму для восстановления пароля',
              textAlign: TextAlign.center,
              style: AFonts.r0i15,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: CustomTextFormField(
                hintText: 'e-mail',
                controller: emailController,
                textInputType: TextInputType.emailAddress,
                contentPadding: const EdgeInsets.only(left: 10),
                isFilled: true,
                borderRadius: 12,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    showErrorSnackBar('Заполините поле ввода', context);
                  } else {
                    context.router.push(
                      PasswordRecoveryRoute(
                        email: emailController.text,
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
                  'Отправить',
                  style: AFonts.h2i18.copyWith(color: NeutralColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
