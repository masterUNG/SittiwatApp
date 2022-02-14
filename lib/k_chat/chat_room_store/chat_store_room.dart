import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_room_store/new_message_store.dart';
import 'package:sittiwat_app/k_chat/chat_room_store/show_message_store.dart';
import 'package:sittiwat_app/model/class_bar.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class ChatStoreRoom extends StatefulWidget {
  const ChatStoreRoom({Key? key}) : super(key: key);

  @override
  _ChatStoreRoomState createState() => _ChatStoreRoomState();
}

class _ChatStoreRoomState extends State<ChatStoreRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: MyStyle().fonWhite12(
                  "หลีกเลี่ยงการซื้อขายกันเองเพื่อป้องกันการโดนหลอก"),
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
                    child: ShowMessageStore(),
                  ),
                  NewMessageStore(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
