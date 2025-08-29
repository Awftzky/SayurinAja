import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/widgets/tile/chat_tile.dart';

class ChatDeliveryPage extends StatelessWidget {
  const ChatDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => Divider(height: 1, indent: 85),
      itemBuilder: (context, index) {
        return ChatTile(
          username: 'Pengantar ${index + 1}',
          lastMessage: 'Status pengiriman...',
          time: '12:0${index} PM',
          unreadCount: index == 0 ? 2 : 0,
          onTap: () {
            /// TODO : ROUTE DETAIL PAGE
          },
        );
      },
    );
  }
}
