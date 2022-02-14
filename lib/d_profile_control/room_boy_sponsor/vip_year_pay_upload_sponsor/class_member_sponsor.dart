import 'dart:convert';

//คลาสส่งข้อมูลห้องจ่ายเงินค่าโฆษณา รายปี (Sponsor_vip)
class MemberSponsorImage {
   String image;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
   String user6;
  MemberSponsorImage({
    required this.image,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
    required this.user6,
  });
  
  
 

  

  MemberSponsorImage copyWith({
    String? image,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
    String? user6,
  }) {
    return MemberSponsorImage(
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

  factory MemberSponsorImage.fromMap(Map<String, dynamic> map) {
    return MemberSponsorImage(
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

  factory MemberSponsorImage.fromJson(String source) => MemberSponsorImage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MemberSponsorImage(image: $image, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5, user6: $user6)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MemberSponsorImage &&
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



class MemberSponsorVdo {
   String videoFile;
   String user1;
   String user2;
  MemberSponsorVdo({
    required this.videoFile,
    required this.user1,
    required this.user2,
  });
 
  

  MemberSponsorVdo copyWith({
    String? videoFile,
    String? user1,
    String? user2,
  }) {
    return MemberSponsorVdo(
      videoFile: videoFile ?? this.videoFile,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'videoFile': videoFile});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
  
    return result;
  }

  factory MemberSponsorVdo.fromMap(Map<String, dynamic> map) {
    return MemberSponsorVdo(
      videoFile: map['videoFile'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberSponsorVdo.fromJson(String source) => MemberSponsorVdo.fromMap(json.decode(source));

  @override
  String toString() => 'MemberSponsorVdo(videoFile: $videoFile, user1: $user1, user2: $user2)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MemberSponsorVdo &&
      other.videoFile == videoFile &&
      other.user1 == user1 &&
      other.user2 == user2;
  }

  @override
  int get hashCode => videoFile.hashCode ^ user1.hashCode ^ user2.hashCode;
}
