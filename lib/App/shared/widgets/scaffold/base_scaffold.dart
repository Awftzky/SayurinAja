import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool useGradient;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;

  const BaseScaffold({
    super.key,
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.useGradient = false,
    this.backgroundColor,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: useGradient ? null : (backgroundColor ?? AppColors.shadowGrey),
        gradient: useGradient ? AppGradients.onboarding : null,
        image: backgroundImage,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        extendBodyBehindAppBar: true,
        floatingActionButton: floatingActionButton,
        body: body == null
            ? null
            : SafeArea(
                top: false, // biarin notch atas
                bottom: true, // cuma amanin bawah
                child: body!,
              ),
      ),
    );
  }
}
