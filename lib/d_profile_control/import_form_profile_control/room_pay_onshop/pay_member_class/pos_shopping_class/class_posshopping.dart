import 'dart:convert';

//คลาสนี้เป็นการส่งค่าโพสขายสินค้าทั่วไปจากห้องสมาชิกรายปี ห้องที่32
//ชุดที่ 1
class PosShopping1 {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String choice;
  PosShopping1({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.choice,
  });
  

 

  PosShopping1 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? choice,
  }) {
    return PosShopping1(
      image: image ?? this.image,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      user3: user3 ?? this.user3,
      user4: user4 ?? this.user4,
      choice: choice ?? this.choice,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'choice': choice});
  
    return result;
  }

  factory PosShopping1.fromMap(Map<String, dynamic> map) {
    return PosShopping1(
      image: map['image'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      choice: map['choice'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PosShopping1.fromJson(String source) => PosShopping1.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PosShopping1(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, choice: $choice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PosShopping1 &&
      other.image == image &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.choice == choice;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      choice.hashCode;
  }
}
