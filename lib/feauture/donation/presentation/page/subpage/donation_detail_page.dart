import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/widget/primary_button.dart';
import 'package:alumni/feauture/donation/presentation/page/subpage/thanks_for_donation_page.dart';
import 'package:alumni/feauture/donation/presentation/widget/mbank_card.dart';
import 'package:alumni/feauture/donation/presentation/widget/optima_card.dart';
import 'package:flutter/material.dart';

class DonationDetailPage extends StatefulWidget {
  const DonationDetailPage({Key? key}) : super(key: key);

  @override
  State<DonationDetailPage> createState() => _DonationDetailPageState();
}

class _DonationDetailPageState extends State<DonationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF007AFF),
            )),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MBankCard(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: OptimaCard(),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PrimaryButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThanksForDonationPage(),
                  ),
                );
              },
              title: 'Я помог Ала-Тоо!',
              backgroundColor: const Color(0xFF153964),
              textStyle: AFonts.h2i18.copyWith(
                color: NeutralColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
