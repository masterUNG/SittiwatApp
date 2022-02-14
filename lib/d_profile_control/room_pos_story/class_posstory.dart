import 'dart:convert';

//คลาสสำหรับ ห้องโพสสตอรีออกจากหน้า ProfileControl ส่งข้อมูลไปยัง และส่งกลับมาแสดงที่หน้า Story - OpenProfileStory
class PosStory {
   String videoFile;
   String user;
  PosStory({
    required this.videoFile,
    required this.user,
  });
  

  PosStory copyWith({
    String? videoFile,
    String? user,
  }) {
    return PosStory(
      videoFile: videoFile ?? this.videoFile,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'videoFile': videoFile});
    result.addAll({'user': user});
  
    return result;
  }

  factory PosStory.fromMap(Map<String, dynamic> map) {
    return PosStory(
      videoFile: map['videoFile'] ?? '',
      user: map['user'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PosStory.fromJson(String source) => PosStory.fromMap(json.decode(source));

  @override
  String toString() => 'PosStory(videoFile: $videoFile, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PosStory &&
      other.videoFile == videoFile &&
      other.user == user;
  }

  @override
  int get hashCode => videoFile.hashCode ^ user.hashCode;
}
