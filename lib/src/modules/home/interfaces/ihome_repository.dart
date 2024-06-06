import 'package:ibnt/src/modules/home/home_imports.dart';

abstract class IHomeRepository {
  Future<Either<HomeException, BaseUserEntity>> getMemberById(String memberId);
  Future<Either<HomeException, TimeLineEntity>> fetchTimeline();
  Future<Either<HomeException, EventReactionResponse>> setEventReaction(EventReaction reaction);
  Future<Either<HomeException, BibleMessageReactionResponse>> setBibleMessageReaction(BibleMessageReaction reaction);
  Future<Either<HomeException, void>> saveEventsReactionsInCache();
  Future<Either<HomeException, void>> saveBibleMessagesReactionsInCache();
}
