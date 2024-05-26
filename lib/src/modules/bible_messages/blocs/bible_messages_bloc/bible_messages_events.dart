part of 'bible_messages_bloc.dart';
abstract class BibleMessagesEvents {}

class CreateMessageEvent implements BibleMessagesEvents {
  final NewMessageEntity newMessage;

  CreateMessageEvent(this.newMessage) {
    newMessage.type = BibleMessageType.created.name;
  }
}

class GenerateMessageEvent implements BibleMessagesEvents {
  final NewMessageEntity newMessage;

  GenerateMessageEvent(this.newMessage) {
    newMessage.type = BibleMessageType.generated.name;
  }
}
