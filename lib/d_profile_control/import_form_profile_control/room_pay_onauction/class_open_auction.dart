import 'dart:convert';

//คลาส จ่ายเงินขอเปิดห้องประมูลสินค้า

class OpenAuction {
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
  OpenAuction({
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
  });
 

 

  OpenAuction copyWith({
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
  }) {
    return OpenAuction(
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
  
    return result;
  }

  factory OpenAuction.fromMap(Map<String, dynamic> map) {
    return OpenAuction(
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
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenAuction.fromJson(String source) => OpenAuction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OpenAuction(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6, user7: $user7, user8: $user8, user9: $user9, user10: $user10)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OpenAuction &&
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
      other.user10 == user10;
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
      user10.hashCode;
  }
}
