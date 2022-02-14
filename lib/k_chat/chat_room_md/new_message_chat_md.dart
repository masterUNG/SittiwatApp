import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessageChatMD extends StatefulWidget {
  const NewMessageChatMD({Key? key}) : super(key: key);

  @override
  _NewMessageChatMDState createState() => _NewMessageChatMDState();
}

class _NewMessageChatMDState extends State<NewMessageChatMD> {
  var _msgString = "";
  final _msgController = TextEditingController();

  void _sendMsg() async {
    FocusScope.of(context).unfocus();

    final userInfo = FirebaseAuth.instance.currentUser!.uid;

    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(userInfo)
        .get();

    await FirebaseFirestore.instance.collection("แชททีมบริหาร").doc().set({
      "text": _msgString,
      "timeStamp": Timestamp.now(),
    });
    _msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (val) {
                setState(() {
                  _msgString = val;
                });
              },
              controller: _msgController,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              decoration: InputDecoration(
                hintText: "Semd Message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: _msgController.text.isEmpty ? null : _sendMsg,
            icon: const Icon(
              Icons.send,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
