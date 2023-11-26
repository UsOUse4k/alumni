import 'package:alumni/core/theme/a_fonts.dart';
import 'package:flutter/material.dart';

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({Key? key, required this.title, required this.value}) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: AFonts.b1i13.copyWith(
                color: const Color(0xFF878787),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(value,style: AFonts.h2i18,),
          ],
        ),
      ),
    );
  }
}
