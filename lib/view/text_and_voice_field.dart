import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../read_data/chats_provider.dart';
import 'package:muslim_in/read_data/post_result_model.dart';
import '../util/voice_handler.dart';
import '../read_data/chat_model.dart';
import 'toggle_button.dart';

enum InputMode {
  text,
  voice,
}

class TextAndVoiceField extends ConsumerStatefulWidget {
  const TextAndVoiceField({super.key});

  @override
  ConsumerState<TextAndVoiceField> createState() => _TextAndVoiceFieldState();
}

class _TextAndVoiceFieldState extends ConsumerState<TextAndVoiceField> {
  InputMode _inputMode = InputMode.voice;
  final _messageController = TextEditingController();
  late PostResult _postResult;
  final VoiceHandler voiceHandler = VoiceHandler();
  var _isReplying = false;
  var _isListening = false;

  @override
  void initState() {
    voiceHandler.initSpeech();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _postResult.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: false,
            style: TextStyle(
              color: Color(0xffD0E1F9),
            ),
            controller: _messageController,
            onChanged: (value) {
              value.isNotEmpty
                  ? setInputMode(InputMode.text)
                  : setInputMode(InputMode.voice);
            },
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              hoverColor: Color(0xffD0E1F9),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              labelText: 'Curhat disini...',
              labelStyle: TextStyle(
                color: Color(0xffD0E1F9),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: Color(0xffD0E1F9))),
              //
            ),
          ),
        ),
        const SizedBox(
          width: 06,
        ),
        ToggleButton(
          isListening: _isListening,
          isReplying: _isReplying,
          inputMode: _inputMode,
          sendTextMessage: () {
            final message = _messageController.text;
            _messageController.clear();
            sendTextMessage(message);
          },
          sendVoiceMessage: sendVoiceMessage,
        )
      ],
    );
  }

  void setInputMode(InputMode inputMode) {
    setState(() {
      _inputMode = inputMode;
    });
  }

  void sendVoiceMessage() async {
    if (!voiceHandler.isEnabled) {
      print('Not supported');
      return;
    }
    if (voiceHandler.speechToText.isListening) {
      await voiceHandler.stopListening();
      setListeningState(false);
    } else {
      setListeningState(true);
      final result = await voiceHandler.startListening();
      setListeningState(false);
      sendTextMessage(result);
    }
  }

  void sendTextMessage(String message) async {
    setReplyingState(true);
    addToChatList(message, DateTime.now(), true);
    addToChatList(
      'Typing...',
      DateTime.now(),
      false,
    );

    setInputMode(InputMode.voice);
    // final chatResponse = await _postResult.response;
    final chatResponse =
        PostResult.connectToAPI(message).then((value) => setState(() {
              Object pesan = value;
              removeTyping();
              addToChatList(
                pesan.toString(),
                DateTime.now(),
                false,
              );
            }));

    // Message(text: chatResponse, date: DateTime.now(), isSentByMe: false);

    setReplyingState(false);
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void setListeningState(bool isListening) {
    setState(() {
      _isListening = isListening;
    });
  }

  void removeTyping() {
    final chats = ref.read(chatsProvider.notifier);
    chats.removeTyping();
  }

  void addToChatList(String message, DateTime date, bool isMe) {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(
      Message(
        text: message,
        date: date,
        isSentByMe: isMe,
      ),
    );
  }

  void openingChat() {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(Message(
      text: 'Halo! Mau curhat apa hari ini?',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ));
  }
  // final List<Message> chats = [
  //   Message(
  //     text: 'Halo! Mau curhat apa hari ini?',
  //     date: DateTime.now().subtract(Duration(minutes: 1)),
  //     isSentByMe: false,
  //   ),
  // ];
}
