import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';

import 'package:lucide_icons/lucide_icons.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onChanged});
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
      icon: const Icon(
        LucideIcons.home,
        color: AppColors.goldenColor,
      ),
      tooltip: LocaleKeys.home.tr(),
      label: LocaleKeys.home.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.history, color: AppColors.goldenColor),
      tooltip: LocaleKeys.history.tr(),
      label: LocaleKeys.history.tr(),
    ),
    BottomNavigationBarItem(
      icon: const Icon(LucideIcons.user, color: AppColors.goldenColor),
      tooltip: LocaleKeys.profile.tr(),
      label: LocaleKeys.profile.tr(),
    )
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.grey.withOpacity(0.5),
      currentIndex: currentIndex,
      items: navBarItems,
      onTap: (value) {
        currentIndex = value;
        setState(() {});
        widget.onChanged(currentIndex);
      },
    );
  }
}
