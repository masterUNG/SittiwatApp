import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sittiwat_app/k_chat/chat_room_md/chat_message_md.dart';

class ShowMessageMD extends StatefulWidget {
  const ShowMessageMD({Key? key}) : super(key: key);

  @override
  _ShowMessageMDState createState() => _ShowMessageMDState();
}

class _ShowMessageMDState extends State<ShowMessageMD> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("แชททีมบริหาร")
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
          itemBuilder: (ctx, i) => ChatMessageMD(
            chatDocs[i]["text"],
          ),
        );
      },
    );
  }
}
