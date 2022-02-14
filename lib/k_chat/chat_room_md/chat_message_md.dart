import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name.dart';

class ChatMessageMD extends StatelessWidget {
  final String meaaage;

  // ignore: use_key_in_widget_constructors
  const ChatMessageMD(
    this.meaaage,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        // mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green.shade50,
            //backgroundImage: NetworkImage(photoUrl),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileName(),
              Container(
                width: 150,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MyStyle().fonBack15(meaaage),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
