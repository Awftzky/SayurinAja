import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage1 extends StatelessWidget {
  const ForgotPasswordPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [

            SizedBox(
              width: 51.w,
              height: 46.h,
              child: Image.asset('assets/images/logo.png'),
            ),

            // TEXT LUPA KATA SANDI

            // GARIS TEBAL

            // INPUT EMAIL

            // BUTTON SELANJUTNYA ( KIRIM DATA EMAIL & KE PAGE 2 )

            // INDICATOR BUTTON
          ],
        ),
      ),
    );
  }
}
