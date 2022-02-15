// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckYearMember {
  final BuildContext context;
  CheckYearMember({
    required this.context,
  });

  Future<QuerySnapshot<Map<String, dynamic>>> processCheck() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var result = await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('yearmember')
        .get();
         return result;
  }
 
}
