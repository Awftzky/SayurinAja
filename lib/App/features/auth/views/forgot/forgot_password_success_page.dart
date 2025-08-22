import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class ForgotPasswordSuccessPage extends StatelessWidget {
  const ForgotPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text('Semuanya selesai!' , style: TextStyle(
                    fontSize: 20 , fontWeight: FontWeight.bold
                )),
                SizedBox(height: 58.h),

                // GARIS TEBAL

                // SPACING TIPSI

                SizedBox(
                  width: 147.w,
                  height: 133.h,
                  child: Image.asset('assets/images/logo.png'),
                ),

                SizedBox(height: 64.h),

                SizedBox(
                    width: 295.w,
                    height: 50.h,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text("Kembali ke halaman masuk" ,
                          style:  TextStyle(
                            fontSize: 16
                          )
                        ),

                      // INDICATOR BUTTON

                    )
                ),
              ],
            )
        )
    );
  }
}
