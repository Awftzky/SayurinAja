import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage2 extends StatelessWidget {
  const ForgotPasswordPage2({super.key});

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

            // TEXT PENGATURAN ULANG KATA SANDI

            // GARIS TEBAL

            // INPUT CODE

            // BUTTON SELANJUTNYA ( KIRIM CODE DAN CHECKING & KE PAGE 3 )

            // INDICATOR BUTTON
          ],
        ),
      ),
    );
  }
}
