// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class YearMemberModel {
  final bool approve;
  final Timestamp startMember;
  final Timestamp expireMember;
  YearMemberModel({
    required this.approve,
    required this.startMember,
    required this.expireMember,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'approve': approve,
      'startMember': startMember,
      'expireMember': expireMember,
    };
  }

  factory YearMemberModel.fromMap(Map<String, dynamic> map) {
    return YearMemberModel(
      approve: (map['approve'] ?? false) as bool,
      startMember: map['startMember'],
      expireMember: map['expireMember'],
    );
  }

  factory YearMemberModel.fromJson(String source) => YearMemberModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
