import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/model/my_style.dart';
import 'package:video_player/video_player.dart';

class MyShowSponsorVdoInStory extends StatefulWidget {
  const MyShowSponsorVdoInStory({Key? key}) : super(key: key);

  @override
  _MyShowSponsorVdoInStoryState createState() =>
      _MyShowSponsorVdoInStoryState();
}

class _MyShowSponsorVdoInStoryState extends State<MyShowSponsorVdoInStory> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    // ignore: avoid_print
    print("screen = $screen");

    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("uploadVDOโฆษณาแบบที่4")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map(
              (document) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(
                          width: screen * 0.45,
                          height: screen * 0.2,
                          child: Chewie(
                           // key: PageStorageKey(document["videoFile"]),
                            controller: ChewieController(
                              //aspectRatio: 50 / 100,
                               aspectRatio: 4 / 2,
                              autoInitialize: true,
                              looping: false,
                              autoPlay: false,
                              fullScreenByDefault: false,
                              videoPlayerController:
                                  VideoPlayerController.network(
                                      document["videoFile"]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyStyle().fonBack15(document["user1"]),
                              MyStyle().fonBack15(document["user2"]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
