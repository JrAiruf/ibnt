import 'package:ibnt/src/modules/home/home_imports.dart';

abstract class IHomeRepository {
  Future<Either<HomeException, BaseUserEntity>> getMemberById(String memberId);
  Future<Either<HomeException, TimeLineEntity>> fetchTimeline();
  Future<Either<HomeException, void>> setEventReaction(EventReaction reaction);
  Future<Either<HomeException, void>> setBibleMessageReaction(BibleMessageReaction reaction);
  Future<Either<HomeException, void>> saveEventsReactionsInCache();
  Future<Either<HomeException, void>> saveBibleMessagesReactionsInCache();
  Future<Either<HomeException, void>> removeReaction(RemoverReactionEntity reaction);
}
