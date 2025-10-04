import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/section/home/store/allstore_section.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/shared/widgets/search/fake_search_bar.dart';

class AllStorePage extends GetView<HomeController> {
  const AllStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: false,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: 26,
              ),
            ),
          ),
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: Container(
              padding: EdgeInsets.only(
                  left: 5.w, right: 15.w, top: 5.h, bottom: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.location_pin,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Obx(
                    () => Text(
                      controller.globalLocation.locationName.value,
                      style: TextStyle(fontSize: 8.sp),
                    ),
                  ),
                ],
              )),
        ),
      ),

      /// BODY
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Banner + FakeSearchBar
          Stack(
            clipBehavior: Clip.none,
            children: [
              /// Banner
              Container(
                width: double.infinity,
                height: 316.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/allstorebanner.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// Fake Search Bar (menggantung di bawah banner)
              Positioned(
                left: 60.w,
                right: 60.w,
                bottom: -20.h,
                child: FakeSearchBar(
                  onTap: () => Get.toNamed(Routes.SEARCHSTORE),
                  height: 40.h,
                  hintText: "Cari toko yang kamu mau tuju disini ya",
                ),
              ),
            ],
          ),

          /// Spacer agar konten tidak tertimpa FakeSearchBar
          SizedBox(height: 40.h),

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
                  onPressed: () => Get.toNamed(Routes.BESTSTORE),
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

          SizedBox(height: 9.h),

          /// Section: AllStoreSection (horizontal list)
          const Padding(
            padding: EdgeInsets.only(left: 23), // biar sejajar sama title
            child: AllStoreSection(),
          ),

          SizedBox(height: 40.h),

          /// Section kedua: Judul + Lihat Semua
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
                  onPressed: () => Get.toNamed(Routes.CLOSESTSTORE),
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
          SizedBox(
            height: 9.h,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 23), // biar sejajar sama title
            child: AllStoreSection(),
          ),
        ],
      ),
    );
  }
}
