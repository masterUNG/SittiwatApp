// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sittiwat_app/a_login/class_user/class_profile_uid.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ProfileNameGmail extends StatefulWidget {
  const ProfileNameGmail({Key? key}) : super(key: key);

  @override
  _ProfileNameGmailState createState() => _ProfileNameGmailState();
}

class _ProfileNameGmailState extends State<ProfileNameGmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_if_null_operators
          MyStyle().fonWhite15(displayName ?? 'Non ?'),
          // ignore: prefer_if_null_operators
          MyStyle().fonWhite12(email ?? 'Non ?'),
        ],
      ),
    );
  }

  var displayName, email;

  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    // findDisplayName();
    readDataUser();
  }

  Future<void> readDataUser() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      String uid = event!.uid;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .get()
          .then((value) {
        setState(() {
          userModel = UserModel.fromMap(value.data()!);
          displayName = '${userModel!.name} \n ${userModel!.cord}';
          email = userModel!.email;
        });
      });
    });
  }

  Future<Null> findDisplayName() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          displayName = event!.displayName!;
          email = event.email!;
        });
      });
    });
  }
}
