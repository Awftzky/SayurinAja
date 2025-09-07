// import 'package:flutter/material.dart';

// class SpotlightPainter extends CustomPainter {
//   final Color color;
//   final double intensity;

//   SpotlightPainter({
//     required this.color,
//     required this.intensity,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..shader = RadialGradient(
//         center: const Alignment(0, -0.8),
//         radius: 1.2,
//         colors: [
//           color.withOpacity(0.5 * intensity),
//           color.withOpacity(0.25 * intensity),
//           color.withOpacity(0.1 * intensity),
//           Colors.transparent,
//         ],
//         stops: const [0.0, 0.3, 0.6, 1.0],
//       ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

//     final path = Path()
//       ..moveTo(size.width * 0.5, 0)
//       ..lineTo(size.width * 0.2, size.height)
//       ..lineTo(size.width * 0.8, size.height)
//       ..close();

//     canvas.drawPath(path, paint);

//     final glowPaint = Paint()
//       ..shader = RadialGradient(
//         center: const Alignment(0, -0.5),
//         radius: 0.8,
//         colors: [
//           color.withOpacity(0.3 * intensity),
//           Colors.transparent,
//         ],
//       ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
//       ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

//     canvas.drawCircle(
//       Offset(size.width * 0.5, size.height * 0.3),
//       30,
//       glowPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant SpotlightPainter oldDelegate) {
//     return oldDelegate.intensity != intensity;
//   }
// }
