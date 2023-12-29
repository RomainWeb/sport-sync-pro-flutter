import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sport_sync_pro/application/exceptions/auth_exceptions_handler.dart';
import 'package:sport_sync_pro/application/router/router.dart';
import 'package:sport_sync_pro/application/utils/colors/colors.dart';
import 'package:sport_sync_pro/features/authentication/data/datasource/firebase_auth_impl.dart';
import 'package:sport_sync_pro/features/common/presentation/widgets/snackbar.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final emailController = TextEditingController();
  final authService = FirebaseAuthImpl();

  Future<void> resetPassword() async {
    final status = await authService.resetPassword(
      email: emailController.text.trim(),
    );
    if (status == AuthStatus.successful) {
      CustomSnackBar.showSuccessSnackBar(
        context,
        message: 'Reset password link sent to your email',
      );
    } else {
      final error = AuthExceptionHandler.generateErrorMessage(status);
      CustomSnackBar.showErrorSnackBar(
        context,
        message: error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: resetPassword,
                    child: const Text('SEND LINK'),
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
