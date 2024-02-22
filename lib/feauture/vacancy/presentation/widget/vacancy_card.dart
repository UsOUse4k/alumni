import 'package:alumni/core/theme/a_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VacancyCard extends StatelessWidget {
  const VacancyCard({
    super.key,
    required this.imageUrl,
    required this.companyName,
    required this.position,
    required this.salary,
    this.onTap,
  });

  final String imageUrl;
  final String companyName;
  final String position;
  final String salary;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Компния: $companyName",
                  style: AFonts.r0i15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Должность: $position",
                    style: AFonts.r0i15,
                  ),
                ),
                Text(
                  "От: $salary KGS в месяц",
                  style: AFonts.r0i15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
