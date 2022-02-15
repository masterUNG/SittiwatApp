// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final String cord;
  final String typeuser;
  final String urlProfile;
  UserModel({
    required this.email,
    required this.name,
    required this.cord,
    required this.typeuser,
    required this.urlProfile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'cord': cord,
      'typeuser': typeuser,
      'urlProfile': urlProfile,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: (map['email'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      cord: (map['cord'] ?? '') as String,
      typeuser: (map['typeuser'] ?? '') as String,
      urlProfile: (map['urlProfile'] ?? '') as String,
    );
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
