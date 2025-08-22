import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/widgets/button/social_auth_button.dart';
class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialAuthButton(
          label: "Apple",
          icon: Icons.apple,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          onPressed: () {
            // TODO: handle login with Apple
          },
        ),
        SocialAuthButton(
          label: "Google",
          icon: Icons.g_mobiledata,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey,
          onPressed: () {
            // TODO: handle login with Google
          },
        ),
      ],
    );
  }
}
