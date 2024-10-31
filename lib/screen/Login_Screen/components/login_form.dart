import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/constants.dart';
import 'package:mobile_app/screen/Forgot_password_screen/forgot_screen.dart';
import 'package:mobile_app/screen/SignUp_Screen/sign_up_screens.dart';
import 'package:mobile_app/controllers/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _loginController.emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              prefixIcon: const Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),

          const SizedBox(height: 14.0),

          // Password input field
          TextFormField(
            controller:
                _loginController.passwordController, // Bind password controller
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              prefixIcon: const Icon(Icons.lock),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),

          const SizedBox(height: 20.0),

          // Sign-in button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Call the login function from LoginController
                _loginController.loginWithEmail();
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Button,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "Sign in",
              style: TextStyle(fontSize: 18.0),
            ),
          ),

          const SizedBox(height: 12.0),

          // Forgot password link
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePasswordScreen(),
                ),
              );
            },
            child: Text(
              'Forgot Password?',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: const Color.fromARGB(255, 231, 51, 51)),
            ),
          ),

          // Sign-up link
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
            child: RichText(
              text: const TextSpan(
                text: "Don’t have an account? ",
                style: TextStyle(color: Color.fromARGB(255, 44, 42, 42)),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(color: Color(0xFF00BF6D)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
