import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayurinaja/features/auth/presentation/sign_in_page.dart';
import 'package:sayurinaja/features/welcome/presentation/welcoming_page.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SayurinAja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const WelcomingPage(),
      routes: {
        SignInPage.nameRoute : (context) => SignInPage()
      },
    );
  }
}
