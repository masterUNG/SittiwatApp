import 'dart:convert';

//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่1")

class UpLoadImage1 {
  String user1;
  String user2;
  String image;
  UpLoadImage1({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage1 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage1(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage1.fromMap(Map<String, dynamic> map) {
    return UpLoadImage1(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage1.fromJson(String source) => UpLoadImage1.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage1(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage1 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}


//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่2")

class UpLoadImage2 {
  String user1;
  String user2;
  String image;
  UpLoadImage2({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage2 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage2(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage2.fromMap(Map<String, dynamic> map) {
    return UpLoadImage2(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage2.fromJson(String source) => UpLoadImage2.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage2(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage2 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}


//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่3")

class UpLoadImage3 {
  String user1;
  String user2;
  String image;
  UpLoadImage3({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage3 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage3(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage3.fromMap(Map<String, dynamic> map) {
    return UpLoadImage3(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage3.fromJson(String source) => UpLoadImage3.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage3(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage3 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}


//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่4")

class UpLoadImage4 {
  String user1;
  String user2;
  String image;
  UpLoadImage4({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage4 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage4(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage4.fromMap(Map<String, dynamic> map) {
    return UpLoadImage4(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage4.fromJson(String source) => UpLoadImage4.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage4(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage4 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}


//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่5")

class UpLoadImage5 {
  String user1;
  String user2;
  String image;
  UpLoadImage5({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage5 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage5(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage5.fromMap(Map<String, dynamic> map) {
    return UpLoadImage5(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage5.fromJson(String source) => UpLoadImage5.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage5(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage5 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}


//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่6")

class UpLoadImage6 {
  String user1;
  String user2;
  String image;
  UpLoadImage6({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage6 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage6(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage6.fromMap(Map<String, dynamic> map) {
    return UpLoadImage6(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage6.fromJson(String source) => UpLoadImage6.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage6(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage6 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}


//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่7")

class UpLoadImage7 {
  String user1;
  String user2;
  String image;
  UpLoadImage7({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage7 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage7(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage7.fromMap(Map<String, dynamic> map) {
    return UpLoadImage7(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage7.fromJson(String source) => UpLoadImage7.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage7(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage7 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}


//คลาส อัปภาพโฆษณา ที่ลูกค้าซื้อ  ("uploadภาพโฆษณาแบบที่8")

class UpLoadImage8 {
  String user1;
  String user2;
  String image;
  UpLoadImage8({
    required this.user1,
    required this.user2,
    required this.image,
  });
 

  UpLoadImage8 copyWith({
    String? user1,
    String? user2,
    String? image,
  }) {
    return UpLoadImage8(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'image': image});
  
    return result;
  }

  factory UpLoadImage8.fromMap(Map<String, dynamic> map) {
    return UpLoadImage8(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpLoadImage8.fromJson(String source) => UpLoadImage8.fromMap(json.decode(source));

  @override
  String toString() => 'UpLoadImage8(user1: $user1, user2: $user2, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UpLoadImage8 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.image == image;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ image.hashCode;
}
