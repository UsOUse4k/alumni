import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/widget/custom_text_form_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class StudentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StudentAppBar(
      {Key? key,
      required this.onChanged,
      required this.onFilter,
      this.name,
      this.education,
      this.species,
      this.yearOfRelease, required this.onClean})
      : super(key: key);

  final Function(String?) onChanged;
  final Function(
    String? name,
    String? education,
    String? species,
    int? yearOfRelease,
  ) onFilter;
  final Function() onClean;

  final String? name;
  final String? education;
  final String? species;
  final int? yearOfRelease;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: CustomTextFormField(
        textFormFieldHeight: 40,
        onChanged: onChanged,
        isFilled: true,
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        filledColor: const Color(0xFFE6E6E6),
        hintText: 'Поиск выпускников',
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(right: 20),
            ),
          ),
          onPressed: () {
            context.router.push(
              StudentFilterRoute(
                onFilter: onFilter,
                name: name,
                education: education,
                species: species,
                yearOfRelease: yearOfRelease,
                onClean: onClean,

              ),
            );
          },
          child: const Text(
            'Фильтры',
            style: TextStyle(
              color: NeutralColor.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w700,
              fontFamily: 'Intro',
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
