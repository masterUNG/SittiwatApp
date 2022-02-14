import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_room_admin/chat_message_admin.dart';

class ShowMessageAdMin extends StatefulWidget {
  const ShowMessageAdMin({Key? key}) : super(key: key);

  @override
  _ShowMessageAdMinState createState() => _ShowMessageAdMinState();
}

class _ShowMessageAdMinState extends State<ShowMessageAdMin> {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("แชทแอดมิน")
          .orderBy("timeStamp", descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        var chatDocs = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, i) => ChatMessageAdmin(
            chatDocs[i]["text"],
          ),
        );
      },
    );
  }
}
