import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class AddNotes extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AddNotes({super.key, required this.onTap, this.text = 'Catatan'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.shadowGrey,
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(10.r)),
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: Image.asset("assets/images/note.png"),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.black),
                )
              ],
            ),
          )),
    );
  }
}
