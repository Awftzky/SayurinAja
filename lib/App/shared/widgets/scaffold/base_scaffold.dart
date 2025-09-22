import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool useGradient;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage; // WELCOMING SCAFFOLD
  final bool? isExtend;
  final Widget? header; // COSTUM HEADER
  final bool? isFixed;

  const BaseScaffold({
    super.key,
    this.body,
    this.appBar,
    this.floatingActionButton,
    this.useGradient = false,
    this.backgroundColor,
    this.backgroundImage,
    this.isExtend,
    this.header,
    this.isFixed,
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
        extendBodyBehindAppBar: isExtend ?? true,
        floatingActionButton: floatingActionButton,
        body: body == null
            ? null
            : SafeArea(
                top: false, // Notch ATAS
                bottom: true, // Nav BAWAH
                child: _buildBodyWithHeader()),
      ),
    );
  }

  Widget _buildBodyWithHeader() {
    if (header == null) {
      return body ?? const SizedBox.shrink();
    }

    return Stack(
      children: [
        if (isFixed == false)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: header!,
          ),
        body ?? const SizedBox.shrink(),

        if (isFixed == true)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: header!,
          ),
      ],
    );
  }
}
