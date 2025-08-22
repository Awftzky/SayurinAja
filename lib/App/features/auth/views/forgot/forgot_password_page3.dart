import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage3 extends StatelessWidget {
  const ForgotPasswordPage3({super.key});

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

            // TEXT ATUR ULANG KATA SANDI BARU

            // GARIS TEBAL

            // INPUT PASSWORD

            // CHECKING STRONG PASSOWRD

            // INPUT PASSWORD AGAIN

            // BUTTON SELANJUTNYA ( KIRIM PASSWORD DAN CHECKING & KE PAGE 3 )

            // INDICATOR BUTTON
          ],
        ),
      ),
    );
  }
}
