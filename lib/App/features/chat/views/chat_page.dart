import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/features/chat/views/chat_seller_page.dart';
import 'package:sayurinaja/App/features/chat/views/chat_delivery_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ChatSellerPage(),
    ChatDeliveryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.grey[300],
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                    child: Text(
                      "Pesan",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  /// TabBar + Avatar
                  Container(
                    height: 51.h,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildTabItem(0, "Pengantar"),
                              SizedBox(width: 8.w),
                              _buildTabItem(1, "Penjual"),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }

  /// Tab Item Builder
  Widget _buildTabItem(int index, String title) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
