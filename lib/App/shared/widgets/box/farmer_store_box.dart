import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';

class FarmerStoreBox extends StatefulWidget {
  final String imageUrl;
  final String storeName;
  final String location;
  final String starReview;
  final VoidCallback? onButtonPressed;
  final double width;
  final double height;
  final bool isLiked;

  const FarmerStoreBox({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.location,
    required this.starReview,
    this.onButtonPressed,
    this.width = 297, // default
    this.height = 115, // default
    this.isLiked = false,
  });

  @override
  State<FarmerStoreBox> createState() => _FarmerStoreBoxState();
}

class _FarmerStoreBoxState extends State<FarmerStoreBox> {
  late bool _liked;

  @override
  void initState() {
    super.initState();
    _liked = widget.isLiked;
  }

  void _toggleLike() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.height.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
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
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Right Side: Text and Button
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0.w),
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
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggleLike,
                        child: Icon(
                          Icons.favorite,
                          size: 16,
                          color: _liked ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),

                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.primary, size: 16),
                      const SizedBox(width: 4),
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
                  const Spacer(),

                  MainButton(
                    text: "Rekomen buat kamu nih",
                    width: (widget.width * 0.55).w,
                    height: 19.h,
                    textSize: 8,
                    fontWeight: FontWeight.w500,
                    onPressed: widget.onButtonPressed,
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
