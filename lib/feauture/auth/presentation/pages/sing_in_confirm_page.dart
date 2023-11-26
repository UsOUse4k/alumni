import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInConfirmPage extends StatefulWidget {
  const SignInConfirmPage({Key? key}) : super(key: key);

  @override
  State<SignInConfirmPage> createState() => _SignInConfirmPageState();
}

class _SignInConfirmPageState extends State<SignInConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 250,),
            Text(
              'Потверждение почты',
              style: AFonts.h1i28,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Введите код, который мы отправили вам на почту ',
              style: AFonts.b0i16,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35,),
            const SizedBox(
              width: 300,
              child: CustomTextFormField(
                hintText: 'введите код',
                contentPadding: EdgeInsets.only(left: 10),
                obscureText: true,
                isFilled: true,
                borderRadius: 12,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                onPressed: () {},
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
