import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyBox extends StatelessWidget {
  const CompanyBox({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 66,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 13,
            spreadRadius: 0,
            color: const Color(0xff000012).withOpacity(0.07),
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 19),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Компания',
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff000000).withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                name,
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
