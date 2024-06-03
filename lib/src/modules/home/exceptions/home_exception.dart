import 'package:ibnt/src/modules/home/home_imports.dart';

abstract class HomeException extends AppException {
  final String exception;
  HomeException({required this.exception}) : super(exception: exception);
}

class TimeLineException extends HomeException {
  TimeLineException({required super.exception});
}
