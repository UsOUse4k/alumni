import 'package:alumni/app/navigation/route.gr.dart';
import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/feauture/students/domain/model/student/student_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({Key? key, required this.user}) : super(key: key);

  final UsersModel? user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          StudentDetailRoute(
            userId: user?.id ?? '',
          ),
        );
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: NeutralColor.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 18,
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: CachedNetworkImageProvider(user?.avatar ?? ''),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user?.name} ${user?.surname}',
                  overflow: TextOverflow.ellipsis,
                  style:TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Intro',
                      fontWeight: FontWeight.w700,
                      color: NeutralColor.primary),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${user?.yearOfRelease ?? '-- --'}',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'Intro',
                    fontWeight: FontWeight.w400,
                    color: NeutralColor.primary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
