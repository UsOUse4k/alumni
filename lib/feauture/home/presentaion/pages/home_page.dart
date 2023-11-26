import 'package:alumni/core/theme/a_color.dart';
import 'package:alumni/feauture/donation/presentation/page/donation_page.dart';
import 'package:alumni/feauture/news/presentation/page/news_page.dart';
import 'package:alumni/feauture/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:alumni/feauture/profile/presentation/page/profile_page.dart';
import 'package:alumni/feauture/students/presentation/page/student_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  late final PageController pageController;

  void changePage(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      selectedIndex.value,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeIn,
    );
  }

  List<Widget> pages = [
    const NewsPage(),
    const StudentPage(),
    const DonationPage(),
    const ProfilePage()
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          selectedIndex.value = index;
        },
        children: pages,
      )),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, value,_) {
          return BottomNavigationBar(
            backgroundColor: PrimaryColor.s100,
            selectedItemColor: NeutralColor.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            useLegacyColorScheme: false,
            currentIndex: value,
            onTap: changePage,
            items: [
              BottomNavigationBarItem(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/news.svg',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 6,
                        height: 2,
                        decoration: BoxDecoration(
                            color: selectedIndex.value == 0
                                ? NeutralColor.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                  label: 'News'),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/student.svg',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 6,
                        height: 2,
                        decoration: BoxDecoration(
                            color: selectedIndex.value == 1
                                ? NeutralColor.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                  label: 'Student'),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/donation.svg',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 6,
                        height: 2,
                        decoration: BoxDecoration(
                            color: selectedIndex.value == 2
                                ? NeutralColor.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                  label: 'Donation'),
              BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/profile.svg',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 6,
                        height: 2,
                        decoration: BoxDecoration(
                            color: selectedIndex.value == 3
                                ? NeutralColor.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                  label: 'Profile')
            ],
          );
        },
      ),
    );
  }
}
