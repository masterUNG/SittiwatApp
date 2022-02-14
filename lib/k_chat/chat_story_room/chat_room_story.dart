import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_story_room/naw_message_chat.dart';
import 'package:sittiwat_app/k_chat/chat_story_room/show_message.dart';

class ChatRoomStory extends StatefulWidget {
  const ChatRoomStory({Key? key}) : super(key: key);

  @override
  _ChatRoomStoryState createState() => _ChatRoomStoryState();
}

class _ChatRoomStoryState extends State<ChatRoomStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.shade400,
      body: Column(
        children: const [
          Expanded(
            child: ShowMessage(),
          ),
          NewMessageChat(),
        ],
      ),
    );
  }
}
