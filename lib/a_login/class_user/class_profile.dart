import 'dart:convert';

//คลาสส่งข้อมูล Email ที่สมัครเข้าสู่แอพขึ้น ไฟเบท
class Profile {
   String user;
   String pisane;
   String email;
   String password;
  Profile({
    required this.user,
    required this.pisane,
    required this.email,
    required this.password,
  });

  

  

 

  Profile copyWith({
    String? user,
    String? pisane,
    String? email,
    String? password,
  }) {
    return Profile(
      user: user ?? this.user,
      pisane: pisane ?? this.pisane,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user': user});
    result.addAll({'pisane': pisane});
    result.addAll({'email': email});
    result.addAll({'password': password});
  
    return result;
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      user: map['user'] ?? '',
      pisane: map['pisane'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Profile(user: $user, pisane: $pisane, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Profile &&
      other.user == user &&
      other.pisane == pisane &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return user.hashCode ^
      pisane.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
