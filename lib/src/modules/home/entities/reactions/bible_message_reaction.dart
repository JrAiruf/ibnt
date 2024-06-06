// ignore_for_file: public_member_api_docs, sort_constructors_first

class BibleMessageReaction {
  final String name;
  final String memberId;
  final String messageId;
  bool toggled;

  BibleMessageReaction({required this.name, required this.memberId, required this.messageId, this.toggled = false});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'memberId': memberId,
      'messageId': messageId,
    };
  }
}
