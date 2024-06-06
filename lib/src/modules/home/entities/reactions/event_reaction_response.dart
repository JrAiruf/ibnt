import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventReactionResponse {
  String name;
  String eventId;
  String memberId;
  bool toggled;

  EventReactionResponse({
    required this.name,
    required this.eventId,
    required this.memberId,
    this.toggled = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'eventId': eventId,
      'memberId': memberId,
      'toggled': toggled,
    };
  }

  factory EventReactionResponse.fromMap(Map<String, dynamic> map) {
    return EventReactionResponse(
      name: map['name'] as String,
      eventId: map['eventId'] as String,
      memberId: map['memberId'] as String,
      toggled: map['toggled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventReactionResponse.fromJson(String source) => EventReactionResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
