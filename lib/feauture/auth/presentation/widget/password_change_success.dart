import 'package:alumni/core/theme/a_fonts.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/navigation/route.gr.dart';
import '../../../../core/theme/a_color.dart';

@RoutePage()
class PasswordChangeSuccessPage extends StatelessWidget {
  const PasswordChangeSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/password_change.svg'),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Ваш пароль изменен!',
              style: AFonts.h1i28,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: FilledButton(
              onPressed: () {
                context.router.replace(const LoginRoute());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(PrimaryColor.s100),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  )),
              child: Text(
                'Войти в аккаунт',
                style: AFonts.h2i18.copyWith(color: NeutralColor.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
