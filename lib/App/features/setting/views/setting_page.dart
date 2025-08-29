import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Header
          Container(
            color: Colors.grey[300],
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Search Button
          Padding(
            padding: EdgeInsets.all(16.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari pengaturan...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 12.w,
                ),
              ),
            ),
          ),

          /// Profile Tile
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            leading: CircleAvatar(
              radius: 36.r, // w=72/2
              backgroundColor: Colors.blueAccent,
              child: const Icon(Icons.person, size: 40, color: Colors.white),
            ),
            title: Text(
              "Username",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "username@email.com",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                /// TODO: Navigate to profile setting page
              },
            ),
          ),

          /// Divider garis panjang
          Divider(thickness: 1, color: Colors.grey[400]),

          /// Menu Section
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              children: [
                _buildSection("Akun Saya", [
                  _buildSettingButton("Keamanan Akun"),
                  _buildSettingButton("Alamat Saya"),
                  _buildSettingButton("Rekening"),
                ]),
                _buildSection("Notifikasi", [
                  _buildSettingButton("Pengaturan Notifikasi"),
                ]),
                _buildSection("Bantuan", [
                  _buildSettingButton("Pusat Bantuan"),
                  _buildSettingButton("Kebijakan Privasi"),
                  _buildSettingButton("Syarat & Ketentuan"),
                ]),
                _buildSection("Tentang Aplikasi", [
                  _buildSettingButton("Informasi Aplikasi"),
                ]),
              ],
            ),
          ),

          /// Logout Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  /// TODO: Logout
                },
                child: Text(
                  "Keluar Dari Akun",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          /// Version Info
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Text(
              "Versi Aplikasi 1.0",
              style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Builder
  Widget _buildSection(String title, List<Widget> buttons) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.h),
          Column(children: buttons),
        ],
      ),
    );
  }

  /// Button Builder
  Widget _buildSettingButton(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: const BorderSide(color: Colors.grey),
          ),
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {
          /// TODO: Navigate
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
