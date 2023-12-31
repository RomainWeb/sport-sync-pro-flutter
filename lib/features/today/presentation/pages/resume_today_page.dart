import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sport_sync_pro/features/common/presentation/widgets/top_nav_bar.dart';
import 'package:sport_sync_pro/features/today/presentation/widgets/day_date_picker.dart';
import 'package:sport_sync_pro/features/today/presentation/widgets/weather.dart';

class ResumeTodayPage extends StatelessWidget {
  const ResumeTodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: TopNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Welcome, ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: "${user != null ? user.displayName : 'User'}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const DayDatePicker(),
            const WeatherToday(),
          ],
        ),
      )
    );
  }
}
