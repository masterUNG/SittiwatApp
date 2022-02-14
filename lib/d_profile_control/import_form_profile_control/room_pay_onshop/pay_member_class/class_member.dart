import 'dart:convert';

// //คลาสนี้ใช้ในการส่งข้อมูลการจ่ายเงินสมัครสมาชิกรายปีเปิดขายสินค้า
class OpenRoom {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
   String user7;
   String user8;
   String user9;
   String user10;
   String user11;
   String user12;
   String user13;
   String user14;
   String choice;
   String choice1;
  OpenRoom({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
    required this.user7,
    required this.user8,
    required this.user9,
    required this.user10,
    required this.user11,
    required this.user12,
    required this.user13,
    required this.user14,
    required this.choice,
    required this.choice1,
  });
  

  OpenRoom copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
    String? user7,
    String? user8,
    String? user9,
    String? user10,
    String? user11,
    String? user12,
    String? user13,
    String? user14,
    String? choice,
    String? choice1,
  }) {
    return OpenRoom(
      image: image ?? this.image,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      user3: user3 ?? this.user3,
      user4: user4 ?? this.user4,
      user5: user5 ?? this.user5,
      user6: user6 ?? this.user6,
      user7: user7 ?? this.user7,
      user8: user8 ?? this.user8,
      user9: user9 ?? this.user9,
      user10: user10 ?? this.user10,
      user11: user11 ?? this.user11,
      user12: user12 ?? this.user12,
      user13: user13 ?? this.user13,
      user14: user14 ?? this.user14,
      choice: choice ?? this.choice,
      choice1: choice1 ?? this.choice1,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
    result.addAll({'user7': user7});
    result.addAll({'user8': user8});
    result.addAll({'user9': user9});
    result.addAll({'user10': user10});
    result.addAll({'user11': user11});
    result.addAll({'user12': user12});
    result.addAll({'user13': user13});
    result.addAll({'user14': user14});
    result.addAll({'choice': choice});
    result.addAll({'choice1': choice1});
  
    return result;
  }

  factory OpenRoom.fromMap(Map<String, dynamic> map) {
    return OpenRoom(
      image: map['image'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
      user7: map['user7'] ?? '',
      user8: map['user8'] ?? '',
      user9: map['user9'] ?? '',
      user10: map['user10'] ?? '',
      user11: map['user11'] ?? '',
      user12: map['user12'] ?? '',
      user13: map['user13'] ?? '',
      user14: map['user14'] ?? '',
      choice: map['choice'] ?? '',
      choice1: map['choice1'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenRoom.fromJson(String source) => OpenRoom.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OpenRoom(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6, user7: $user7, user8: $user8, user9: $user9, user10: $user10, user11: $user11, user12: $user12, user13: $user13, user14: $user14, choice: $choice, choice1: $choice1)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OpenRoom &&
      other.image == image &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6 &&
      other.user7 == user7 &&
      other.user8 == user8 &&
      other.user9 == user9 &&
      other.user10 == user10 &&
      other.user11 == user11 &&
      other.user12 == user12 &&
      other.user13 == user13 &&
      other.user14 == user14 &&
      other.choice == choice &&
      other.choice1 == choice1;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode ^
      user7.hashCode ^
      user8.hashCode ^
      user9.hashCode ^
      user10.hashCode ^
      user11.hashCode ^
      user12.hashCode ^
      user13.hashCode ^
      user14.hashCode ^
      choice.hashCode ^
      choice1.hashCode;
  }
}


//คลาสร้านค้าขอใบกำกับภาษี ("ร้านขอใบกำกับภาษีค่าสมาชิกรายปี")
class TaxMember {
  String textChoice;
  String image;
  String user1;
  String user2;
  String user3;
  String user4;
  String user5;
  String user6;
  TaxMember({
    required this.textChoice,
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });

  

  TaxMember copyWith({
    String? textChoice,
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return TaxMember(
      textChoice: textChoice ?? this.textChoice,
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
  
    result.addAll({'textChoice': textChoice});
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory TaxMember.fromMap(Map<String, dynamic> map) {
    return TaxMember(
      textChoice: map['textChoice'] ?? '',
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

  factory TaxMember.fromJson(String source) => TaxMember.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaxMember(textChoice: $textChoice, image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TaxMember &&
      other.textChoice == textChoice &&
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
    return textChoice.hashCode ^
      image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}





