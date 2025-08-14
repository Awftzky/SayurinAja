import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         body: Center(
           child: Column(
             children: [
               SizedBox(
                 width: 231,
                 height: 203,
                 child: Image.asset('assets/images/logo.png'),
               )
             ],
           ),
         ),
      ),
    );
  }
}
