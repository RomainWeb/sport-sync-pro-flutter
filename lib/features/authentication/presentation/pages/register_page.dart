import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sport_sync_pro/application/router/router.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final displayNameController = TextEditingController();

    Future<void> register() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await FirebaseAuth.instance.currentUser!.updateDisplayName(displayNameController.text.trim());

        AutoRouter.of(context).push(const HomeRoute());
      } catch(e) {
        print(e);
      }
    }

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      displayNameController.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primaryColor,
          onPressed: () => { AutoRouter.of(context).push(const AuthenticationRoute())},
      ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    'REGISTER',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor
                    )
                ),
                Image.asset(
                  'assets/images/login-illustration.jpg',
                  width: 220,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Full name', style: TextStyle(
                        color: AppColors.primaryColorLighter,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ],
                ),
                TextField(
                  controller: displayNameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.greyLight,
                    ),
                    hintText: 'Enter your full name',
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Email', style: TextStyle(
                        color: AppColors.primaryColorLighter,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ],
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.greyLight,
                    ),
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Password', style: TextStyle(
                        color: AppColors.primaryColorLighter,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ],
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.password,
                      color: AppColors.greyLight,
                    ),
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.secondaryColor),
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
                    ),
                    onPressed: register,
                    child: const Text('REGISTER'),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade400,
                        fontSize: 16
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => AutoRouter.of(context).push(const LoginRoute()),
                          text: 'Sign up',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
