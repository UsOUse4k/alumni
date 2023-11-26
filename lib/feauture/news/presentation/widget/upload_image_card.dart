import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class UploadImageCard extends StatelessWidget {
  const UploadImageCard({Key? key, required this.onPressed}) : super(key: key);

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: DottedBorder(
        color: const Color(0xFF153964),
        dashPattern: const [4, 4],
        strokeWidth: 2,
        child: const SizedBox(
          width: double.infinity,
          height: 230,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Загрузите свои картикни',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Intro'),
            ),
          ),
        ),
      ),
    );
  }
}
