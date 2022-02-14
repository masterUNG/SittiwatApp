import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_room_md/new_message_chat_md.dart';
import 'package:sittiwat_app/k_chat/chat_room_md/show_message_md.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:sittiwat_app/model/show_profile/profile_name_gmail.dart';

class ChatRoomMd extends StatefulWidget {
  const ChatRoomMd({Key? key}) : super(key: key);

  @override
  _ChatRoomMdState createState() => _ChatRoomMdState();
}

class _ChatRoomMdState extends State<ChatRoomMd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: SafeArea(
        child: Column(
          children: [


            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade900,
                    Colors.greenAccent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/story"),
                            icon: const Icon(
                              Icons.switch_account_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          MyStyle().fonWhite12("สตอรี่")
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: MyStyle().greenColor,
                        radius: 32,
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/profilecontrol"),
                            icon: const Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          MyStyle().fonWhite12("ฉัน")
                        ],
                      ),
                    ],
                  ),
                  const Expanded(child: ProfileNameGmail()),
                  Center(child: MyStyle().fonBack20("Thai...KASET HEY")),
                  Center(
                      child: MyStyle().fonBack15(
                          "ยินดีต้อนรับทุกท่าน เชิญแบ่งปันทักษะการบริหาร")),
                ],
              ),
            ),
           

            const Expanded(
              child: ShowMessageMD(),
            ),
            const NewMessageChatMD(),
          ],
        ),
      ),
    );
  }
}
