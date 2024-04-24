import 'package:ibnt/src/modules/home/entities/entity_type.dart';
import 'package:ibnt/src/modules/home/entities/time_line_content.dart';

class HomeEventEntity extends TimeLineContent {
  HomeEventEntity() {
    super.type = EntityType.event;
  }
}
