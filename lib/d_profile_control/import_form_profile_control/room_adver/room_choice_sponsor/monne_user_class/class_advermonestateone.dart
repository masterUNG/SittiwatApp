import 'dart:convert';


//คลาสส่งข้อมูลห้องเบิกเงินค่าโฆษณา ของสมาชิก
class AdverMoneStateOne {
   String choice;
   String user1;
   String user2;
   String user3;
   String user4;
   String user5;
  AdverMoneStateOne({
    required this.choice,
    required this.user1,
    required this.user2,
    required this.user3,
    required this.user4,
    required this.user5,
  });
  
  
  
 

 

  AdverMoneStateOne copyWith({
    String? choice,
    String? user1,
    String? user2,
    String? user3,
    String? user4,
    String? user5,
  }) {
    return AdverMoneStateOne(
      choice: choice ?? this.choice,
      user1: user1 ?? this.user1,
      user2: user2 ?? this.user2,
      user3: user3 ?? this.user3,
      user4: user4 ?? this.user4,
      user5: user5 ?? this.user5,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'choice': choice});
    result.addAll({'user1': user1});
    result.addAll({'user2': user2});
    result.addAll({'user3': user3});
    result.addAll({'user4': user4});
    result.addAll({'user5': user5});
  
    return result;
  }

  factory AdverMoneStateOne.fromMap(Map<String, dynamic> map) {
    return AdverMoneStateOne(
      choice: map['choice'] ?? '',
      user1: map['user1'] ?? '',
      user2: map['user2'] ?? '',
      user3: map['user3'] ?? '',
      user4: map['user4'] ?? '',
      user5: map['user5'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdverMoneStateOne.fromJson(String source) => AdverMoneStateOne.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdverMoneStateOne(choice: $choice, user1: $user1, user2: $user2, user3: $user3, user4: $user4, user5: $user5)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AdverMoneStateOne &&
      other.choice == choice &&
      other.user1 == user1 &&
      other.user2 == user2 &&
      other.user3 == user3 &&
      other.user4 == user4 &&
      other.user5 == user5;
  }

  @override
  int get hashCode {
    return choice.hashCode ^
      user1.hashCode ^
      user2.hashCode ^
      user3.hashCode ^
      user4.hashCode ^
      user5.hashCode;
  }
}
