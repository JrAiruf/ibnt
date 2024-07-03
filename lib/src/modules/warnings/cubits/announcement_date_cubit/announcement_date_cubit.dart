import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class AnnouncementDateCubit extends Cubit<AnnouncementDate> {
  AnnouncementDateCubit() : super(AnnouncementDate());

  bool loading = false;
  void changeAnnouncementDate(int day) {
    final date = DateTime.now();
    final announcementDate = AnnouncementDate(
      day: day,
      month: date.month,
      year: date.year,
    );
    loading = true;
    state.day = day;
    emit(announcementDate);
    loading = false;
  }
}
