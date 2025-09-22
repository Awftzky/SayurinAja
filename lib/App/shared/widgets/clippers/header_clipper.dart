import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  final double cornerRadius;

  HeaderClipper({this.cornerRadius = 32.0});

  @override
  Path getClip(Size size) {
    // Path adalah objek yang digunakan untuk menggambar bentuk 2D.
    Path path = Path();

    // Mulai menggambar dari pojok kiri atas (titik 0,0)
    path.lineTo(0, size.height - cornerRadius);

    // Membuat kurva/lengkungan di pojok kiri bawah
    // Titik kontrolnya adalah pojok kiri bawah (0, size.height)
    // Titik akhirnya adalah (cornerRadius, size.height)
    path.quadraticBezierTo(
      0,
      size.height,
      cornerRadius,
      size.height,
    );

    // Menggambar garis lurus di bagian bawah sampai ke awal lengkungan kanan
    path.lineTo(size.width - cornerRadius, size.height);

    // Membuat kurva/lengkungan di pojok kanan bawah
    // Titik kontrolnya adalah pojok kanan bawah (size.width, size.height)
    // Titik akhirnya adalah (size.width, size.height - cornerRadius)
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - cornerRadius,
    );

    // Menggambar garis lurus ke atas sampai pojok kanan atas
    path.lineTo(size.width, 0);

    // Menutup path, secara otomatis akan menarik garis kembali ke titik awal (0,0)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Kita set `false` karena bentuknya tidak akan berubah secara dinamis.
    // Ini adalah optimisasi agar tidak perlu menggambar ulang.
    return false;
  }
}
