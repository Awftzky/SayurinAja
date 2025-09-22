import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/widgets/tile/chat_tile.dart';

class ChatSellerPage extends StatelessWidget {
  const ChatSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// BUILD PAKAI COUNT
    return ListView.separated(
      itemCount: 3,

      /// JUMLAH CHAT
      separatorBuilder: (context, index) => Divider(height: 1, indent: 85),
      itemBuilder: (context, index) {
        return ChatTile(
          username: 'Penjual ${index + 1}',
          lastMessage: 'Barang siap dikirim...',
          time: '09:4${index} AM',
          unreadCount: index == 1 ? 5 : 0,
          onTap: () {},
        );
      },
    );
  }
}
