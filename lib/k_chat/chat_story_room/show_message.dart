import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_story_room/chat_message_story.dart';

class ShowMessage extends StatefulWidget {
  const ShowMessage({Key? key}) : super(key: key);

  @override
  _ShowMessageState createState() => _ShowMessageState();
}

class _ShowMessageState extends State<ShowMessage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("แชทห้องสตอรี่")
          .orderBy("timeStamp", descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.connectionState ==ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(),);
        }


        var chatDocs = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, i) => ChatMessageStory(
            chatDocs[i]["text"],
           
          ),
        );
      },
    );
  }
}
