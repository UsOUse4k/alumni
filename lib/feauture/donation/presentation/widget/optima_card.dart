import 'package:alumni/core/theme/a_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widget/custom_snack_bar.dart';

class OptimaCard extends StatelessWidget {
  const OptimaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1E4097),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: SvgPicture.asset(
              'assets/images/optima.svg',
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              'DONIERBEK ZAITOV',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: NeutralColor.white,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 50,
            child: Row(
              children: [
                Text(
                  '1234 5678 9012 3456',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    fontSize: 19.sp,
                    color: NeutralColor.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      const ClipboardData(
                        text: "1234 5678 9012 3456",
                      ),
                    );
                    if (context.mounted){
                      showSuccessSnackBar('Номер карты скопирован', context);
                    }
                  },
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            right: 20,
            child: Image.asset(
              'assets/images/visa.png',
            ),
          ),
        ],
      ),
    );
  }
}
