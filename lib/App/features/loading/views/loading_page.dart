import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/features/loading/controller/loading_controller.dart';

class LoadingPage extends GetView<LoadingController> {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: true,
      body: Center(
        child: Obx(() => AnimatedOpacity(
              opacity: controller.opacity.value,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: 346.w,
                height: 346.h,
                child: Image.asset('assets/images/transparentlogo_3.png'),
              ),
            )),
      ),
    );
  }
}
