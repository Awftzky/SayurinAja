import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/auth/controller/register/register_controller.dart';
import 'package:sayurinaja/App/shared/widgets/input/custom_input_auth.dart';
import 'package:sayurinaja/App/shared/section/auth/social_auth_section.dart';
class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          width: 347.82.w,
          height: 606.81.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mendaftar ke SayurinAja!',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),

                // Email
                CustomInputAuth(
                  hintText: "Email",
                  controller: controller.emailController,
                ),
                SizedBox(height: 15.h),

                // Username
                CustomInputAuth(
                  hintText: "Nama Pengguna",
                  controller: controller.usernameController,
                ),
                SizedBox(height: 15.h),

                // Password
                CustomInputAuth(
                  hintText: "Kata Sandi",
                  controller: controller.passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 25.h),

                // Button Daftar
                Obx(() => SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed:
                    controller.isLoading.value ? null : controller.register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
                SizedBox(height: 15.h),

                GestureDetector(
                  onTap: () {
                    Get.toNamed('/login'); // PAGE BELUM ADA
                  },
                  child: Text(
                    "Sudah mempunyai akun? Masuk",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text("atau masuk dengan"),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
                  ],
                ),

                SizedBox(height: 20.h),

                const SocialAuthSection(),

                SizedBox(height: 58.h),

                Padding(
                  padding: EdgeInsets.only(right: 10 , left: 20),
                  child: Text(
                    'Dengan mendaftar untuk membuat akun, Anda menerima persyaratan layanan dan kebijakan privasi kami.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8.sp,
                    ),
                  ),
                )
              ],
          ),
          ),
        ),
      ),
    );
  }
}
