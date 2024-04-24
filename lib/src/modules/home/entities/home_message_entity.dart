import 'package:ibnt/src/modules/home/entities/entity_type.dart';
import 'package:ibnt/src/modules/home/entities/time_line_content.dart';

class HomeMessageEntity extends TimeLineContent {
  HomeMessageEntity() {
    super.type = EntityType.message;
  }
}
