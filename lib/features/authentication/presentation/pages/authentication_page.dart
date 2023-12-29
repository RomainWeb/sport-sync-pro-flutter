import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_sync_pro/application/router/router.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';
import 'package:sport_sync_pro/features/authentication/data/datasource/firebase_auth_impl.dart';
import 'package:sport_sync_pro/features/authentication/presentation/pages/login_page.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/secure-illustration.jpg',
            width: 220,
          ),
          Text(
            'Welcome to \n Sport Sync Pro',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)),
            ),
            onPressed: () { AutoRouter.of(context).push(const LoginRoute());},
            child: const Text(
              'Log in'
            )
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundLight,
                foregroundColor: AppColors.primaryColorDarker,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: const Text(
                  'sign up'
              )
          ),
          const SizedBox(height: 32),
          Text(
            'continue with an account',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
            ),
            onPressed: () async {
              await FirebaseAuthImpl.signInWithGoogle(context: context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.googlePlusG,
              color: Colors.white,
            ),
            label: const Text("Google"), // text
          ),
        ],
      ),
    );
  }
}
