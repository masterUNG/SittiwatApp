import 'dart:convert';


//คลาสห้องจ่ายเงินค่าประกันสินค้าประมูล ("จ่ายเงินประกันสินค้าประมูล")
class Guarant {
   String choice;
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  Guarant({
    required this.choice,
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  

 

  Guarant copyWith({
    String? choice,
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return Guarant(
      choice: choice ?? this.choice,
      image: image ?? this.image,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      user3: user3 ?? this.user3,
      user4: user4 ?? this.user4,
      user5: user5 ?? this.user5,
      user6: user6 ?? this.user6,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'choice': choice});
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory Guarant.fromMap(Map<String, dynamic> map) {
    return Guarant(
      choice: map['choice'] ?? '',
      image: map['image'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Guarant.fromJson(String source) => Guarant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Guarant(choice: $choice, image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Guarant &&
      other.choice == choice &&
      other.image == image &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6;
  }

  @override
  int get hashCode {
    return choice.hashCode ^
      image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}
