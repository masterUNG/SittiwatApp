import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sittiwat_app/a_login/class_user/class_profile_uid.dart';

class GetUserModel {
  Future<UserModel?> processGetUserModel() async {
    UserModel? userModel;

    var uid = FirebaseAuth.instance.currentUser!.uid;
    var result =
        await FirebaseFirestore.instance.collection('user').doc(uid).get();

    userModel = UserModel.fromMap(result.data()!);

    return userModel;
  }
}
