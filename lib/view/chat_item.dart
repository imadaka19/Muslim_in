import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String text;
  final bool isMe;
  const ChatItem({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        // horizontal: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // if (!isMe) ProfileContainer(isMe: isMe),
          if (!isMe) const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: BoxDecoration(
              color: isMe ? Color(0xFF272A35) : Colors.grey.shade300,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(15),
                bottomRight: const Radius.circular(15),
                topLeft: Radius.circular(isMe ? 15 : 0),
                topRight: Radius.circular(isMe ? 0 : 15),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.grey.shade300 : Color(0xFF272A35),
              ),
            ),
          ),
          if (isMe) const SizedBox(width: 15),
          // if (isMe) ProfileContainer(isMe: isMe),
        ],
      ),
    );
  }
}
