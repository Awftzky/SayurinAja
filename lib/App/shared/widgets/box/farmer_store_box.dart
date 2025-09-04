import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';

class StoreCard extends StatelessWidget {
  final String imageUrl;
  final String storeName;
  final String location;
  final String starReview;
  final VoidCallback? onButtonPressed;

  const StoreCard({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.location,
    required this.starReview,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 297.w, // Specified width
      height: 115.h, // Specified height
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Side: Image
          Container(
            width: 114.w, // Adjust as needed for your image proportion
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(imageUrl), // Use AssetImage for local images
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Right Side: Text and Button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    storeName,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.primary, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
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
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        starReview,
                        style: const TextStyle(
                          fontSize: 8,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(), // Pushes the button to the bottom
                  MainButton(
                    text: "Rekomen buat kamu nih",
                    width: 158.w,
                    height: 19.h,
                    textSize: 8,
                    fontWeight: FontWeight.w500,
                    onPressed: () {},

                    /// NAVIGASI KEDALAM STORE
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
