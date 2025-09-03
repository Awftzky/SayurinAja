import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class CustomInputAuth extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final Color borderColor;

  const CustomInputAuth({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.width,
    this.height,
    this.borderColor = Colors.black,
  });

  @override
  State<CustomInputAuth> createState() => _CustomInputAuthState();
}

class _CustomInputAuthState extends State<CustomInputAuth> {
  bool _obscure = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // refresh biar suffixIcon bisa muncul/hilang
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width?.w ?? double.infinity,
      height: widget.height?.h ?? 66.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            blurRadius: 7.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        focusNode: _focusNode,
        controller: widget.controller,
        obscureText: widget.obscureText ? _obscure : false,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: 13.sp,
            color: AppColors.black,
          ),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: widget.borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),

          /// ICONN SHOW PASSWORD
          suffixIcon: widget.obscureText && _focusNode.hasFocus
              ? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
