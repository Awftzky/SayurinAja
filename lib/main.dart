import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayurinaja/App/core/global/bindings/global_bindings.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // APP HANYA BISA POTRET
  await LocalStorage().initPrefs(); // Inisialisasi Storage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'SayurinAja',
        initialBinding: GlobalBindings(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes, // PageView & Binding
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
