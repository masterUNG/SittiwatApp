
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sittiwat_app/model/my_style.dart';

class ProfileName extends StatefulWidget {
  const ProfileName({Key? key}) : super(key: key);

  @override
  _ProfileNameState createState() => _ProfileNameState();
}

class _ProfileNameState extends State<ProfileName> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_if_null_operators
    return MyStyle().fonBack15(displayName == null ? "Non ?" : displayName);
  }

   var displayName;
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<Null> findDisplayName() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          displayName = event!.displayName!;                   
                  
          
        });
       
      });
    });
  }
}
