import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsBackground extends StatelessWidget {
  const NewsBackground({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 330,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/student_white.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ala-Too Alumni',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Intro',
                    fontSize: 19,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ala-Too Alumni - возможности \n'
                        'не заканчиваются в стенах IAU',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      fontFamily: 'Intro',
                      color: NeutralColor.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PrimaryButton(
                    width: 120.w,
                    height: 25.h,
                    onPressed: onPressed,
                    title: 'Читать',
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
