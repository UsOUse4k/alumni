import 'package:alumni/core/widget/text_with_mark.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../theme/a_color.dart';
import '../theme/a_fonts.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown(
      {Key? key, required this.onChanged, this.items, required this.hintText, required this.title, this.value})
      : super(key: key);

  final Function(T?) onChanged;
  final List<DropdownMenuItem<T>>? items;
  final String hintText;
  final String title;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWithMark(
          title: title ?? '',
          isRequired: false,
        ),
        const SizedBox(
          height: 3 ,
        ),
        SizedBox(
          height: 40,
          child: DropdownButtonFormField2<T>(
              isExpanded: true,
              value: value,
              decoration: InputDecoration(
                constraints: const BoxConstraints(
                  minHeight: 40
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                hintText: hintText,
                filled: true,
                fillColor: NeutralColor.white,
                hintStyle: AFonts.r0i15.copyWith(
                  color: const Color(0xFFBCBCBC),
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
                disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: onChanged,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: NeutralColor.white,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              buttonStyleData: const ButtonStyleData(
                height: 30,
                padding: EdgeInsets.only(top: 3)
              ),

              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
              items: items),
        ),
      ],
    );
  }
}
