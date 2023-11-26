import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/home/presentaion/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThanksForDonationPage extends StatelessWidget {
  const ThanksForDonationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Спасибо, что помагаете  и заботитесь о своем университете',
            style: AFonts.h1i28,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: SvgPicture.asset('assets/images/thank_donation.svg'),
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            width: 250,
            backgroundColor: const Color(0xFF153964),
            title: 'Готово!',
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Intro',
              color: NeutralColor.white,
            ),
          )
        ],
      ),
    );
  }
}
