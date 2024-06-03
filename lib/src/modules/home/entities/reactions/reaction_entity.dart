// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReactionEntity {
  final String name;
  final String memberId;
  final String eventId;

  ReactionEntity({
    required this.name,
    required this.memberId,
    required this.eventId,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'memberId': memberId,
      'eventId': eventId,
    };
  }

  factory ReactionEntity.fromMap(Map<String, dynamic> map) {
    return ReactionEntity(
      name: map['name'] as String,
      memberId: map['memberId'] as String,
      eventId: map['eventId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReactionEntity.fromJson(String source) => ReactionEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
