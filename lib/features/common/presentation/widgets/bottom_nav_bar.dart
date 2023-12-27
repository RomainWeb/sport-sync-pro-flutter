import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GNav(
        color: AppColors.primaryColorLighter,
        selectedIndex: 1,
        activeColor: AppColors.primaryColorDarker,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabMargin: const EdgeInsets.symmetric(horizontal: 8),
        tabBorderRadius: 16,
        gap: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: FontAwesomeIcons.peopleGroup,
            text: 'Groupes',
          ),
          GButton(
            icon: FontAwesomeIcons.calendarDay,
            text: 'Calendrier',
          ),
          GButton(
            icon: FontAwesomeIcons.clock,
            text: 'Planning',
          ),
        ],
      ),
    );
  }
}
