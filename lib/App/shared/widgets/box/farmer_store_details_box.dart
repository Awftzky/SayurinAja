import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class FarmerStoreDetailsBox extends StatefulWidget {
  final String imageUrl;
  final String storeName;
  final String location;
  final String starReview;
  final String description;
  final double width;
  final double height;

  const FarmerStoreDetailsBox({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.location,
    required this.starReview,
    required this.description,
    this.width = 336, // default
    this.height = 130, // lebih tinggi utk muat description
  });

  @override
  State<FarmerStoreDetailsBox> createState() => _FarmerStoreDetailsBoxState();
}

class _FarmerStoreDetailsBoxState extends State<FarmerStoreDetailsBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.height.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32.r), // CONTAINER KESELURUHAN
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Left Side: Image
          Container(
            width: (widget.width * 0.38).w,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.r),
                  topLeft: Radius.circular(32.r)),
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Right Side: Text & Description
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Row: Store name + Like button
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.storeName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.primary, size: 16),
                      Expanded(
                        child: Text(
                          widget.location,
                          style: const TextStyle(
                            fontSize: 8,
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        widget.starReview,
                        style: const TextStyle(
                          fontSize: 8,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  /// Description title
                  const Text(
                    "Deskripsi :",
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  /// Description text
                  Expanded(
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w300,
                        color: AppColors.black,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
