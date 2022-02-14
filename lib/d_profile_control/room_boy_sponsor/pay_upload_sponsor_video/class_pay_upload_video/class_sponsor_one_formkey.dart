import 'dart:convert';

//คลาสส่งข้อมูลห้องอัป จ่ายเงินค่าโฆษณาVDO ("จ่ายค่าโฆษณาVDOแบบที่1")
class SponsorOneFormkey1 {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorOneFormkey1({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
 

  SponsorOneFormkey1 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorOneFormkey1(
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
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorOneFormkey1.fromMap(Map<String, dynamic> map) {
    return SponsorOneFormkey1(
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

  factory SponsorOneFormkey1.fromJson(String source) => SponsorOneFormkey1.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorOneFormkey1(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorOneFormkey1 &&
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
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป จ่ายเงินค่าโฆษณาVDO ("จ่ายค่าโฆษณาVDOแบบที่2")
class SponsorOneFormkey2 {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorOneFormkey2({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
 

  SponsorOneFormkey2 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorOneFormkey2(
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
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorOneFormkey2.fromMap(Map<String, dynamic> map) {
    return SponsorOneFormkey2(
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

  factory SponsorOneFormkey2.fromJson(String source) => SponsorOneFormkey2.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorOneFormkey2(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorOneFormkey2 &&
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
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป จ่ายเงินค่าโฆษณาVDO ("จ่ายค่าโฆษณาVDOแบบที่3")
class SponsorOneFormkey {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorOneFormkey({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
 

  SponsorOneFormkey copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorOneFormkey(
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
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorOneFormkey.fromMap(Map<String, dynamic> map) {
    return SponsorOneFormkey(
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

  factory SponsorOneFormkey.fromJson(String source) => SponsorOneFormkey.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorOneFormkey(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorOneFormkey &&
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
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป จ่ายเงินค่าโฆษณาVDO ("จ่ายค่าโฆษณาVDOแบบที่4")
class SponsorOneFormkey4 {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorOneFormkey4({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
 

  SponsorOneFormkey4 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorOneFormkey4(
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
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorOneFormkey4.fromMap(Map<String, dynamic> map) {
    return SponsorOneFormkey4(
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

  factory SponsorOneFormkey4.fromJson(String source) => SponsorOneFormkey4.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorOneFormkey4(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorOneFormkey4 &&
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
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป จ่ายเงินค่าโฆษณาVDO ("จ่ายค่าโฆษณาVDOแบบที่5")
class SponsorOneFormkey5 {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorOneFormkey5({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
 

  SponsorOneFormkey5 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorOneFormkey5(
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
  
    result.addAll({'image': image});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorOneFormkey5.fromMap(Map<String, dynamic> map) {
    return SponsorOneFormkey5(
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

  factory SponsorOneFormkey5.fromJson(String source) => SponsorOneFormkey5.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorOneFormkey5(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorOneFormkey5 &&
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
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}
