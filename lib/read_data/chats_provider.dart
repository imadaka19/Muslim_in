import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'chat_model.dart';

class ChatNotifier extends StateNotifier<List<Message>> {
  ChatNotifier() : super([]);

  void add(Message message) {
    state = [...state, message];
  }

  void removeTyping() {
    state = state..removeWhere((chat) => chat.text == 'Typing...');
  }
}

final chatsProvider = StateNotifierProvider<ChatNotifier, List<Message>>(
  (ref) => ChatNotifier(),
);
