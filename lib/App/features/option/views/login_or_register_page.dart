import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class LoginOrRegisterPage extends StatelessWidget {
  const LoginOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         SizedBox(
           width: 169.w,
           height: 160.h,
           child: Image.asset('assets/images/logo.png'),
         ),
          SizedBox(height: 64.h),

          Text('Selamat Datang!' , style: TextStyle(
            fontSize: 20 , fontWeight: FontWeight.bold
          )),

          SizedBox(height: 52.h),
          
          SizedBox(
            width: 295.w,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Text("MASUK" , )
            )
          ),

          SizedBox(height: 64.h),

          SizedBox(
              width: 295.w,
              height: 50.h,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text("MENDAFTAR" , )
              )
          ),

          SizedBox(height: 64.h),

          SizedBox(
              width: 295.w,
              height: 50.h,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.NAVIGATION);
                  },
                  child: Text("HALAMAN UTAMA" , )
              )
          ),
        ],
      )
      )
    );
  }
}
