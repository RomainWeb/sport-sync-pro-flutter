import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sport_sync_pro/features/common/presentation/widgets/bottom_nav_bar.dart';
import 'package:sport_sync_pro/features/today/presentation/pages/resume_today_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ResumeTodayPage(),
    Text('page 2'),
    Text('page 3')
  ];

  @override
  Widget build(BuildContext context) {
     User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTabChange: navigationBottomBar,
        )
    );
  }
}
