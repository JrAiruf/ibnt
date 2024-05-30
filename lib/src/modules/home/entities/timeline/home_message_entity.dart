// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ibnt/src/modules/home/home_imports.dart';

class HomeMessageEntity extends TimeLineContent {
  final String title;
  final String content;
  final BibleMessageType messageType;
  HomeMessageEntity({
    required this.title,
    required this.content,
    required this.messageType,
  }) {
    super.type = EntityType.message;
  }
}
