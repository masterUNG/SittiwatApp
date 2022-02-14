import 'dart:convert';

//คลาสนี้เป็นการส่งค่าโพสประมูลสินค้าทั่วไปจากห้องสมาชิกประมูลสินค้า 
//ชุดที่ 1
class PosAuction1 {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String choice1;
   String choice2;
   String choice3;
   String choice4;
  PosAuction1({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.choice1,
    required this.choice2,
    required this.choice3,
    required this.choice4,
  });
  

  

  PosAuction1 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? choice1,
    String? choice2,
    String? choice3,
    String? choice4,
  }) {
    return PosAuction1(
      image: image ?? this.image,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      user3: user3 ?? this.user3,
      user4: user4 ?? this.user4,
      choice1: choice1 ?? this.choice1,
      choice2: choice2 ?? this.choice2,
      choice3: choice3 ?? this.choice3,
      choice4: choice4 ?? this.choice4,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'choice1': choice1});
    result.addAll({'choice2': choice2});
    result.addAll({'choice3': choice3});
    result.addAll({'choice4': choice4});
  
    return result;
  }

  factory PosAuction1.fromMap(Map<String, dynamic> map) {
    return PosAuction1(
      image: map['image'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      choice1: map['choice1'] ?? '',
      choice2: map['choice2'] ?? '',
      choice3: map['choice3'] ?? '',
      choice4: map['choice4'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PosAuction1.fromJson(String source) => PosAuction1.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PosAuction1(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, choice1: $choice1, choice2: $choice2, choice3: $choice3, choice4: $choice4)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PosAuction1 &&
      other.image == image &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.choice1 == choice1 &&
      other.choice2 == choice2 &&
      other.choice3 == choice3 &&
      other.choice4 == choice4;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      choice1.hashCode ^
      choice2.hashCode ^
      choice3.hashCode ^
      choice4.hashCode;
  }
}
