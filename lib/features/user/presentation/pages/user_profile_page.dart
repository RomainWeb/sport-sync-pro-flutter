import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sport_sync_pro/application/router/router.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';


@RoutePage()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            AutoRouter.of(context).push(const AuthenticationRoute());
          },
          child: const Text('LOG OUT'),
        ),
      ),
    );
  }
}
