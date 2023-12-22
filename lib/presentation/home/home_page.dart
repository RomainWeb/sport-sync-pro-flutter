import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
    Text('page 1'),
    Text('page 2'),
    Text('page 3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
    );
  }
}
