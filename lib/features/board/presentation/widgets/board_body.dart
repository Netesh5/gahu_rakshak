import 'package:flutter/material.dart';
import 'package:gahurakshak/features/board/presentation/widgets/bottom_nav_bar.dart';
import 'package:gahurakshak/features/dashboard/presenatation/pages/dashboard_view.dart';
import 'package:gahurakshak/features/history/presentation/pages/history_view.dart';
import 'package:gahurakshak/features/homepage/presentation/pages/homepage_view.dart';
import 'package:gahurakshak/features/profile/presentation/pages/profile_view.dart';

class BoardBody extends StatefulWidget {
  const BoardBody({super.key});

  @override
  State<BoardBody> createState() => _BoardBodyState();
}

class _BoardBodyState extends State<BoardBody> {
  final pageController = PageController(initialPage: 0);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          currentPage = value;
          setState(() {});
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePageView(),
          DashBoardView(),
          HistoryView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onChanged: (int index) {
          pageController.jumpToPage(index);
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
