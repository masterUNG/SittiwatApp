import 'dart:convert';

//คลาสส่งข้อมูลห้องอัป จ่ายค่า (โฆษณาภาพนิ่งแบบที่1)
class SponsorTwoFormkey1 {
   String image;  
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey1({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
 
  
 

 

  SponsorTwoFormkey1 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey1(
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

  factory SponsorTwoFormkey1.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey1(
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

  factory SponsorTwoFormkey1.fromJson(String source) => SponsorTwoFormkey1.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey1(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey1 &&
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





//คลาสส่งข้อมูลห้องอัป ไฟรูปภาพ (โฆษณาภาพนิ่งแบบที่2)
class SponsorTwoFormkey2 {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey2({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  
 

 

  SponsorTwoFormkey2 copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey2(
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

  factory SponsorTwoFormkey2.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey2(
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

  factory SponsorTwoFormkey2.fromJson(String source) => SponsorTwoFormkey2.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey2(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey2 &&
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


//คลาสส่งข้อมูลห้องอัป ไฟรูปภาพ (โฆษณาภาพนิ่งแบบที่3)
class SponsorTwoFormkey3 {
   String sponsorImage;
   String monney;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey3({
    required this.sponsorImage,
    required this.monney,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  

  SponsorTwoFormkey3 copyWith({
    String? sponsorImage,
    String? monney,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey3(
      sponsorImage: sponsorImage ?? this.sponsorImage,
      monney: monney ?? this.monney,
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
  
    result.addAll({'sponsorImage': sponsorImage});
    result.addAll({'monney': monney});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorTwoFormkey3.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey3(
      sponsorImage: map['sponsorImage'] ?? '',
      monney: map['monney'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorTwoFormkey3.fromJson(String source) => SponsorTwoFormkey3.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey3(sponsorImage: $sponsorImage, monney: $monney, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey3 &&
      other.sponsorImage == sponsorImage &&
      other.monney == monney &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6;
  }

  @override
  int get hashCode {
    return sponsorImage.hashCode ^
      monney.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป ไฟรูปภาพ (โฆษณาภาพนิ่งแบบที่4)
class SponsorTwoFormkey4 {
   String sponsorImage;
   String monney;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey4({
    required this.sponsorImage,
    required this.monney,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  

  SponsorTwoFormkey4 copyWith({
    String? sponsorImage,
    String? monney,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey4(
      sponsorImage: sponsorImage ?? this.sponsorImage,
      monney: monney ?? this.monney,
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
  
    result.addAll({'sponsorImage': sponsorImage});
    result.addAll({'monney': monney});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorTwoFormkey4.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey4(
      sponsorImage: map['sponsorImage'] ?? '',
      monney: map['monney'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorTwoFormkey4.fromJson(String source) => SponsorTwoFormkey4.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey4(sponsorImage: $sponsorImage, monney: $monney, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey4 &&
      other.sponsorImage == sponsorImage &&
      other.monney == monney &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6;
  }

  @override
  int get hashCode {
    return sponsorImage.hashCode ^
      monney.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป ไฟรูปภาพ (โฆษณาภาพนิ่งแบบที่5)
class SponsorTwoFormkey5 {
   String sponsorImage;
   String monney;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey5({
    required this.sponsorImage,
    required this.monney,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  

  SponsorTwoFormkey5 copyWith({
    String? sponsorImage,
    String? monney,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey5(
      sponsorImage: sponsorImage ?? this.sponsorImage,
      monney: monney ?? this.monney,
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
  
    result.addAll({'sponsorImage': sponsorImage});
    result.addAll({'monney': monney});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorTwoFormkey5.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey5(
      sponsorImage: map['sponsorImage'] ?? '',
      monney: map['monney'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorTwoFormkey5.fromJson(String source) => SponsorTwoFormkey5.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey5(sponsorImage: $sponsorImage, monney: $monney, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey5 &&
      other.sponsorImage == sponsorImage &&
      other.monney == monney &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6;
  }

  @override
  int get hashCode {
    return sponsorImage.hashCode ^
      monney.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป ไฟรูปภาพ (โฆษณาภาพนิ่งแบบที่6)
class SponsorTwoFormkey6 {
   String sponsorImage;
   String monney;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey6({
    required this.sponsorImage,
    required this.monney,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  

  SponsorTwoFormkey6 copyWith({
    String? sponsorImage,
    String? monney,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey6(
      sponsorImage: sponsorImage ?? this.sponsorImage,
      monney: monney ?? this.monney,
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
  
    result.addAll({'sponsorImage': sponsorImage});
    result.addAll({'monney': monney});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorTwoFormkey6.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey6(
      sponsorImage: map['sponsorImage'] ?? '',
      monney: map['monney'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorTwoFormkey6.fromJson(String source) => SponsorTwoFormkey6.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey5(sponsorImage: $sponsorImage, monney: $monney, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey5 &&
      other.sponsorImage == sponsorImage &&
      other.monney == monney &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6;
  }

  @override
  int get hashCode {
    return sponsorImage.hashCode ^
      monney.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป ไฟรูปภาพ (โฆษณาภาพนิ่งแบบที่7)
class SponsorTwoFormkey7 {
   String sponsorImage;
   String monney;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey7({
    required this.sponsorImage,
    required this.monney,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  

  SponsorTwoFormkey7 copyWith({
    String? sponsorImage,
    String? monney,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey7(
      sponsorImage: sponsorImage ?? this.sponsorImage,
      monney: monney ?? this.monney,
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
  
    result.addAll({'sponsorImage': sponsorImage});
    result.addAll({'monney': monney});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorTwoFormkey7.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey7(
      sponsorImage: map['sponsorImage'] ?? '',
      monney: map['monney'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorTwoFormkey7.fromJson(String source) => SponsorTwoFormkey7.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey5(sponsorImage: $sponsorImage, monney: $monney, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey7 &&
      other.sponsorImage == sponsorImage &&
      other.monney == monney &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6;
  }

  @override
  int get hashCode {
    return sponsorImage.hashCode ^
      monney.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


//คลาสส่งข้อมูลห้องอัป ไฟรูปภาพ (โฆษณาภาพนิ่งแบบที่8)
class SponsorTwoFormkey8 {
   String sponsorImage;
   String monney;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  SponsorTwoFormkey8({
    required this.sponsorImage,
    required this.monney,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  

  SponsorTwoFormkey8 copyWith({
    String? sponsorImage,
    String? monney,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return SponsorTwoFormkey8(
      sponsorImage: sponsorImage ?? this.sponsorImage,
      monney: monney ?? this.monney,
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
  
    result.addAll({'sponsorImage': sponsorImage});
    result.addAll({'monney': monney});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
    result.addAll({'user6': user6});
  
    return result;
  }

  factory SponsorTwoFormkey8.fromMap(Map<String, dynamic> map) {
    return SponsorTwoFormkey8(
      sponsorImage: map['sponsorImage'] ?? '',
      monney: map['monney'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      user6: map['user6'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SponsorTwoFormkey8.fromJson(String source) => SponsorTwoFormkey8.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SponsorTwoFormkey5(sponsorImage: $sponsorImage, monney: $monney, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SponsorTwoFormkey8 &&
      other.sponsorImage == sponsorImage &&
      other.monney == monney &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.user6 == user6;
  }

  @override
  int get hashCode {
    return sponsorImage.hashCode ^
      monney.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      user6.hashCode;
  }
}


