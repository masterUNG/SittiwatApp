import 'dart:convert';



class UserModel {
 final String email;
 final String name;
 final String cord;
 final String typeuser;
  UserModel({
    required this.email,
    required this.name,
    required this.cord,
    required this.typeuser,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? cord,
    String? typeuser,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      cord: cord ?? this.cord,
      typeuser: typeuser ?? this.typeuser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'cord': cord,
      'typeuser': typeuser,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      cord: map['cord'],
      typeuser: map['typeuser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, cord: $cord, typeuser: $typeuser)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.email == email &&
      other.name == name &&
      other.cord == cord &&
      other.typeuser == typeuser;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      name.hashCode ^
      cord.hashCode ^
      typeuser.hashCode;
  }
}








