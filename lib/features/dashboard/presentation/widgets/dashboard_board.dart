import 'package:flutter/material.dart';
import 'package:gahurakshak/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:gahurakshak/features/history/presentation/pages/history_view.dart';
import 'package:gahurakshak/features/homepage/presentation/pages/homepage_view.dart';
import 'package:gahurakshak/features/profile/presentation/pages/profile_view.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
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
        children: const [
          HomePageView(),
          HistoryView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onChanged: (int index) {
          setState(() {});
          currentPage = index;
          pageController.jumpToPage(index);
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
