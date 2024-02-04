import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SignInSuccessPage extends StatelessWidget {
  const SignInSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/sing_in.svg'),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Вы успешно зарегистрировались!',
            style: AFonts.h1i28,
            textAlign: TextAlign.center,
          ),
          Text(
            'Зайдите в почту и Подтвердите аккаунт для того чтобы войти в аккаунт',
            style: AFonts.b0i16,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  context.router.replace(const LoginRoute());
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(PrimaryColor.s100),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    )),
                child: Text(
                  'Войти в аккаунт',
                  style: AFonts.h2i18.copyWith(color: NeutralColor.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
