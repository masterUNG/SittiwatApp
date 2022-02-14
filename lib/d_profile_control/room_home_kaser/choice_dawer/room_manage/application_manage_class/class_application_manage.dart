import 'dart:convert';

//คลาสรับ-ส่งข้อมูลห้องสมัครกรอกเข้าร่วมบริหารแพรทฟรอม
class ApplicationOneImage {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String choice1;
   String choice2;
   String choice3;
   String choice4;
   String choice5;
   String choice6;
   String choice7;
   String choice8;
   String choice9;
   String choice10;
   String choice11;
   String choice12;
   String choice13;
   String choice14;
   String choice15;
   String choice16;
   String choice17;
  ApplicationOneImage({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.choice1,
    required this.choice2,
    required this.choice3,
    required this.choice4,
    required this.choice5,
    required this.choice6,
    required this.choice7,
    required this.choice8,
    required this.choice9,
    required this.choice10,
    required this.choice11,
    required this.choice12,
    required this.choice13,
    required this.choice14,
    required this.choice15,
    required this.choice16,
    required this.choice17,
  });
 

  ApplicationOneImage copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? choice1,
    String? choice2,
    String? choice3,
    String? choice4,
    String? choice5,
    String? choice6,
    String? choice7,
    String? choice8,
    String? choice9,
    String? choice10,
    String? choice11,
    String? choice12,
    String? choice13,
    String? choice14,
    String? choice15,
    String? choice16,
    String? choice17,
  }) {
    return ApplicationOneImage(
      image: image ?? this.image,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      user3: user3 ?? this.user3,
      user4: user4 ?? this.user4,
      user5: user5 ?? this.user5,
      choice1: choice1 ?? this.choice1,
      choice2: choice2 ?? this.choice2,
      choice3: choice3 ?? this.choice3,
      choice4: choice4 ?? this.choice4,
      choice5: choice5 ?? this.choice5,
      choice6: choice6 ?? this.choice6,
      choice7: choice7 ?? this.choice7,
      choice8: choice8 ?? this.choice8,
      choice9: choice9 ?? this.choice9,
      choice10: choice10 ?? this.choice10,
      choice11: choice11 ?? this.choice11,
      choice12: choice12 ?? this.choice12,
      choice13: choice13 ?? this.choice13,
      choice14: choice14 ?? this.choice14,
      choice15: choice15 ?? this.choice15,
      choice16: choice16 ?? this.choice16,
      choice17: choice17 ?? this.choice17,
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
    result.addAll({'choice1': choice1});
    result.addAll({'choice2': choice2});
    result.addAll({'choice3': choice3});
    result.addAll({'choice4': choice4});
    result.addAll({'choice5': choice5});
    result.addAll({'choice6': choice6});
    result.addAll({'choice7': choice7});
    result.addAll({'choice8': choice8});
    result.addAll({'choice9': choice9});
    result.addAll({'choice10': choice10});
    result.addAll({'choice11': choice11});
    result.addAll({'choice12': choice12});
    result.addAll({'choice13': choice13});
    result.addAll({'choice14': choice14});
    result.addAll({'choice15': choice15});
    result.addAll({'choice16': choice16});
    result.addAll({'choice17': choice17});
  
    return result;
  }

  factory ApplicationOneImage.fromMap(Map<String, dynamic> map) {
    return ApplicationOneImage(
      image: map['image'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
      choice1: map['choice1'] ?? '',
      choice2: map['choice2'] ?? '',
      choice3: map['choice3'] ?? '',
      choice4: map['choice4'] ?? '',
      choice5: map['choice5'] ?? '',
      choice6: map['choice6'] ?? '',
      choice7: map['choice7'] ?? '',
      choice8: map['choice8'] ?? '',
      choice9: map['choice9'] ?? '',
      choice10: map['choice10'] ?? '',
      choice11: map['choice11'] ?? '',
      choice12: map['choice12'] ?? '',
      choice13: map['choice13'] ?? '',
      choice14: map['choice14'] ?? '',
      choice15: map['choice15'] ?? '',
      choice16: map['choice16'] ?? '',
      choice17: map['choice17'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationOneImage.fromJson(String source) => ApplicationOneImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ApplicationOneImage(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, choice1: $choice1, choice2: $choice2, choice3: $choice3, choice4: $choice4, choice5: $choice5, choice6: $choice6, choice7: $choice7, choice8: $choice8, choice9: $choice9, choice10: $choice10, choice11: $choice11, choice12: $choice12, choice13: $choice13, choice14: $choice14, choice15: $choice15, choice16: $choice16, choice17: $choice17)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ApplicationOneImage &&
      other.image == image &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5 &&
      other.choice1 == choice1 &&
      other.choice2 == choice2 &&
      other.choice3 == choice3 &&
      other.choice4 == choice4 &&
      other.choice5 == choice5 &&
      other.choice6 == choice6 &&
      other.choice7 == choice7 &&
      other.choice8 == choice8 &&
      other.choice9 == choice9 &&
      other.choice10 == choice10 &&
      other.choice11 == choice11 &&
      other.choice12 == choice12 &&
      other.choice13 == choice13 &&
      other.choice14 == choice14 &&
      other.choice15 == choice15 &&
      other.choice16 == choice16 &&
      other.choice17 == choice17;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode ^
      choice1.hashCode ^
      choice2.hashCode ^
      choice3.hashCode ^
      choice4.hashCode ^
      choice5.hashCode ^
      choice6.hashCode ^
      choice7.hashCode ^
      choice8.hashCode ^
      choice9.hashCode ^
      choice10.hashCode ^
      choice11.hashCode ^
      choice12.hashCode ^
      choice13.hashCode ^
      choice14.hashCode ^
      choice15.hashCode ^
      choice16.hashCode ^
      choice17.hashCode;
  }
}


//########################################################

class ApplicationOneVdo {
   String videoFile;
  ApplicationOneVdo({
    required this.videoFile,
  });
   
 

  ApplicationOneVdo copyWith({
    String? videoFile,
  }) {
    return ApplicationOneVdo(
      videoFile: videoFile ?? this.videoFile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'videoFile': videoFile});
  
    return result;
  }

  factory ApplicationOneVdo.fromMap(Map<String, dynamic> map) {
    return ApplicationOneVdo(
      videoFile: map['videoFile'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplicationOneVdo.fromJson(String source) => ApplicationOneVdo.fromMap(json.decode(source));

  @override
  String toString() => 'ApplicationOneVdo(videoFile: $videoFile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ApplicationOneVdo &&
      other.videoFile == videoFile;
  }

  @override
  int get hashCode => videoFile.hashCode;
}
