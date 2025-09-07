import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/section/home/store/allstore_section.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllStorePage extends StatelessWidget {
  const AllStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: false,
      appBar: AppBar(
          backgroundColor: AppColors.transparent,
          leading: Padding(
            padding:
                EdgeInsets.only(left: 23.w), // Tambahkan padding di sisi kiri
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                  size: 16,
                ),
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Banner
          Container(
            width: double.infinity,
            height: 316.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage("assets/images/allstorebanner.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 63.h),

          /// Section: Judul + Lihat Semua
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Toko terbaik untuk kamu",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: navigasi ke semua toko
                  },
                  child: const Text(
                    "Lihat semuanya",
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.h),

          /// Section: AllStoreSection (horizontal list)
          const Padding(
            padding: EdgeInsets.only(left: 23), // biar sejajar sama title
            child: AllStoreSection(),
          ),

          SizedBox(height: 40.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Toko terdekat dari posisi kamu",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: navigasi ke semua toko
                  },
                  child: const Text(
                    "Lihat semuanya",
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
