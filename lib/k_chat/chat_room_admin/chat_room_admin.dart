import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_room_admin/new_message_chat_admin.dart';
import 'package:sittiwat_app/k_chat/chat_room_admin/show_message_admin.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class ChatAdmin extends StatefulWidget {
  const ChatAdmin({Key? key}) : super(key: key);

  @override
  _ChatAdminState createState() => _ChatAdminState();
}

class _ChatAdminState extends State<ChatAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: MyStyle().fonWhite15("ยินดีให้คำปรึกษา และ รับคำติชม"),
              leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, "/story"),
                icon: Icon(
                  Icons.switch_account_outlined,
                  color: Colors.orangeAccent.shade700,
                  size: 20,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/profilecontrol"),
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.orangeAccent.shade700,
                    size: 20,
                  ),
                ),
              ],

              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.shade200,
              expandedHeight: 300,
              floating: false,
              //pinned: true,
              flexibleSpace: Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomClipperForAppBer(),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.greenAccent, Colors.green],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: Chewie(
                        controller: ChewieController(
                          aspectRatio: 4 / 2,
                          autoInitialize: true,
                          looping: true,
                          autoPlay: true,
                          fullScreenByDefault: false,
                          videoPlayerController: VideoPlayerController.asset(
                              "lib/video/intorlkaset3.mp4"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: const [
                  Expanded(
                    child: ShowMessageAdMin(),
                  ),
                  NewMessageChatAdMin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
