import 'package:flutter/material.dart';
import 'package:mobile_app/screen/Login_Screen/components/login_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Image.asset(
                    "assets/logo/logo.png",
                    height: 200,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome back! Please login to your account.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 13, 69, 221),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  const LoginForm(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
