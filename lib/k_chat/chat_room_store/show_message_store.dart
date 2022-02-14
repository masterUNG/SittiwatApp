import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_room_store/chat_message_store.dart';

class ShowMessageStore extends StatefulWidget {
  const ShowMessageStore({Key? key}) : super(key: key);

  @override
  _ShowMessageStoreState createState() => _ShowMessageStoreState();
}

class _ShowMessageStoreState extends State<ShowMessageStore> {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("แชทร้านค้ากับลูกค้า")
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
          itemBuilder: (ctx, i) => ChatMessageStore(
            chatDocs[i]["text"],
          ),
        );
      },
    );
  }
}
