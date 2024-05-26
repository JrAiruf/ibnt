import 'package:ibnt/src/modules/bible_messages/bible_messages_imports.dart';

abstract class IBibleMessagesRepository {
  Future<Either<BibleMessageException, BibleMessageEntity>> createBibleMessage(NewMessageEntity message);
  Future<Either<BibleMessageException, BibleMessageEntity>> generateBibleMessage(NewMessageEntity message);
}
