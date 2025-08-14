import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const nameRoute = '/sign_in';
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 295.0,
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo.png',
              width: 117,
              height: 105,
            ),
          )

        ],
      ),

      // Image

      // Text Login

      // TextField Email

      // TextField Password

      // Login Button

      // Text Forgot Password

      // Line

      // Text Login Alternative

      // Login WIth Apple

      // Login With Google

      // Register Button

    );
  }
}
