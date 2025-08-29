import 'package:get/get.dart';
import 'package:sayurinaja/App/features/chat/controller/chat_controller.dart';
class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}