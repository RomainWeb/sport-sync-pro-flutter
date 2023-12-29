import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sport_sync_pro/application/exceptions/auth_exceptions_handler.dart';
import 'package:sport_sync_pro/application/router/router.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';
import 'package:sport_sync_pro/features/authentication/data/datasource/firebase_auth_impl.dart';
import 'package:sport_sync_pro/features/common/presentation/widgets/snackbar.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final authService = FirebaseAuthImpl();

    Future<void> login() async {
      final status = await authService.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      if (status == AuthStatus.successful) {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null && !user.emailVerified) {
          AutoRouter.of(context).push(const VerifyEmailRoute());
        } else {
          AutoRouter.of(context).pushAndPopUntil(const HomeRoute(), predicate: (Route<dynamic> route) { return false; });
        }
      } else {
        final error = AuthExceptionHandler.generateErrorMessage(status);
        CustomSnackBar.showErrorSnackBar(
          context,
          message: error,
        );
      }
    }

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
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
                    'LOGIN',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => AutoRouter.of(context).push(const ResetPasswordRoute()),
                        child: Text('Forgot password?', style: TextStyle(
                          color: AppColors.primaryColorLighter,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ],
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
                    onPressed: login,
                    child: const Text('LOGIN'),
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: 'dont\'t have an account? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade400,
                        fontSize: 16
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => AutoRouter.of(context).push(const AuthenticationRoute()),
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
