import 'package:ibnt/src/modules/warnings/warnings_imports.dart';

class MonthTitleWidget extends StatelessWidget {
  const MonthTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final announcementFontSize = height * 0.02;
    final monthFontSize = height * 0.04;
    final monthComponentPadding = height * 0.02;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: monthComponentPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Avisos",
              style: TextStyle(
                fontSize: announcementFontSize,
              ),
            ),
            Text(
              _getMonthName(),
              style: TextStyle(
                fontSize: monthFontSize,
                fontFamily: "Karma",
                color: AppThemes.primaryColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _getMonthName() {
  final date = DateTime.now();
  String monthName = "";
  switch (date.month) {
    case 1:
      monthName = MonthName.Janeiro.name;
      break;
    case 2:
      monthName = MonthName.Fevereiro.name;
      break;
    case 3:
      monthName = MonthName.Marco.name.replaceAll("c", "ç");
      break;
    case 4:
      monthName = MonthName.Abril.name;
      break;
    case 5:
      monthName = MonthName.Maio.name;
      break;
    case 6:
      monthName = MonthName.Junho.name;
      break;
    case 7:
      monthName = MonthName.Julho.name;
      break;
    case 8:
      monthName = MonthName.Agosto.name;
      break;
    case 9:
      monthName = MonthName.Setembro.name;
      break;
    case 10:
      monthName = MonthName.Outubro.name;
      break;
    case 11:
      monthName = MonthName.Novembro.name;
      break;
    case 12:
      monthName = MonthName.Dezembro.name;
      break;

    default:
      monthName = "";
  }
  return monthName;
}
