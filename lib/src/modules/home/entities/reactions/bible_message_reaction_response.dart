// ignore_for_file: public_member_api_docs, sort_constructors_first
class BibleMessageReactionResponse {
  String name;
  String eventId;
  String memberId;
  bool toggled;

  BibleMessageReactionResponse({
    required this.name,
    required this.eventId,
    required this.memberId,
    this.toggled = false,
  });

  factory BibleMessageReactionResponse.fromMap(Map<String, dynamic> map) {
    return BibleMessageReactionResponse(
      name: map['name'],
      eventId: map['eventId'],
      memberId: map['memberId'],
      toggled: map['toggled'],
    );
  }
}
