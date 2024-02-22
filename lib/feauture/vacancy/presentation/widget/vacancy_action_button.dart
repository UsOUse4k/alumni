import 'package:alumni/core/theme/a_fonts.dart';
import 'package:flutter/material.dart';

class VacancyActionButton extends StatefulWidget {
  final String text;
  final Color backColor;
  final void Function()? onTap;

  const VacancyActionButton({
    super.key,
    required this.text,
    required this.backColor,
    required this.onTap,
  });

  @override
  State<VacancyActionButton> createState() => _VacancyActionButtonState();
}

class _VacancyActionButtonState extends State<VacancyActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backColor,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: AFonts.r0i15.copyWith(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
