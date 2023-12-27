import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';
import 'package:sport_sync_pro/features/user/presentation/pages/user_profile_page.dart';


class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  TopNavBar({
    super.key,
    this.title = '',
  });


  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        backgroundColor: AppColors.primaryColorDarker,
        elevation: 0,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.user),
            color: Colors.white,
            iconSize: 16.0,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserProfilePage())
              )
            },
          ),
        ]
    );
  }
}

