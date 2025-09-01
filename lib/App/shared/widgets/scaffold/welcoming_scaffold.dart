import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';

class WelcomingScaffold extends StatelessWidget {
  final Widget body;

  const WelcomingScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: body,
      backgroundImage: const DecorationImage(
          image: AssetImage("assets/images/onboarding0_bg.png"),
          fit: BoxFit.cover),
    );
  }
}
