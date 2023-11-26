import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/admin.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NewsAppBar extends StatelessWidget {
  const NewsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: NeutralColor.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Новости',
              style: AFonts.h1i28.copyWith(fontSize: 23),
            ),
          ),
          centerTitle: true,
          actions: [
            Admin.isAdmin ?? false
                ? Padding(
                    padding: const EdgeInsets.only(right: 15, top: 5),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: const Color(0xFF153964),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.router.push(const CreateNewsRoute());
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 28,
                          color: NeutralColor.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
