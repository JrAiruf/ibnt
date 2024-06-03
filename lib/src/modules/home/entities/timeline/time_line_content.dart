// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/entities/timeline/entity_type.dart';

abstract class TimeLineContent {
  String? id;
  EntityType? type;
  
  TimeLineContent({
    this.id,
    this.type,
  });
}
