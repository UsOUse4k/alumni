import 'package:alumni/core/theme/a_fonts.dart';
import 'package:alumni/core/utils/a_text.dart';
import 'package:alumni/feauture/donation/presentation/page/subpage/donation_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage>
    with AutomaticKeepAliveClientMixin {
  List<DonationModel> icons = [
    DonationModel(
      'Стидендия',
      'assets/images/scholarship.svg',
    ),
    DonationModel(
      'Наука',
      'assets/images/science.svg',
    ),
    DonationModel(
      'Стартап',
      'assets/images/startup.svg',
    ),
    DonationModel(
      'Гранты',
      'assets/images/money.svg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Помощь Университету',
          style: AFonts.h1i28,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              AText.donationText,
              textAlign: TextAlign.center,
              style: AFonts.r0i15,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DonationDetailPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color(0xFFECEFFB),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            icons[index].iconSvg,
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            icons[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Intro',
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DonationModel {
  final String title;
  final String iconSvg;

  DonationModel(this.title, this.iconSvg);
}
