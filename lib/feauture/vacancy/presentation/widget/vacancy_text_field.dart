import 'package:alumni/core/theme/a_fonts.dart';
import 'package:flutter/material.dart';

class VacancyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isSmall;

  const VacancyTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: !isSmall ? 43 : 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black87,
        cursorHeight: 14,
        style: AFonts.r0i15.copyWith(
          fontSize: 10,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.only(left: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: AFonts.r0i15.copyWith(
            fontSize: 10,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
