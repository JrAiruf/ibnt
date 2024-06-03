import 'package:ibnt/src/modules/home/entities/timeline/timeline_entity.dart';
import 'package:ibnt/src/modules/home/exceptions/home_exception.dart';
import 'package:ibnt/src/modules/home/home_imports.dart';

abstract class IHomeRepository {
  Future<Either<HomeException, TimeLineEntity>> fetchTimeline();
}
