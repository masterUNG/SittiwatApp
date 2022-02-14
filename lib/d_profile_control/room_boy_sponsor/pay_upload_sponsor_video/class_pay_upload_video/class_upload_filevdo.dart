import 'dart:convert';

// คลาสโหลดไฟ วีดีโอ 

class UploadFileVdo1 {
  String user1;
  String user2;
  String videoFile;
  UploadFileVdo1({
    required this.user1,
    required this.user2,
    required this.videoFile,
  });
 

  UploadFileVdo1 copyWith({
    String? user1,
    String? user2,
    String? videoFile,
  }) {
    return UploadFileVdo1(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      videoFile: videoFile ?? this.videoFile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'videoFile': videoFile});
  
    return result;
  }

  factory UploadFileVdo1.fromMap(Map<String, dynamic> map) {
    return UploadFileVdo1(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      videoFile: map['videoFile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadFileVdo1.fromJson(String source) => UploadFileVdo1.fromMap(json.decode(source));

  @override
  String toString() => 'UploadFileVdo1(user1: $user1, user2: $user2, videoFile: $videoFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UploadFileVdo1 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.videoFile == videoFile;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ videoFile.hashCode;
}


class UploadFileVdo2 {
  String user1;
  String user2;
  String videoFile;
  UploadFileVdo2({
    required this.user1,
    required this.user2,
    required this.videoFile,
  });
 

  UploadFileVdo2 copyWith({
    String? user1,
    String? user2,
    String? videoFile,
  }) {
    return UploadFileVdo2(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      videoFile: videoFile ?? this.videoFile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'videoFile': videoFile});
  
    return result;
  }

  factory UploadFileVdo2.fromMap(Map<String, dynamic> map) {
    return UploadFileVdo2(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      videoFile: map['videoFile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadFileVdo2.fromJson(String source) => UploadFileVdo2.fromMap(json.decode(source));

  @override
  String toString() => 'UploadFileVdo2(user1: $user1, user2: $user2, videoFile: $videoFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UploadFileVdo2 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.videoFile == videoFile;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ videoFile.hashCode;
}



class UploadFileVdo3 {
  String user1;
  String user2;
  String videoFile;
  UploadFileVdo3({
    required this.user1,
    required this.user2,
    required this.videoFile,
  });
 

  UploadFileVdo3 copyWith({
    String? user1,
    String? user2,
    String? videoFile,
  }) {
    return UploadFileVdo3(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      videoFile: videoFile ?? this.videoFile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'videoFile': videoFile});
  
    return result;
  }

  factory UploadFileVdo3.fromMap(Map<String, dynamic> map) {
    return UploadFileVdo3(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      videoFile: map['videoFile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadFileVdo3.fromJson(String source) => UploadFileVdo3.fromMap(json.decode(source));

  @override
  String toString() => 'UploadFileVdo3(user1: $user1, user2: $user2, videoFile: $videoFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UploadFileVdo3 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.videoFile == videoFile;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ videoFile.hashCode;
}



class UploadFileVdo4 {
  String user1;
  String user2;
  String videoFile;
  UploadFileVdo4({
    required this.user1,
    required this.user2,
    required this.videoFile,
  });
 

  UploadFileVdo4 copyWith({
    String? user1,
    String? user2,
    String? videoFile,
  }) {
    return UploadFileVdo4(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      videoFile: videoFile ?? this.videoFile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'videoFile': videoFile});
  
    return result;
  }

  factory UploadFileVdo4.fromMap(Map<String, dynamic> map) {
    return UploadFileVdo4(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      videoFile: map['videoFile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadFileVdo4.fromJson(String source) => UploadFileVdo4.fromMap(json.decode(source));

  @override
  String toString() => 'UploadFileVdo4(user1: $user1, user2: $user2, videoFile: $videoFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UploadFileVdo4 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.videoFile == videoFile;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ videoFile.hashCode;
}



class UploadFileVdo5 {
  String user1;
  String user2;
  String videoFile;
  UploadFileVdo5({
    required this.user1,
    required this.user2,
    required this.videoFile,
  });
 

  UploadFileVdo5 copyWith({
    String? user1,
    String? user2,
    String? videoFile,
  }) {
    return UploadFileVdo5(
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      videoFile: videoFile ?? this.videoFile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'videoFile': videoFile});
  
    return result;
  }

  factory UploadFileVdo5.fromMap(Map<String, dynamic> map) {
    return UploadFileVdo5(
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      videoFile: map['videoFile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadFileVdo5.fromJson(String source) => UploadFileVdo5.fromMap(json.decode(source));

  @override
  String toString() => 'UploadFileVdo5(user1: $user1, user2: $user2, videoFile: $videoFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UploadFileVdo5 &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.videoFile == videoFile;
  }

  @override
  int get hashCode => user1.hashCode ^ user2.hashCode ^ videoFile.hashCode;
}
